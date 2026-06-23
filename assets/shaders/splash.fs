#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define MY_HIGHP_OR_MEDIUMP highp
#else
    #define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP number vort_speed;
extern MY_HIGHP_OR_MEDIUMP vec4 colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 colour_2;
extern MY_HIGHP_OR_MEDIUMP number mid_flash;
extern MY_HIGHP_OR_MEDIUMP number vort_offset;

#define PIXEL_SIZE_FAC 700.
// deep pastel rose shadow instead of meaty dark red
#define DARK vec4(0.35, 0.18, 0.22, 1.0)
// soft pink-white highlight
#define HIGHLIGHT vec4(1.0, 0.82, 0.80, 1.0)

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    // pixelated UV
    MY_HIGHP_OR_MEDIUMP number pixel_size = length(love_ScreenSize.xy) / PIXEL_SIZE_FAC;
    MY_HIGHP_OR_MEDIUMP vec2 uv = (floor(screen_coords.xy * (1. / pixel_size)) * pixel_size - 0.5 * love_ScreenSize.xy) / length(love_ScreenSize.xy);
    MY_HIGHP_OR_MEDIUMP number uv_len = length(uv);

    // diagonal wave drift — two layers opposite directions
    MY_HIGHP_OR_MEDIUMP number speed = time * vort_speed + vort_offset;
    MY_HIGHP_OR_MEDIUMP vec2 mid = (love_ScreenSize.xy / length(love_ScreenSize.xy)) / 2.;
    MY_HIGHP_OR_MEDIUMP vec2 sv = uv.xy + mid.xy * 0.08
        + vec2(
            sin(speed * 0.7 + uv.y * 3.0) * 0.012,
            cos(speed * 0.5 + uv.x * 3.0) * 0.012
        )
        + vec2(
            cos(speed * 0.4 - uv.y * 2.5) * 0.008,
            sin(speed * 0.6 - uv.x * 2.5) * 0.008
        );

    // smoke swirl — 7 iterations
    sv *= 30.;
    speed = time * 5. * vort_speed + vort_offset + 1033.;
    MY_HIGHP_OR_MEDIUMP vec2 uv2 = vec2(sv.x + sv.y);

    for (int i = 0; i < 7; i++) {
        uv2 += sin(max(sv.x, sv.y)) + sv;
        sv  += 0.5 * vec2(cos(5.1123314 + 0.353 * uv2.y + speed * 0.131121), sin(uv2.x - 0.113 * speed));
        sv  -= 1.0 * cos(sv.x + sv.y) - 1.0 * sin(sv.x * 0.711 - sv.y);
    }

    // smoke value 0-2
    MY_HIGHP_OR_MEDIUMP number smoke_res = min(2., max(-2., 1.5 + length(sv) * 0.12 - 0.17 * (min(10., time * 1.2 - 4.))));
    if (smoke_res < 0.2) {
        smoke_res = (smoke_res - 0.2) * 0.6 + 0.2;
    }

    MY_HIGHP_OR_MEDIUMP number c1p = max(0., 1. - 2. * abs(1. - smoke_res));
    MY_HIGHP_OR_MEDIUMP number c2p = max(0., 1. - 2. * (smoke_res));
    MY_HIGHP_OR_MEDIUMP number cb  = 1. - min(1., c1p + c2p);

    // breathing pastel shadow
    MY_HIGHP_OR_MEDIUMP number breath = 0.88 + 0.12 * sin(time * 0.8 + vort_offset);
    MY_HIGHP_OR_MEDIUMP vec4 dark_tone = vec4(DARK.rgb * breath, DARK.a);

    // lift all colors toward pastel — mix toward white
    MY_HIGHP_OR_MEDIUMP vec4 c1_pastel = mix(colour_1, vec4(1.0), 0.25);
    MY_HIGHP_OR_MEDIUMP vec4 c2_pastel = mix(colour_2, vec4(1.0), 0.20);

    // base color mix
    MY_HIGHP_OR_MEDIUMP vec4 ret_col = c1_pastel * c1p + c2_pastel * c2p + vec4(cb * dark_tone.rgb, cb * c1_pastel.a);

    // vignette — soft pastel rose at edges, not deep crimson
    MY_HIGHP_OR_MEDIUMP number vignette = 1.0 - smoothstep(0.3, 0.85, uv_len * 1.8);
    MY_HIGHP_OR_MEDIUMP vec4 vignette_col = vec4(0.55, 0.22, 0.28, 1.0);
    ret_col = mix(vignette_col, ret_col, vignette);

    // highlight bleed on bright peaks
    MY_HIGHP_OR_MEDIUMP number highlight_amt = max(0., c1p - 0.5) * 0.30;
    ret_col = mix(ret_col, HIGHLIGHT, highlight_amt);

    // scanline card texture — very subtle
    MY_HIGHP_OR_MEDIUMP number scanline = 1.0 - 0.03 * mod(floor(screen_coords.y / pixel_size), 2.0);
    ret_col.rgb *= scanline;

    // global brightness lift so nothing reads as fleshy
    ret_col.rgb = mix(ret_col.rgb, vec3(1.0), 0.10);

    // flash
    MY_HIGHP_OR_MEDIUMP number mod_flash = max(mid_flash * 0.8, max(c1p, c2p) * 5. - 4.4) + mid_flash * max(c1p, c2p);

    return ret_col * (1. - mod_flash) + mod_flash * vec4(1., 1., 1., 1.);
}