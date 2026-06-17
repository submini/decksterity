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

float hash(vec2 p) {
    p = fract(p * vec2(443.897, 441.423));
    p += dot(p, p + 19.19);
    return fract(p.x * p.y);
}

float star(vec2 uv, float threshold) {
    float h = hash(floor(uv * 40.0));
    if (h > threshold) return 0.0;
    vec2 f = fract(uv * 40.0) - 0.5;
    float twinkle = 0.5 + 0.5 * sin(time * 2.5 + h * 6.28);
    return max(0.0, (1.0 - length(f) * 3.5) * twinkle); 
}

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.zw)/texture_details.zw;

    vec4 pixel = Texel(texture, texture_coords);
    if (pixel.a < 0.01) return pixel;

    // Locked the visual intensity to a constant value rather than scaling with Ante
    float intensity = 0.8; 
    float drift = time * 0.025 + cosmic.x * 0.001;

    float luma = dot(pixel.rgb, vec3(0.299, 0.587, 0.114));
    vec3 space_base = mix(
        pixel.rgb,
        vec3(luma * 0.4 + 0.05, luma * 0.3, luma * 0.6 + 0.15),
        intensity * 0.85
    );

    vec3 neb = vec3(0.0);
    neb += vec3(0.5, 0.1, 1.0) * smoothstep(0.4, 0.0, length(uv - vec2(0.28 + 0.06*sin(drift), 0.38))) * 1.8;
    neb += vec3(0.1, 0.25, 1.0) * smoothstep(0.35, 0.0, length(uv - vec2(0.72, 0.58 + 0.05*cos(drift*0.8)))) * 1.8;
    neb += vec3(0.9, 0.15, 0.5) * smoothstep(0.22, 0.0, length(uv - vec2(0.5, 0.22))) * 1.4;
    neb *= 0.8;

    float thresh = 0.80 - intensity * 3.0; 
    float stars = star(uv + vec2(drift * 0.5, 0.0), thresh)
                + star(uv + vec2(0.0, drift * 0.4), thresh + 0.01)
                + star(uv - vec2(drift * 0.3, drift * 0.2), thresh + 0.02);
    vec3 star_col = vec3(stars) * vec3(0.9, 0.95, 1.0) * 0.5; 

    float ex = smoothstep(0.0, 0.08, uv.x) * smoothstep(1.0, 0.92, uv.x);
    float ey = smoothstep(0.0, 0.06, uv.y) * smoothstep(1.0, 0.94, uv.y);
    float pulse = 0.6 + 0.4 * sin(time * 1.8 + cosmic.x);
    vec3 edge = vec3(0.3, 0.05, 0.8) * (1.0 - ex*ey) * pulse * intensity * 0.8;

    vec3 result = space_base + neb + star_col + edge;

    return dissolve_mask(vec4(result, pixel.a) * colour, texture_coords, uv);
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