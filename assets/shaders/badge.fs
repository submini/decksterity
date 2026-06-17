#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define PRECISION highp
#else
    #define PRECISION mediump
#endif

#define PI 3.14159265358979323846

extern PRECISION vec2 badge;
extern PRECISION vec4 uie_details;
extern PRECISION float uie_scale;
extern PRECISION float uie_rot;
extern PRECISION float time;

vec4 effect(
    vec4 colour,
    Image texture,
    vec2 texture_coords,
    vec2 screen_coords
)
{
    float dummy =
        uie_details.x * 0.00001 +
        uie_scale     * 0.00001 +
        uie_rot       * 0.00001;

    // 🕐 use badge.g as clock, same as the reference mod
    float iTime = badge.g + dummy;

    // 🌸 Pastel Red #ff746c
    vec3 baseCol = vec3(1.0, 0.455, 0.424);

    // 🧭 normalize by screen size like the reference, then scale to grid
    vec2 uv = screen_coords / vec2(love_ScreenSize.x / love_ScreenSize.y) * 0.00140;
    uv *= 75.0;

    // 🎢 diagonal drift using the real clock
    uv += vec2(iTime / 1.5, iTime / 2.5);

    // 🔷 hexagonal grid transform
    vec2 hexUV = vec2(uv.x, uv.y / 0.866);

    float rowIndex  = floor(hexUV.y);
    float colOffset = mod(rowIndex, 2.0) * 0.5;

    vec2 cell = floor(vec2(hexUV.x - colOffset, hexUV.y));
    vec2 gv   = vec2(hexUV.x - colOffset, hexUV.y) - cell - 0.5;

    float d = length(vec2(gv.x, gv.y * 0.866));

    // 🔵 per-cell ripple phase
    float phase = sin(cell.x * 1.3 + cell.y * 2.1);
    float pulse = 0.04 * sin(iTime * 2.5 + phase * 6.28);
    float dotRadius = 0.25 + pulse;
    float dots = smoothstep(dotRadius + 0.08, dotRadius - 0.08, d);

    // 🌑 dark crimson dots
    vec3 dotCol = vec3(0.6588, 0.298, 0.2784);

    // ✨ slight white lift on the base
    baseCol = mix(baseCol, vec3(1.0), 0.18);

    vec3 finalCol = mix(baseCol, dotCol, dots);

    return vec4(finalCol, 1.0) * colour;
}