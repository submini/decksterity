// cosmic.fs - Decksterity

#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
#define PRECISION highp
#else
#define PRECISION mediump
#endif

extern PRECISION vec2 cosmic;
extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;

vec4 dissolve_mask(vec4 final_pixel, vec2 texture_coords, vec2 uv);

// hash for noise
float hash(vec2 p) {
    p = fract(p * vec2(443.897, 441.423));
    p += dot(p, p + 19.19);
    return fract(p.x * p.y);
}

float hash1(float n) {
    return fract(sin(n) * 43758.5453123);
}

// smooth noise for gas clouds
float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

// fbm for nebula pillars
float fbm(vec2 p) {
    float v = 0.0;
    float a = 0.5;
    for (int i = 0; i < 5; i++) {
        v += a * noise(p);
        p = p * 2.1 + vec2(1.7, 9.2);
        a *= 0.5;
    }
    return v;
}

// star with diffraction spikes like Hubble
float star(vec2 uv, float size, float brightness) {
    float d = length(uv);
    float core = brightness * smoothstep(size, 0.0, d);
    // diffraction spikes — 4 rays
    float spike_h = brightness * 0.4 * smoothstep(size * 8.0, 0.0, abs(uv.y)) * smoothstep(size * 0.5, 0.0, abs(uv.x));
    float spike_v = brightness * 0.4 * smoothstep(size * 8.0, 0.0, abs(uv.x)) * smoothstep(size * 0.5, 0.0, abs(uv.y));
    return core + spike_h + spike_v;
}

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec2 uv = (((texture_coords) * (image_details)) - texture_details.xy * texture_details.zw) / texture_details.zw;

    vec4 pixel = Texel(texture, texture_coords);
    if (pixel.a < 0.01) return pixel;

    float drift = time * 0.018 + cosmic.x * 0.001;

    // deep space base — preserve card luma, push toward deep blue-black
    float luma = dot(pixel.rgb, vec3(0.299, 0.587, 0.114));
    vec3 space_base = mix(
        pixel.rgb * 0.15,
        vec3(luma * 0.12, luma * 0.08, luma * 0.22),
        0.9
    );

    // --- NEBULA GAS CLOUDS ---
    // slow drifting fbm coords
    vec2 neb_uv = uv + vec2(drift * 0.3, drift * 0.2);

    // pillar of creation style — tall purple/blue gas column
    float pillar = fbm(neb_uv * 3.5 + vec2(0.2, drift * 0.15));
    float pillar_shape = smoothstep(0.8, 0.3, abs(uv.x - 0.45) * 2.5) * smoothstep(0.0, 0.9, uv.y);
    vec3 pillar_col = mix(
        vec3(0.18, 0.04, 0.35),  // deep violet
        vec3(0.45, 0.15, 0.85),  // bright purple
        pillar
    ) * pillar_shape * 1.8;

    // blue emission nebula — oxygen III glow
    float blue_neb = fbm(neb_uv * 2.8 + vec2(1.3, 0.7 + drift * 0.1));
    vec3 blue_col = vec3(0.05, 0.30, 0.95) * pow(blue_neb, 1.4) * 1.5
                  * smoothstep(0.9, 0.1, length(uv - vec2(0.75, 0.55)));

    // pink hydrogen alpha wisps
    float pink_neb = fbm(neb_uv * 4.2 - vec2(0.9, 1.1 + drift * 0.08));
    vec3 pink_col = vec3(0.85, 0.15, 0.55) * pow(pink_neb, 1.8) * 1.2
                  * smoothstep(0.7, 0.0, length(uv - vec2(0.25, 0.70)));

    // teal/cyan wisps — doubly ionized oxygen
    float teal_neb = fbm(neb_uv * 3.1 + vec2(2.2, drift * 0.12));
    vec3 teal_col = vec3(0.0, 0.75, 0.80) * pow(teal_neb, 2.0) * 1.0
                  * smoothstep(0.55, 0.0, length(uv - vec2(0.60, 0.25)));

    vec3 nebula = pillar_col + blue_col + pink_col + teal_col;
    nebula = clamp(nebula, 0.0, 1.5);

    // --- STARS ---
    vec3 star_col = vec3(0.0);

    // seed several stars at fixed UV positions with twinkling
    float t = time;
    struct StarDef { vec2 pos; float size; vec3 color; };

    // bright blue-white stars
    vec2 s1 = vec2(0.15, 0.82); float tw1 = 0.7 + 0.3 * sin(t * 2.1 + hash1(1.0) * 6.28);
    star_col += star(uv - s1, 0.012, tw1) * vec3(0.85, 0.92, 1.00);

    vec2 s2 = vec2(0.88, 0.18); float tw2 = 0.7 + 0.3 * sin(t * 1.7 + hash1(2.0) * 6.28);
    star_col += star(uv - s2, 0.009, tw2) * vec3(0.80, 0.88, 1.00);

    vec2 s3 = vec2(0.62, 0.91); float tw3 = 0.7 + 0.3 * sin(t * 2.8 + hash1(3.0) * 6.28);
    star_col += star(uv - s3, 0.007, tw3) * vec3(0.90, 0.95, 1.00);

    // warm yellow star
    vec2 s4 = vec2(0.08, 0.35); float tw4 = 0.7 + 0.3 * sin(t * 1.4 + hash1(4.0) * 6.28);
    star_col += star(uv - s4, 0.008, tw4) * vec3(1.00, 0.92, 0.65);

    // red giant
    vec2 s5 = vec2(0.78, 0.72); float tw5 = 0.7 + 0.3 * sin(t * 1.9 + hash1(5.0) * 6.28);
    star_col += star(uv - s5, 0.010, tw5) * vec3(1.00, 0.45, 0.20);

    // tiny background field stars via hash grid
    vec2 grid_uv = uv * 55.0;
    vec2 grid_id = floor(grid_uv);
    vec2 grid_f  = fract(grid_uv) - 0.5;
    float h = hash(grid_id);
    if (h > 0.82) {
        float twinkle = 0.4 + 0.6 * sin(t * (1.5 + h * 3.0) + h * 6.28);
        float field_star = smoothstep(0.3, 0.0, length(grid_f)) * twinkle * (h - 0.82) * 6.0;
        vec3 field_col = mix(vec3(0.8, 0.85, 1.0), vec3(1.0, 0.9, 0.7), h);
        star_col += field_star * field_col * 0.35;
    }

    // --- EDGE GLOW ---
    float ex = smoothstep(0.0, 0.10, uv.x) * smoothstep(1.0, 0.90, uv.x);
    float ey = smoothstep(0.0, 0.08, uv.y) * smoothstep(1.0, 0.92, uv.y);
    // hue-shifting edge — cycles purple → blue → teal
    float edge_hue = sin(time * 0.6 + cosmic.x) * 0.5 + 0.5;
    vec3 edge_col = mix(
        vec3(0.5, 0.05, 1.0),   // purple
        vec3(0.0, 0.6, 0.9),    // blue-teal
        edge_hue
    );
    float pulse = 0.55 + 0.45 * sin(time * 1.6 + cosmic.x * 0.7);
    vec3 edge = edge_col * (1.0 - ex * ey) * pulse * 1.1;

    // --- COMPOSE ---
    vec3 result = space_base + nebula * 0.9 + star_col + edge;

    // subtle brightness boost on the card so it's still readable
    result = mix(result, result + luma * 0.15, 0.4);

    return dissolve_mask(vec4(clamp(result, 0.0, 1.0), pixel.a) * colour, texture_coords, uv);
}

vec4 dissolve_mask(vec4 final_pixel, vec2 texture_coords, vec2 uv) {
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : final_pixel.xyz, shadow ? final_pixel.a*0.3 : final_pixel.a);
    }
    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01;
    float t = time * 10.0 + 2003.;
    vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 usc = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
    vec2 fp1 = usc + 50.*vec2(sin(-t/143.634), cos(-t/99.4324));
    vec2 fp2 = usc + 50.*vec2(cos( t/53.1532),  cos( t/61.4532));
    vec2 fp3 = usc + 50.*vec2(sin(-t/87.5322),  sin(-t/49.0000));
    float field = (1.+(cos(length(fp1)/19.483)+sin(length(fp2)/33.155)*cos(fp2.y/15.73)+cos(length(fp3)/27.193)*sin(fp3.x/21.92)))/2.;
    vec2 borders = vec2(0.2, 0.8);
    float res = (.5+.5*cos((adjusted_dissolve)/82.612+(field+-.5)*3.14))
        -(floored_uv.x>borders.y?(floored_uv.x-borders.y)*(5.+5.*dissolve):0.)*(dissolve)
        -(floored_uv.y>borders.y?(floored_uv.y-borders.y)*(5.+5.*dissolve):0.)*(dissolve)
        -(floored_uv.x<borders.x?(borders.x-floored_uv.x)*(5.+5.*dissolve):0.)*(dissolve)
        -(floored_uv.y<borders.x?(borders.x-floored_uv.y)*(5.+5.*dissolve):0.)*(dissolve);
    if (final_pixel.a>0.01&&burn_colour_1.a>0.01&&!shadow&&res<adjusted_dissolve+0.8*(0.5-abs(adjusted_dissolve-0.5))&&res>adjusted_dissolve) {
        if (!shadow&&res<adjusted_dissolve+0.5*(0.5-abs(adjusted_dissolve-0.5))&&res>adjusted_dissolve) {
            final_pixel.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a>0.01) {
            final_pixel.rgba = burn_colour_2.rgba;
        }
    }
    return vec4(shadow?vec3(0.):final_pixel.xyz, res>adjusted_dissolve?(shadow?final_pixel.a*0.3:final_pixel.a):0.);
}

extern PRECISION vec2 mouse_screen_pos;
extern PRECISION float hovering;
extern PRECISION float screen_scale;

#ifdef VERTEX
vec4 position(mat4 transform_projection, vec4 vertex_position) {
    if (hovering <= 0.) return transform_projection * vertex_position;
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03-0.3*max(0.,0.3-mid_dist))*hovering*(length(mouse_offset)*length(mouse_offset))/(2.-mid_dist);
    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif