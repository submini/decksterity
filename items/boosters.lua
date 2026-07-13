SMODS.Booster {
    key = "carcana_pack_1",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'carcana_pack',
    group_key = "k_dckst_carcana_pack",
    weight = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_RED },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_carcana_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_RED, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Catarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_fool", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("carcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_RED)
        ease_background_colour{new_colour = G.C.DCKST_RED, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "carcana_pack_2",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'carcana_pack',
    group_key = "k_dckst_carcana_pack",
    weight = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_RED },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_carcana_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_RED, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Catarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_fool", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("carcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_RED)
        ease_background_colour{new_colour = G.C.DCKST_RED, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "carcana_pack_3",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 2, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'carcana_pack',
    group_key = "k_dckst_carcana_pack",
    weight = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_RED },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_carcana_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_RED, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Catarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_fool", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("carcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_RED)
        ease_background_colour{new_colour = G.C.DCKST_RED, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "carcana_pack_4",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 3, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'carcana_pack',
    group_key = "k_dckst_carcana_pack",
    weight = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_RED },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_carcana_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_RED, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Catarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_fool", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("carcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_RED)
        ease_background_colour{new_colour = G.C.DCKST_RED, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "jumbo_carcana_pack_1",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 0, y = 2 },
    config = { extra = 5, choose = 1},
    kind = 'carcana_pack',
    group_key = "k_dckst_carcana_pack_jumbo",
    weight = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_RED },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_carcana_pack_jumbo"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_RED, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Catarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_fool", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("carcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
    
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_RED)
        ease_background_colour{new_colour = G.C.DCKST_RED, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "jumbo_carcana_pack_2",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 1, y = 2 },
    config = { extra = 5, choose = 1},
    kind = 'carcana_pack',
    group_key = "k_dckst_carcana_pack_jumbo",
    weight = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_RED },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_carcana_pack_jumbo"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_RED, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Catarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_fool", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("carcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_RED)
        ease_background_colour{new_colour = G.C.DCKST_RED, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "mega_carcana_pack_1",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 2, y = 2 },
    config = { extra = 5, choose = 2},
    kind = 'carcana_pack',
    group_key = "k_dckst_carcana_pack_mega",
    weight = 0.25,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_RED },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_carcana_pack_mega"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_RED, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Catarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_fool", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("carcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_RED)
        ease_background_colour{new_colour = G.C.DCKST_RED, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "mega_carcana_pack_2",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 3, y = 2 },
    config = { extra = 5, choose = 2},
    kind = 'carcana_pack',
    group_key = "k_dckst_carcana_pack_mega",
    weight = 0.25,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_RED },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_carcana_pack_mega"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_RED, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Catarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_fool", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("carcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_RED)
        ease_background_colour{new_colour = G.C.DCKST_RED, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "neoarcana_pack_1",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 0, y = 1 },
    config = { extra = 3, choose = 1},
    kind = 'neoarcana_pack',
    group_key = "k_dckst_neoarcana_pack",
    weight = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_TEAL },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_neoarcana_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_TEAL, 0.4), lighten(G.C.DCKST_TEAL, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'neotarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("neoarcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_TEAL)
        ease_background_colour{new_colour = G.C.DCKST_TEAL, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "neoarcana_pack_2",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 1, y = 1 },
    config = { extra = 3, choose = 1},
    kind = 'neoarcana_pack',
    group_key = "k_dckst_neoarcana_pack",
    weight = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_TEAL },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_neoarcana_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_TEAL, 0.4), lighten(G.C.DCKST_TEAL, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'neotarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("neoarcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_TEAL)
        ease_background_colour{new_colour = G.C.DCKST_TEAL, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "neoarcana_pack_3",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 2, y = 1 },
    config = { extra = 3, choose = 1},
    kind = 'neoarcana_pack',
    group_key = "k_dckst_neoarcana_pack",
    weight = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_TEAL },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_neoarcana_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_TEAL, 0.4), lighten(G.C.DCKST_TEAL, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'neotarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("neoarcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_TEAL)
        ease_background_colour{new_colour = G.C.DCKST_TEAL, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "neoarcana_pack_4",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 3, y = 1 },
    config = { extra = 3, choose = 1},
    kind = 'neoarcana_pack',
    group_key = "k_dckst_neoarcana_pack",
    weight = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_TEAL },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_neoarcana_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_TEAL, 0.4), lighten(G.C.DCKST_TEAL, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'neotarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("neoarcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_TEAL)
        ease_background_colour{new_colour = G.C.DCKST_TEAL, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "jumbo_neoarcana_pack_1",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 0, y = 3 },
    config = { extra = 5, choose = 1},
    kind = 'neoarcana_pack',
    group_key = "k_dckst_neoarcana_pack_jumbo",
    weight = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_TEAL },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_neoarcana_pack_jumbo"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_TEAL, 0.4), lighten(G.C.DCKST_TEAL, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'neotarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("neoarcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_TEAL)
        ease_background_colour{new_colour = G.C.DCKST_TEAL, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "jumbo_neoarcana_pack_2",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 1, y = 3 },
    config = { extra = 5, choose = 1},
    kind = 'neoarcana_pack',
    group_key = "k_dckst_neoarcana_pack_jumbo",
    weight = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_TEAL },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_neoarcana_pack_jumbo"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_TEAL, 0.4), lighten(G.C.DCKST_TEAL, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'neotarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("neoarcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_TEAL)
        ease_background_colour{new_colour = G.C.DCKST_TEAL, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "mega_neoarcana_pack_1",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 2, y = 3 },
    config = { extra = 5, choose = 2},
    kind = 'neoarcana_pack',
    group_key = "k_dckst_neoarcana_pack_mega",
    weight = 0.25,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_TEAL },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_neoarcana_pack_mega"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_TEAL, 0.4), lighten(G.C.DCKST_TEAL, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'neotarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("neoarcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_TEAL)
        ease_background_colour{new_colour = G.C.DCKST_TEAL, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "mega_neoarcana_pack_2",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 3, y = 3 },
    config = { extra = 5, choose = 2},
    kind = 'neoarcana_pack',
    group_key = "k_dckst_neoarcana_pack_mega",
    weight = 0.25,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_TEAL },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_neoarcana_pack_mega"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_TEAL, 0.4), lighten(G.C.DCKST_TEAL, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'neotarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("neoarcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_TEAL)
        ease_background_colour{new_colour = G.C.DCKST_TEAL, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "tram_pack_1",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 0, y = 4 },
    config = { extra = 3, choose = 1},
    kind = 'tram_pack',
    group_key = "k_dckst_tram_pack",
    weight = 0.5,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_NEONGREEN },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_tram_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_NEONGREEN, 0.4), lighten(G.C.DCKST_NEONGREEN, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Route' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("route")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_NEONGREEN)
        ease_background_colour{new_colour = G.C.DCKST_NEONGREEN, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "tram_pack_2",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 1, y = 4 },
    config = { extra = 3, choose = 1},
    kind = 'tram_pack',
    group_key = "k_dckst_tram_pack",
    weight = 0.5,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_NEONGREEN },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_tram_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_NEONGREEN, 0.4), lighten(G.C.DCKST_NEONGREEN, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Route' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("route")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_NEONGREEN)
        ease_background_colour{new_colour = G.C.DCKST_NEONGREEN, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "jumbo_tram_pack",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 2, y = 4 },
    config = { extra = 5, choose = 1},
    kind = 'tram_pack',
    group_key = "k_dckst_tram_pack_jumbo",
    weight = 0.5,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_NEONGREEN },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_tram_pack_jumbo"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_NEONGREEN, 0.4), lighten(G.C.DCKST_NEONGREEN, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Route' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("route")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_NEONGREEN)
        ease_background_colour{new_colour = G.C.DCKST_NEONGREEN, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "mega_tram_pack",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 3, y = 4 },
    config = { extra = 5, choose = 2},
    kind = 'tram_pack',
    group_key = "k_dckst_tram_pack_mega",
    weight = 0.25,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_NEONGREEN },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_tram_pack_mega"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_NEONGREEN, 0.4), lighten(G.C.DCKST_NEONGREEN, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Route' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("route")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_NEONGREEN)
        ease_background_colour{new_colour = G.C.DCKST_NEONGREEN, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "spectaclaw_pack_1",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 0, y = 5 },
    config = { extra = 2, choose = 1},
    kind = 'spectaclaw_pack',
    group_key = "k_dckst_spectaclaw_pack",
    weight = 0.5,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_PERI },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_spectaclaw_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_PERI, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Spectaclaw' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("route")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_PERI)
        ease_background_colour{new_colour = G.C.DCKST_PERI, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "spectaclaw_pack_2",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 1, y = 5 },
    config = { extra = 2, choose = 1},
    kind = 'spectaclaw_pack',
    group_key = "k_dckst_spectaclaw_pack",
    weight = 0.5,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_PERI },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_spectaclaw_pack_normal"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_PERI, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Spectaclaw' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("route")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_PERI)
        ease_background_colour{new_colour = G.C.DCKST_PERI, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "jumbo_spectaclaw_pack",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 2, y = 5 },
    config = { extra = 4, choose = 1},
    kind = 'spectaclaw_pack',
    group_key = "k_dckst_spectaclaw_pack_jumbo",
    weight = 0.5,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_PERI },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_spectaclaw_pack_jumbo"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_PERI, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Spectaclaw' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("route")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_PERI)
        ease_background_colour{new_colour = G.C.DCKST_PERI, special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "mega_spectaclaw_pack",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 3, y = 5 },
    config = { extra = 4, choose = 2},
    kind = 'spectaclaw_pack',
    group_key = "k_dckst_spectaclaw_pack_mega",
    weight = 0.25,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_PERI },
                card.ability.choose,
                card.ability.extra,
            },
            key = "p_dckst_spectaclaw_pack_mega"
        }
    end,
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.DCKST_PERI, 0.4), lighten(G.C.DCKST_RED, 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Spectaclaw' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_star", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("route")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_PERI)
        ease_background_colour{new_colour = G.C.DCKST_PERI, special_colour = HEX("000000"), contrast = 2}
    end,
}

-- Shared helper: builds a pool of Decksterity jokers the player doesn't own,
-- AND excludes jokers already dealt into the CURRENT pack being opened
-- (fixes duplicate rolls on choose=2 packs, since G.jokers.cards isn't updated
-- until cards are actually kept/added, not just dealt into the pack area).
local function dckst_get_unowned_joker_key(booster_card)
    -- Track jokers already dealt into this specific pack instance.
    -- Stored on the booster_card itself so each pack opening has its own list.
    booster_card.dckst_dealt_keys = booster_card.dckst_dealt_keys or {}

    -- Build set of owned joker keys (from actual joker area)
    local owned = {}
    for _, joker_card in ipairs(G.jokers.cards) do
        if joker_card.config and joker_card.config.center then
            owned[joker_card.config.center.key] = true
        end
    end

    -- Build set of keys already dealt into this pack instance
    local dealt = {}
    for _, key in ipairs(booster_card.dckst_dealt_keys) do
        dealt[key] = true
    end

    -- Filter pool: Decksterity jokers, not owned, not already dealt this pack
    local shuffle_pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker"
        and center.pools and center.pools["decksterity"]
        and not owned[key]
        and not dealt[key] then
            table.insert(shuffle_pool, key)
        end
    end

    -- Fallback 1: ignore "dealt this pack" filter if pool runs dry
    -- (better a repeat within the pack than a hard failure)
    if #shuffle_pool == 0 then
        print("WARNING: Decksterity pool exhausted after dedup-within-pack, relaxing dealt filter")
        for key, center in pairs(G.P_CENTERS) do
            if center.set == "Joker"
            and center.pools and center.pools["decksterity"]
            and not owned[key] then
                table.insert(shuffle_pool, key)
            end
        end
    end

    -- Fallback 2: player owns everything Decksterity has to offer
    if #shuffle_pool == 0 then
        print("WARNING: Shuffle pool empty (all owned), falling back to full Decksterity pool")
        for key, center in pairs(G.P_CENTERS) do
            if center.set == "Joker" and center.pools and center.pools["decksterity"] then
                table.insert(shuffle_pool, key)
            end
        end
    end

    local chosen_key = pseudorandom_element(shuffle_pool)

    if not chosen_key or not G.P_CENTERS[chosen_key] then
        print("WARNING: Missing Joker center for", tostring(chosen_key))
        chosen_key = "j_joker"
    end

    -- Record this pick so subsequent create_card calls in the same pack skip it
    table.insert(booster_card.dckst_dealt_keys, chosen_key)

    return chosen_key
end

-- Shared create_card function used by all Decksteritical packs
local function dckst_pack_create_card(self, booster_card)
    local chosen_key = dckst_get_unowned_joker_key(booster_card)
    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end

-- Shared background ease function
local function dckst_pack_ease_bg(self)
    ease_colour(G.C.DYN_UI.MAIN, G.C.DCKST_RED)
    ease_background_colour{ new_colour = G.C.DCKST_RED, special_colour = G.C.WHITE, contrast = 2 }
end

SMODS.Booster {
    key = "decksteritical_pack_1",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 0, y = 6 },
    config = { extra = 2, choose = 1 },
    kind = 'decksteritical_pack',
    group_key = "k_dckst_decksteritical_pack",
    weight = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { colours = { G.C.DCKST_RED }, card.ability.choose, card.ability.extra },
            key = "p_dckst_decksteritical_pack_normal"
        }
    end,
    draw_hand = false,
    unlocked = true,
    discovered = false,
    create_card = dckst_pack_create_card,
    ease_background_colour = dckst_pack_ease_bg,
}

SMODS.Booster {
    key = "decksteritical_pack_2",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 1, y = 6 },
    config = { extra = 2, choose = 1 },
    kind = 'decksteritical_pack',
    group_key = "k_dckst_decksteritical_pack",
    weight = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { colours = { G.C.DCKST_RED }, card.ability.choose, card.ability.extra },
            key = "p_dckst_decksteritical_pack_normal"
        }
    end,
    draw_hand = false,
    unlocked = true,
    discovered = false,
    create_card = dckst_pack_create_card,
    ease_background_colour = dckst_pack_ease_bg,
}

SMODS.Booster {
    key = "jumbo_decksteritical_pack",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 2, y = 6 },
    config = { extra = 4, choose = 1 },
    kind = 'decksteritical_pack',
    group_key = "k_dckst_decksteritical_pack_jumbo",
    weight = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { colours = { G.C.DCKST_RED }, card.ability.choose, card.ability.extra },
            key = "p_dckst_decksteritical_pack_jumbo"
        }
    end,
    draw_hand = false,
    unlocked = true,
    discovered = false,
    create_card = dckst_pack_create_card,
    ease_background_colour = dckst_pack_ease_bg,
}

SMODS.Booster {
    key = "mega_decksteritical_pack",
    set = "Booster",
    atlas = 'packs',
    pos = { x = 3, y = 6 },
    config = { extra = 4, choose = 2 },
    kind = 'decksteritical_pack',
    group_key = "k_dckst_decksteritical_pack_mega",
    weight = 1,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { colours = { G.C.DCKST_RED }, card.ability.choose, card.ability.extra },
            key = "p_dckst_decksteritical_pack_mega"
        }
    end,
    draw_hand = false,
    unlocked = true,
    discovered = false,
    create_card = dckst_pack_create_card,
    ease_background_colour = dckst_pack_ease_bg,
}