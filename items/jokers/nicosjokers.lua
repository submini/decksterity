SMODS.Joker {
    key = "benny",
    config = {
        extra = {
            chip_percent = 0
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 7,
    rarity = 2, -- Uncommon
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local min_v = card.ability.extra.min or 0
        local max_v = card.ability.extra.max or 100
        local r_percents = {}
        for i = min_v, max_v do
            r_percents[#r_percents + 1] = tostring(i) .. '%'
        end

        -- Rotate the array so index 1 isn't always min_v (the "always starts at 0%" fix)
        local offset = math.random(0, #r_percents - 1)
        if offset > 0 then
            local rotated = {}
            for i = 1, #r_percents do
                rotated[i] = r_percents[((i - 1 + offset) % #r_percents) + 1]
            end
            r_percents = rotated
        end
        local main_start = {
            { n = G.UIT.R, config = { align = 'cm' }, nodes = {
                { n = G.UIT.T, config = { text = localize('k_dckst_benny_line1'), colour = G.C.UI.TEXT_DARK, scale = 0.32 } },
            } },
            { n = G.UIT.R, config = { align = 'cm' }, nodes = {
                { n = G.UIT.T, config = { text = localize('k_dckst_benny_line2'), colour = G.C.UI.TEXT_DARK, scale = 0.32 } },
                { n = G.UIT.O, config = { object = DynaText({
                    string = r_percents,
                    colours = { G.C.FILTER },
                    pop_in_rate = 9999999,
                    silent = true,
                    random_element = true,
                    pop_delay = 0.5,
                    scale = 0.32,
                    min_cycle_time = 0
                }) } },
            } },
        }
        return { main_start = main_start }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            if G.GAME.chips / G.GAME.blind.chips >= (card.ability.extra.chip_percent / 100) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
                        play_sound('tarot1')
                        SMODS.destroy_cards(card, nil, true)
                        return true
                    end
                }))
                return {
                    message = localize('k_saved_ex'),
                    saved = true,
                    colour = G.C.RED
                }
            end
        end
    end,
}

local dckst_benny_update_ref = Game.update
function Game:update(dt)
    dckst_benny_update_ref(self, dt)

    if not G.SETTINGS.paused then
        G.GAME.dckst_benny_timer = (G.GAME.dckst_benny_timer or 0) + dt * math.min(G.SETTINGS.GAMESPEED, 4)

        if G.GAME.dckst_benny_timer >= 1.0 then
            G.GAME.dckst_benny_timer = G.GAME.dckst_benny_timer - 1.0

            if G.jokers and G.jokers.cards then
                for _, joker_card in ipairs(G.jokers.cards) do
                    if joker_card.config.center.key == 'j_dckst_benny' then
                        joker_card.ability.extra.chip_percent = pseudorandom('dckst_benny_roll', 0, 100) / 1
                    end
                end
            end
        end
    end
end

SMODS.Joker {
    key = "smileghost",
    config = {
        extra = {
            h1_discard_gain = 1, h2_discard_gain = 2, h3_discard_gain = 3,
            h1_hand_gain    = 1, h2_hand_gain    = 2, h3_hand_gain    = 3,
            discard_chance_denom = 2,
            hand_chance_denom    = 3, 
            threshold = 5,
        }
    },
    pos = { x = 0, y = 7 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 11,
    rarity = "dckst_mediumrare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        local gain = DCKST.gset_val(e.h1_discard_gain, e.h2_discard_gain, e.h3_discard_gain)
        local dnum, ddenom = SMODS.get_probability_vars(card, 1, e.discard_chance_denom, 'j_dckst_smileghost_discard')
        local hnum, hdenom = SMODS.get_probability_vars(card, 1, e.hand_chance_denom, 'j_dckst_smileghost_hand')
        return { vars = { dnum, ddenom, gain, hnum, hdenom, gain, e.threshold } }
    end,

    calculate = function(self, card, context)
    local e = card.ability.extra

    -- Discard action: fires once with the full discarded batch.
    if context.pre_discard and context.full_hand then
        if #context.full_hand >= e.threshold then
            if SMODS.pseudorandom_probability(card, 'j_dckst_smileghost_discard', 1, e.discard_chance_denom, 'j_dckst_smileghost_discard') then
                local discard_gain = DCKST.gset_val(e.h1_discard_gain, e.h2_discard_gain, e.h3_discard_gain)
                return {
                    func = function()
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards + discard_gain
                        ease_discard(discard_gain)
                        return true
                    end,
                }
            end
        end
    end

    -- Play action: fires once with the full played hand, before scoring.
    if context.before and context.full_hand then
        if #context.full_hand >= e.threshold then
            if SMODS.pseudorandom_probability(card, 'j_dckst_smileghost_hand', 1, e.hand_chance_denom, 'j_dckst_smileghost_hand') then
                local hand_gain = DCKST.gset_val(e.h1_hand_gain, e.h2_hand_gain, e.h3_hand_gain)
                return {
                    func = function()
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands + hand_gain
                        ease_hands_played(hand_gain)
                        return true
                    end,
                }
            end
        end
    end
end,
}

SMODS.Joker {
    key = "blonk",
    config = {
        extra = {
            h1_min = 0.2, h1_max = 2.0, h1_step = 0.1,
            h2_min = 0.2, h2_max = 2.0, h2_step = 0.1,
            h3_min = 0.01, h3_max = 0.70, h3_step = 0.01,

            xmult = 1,
            emult = 1, 
        }
    },
    pos = { x = 1, y = 7 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 7,
    rarity = 2, -- Uncommon
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_min, e.h3_max, e.emult } }
        end
        return { vars = { e.h1_min, e.h1_max, e.xmult } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        if context.joker_main then
            local min, max, step
            if DCKST.gset(3) then
                min, max, step = e.h3_min, e.h3_max, e.h3_step
            else
                min, max, step = e.h1_min, e.h1_max, e.h1_step
            end

            local steps = math.floor((max - min) / step + 0.5)
            local roll = pseudorandom('j_dckst_blonk_jump', 0, steps)
            local jump_height = min + (roll * step)
            jump_height = math.floor(jump_height * 100 + 0.5) / 100
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
            message = localize('k_dckst_boing'),
            })

            if DCKST.gset(3) then
                e.emult = e.emult + jump_height
                return {
                    e_mult = e.emult,
                    card = card
                }
            else
                e.xmult = e.xmult + jump_height
                return {
                    Xmult = e.xmult,
                    card = card
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "wavgun",
    config = {
        extra = {
            max_shots = 12,
            shots_used = 0,
        }
    },
    pos = { x = 2, y = 7 },
    soul_pos = { x = 4, y = 2 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 19,
    rarity = "dckst_exquisite",
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        return { vars = { e.shots_used, e.max_shots } }
    end,

    calculate = function(self, card, context) 
    if context.blind_disabled then
        if card.ability.extra.shots_used == card.ability.extra.max_shots then 
            G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.destroy_cards(card, nil, true)
                        return true
                    end
                }))
        end
    end
    end,

    update = function(self, card, dt)
        local extra = card.ability.extra
        local is_active = extra.shots_used < extra.max_shots
            and G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled

        if is_active and not card.dckst_wavgun_pulsing then
            card.dckst_wavgun_pulsing = true
            local eval = function()
                local e = card.ability.extra
                return e.shots_used < e.max_shots
                    and G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled
            end
            juice_card_until(card, eval, true)
        elseif not is_active then
            card.dckst_wavgun_pulsing = nil
        end
    end,
}

local card_align_h_popup_ref = Card.align_h_popup
function Card:align_h_popup()
    if self.config.center and self.config.center.key == 'j_dckst_wavgun' then
        return {
            major = self,
            parent = self,
            xy_bond = 'Strong',
            r_bond = 'Weak',
            wh_bond = 'Weak',
            offset = { x = -3, y = 2 },
            type = 'cl',
        }
    end
    return card_align_h_popup_ref(self)
end

-- Restore normal left-click behaviour; Wavgun fires on right-click instead.
local card_click_ref = Card.click
function Card:click()
    return card_click_ref(self)
end

local love_mousepressed_ref = love.mousepressed
function love.mousepressed(x, y, button, ...)
    if button == 2 and G.CONTROLLER and G.CONTROLLER.hovering and G.CONTROLLER.hovering.target then
        local card = G.CONTROLLER.hovering.target
        if card.config and card.config.center and card.config.center.key == 'j_dckst_wavgun' and card.area == G.jokers then
            local extra = card.ability.extra
            local can_fire = extra.shots_used < extra.max_shots
                and G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled

            if can_fire then
                extra.shots_used = extra.shots_used + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind:disable()
                        play_sound('dckst_wavgunfire')
                        return true
                    end
                }))
                card:juice_up(0.8, 0.8)
                card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_dckst_wavgun_fire'), colour = G.C.RED })
            else
                card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_dckst_wavgun_unusable'), colour = G.C.UI.TEXT_INACTIVE })
            end
            return
        end
    end
    return love_mousepressed_ref(x, y, button, ...)
end

SMODS.Joker {
    key = "sunshine",
    config = {
        extra = {
            h1_xscore_gain = 0.2,
            h2_xscore_gain = 0.6,
            h3_escore_gain = 0.06,

            xscore = 1,
            escore = 1,
        }
    },
    pos = { x = 3, y = 7 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 14,
    rarity = "dckst_mediumwell",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_escore_gain, e.escore } }
        elseif DCKST.gset(2) then
            return { vars = { e.h2_xscore_gain, e.xscore } }
        end
        return { vars = { e.h1_xscore_gain, e.xscore } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        if context.individual and context.cardarea == G.play then
            local val = context.other_card.base.value
            if val == '2' or val == '3' or val == '6' then

                if DCKST.gset(3) then
                    e.escore = e.escore + e.h3_escore_gain
                else
                    local gain = DCKST.gset_val(e.h1_xscore_gain, e.h2_xscore_gain, e.h2_xscore_gain)
                    e.xscore = e.xscore + gain
                end

                return { message = localize('k_upgrade_ex'), }
            end
        end

        if context.joker_main then
            if DCKST.gset(3) then
                return {
                    e_score = e.escore,
                    card = card
                }
            else
                return {
                    x_score = e.xscore,
                    card = card
                }
            end
        end
    end,
}



local function dckst_dream_active()
    local ok, result = pcall(function()
        if not (G.jokers and G.jokers.cards) then return false end
        for _, j in ipairs(G.jokers.cards) do
            if j and j.config and j.config.center and j.config.center.key == 'j_dckst_dream' and not j.debuff then
                return true
            end
        end
        return false
    end)
    return ok and result
end

-- Log-uniform roll, X1 to X100 (two orders of magnitude).
local function dckst_dream_roll(seed)
    return 10 ^ pseudorandom(seed or 'dckst_dream', 0, 2)
end

SMODS.Joker {
    key = "dream",
    config = { extra = {} },
    pos = { x = 4, y = 7 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 16,
    rarity = "dckst_welldone",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,
}
local DCKST_DREAM_KINDS = {
    chips = 'add', h_chips = 'add', chip_mod = 'add',
    mult = 'add', h_mult = 'add', mult_mod = 'add',
    score = 'add',

    xchips = 'op', x_chips = 'op',
    xmult = 'op', x_mult = 'op', Xmult_mod = 'op',
    echips = 'op', e_chips = 'op',
    emult = 'op', e_mult = 'op',
    x_score = 'op', e_score = 'op',
    ee_score = 'op', eee_score = 'op',

    -- { arrows, value } style effects
    hypermult = 'hyper', hyperchips = 'hyper', hyper_score = 'hyper',
}

-- Continuous log-uniform roll in [1, 100].
local function dckst_dream_roll(seed)
    return 10 ^ (pseudorandom(seed) * 2)
end

local dckst_dream_cie_ref = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
    local kind = DCKST_DREAM_KINDS[key]
    if kind and dckst_dream_active() then
        local roll = dckst_dream_roll('dckst_dream_' .. key)

        if kind == 'hyper' then
            -- amount = { arrows, value }; scale the value, never the arrow count.
            if type(amount) == 'table' then
                local v = tonumber(to_number(amount[2]))
                if v and v > 1 then
                    amount = { amount[1], 1 + (v - 1) * roll }
                end
            end
        else
            local n = tonumber(to_number(amount))
            if n then
                if kind == 'add' and n > 0 then
                    amount = n * roll
                elseif kind == 'op' and n > 1 then
                    -- Scale the boost above 1 so "no effect" stays untouched.
                    amount = 1 + (n - 1) * roll
                end
            end
        end
    end
    return dckst_dream_cie_ref(effect, scored_card, key, amount, from_edition)
end

SMODS.Joker {
    key = "liminesque",
    config = {
        extra = {
            threshold = 250,
            straights = 0,
            h1_arrows = 3, h1_value = 3,   
            h3_arrows = 4, h3_value = 3,  
        }
    },
    pos = { x = 0, y = 8 }, 
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        local key = DCKST.gset(3) and (self.key .. '_h3') or nil
        return { key = key, vars = { e.threshold, e.straights, DCKST.gset_val(e.h1_value, e.h1_value, e.h3_value) } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Count Straights, once per hand, in the before context.
        if context.before and context.poker_hands and not context.blueprint then
            if e.straights < e.threshold and context.poker_hands['Straight'] then
                e.straights = e.straights + 1
                if e.straights >= e.threshold then
                    return {
                        message = localize('k_active_ex'),
                        card = card
                    }
                end
            end
        end

        if context.joker_main and (e.straights or 0) >= e.threshold then
            if DCKST.gset(3) then
                return { hypermult = { e.h3_arrows, e.h3_value }, card = card }
            end
            return { hypermult = { e.h1_arrows, e.h1_value }, card = card }
        end
    end,
}

SMODS.Joker {
    key = "speed_coil",
    config = {
        extra = {
            h1_gain = 0.5,
            h2_gain = 0.7,
            h3_gain = 0.05,

            xmult = 1,
            emult = 1,
        }
    },
    pos = { x = 1, y = 8 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 7,
    rarity = 2, -- Uncommon
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_gain, e.emult } }
        elseif DCKST.gset(2) then
            return { vars = { e.h2_gain, e.xmult } }
        end
        return { vars = { e.h1_gain, e.xmult } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Scale once per hand, by the current game speed.
        if context.before and not context.blueprint then
            local speed = G.SETTINGS.GAMESPEED or 1
            if DCKST.gset(3) then
                e.emult = e.emult + e.h3_gain * speed
            else
                e.xmult = e.xmult + DCKST.gset_val(e.h1_gain, e.h2_gain, e.h2_gain) * speed
            end
            return { message = localize('k_upgrade_ex'), card = card }
        end

        -- Apply the stored value.
        if context.joker_main then
            if DCKST.gset(3) then
                if e.emult > 1 then return { emult = e.emult, card = card } end
            elseif e.xmult > 1 then
                return { xmult = e.xmult, card = card }
            end
        end
    end,
}

SMODS.Joker {
    key = "gravity_coil",
    config = {
        extra = {
            h1_gain = 0.7,
            h2_gain = 1,
            h3_gain = 0.08,

            xchips = 1,
            echips = 1,
        }
    },
    pos = { x = 2, y = 8 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 7,
    rarity = 2, -- Uncommon
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_gain, e.echips } }
        elseif DCKST.gset(2) then
            return { vars = { e.h2_gain, e.xchips } }
        end
        return { vars = { e.h1_gain, e.xchips } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Scale once per hand, by the current game speed.
        if context.before and not context.blueprint then
            local speed = G.SETTINGS.GAMESPEED or 1
            if DCKST.gset(3) then
                e.echips = e.echips + e.h3_gain * speed
            else
                e.xchips = e.xchips + DCKST.gset_val(e.h1_gain, e.h2_gain, e.h2_gain) * speed
            end
            return { message = localize('k_upgrade_ex'), card = card }
        end

        -- Apply the stored value.
        if context.joker_main then
            if DCKST.gset(3) then
                if e.echips > 1 then return { echips = e.echips, card = card } end
            elseif e.xchips > 1 then
                return { xchips = e.xchips, card = card }
            end
        end
    end,
}

SMODS.Joker {
    key = "dev_envmap",
    config = {
        extra = {
            h1_gain = 0.75,  
            h3_gain = 0.05,  

            per = 2,          
            used = 0,         

            xchips = 1,
            echips = 1,
        }
    },
    pos = { x = 3, y = 8 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 5,
    rarity = 1, -- Common
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Count consumables; gain on every 2nd one.
        if context.using_consumeable and not context.blueprint then
            e.used = e.used + 1
            if e.used >= e.per then
                e.used = e.used - e.per
                if DCKST.gset(3) then
                    e.echips = e.echips + e.h3_gain
                else
                    e.xchips = e.xchips + e.h1_gain
                end
                return { message = localize('k_upgrade_ex'), card = card }
            end
        end

        -- Apply the stored value.
        if context.joker_main then
            if DCKST.gset(3) then
                if e.echips > 1 then return { echips = e.echips, card = card } end
            elseif e.xchips > 1 then
                return { xchips = e.xchips, card = card }
            end
        end
    end,
}

SMODS.Joker {
    key = "polb",
    config = {
        extra = {
            h1_gain = 0.8,  
            h2_gain = 1,     
            h3_gain = 0.1,   

            xchips = 1,
            echips = 1,
        }
    },
    pos = { x = 4, y = 8 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_gain, e.echips } }
        elseif DCKST.gset(2) then
            return { vars = { e.h2_gain, e.xchips } }
        end
        return { vars = { e.h1_gain, e.xchips } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Scale for each scored dark-suited card.
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local scored = context.other_card
            if scored and (scored:is_suit('Spades') or scored:is_suit('Clubs')) then
                if DCKST.gset(3) then
                    e.echips = e.echips + e.h3_gain
                else
                    e.xchips = e.xchips + DCKST.gset_val(e.h1_gain, e.h2_gain, e.h2_gain)
                end
                return { message = localize('k_upgrade_ex'), card = card }
            end
        end

        -- Apply the stored value.
        if context.joker_main then
            if DCKST.gset(3) then
                if e.echips > 1 then return { echips = e.echips, card = card } end
            elseif e.xchips > 1 then
                return { xchips = e.xchips, card = card }
            end
        end
    end,
}

SMODS.Joker {
    key = "jermias",
    config = {
        extra = {
            arrows = 2,         
            good_value = 8.5,    
            bad_value = 0.85,    
            odds = 4,            
        }
    },
    pos = { x = 0, y = 9 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 9,
    rarity = 3, -- Rare
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        local num, denom = SMODS.get_probability_vars(card, 1, e.odds, 'j_dckst_jermias')
        return { vars = { e.good_value } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        if context.joker_main then
            if SMODS.pseudorandom_probability(card, 'jermias', 1, e.odds, 'j_dckst_jermias') then
                return { hypermult = { e.arrows, e.bad_value }, card = card }
            end
            return { hypermult = { e.arrows, e.good_value }, card = card }
        end
    end,
}

SMODS.Joker {
    key = "follower",
    config = {
        extra = {
            h2_div = 10,     
            h3_div = 100,   

            stored = 0,      
        }
    },
    pos = { x = 1, y = 9 }, 
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 11,
    rarity = "dckst_mediumrare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        local shown = number_format(e.stored)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_div, shown } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { e.h2_div, shown } }
        end
        return { vars = { shown } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Pay out the remembered Mult as Score on this hand.
        if context.joker_main and e.stored > 0 then
            if DCKST.gset(3) then
                local val = 1 + (e.stored / e.h3_div)
                return { e_score = val, card = card }
            elseif DCKST.gset(2) then
                local val = 1 + (e.stored / e.h2_div)
                return { x_score = val, card = card }
            else
                return { score = e.stored, card = card }
            end
        end

        -- After scoring: remember this hand's final Mult for next time.
        if context.after and not context.blueprint then
            local m = G.GAME.dckst_last_final_mult
            e.stored = m and tonumber(to_number(m)) or 0
        end
    end,
}

-- Record the final Mult of every scored hand, right before it is committed.
local dckst_follower_ref = SMODS.calculate_round_score
function SMODS.calculate_round_score(flames)
    local final_mult = SMODS.Scoring_Parameters
        and SMODS.Scoring_Parameters.mult
        and SMODS.Scoring_Parameters.mult.current
    if final_mult ~= nil then
        G.GAME.dckst_last_final_mult = final_mult
    end
    return dckst_follower_ref(flames)
end


local DCKST_MVP_EFFECTS = {
    { weight = 3, apply = function(card)
        local n = pseudorandom('dckst_mvp_chips', 8, 25)
        return { chips = n}
    end },
    { weight = 3, apply = function(card)
        local n = pseudorandom('dckst_mvp_mult', 4, 12)
        return { mult = n, }
    end },
    { weight = 2, apply = function(card)
        local n = 1 + pseudorandom('dckst_mvp_xmult', 0.15, 0.5)
        return { x_mult = n,  }
    end },
    { weight = 2, apply = function(card)
        local n = pseudorandom('dckst_mvp_dollars', 2, 6)
        return { dollars = n, }
    end },
    { weight = 1, apply = function(card)
        return {
            level_up = 1,
            level_up_hand = context_current_hand_name,
            message = localize('k_level_up_ex')
        }
    end },
    -- drawbacks, to keep the chaos honest
    { weight = 2, apply = function(card)
        local n = pseudorandom('dckst_mvp_neg_chips', 5, 15)
        return { chips = -n, }
    end },
    { weight = 1, apply = function(card)
        local n = pseudorandom('dckst_mvp_neg_mult', 2, 6)
        return { mult = -n,}
    end },
}

SMODS.Joker {
    key = "morevariedpathfinder",
    config = { extra = {} },
    pos = { x = 2, y = 9 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 6,
    rarity = 2, -- Uncommon
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
    local hex_chars = { '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F' }
    local prefixes = { '0x','1x','2x','3x','4x','5x','6x','7x','8x','9x' }
    local easter_eggs = {
        '0xDEADBEEFCAFEF00D',
        '0xC0FFEEBADF00DFEE',
        '0xFACEFEEDDEADC0DE',
        '0x1337BABE0BADCAFE',
        '0x0DDBALLBEEFCAKE1',
        '0xDEADD00DFACEB00C',
    }

    local hex_strings = {}
    for i = 1, 40 do
        -- occasional easter egg among the noise
        if pseudorandom('dckst_mvp_hexegg'..i) < 0.08 then
            hex_strings[#hex_strings + 1] = pseudorandom_element(easter_eggs, pseudoseed('dckst_mvp_hexeggpick'..i))
        else
            local prefix = pseudorandom_element(prefixes, pseudoseed('dckst_mvp_hexprefix'..i))
            local s = prefix
            for j = 1, 16 do
                s = s .. pseudorandom_element(hex_chars, pseudoseed('dckst_mvp_hexchar'..i..j))
            end
            hex_strings[#hex_strings + 1] = s
        end
    end

    local main_start = {
        { n = G.UIT.R, config = { align = 'cm' }, nodes = {
            { n = G.UIT.O, config = { object = DynaText({
                string = hex_strings,
                colours = { G.C.FILTER, G.C.GREEN, G.C.DARK_EDITION },
                pop_in_rate = 9999999,
                silent = true,
                random_element = true,
                pop_delay = 0.28,
                scale = 0.35,
                min_cycle_time = 0
            }) } },
        } },
    }
    return { main_start = main_start }
end,

    calculate = function(self, card, context)
    if context.before and context.scoring_name then
        card.ability.extra.last_hand = context.scoring_name
    end

    if context.joker_main then
        local total_weight = 0
        for _, e in ipairs(DCKST_MVP_EFFECTS) do total_weight = total_weight + e.weight end

        local roll = pseudorandom('dckst_mvp_pick', 1, total_weight)
        local running = 0
        local chosen = DCKST_MVP_EFFECTS[#DCKST_MVP_EFFECTS]
        for _, e in ipairs(DCKST_MVP_EFFECTS) do
            running = running + e.weight
            if roll <= running then
                chosen = e
                break
            end
        end

        local ret = chosen.apply(card)
        if ret.level_up then
            ret.level_up_hand = card.ability.extra.last_hand or 'High Card'
        end
        ret.card = card
        return ret
    end
end,
}

SMODS.Joker {
    key = "hopper",
    config = {
        extra = {
            hops = 0,
        }
    },
    pos = { x = 3, y = 9 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 13,
    rarity = "dckst_medium",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hops } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.hops > 0 then
            return {
                mult = card.ability.extra.hops,
                card = card
            }
        end
    end,
}

local dckst_hopper_update_ref = Game.update
function Game:update(dt)
    dckst_hopper_update_ref(self, dt)

    if not G.SETTINGS.paused then
        -- In-game seconds: scales with GAMESPEED, same pattern as Benny/H-bar.
        G.GAME.dckst_hopper_timer = (G.GAME.dckst_hopper_timer or 0) + dt * (G.SETTINGS.GAMESPEED or 1)

        if G.GAME.dckst_hopper_timer >= 1.0 then
            G.GAME.dckst_hopper_timer = G.GAME.dckst_hopper_timer - 1.0

            if G.jokers and G.jokers.cards then
                for _, joker_card in ipairs(G.jokers.cards) do
                    if joker_card.config.center.key == 'j_dckst_hopper' then
                        joker_card.ability.extra.hops = joker_card.ability.extra.hops + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                joker_card:juice_up(1, 0.1)
                                return true
                            end
                        }))
                    end
                end
            end
        end
    end
end

SMODS.Joker {
    key = "cootie",
    config = {
        extra = {
            h1_gain = 0.3,
            h2_gain = 0.7,
            h3_gain = 0.7,

            xmult = 1,
            emult = 1,
        }
    },
    pos = { x = 4, y = 9 },
    soul_pos = { y = 0 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 20,
    rarity = 4, -- Legendary
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    soul_atlas = 'cootie_ani',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_gain, e.emult } }
        elseif DCKST.gset(2) then
            return { vars = { e.h2_gain, e.xmult } }
        end
        return { vars = { e.h1_gain, e.xmult } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Trigger off any OTHER nn_jokers card firing, not itself.
        if context.other_joker
            and context.other_joker ~= card
            and not context.blueprint
        then
            local center = context.other_joker.config and context.other_joker.config.center
            local attrs = center and center.attributes
            local is_nnb = attrs and (
                (type(attrs) == 'table' and attrs.nn_jokers)
                or (type(attrs) == 'table' and (function()
                    for _, a in ipairs(attrs) do if a == 'nn_jokers' then return true end end
                    return false
                end)())
            )

            if is_nnb then
                if DCKST.gset(3) then
                    e.emult = e.emult + e.h3_gain
                else
                    e.xmult = e.xmult + DCKST.gset_val(e.h1_gain, e.h2_gain, e.h2_gain)
                end
                return {
                    message = localize('k_upgrade_ex'),
                    card = card
                }
            end
        end

        -- Apply the stored value.
        if context.joker_main then
            if DCKST.gset(3) then
                if e.emult > 1 then return { emult = e.emult, card = card } end
            elseif e.xmult > 1 then
                return { xmult = e.xmult, card = card }
            end
        end
    end,
}

SMODS.Joker {
    key = "jess",
    config = {
        extra = {
            h1_gain = 0.75,
            h2_gain = 1,
            h3_gain = 0.2,

            period = 3,   
            revolutions = 0,
        }
    },
    pos = { x = 0, y = 10 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 15,
    rarity = "dckst_mediumwell",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
    local e = card.ability.extra
    local gain = DCKST.gset_val(e.h1_gain, e.h2_gain, e.h3_gain)
    local combined = 1 + e.revolutions * gain
    if DCKST.gset(3) then
        return { key = self.key..'_h3', vars = { e.h3_gain, e.revolutions, e.period, combined } }
    elseif DCKST.gset(2) then
        return { vars = { e.h2_gain, e.revolutions, e.period, combined } }
    end
    return { vars = { e.h1_gain, e.revolutions, e.period, combined } }
end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        if context.joker_main and e.revolutions > 0 then
            if DCKST.gset(3) then
                return { e_score = 1 + e.revolutions * e.h3_gain, card = card }
            end
            local gain = DCKST.gset_val(e.h1_gain, e.h2_gain, e.h2_gain)
            return { x_score = 1 + e.revolutions * gain, card = card }
        end
    end,
}

local dckst_jess_update_ref = Game.update
function Game:update(dt)
    dckst_jess_update_ref(self, dt)

    if not G.SETTINGS.paused then
        -- In-game seconds: scales with GAMESPEED, same pattern as Hopper.
        G.GAME.dckst_jess_timer = (G.GAME.dckst_jess_timer or 0) + dt * (G.SETTINGS.GAMESPEED or 1)

        if G.jokers and G.jokers.cards then
            for _, joker_card in ipairs(G.jokers.cards) do
                if joker_card.config.center.key == 'j_dckst_jess' then
                    local period = joker_card.ability.extra.period or 3
                    if G.GAME.dckst_jess_timer >= period then
                        -- Handles multiple periods elapsing between updates.
                        local completed = math.floor(G.GAME.dckst_jess_timer / period)
                        G.GAME.dckst_jess_timer = G.GAME.dckst_jess_timer - (completed * period)
                        joker_card.ability.extra.revolutions = joker_card.ability.extra.revolutions + completed
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                joker_card:juice_up(1, 0.1)
                                return true
                            end
                        }))
                    end
                end
            end
        end
    end
end



-- ===== SCREENSAVER =====
DCKST.screensaver = DCKST.screensaver or { windows = {}, timer = 0, next_spawn = 2 }

local SS_MAX_WINDOWS = 10
local SS_TOTAL_ERRORS = 50

-- Array of sound options for window spawning
local SS_SPAWN_SOUNDS = { "dckst_win95", "dckst_winxp", "dckst_win8" }

-- Lazy-load helper so it checks G.localization when the game is actually running
local function get_ss_error(i)
    local key = string.format("k_dckst_screensaver_msg_%d", i)
    local dict = G.localization and G.localization.misc and G.localization.misc.dictionary
    local val = dict and dict[key] or localize(key)

    if type(val) == "table" and #val >= 2 then
        return val
    elseif type(val) == "string" and val ~= key then
        return { "Windows Error", val }
    end

    -- Ultimate fallback if localization isn't loaded yet
    return { "Windows 95", "Fatal exception " .. i .. " has occurred." }
end

-- Active (non-debuffed) Screensavers. Used for spawning and rewards.
local function ss_get_jokers()
    local found = {}
    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            if j.config and j.config.center and j.config.center.key == 'j_dckst_screensaver' and not j.debuff then
                found[#found + 1] = j
            end
        end
    end
    return found
end

-- Is any Screensaver still in the player's possession? (debuffed or not)
local function ss_owned()
    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            if j.config and j.config.center and j.config.center.key == 'j_dckst_screensaver' and not j.removed then
                return true
            end
        end
    end
    return false
end

-- States that count as "inside a round"
local function ss_in_round()
    if G.STAGE ~= G.STAGES.RUN then return false end
    local S = G.STATES
    return G.STATE == S.SELECTING_HAND
        or G.STATE == S.HAND_PLAYED
        or G.STATE == S.DRAW_TO_HAND
        or G.STATE == S.PLAY_TAROT
end

local function ss_clear()
    local ss = DCKST.screensaver
    if #ss.windows > 0 then ss.windows = {} end
    ss.timer = 0
end

-- Window geometry in real screen pixels. x/y are stored as 0-1 fractions so resizing is safe.
local function ss_geometry(win)
    local W, H = love.graphics.getDimensions()
    local s = math.max(0.75, H / 720)
    local w, h = 320 * s, 130 * s
    local x = win.fx * (W - w)
    local y = win.fy * (H - h)
    local bar = 26 * s
    local btn = 20 * s
    return {
        s = s, x = x, y = y, w = w, h = h, bar = bar,
        close = { x = x + w - btn - 4 * s, y = y + (bar - btn) / 2, w = btn, h = btn },
        ok    = { x = x + w / 2 - 40 * s,  y = y + h - 36 * s,     w = 80 * s, h = 26 * s },
    }
end

local function ss_in_rect(mx, my, r)
    return mx >= r.x and mx <= r.x + r.w and my >= r.y and my <= r.y + r.h
end

local ss_font_cache = {}
local function ss_font(size)
    size = math.floor(size + 0.5)
    if not ss_font_cache[size] then
        ss_font_cache[size] = love.graphics.newFont(size)
    end
    return ss_font_cache[size]
end

SMODS.Joker {
    key = "screensaver",
    config = {
        extra = {
            h1_gain = 0.1,
            h2_gain = 0.2,
            h3_gain = 0.01,

            xmult = 1,
            emult = 1,
        }
    },
    pos = { x = 1, y = 10 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 15,
    rarity = "dckst_mediumwell",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["nnb"] = true },
    attributes = { 'nn_jokers' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("nico's nextbots", HEX("01b051"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_gain, e.emult } }
        elseif DCKST.gset(2) then
            return { vars = { e.h2_gain, e.xmult } }
        end
        return { vars = { e.h1_gain, e.xmult } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra
        if context.joker_main then
            if DCKST.gset(3) then
                if e.emult > 1 then return { emult = e.emult, card = card } end
            elseif e.xmult > 1 then
                return { xmult = e.xmult, card = card }
            end
        end
    end,

    -- Instant cleanup the frame the last copy leaves (sold, destroyed, etc.)
    remove_from_deck = function(self, card, from_debuff)
        if from_debuff then return end
        local remaining = 0
        if G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                if j ~= card and j.config and j.config.center and j.config.center.key == 'j_dckst_screensaver' then
                    remaining = remaining + 1
                end
            end
        end
        if remaining == 0 then ss_clear() end
    end,
}

-- Called when the player closes a window: upgrades every owned Screensaver.
local function ss_reward()
    for _, j in ipairs(ss_get_jokers()) do
        local e = j.ability.extra
        if DCKST.gset(3) then
            e.emult = e.emult + e.h3_gain
        else
            e.xmult = e.xmult + DCKST.gset_val(e.h1_gain, e.h2_gain, e.h2_gain)
        end
        card_eval_status_text(j, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
        j:juice_up(0.5, 0.3)
    end
end

-- Spawner / cleanup (real time, not GAMESPEED, so it stays annoying at any speed).
local dckst_ss_update_ref = Game.update
function Game:update(dt)
    dckst_ss_update_ref(self, dt)

    local ss = DCKST.screensaver

    -- Not in a run, or joker no longer in possession: wipe everything
    if G.STAGE ~= G.STAGES.RUN or not ss_owned() then
        ss_clear()
        return
    end

    -- Blind beaten / shop / blind select / etc.: wipe everything
    if not ss_in_round() then
        ss_clear()
        return
    end

    -- Paused, or every copy debuffed: freeze spawning but leave existing windows
    if G.SETTINGS.paused or #ss_get_jokers() == 0 then return end

    ss.timer = ss.timer + dt
    if ss.timer >= ss.next_spawn then
        ss.timer = 0
        ss.next_spawn = 1.5 + math.random() * 2.5
        if #ss.windows < SS_MAX_WINDOWS then
            local rand_idx = math.random(1, SS_TOTAL_ERRORS)
            local msg = get_ss_error(rand_idx)
            ss.windows[#ss.windows + 1] = {
                title = msg[1], text = msg[2],
                fx = math.random(), fy = math.random(),
            }
            -- Play a random OS error sound on spawn
            local chosen_sound = SS_SPAWN_SOUNDS[math.random(#SS_SPAWN_SOUNDS)]
            play_sound(chosen_sound, 1.0, 0.6)
        end
    end
end

-- Drawing: runs after the game has drawn, straight onto the window.
local dckst_ss_draw_ref = love.draw
function love.draw(...)
    dckst_ss_draw_ref(...)

    local ss = DCKST.screensaver
    if not ss.windows[1] or G.STAGE ~= G.STAGES.RUN then return end

    love.graphics.push('all')
    love.graphics.origin()
    love.graphics.setShader()
    love.graphics.setCanvas()
    love.graphics.setColor(1, 1, 1, 1)

    for _, win in ipairs(ss.windows) do
        local g = ss_geometry(win)
        local s = g.s

        -- drop shadow
        love.graphics.setColor(0, 0, 0, 0.35)
        love.graphics.rectangle('fill', g.x + 4 * s, g.y + 4 * s, g.w, g.h)
        -- body
        love.graphics.setColor(0.75, 0.75, 0.75, 1)
        love.graphics.rectangle('fill', g.x, g.y, g.w, g.h)
        -- title bar
        love.graphics.setColor(0.05, 0.15, 0.55, 1)
        love.graphics.rectangle('fill', g.x, g.y, g.w, g.bar)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setFont(ss_font(13 * s))
        love.graphics.print(win.title, g.x + 8 * s, g.y + 5 * s)
        -- close button
        love.graphics.setColor(0.8, 0.1, 0.1, 1)
        love.graphics.rectangle('fill', g.close.x, g.close.y, g.close.w, g.close.h)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setLineWidth(2 * s)
        love.graphics.line(g.close.x + 5 * s, g.close.y + 5 * s, g.close.x + g.close.w - 5 * s, g.close.y + g.close.h - 5 * s)
        love.graphics.line(g.close.x + g.close.w - 5 * s, g.close.y + 5 * s, g.close.x + 5 * s, g.close.y + g.close.h - 5 * s)
        -- message
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.setFont(ss_font(13 * s))
        love.graphics.printf(win.text, g.x + 12 * s, g.y + g.bar + 12 * s, g.w - 24 * s, 'left')
        -- OK button
        love.graphics.setColor(0.6, 0.6, 0.6, 1)
        love.graphics.rectangle('fill', g.ok.x, g.ok.y, g.ok.w, g.ok.h)
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.rectangle('line', g.ok.x, g.ok.y, g.ok.w, g.ok.h)
        love.graphics.printf("OK", g.ok.x, g.ok.y + 4 * s, g.ok.w, 'center')
    end

    love.graphics.pop()
end

-- Clicking: X or OK closes the topmost window under the cursor and pays out.
local dckst_ss_mouse_ref = love.mousepressed
function love.mousepressed(x, y, button, ...)
    local ss = DCKST.screensaver
    if button == 1 and ss.windows[1] and G.STAGE == G.STAGES.RUN then
        for i = #ss.windows, 1, -1 do
            local g = ss_geometry(ss.windows[i])
            if ss_in_rect(x, y, g.close) or ss_in_rect(x, y, g.ok) then
                table.remove(ss.windows, i)
                ss_reward()
                play_sound('cancel', 1.1, 0.5)
                return -- swallow the click
            end
        end
    end
    return dckst_ss_mouse_ref(x, y, button, ...)
end