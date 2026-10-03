SMODS.DynaTextEffect {
        key = "rainbow_wiggle",
        func = function (dynatext, index, letter)
            letter.offset.y = math.cos(G.TIMERS.REAL * 2.95 + index) * 9
            letter.scale = (((math.sin((G.TIMERS.REAL + index)*2.9443) + 1)/2) + 6 )/6
        end
    }