SMODS.Joker{
    key = "majuscule",
    config = {
        extra = {
            Xmult = 6
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}

SMODS.Joker{
    key = "miniscule",
    config = {
        extra = {
            xchips = 12
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}

SMODS.Joker {
    key = "fraktur",
    config = { extra = {} },
    pos = { x = 2, y = 0 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 15,
    rarity = "dckst_mediumwell",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
    if context.dckst_rescore then
        local has_straight = context.poker_hands and context.poker_hands["Straight"] and #context.poker_hands["Straight"] > 0
        if has_straight  then
            return { dckst_rescore_all = true, card = card }
        end
    end
end
}

SMODS.Joker {
    key = "superscript",
    config = {
        extra = {
            h1_xscore = 1.2,
            h2_xscore = 2,
            h3_escore = 1.2,
        }
    },
    pos = { x = 3, y = 0 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { card.ability.extra.h3_escore } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { card.ability.extra.h2_xscore } }
        end
        return { vars = { card.ability.extra.h1_xscore } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local has_straight = context.poker_hands and context.poker_hands["Straight"] and #context.poker_hands["Straight"] > 0
            if has_straight then
                if DCKST.gset(3) then
                    return {
                        e_score = card.ability.extra.h3_escore,
                        card = card
                    }
                end
                local xscore = DCKST.gset(2) and card.ability.extra.h2_xscore or card.ability.extra.h1_xscore
                return {
                    xscore = xscore,
                    card = card
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "subscript",
    config = {
        extra = {
            h1_xscore = 1,
            h1_gain = 0.2,

            h2_xscore = 1,
            h2_gain = 0.5,

            h3_escore = 1,
            h3_gain = 0.2,

            trigger_count = 0
        }
    },
    pos = { x = 4, y = 0 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 8,
    rarity = 3, -- Rare
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { card.ability.extra.h3_gain, card.ability.extra.h3_escore } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { card.ability.extra.h2_gain, card.ability.extra.h2_xscore } }
        end
        return { vars = { card.ability.extra.h1_gain, card.ability.extra.h1_xscore } }
    end,

    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
        local has_straight = context.poker_hands and context.poker_hands["Straight"] and #context.poker_hands["Straight"] > 0
        if has_straight then
            card.ability.extra.trigger_count = card.ability.extra.trigger_count + 1

            if card.ability.extra.trigger_count % 3 == 0 then
                if DCKST.gset(3) then
                    card.ability.extra.h3_escore = card.ability.extra.h3_escore + card.ability.extra.h3_gain
                elseif DCKST.gset(2) then
                    card.ability.extra.h2_xscore = card.ability.extra.h2_xscore + card.ability.extra.h2_gain
                else
                    card.ability.extra.h1_xscore = card.ability.extra.h1_xscore + card.ability.extra.h1_gain
                end

                card.ability.extra.pending_score_gain = true
                return {
                    message = localize('k_upgrade_ex'),
                    card = card
                }
            end
        end
    end

    if context.joker_main then
        card.ability.extra.pending_score_gain = false

        if DCKST.gset(3) then
            return {
                e_score = card.ability.extra.h3_escore,
                card = card
            }
        elseif DCKST.gset(2) then
            return {
                xscore = card.ability.extra.h2_xscore,
                card = card
            }
        else
            return {
                xscore = card.ability.extra.h1_xscore,
                card = card
            }
        end
    end
end,
}

SMODS.Joker {
    key = "h_bar",
    config = {
        extra = {
            gain_per_second = 1.054571817,
            accumulated = 0
        }
    },
    pos = { x = 0, y = 1 },
    soul_pos = { x = 1, y = 1},
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    in_pool = function(self, args)
        return (
            not args
            or args.source ~= 'sho'
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { number_format(card.ability.extra.accumulated) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_dckst_hbar_ex') })
                    G.GAME.blind.chips = math.max(1, G.GAME.blind.chips - card.ability.extra.accumulated)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    G.HUD_blind:recalculate()
                    return true
                end
            }))
        end
    end,
}

local dckst_hbar_update_ref = Game.update
function Game:update(dt)
    dckst_hbar_update_ref(self, dt)

    if not G.SETTINGS.paused then
        G.GAME.dckst_hbar_timer = (G.GAME.dckst_hbar_timer or 0) + dt * math.min(G.SETTINGS.GAMESPEED, 4)

        if G.GAME.dckst_hbar_timer >= 1.0 then
            G.GAME.dckst_hbar_timer = G.GAME.dckst_hbar_timer - 1.0

            if G.jokers and G.jokers.cards then
                for _, joker_card in ipairs(G.jokers.cards) do
                    if joker_card.config.center.key == 'j_dckst_h_bar' then
                        joker_card.ability.extra.accumulated = joker_card.ability.extra.accumulated * joker_card.ability.extra.gain_per_second
                    end
                end
            end
        end
    end
end



SMODS.Joker {
    key = "aitch",
    config = {
        extra = {
            rank_options = { 6, 7, 8, 9, 10, 11, 12, 13, 14 }
        }
    },
    pos = { x = 2, y = 1 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 17,
    rarity = "dckst_welldone",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = {} }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = {} }
        end
        return { vars = {} }
    end,
}

DCKST.aitch_available_ranks = function()
    if DCKST.gset(3) then
        return { 6, 7, 8, 9, 10, 11, 12, 13, 14 }
    elseif DCKST.gset(2) then
        return { 6, 7, 8, 9, 10 }
    end
    return { 6, 7, 8 }
end

local dckst_aitch_getid_ref = Card.get_id
function Card:get_id()
    if self.ability and self.ability.dckst_aitch_selected_rank then
        return self.ability.dckst_aitch_selected_rank
    end
    return dckst_aitch_getid_ref(self)
end

local dckst_aitch_click_ref = Card.click
function Card:click()
    if next(SMODS.find_card('j_dckst_aitch')) and self.base and self.base.id == 8 and self.area == G.hand and love.keyboard.isDown('lctrl') then
        local ranks = DCKST.aitch_available_ranks()
        local rank_labels = {
            [6] = '6', [7] = '7', [8] = '8', [9] = '9', [10] = '10',
            [11] = 'J', [12] = 'Q', [13] = 'K', [14] = 'A'
        }

        local current = self.ability.dckst_aitch_selected_rank or 8
        local current_index = 1
        for i, id in ipairs(ranks) do
            if id == current then current_index = i break end
        end

        local next_index = (current_index % #ranks) + 1
        self.ability.dckst_aitch_selected_rank = ranks[next_index]

        local aitch_card = SMODS.find_card('j_dckst_aitch')[1]
        if aitch_card then
            card_eval_status_text(aitch_card, 'extra', nil, nil, nil, { message = rank_labels[ranks[next_index]] })
        end
        self:juice_up(0.3, 0.3)
        return
    end
    return dckst_aitch_click_ref(self)
end

SMODS.Joker {
    key = 'blackboard',
    rarity = 'dckst_mediumrare',
    pos = { x = 3, y = 1 },
    cost = 11,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },
    config = {
    extra = {
        h1_chipgain = 0.75,
        h2_chipgain = 1,
        h3_chipgain = 0.2,
        storedchips = 1,
    }
},
loc_vars = function(self, info_queue, card)
    local e = card.ability.extra
    local gain = DCKST.gset_val(e.h1_chipgain, e.h2_chipgain, e.h3_chipgain)
    local key = (DCKST.gset(3) and self.key..'_h3') or (DCKST.gset(2) and self.key..'_h2') or nil
    return { key = key, vars = { gain, e.storedchips } }
end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,
    calculate = function(self, card, context)
    if context.joker_main then
        local suits = {}
        local unique_suits = 0
        for _, played_card in ipairs(context.full_hand or {}) do
            local suit = played_card.base.suit
            if suit and not suits[suit] then
                suits[suit] = true
                unique_suits = unique_suits + 1
            end
        end

        local has_straight = context.poker_hands and context.poker_hands['Straight'] and #context.poker_hands['Straight'] > 0

        if unique_suits >= 4 and has_straight then
    local e = card.ability.extra
    e.storedchips = e.storedchips + DCKST.gset_val(e.h1_chipgain, e.h2_chipgain, e.h3_chipgain)
end

        if DCKST.gset(3) then
            return {
                e_chips = card.ability.extra.storedchips,
            }
        else
            return {
                x_chips = card.ability.extra.storedchips,
            }
        end
    end
end
}

SMODS.Joker {
    key = "sansserif",
    config   = {
        extra = {
            score_gain   = 144,
            x_score_gain = 0,
            score        = 0,
            x_score      = 1,
        },
    },
    pos = { x = 4, y = 1 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_crazy
        local val = DCKST.gset_val(card.ability.extra.score_gain, 0.1, 0.25)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { val, card.ability.extra.x_score } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { val, card.ability.extra.x_score } }
        end
        return { vars = { val, card.ability.extra.score } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    -- fires whenever a joker is sold; filter down to j_crazy specifically
    -- NOTE: context.selling_card is a BOOLEAN flag (true) marking this as a
    -- sell event, not a card reference. The card actually being sold is
    -- context.card.
    calculate = function(self, card, context)
        if context.selling_card == true
            and context.card
            and context.card ~= card
            and context.card.config
            and context.card.config.center
            and context.card.config.center.key == "j_crazy"
        then
            if DCKST.gset(1) then
                -- h1: flat additive Score
                card.ability.extra.score = card.ability.extra.score + card.ability.extra.score_gain

                return {
                    card    = card,
                    message = localize("k_upgrade_ex"),
                }
            else
                -- h2 / h3: multiplicative Score
                local mult_gain = DCKST.gset_val(nil, 0.1, 0.25)
                card.ability.extra.x_score = card.ability.extra.x_score + mult_gain

                return {
                    card    = card,
                    message = localize("k_upgrade_ex"),
                }
            end
        end

        if context.joker_main then
            if DCKST.gset(1) and card.ability.extra.score > 0 then
                return { score = card.ability.extra.score }
            elseif not DCKST.gset(1) and card.ability.extra.x_score > 1 then
                return { x_score = card.ability.extra.x_score }
            end
        end
    end,
}

SMODS.Joker {
    key = "small_caps",
    config = {
        extra = {
            dollars      = 0,
            dollar_gain  = 1,
            x_dollars    = 1,
        },
    },
    pos = { x = 0, y = 2 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    loc_vars = function(self, info_queue, card)
        local val = DCKST.gset_val(1, 0.2, 0.5)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { card.ability.extra.x_dollars, val } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { card.ability.extra.x_dollars, val } }
        end
        return { vars = { card.ability.extra.dollars, val} }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers
            and context.before
            and next(context.poker_hands['Straight'] or {})
        then
            if DCKST.gset(1) then
                card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollar_gain
                ease_dollars(card.ability.extra.dollars)
            else
                local gain = DCKST.gset_val(nil, 0.2, 0.5)
                card.ability.extra.x_dollars = card.ability.extra.x_dollars + gain
 
                local bonus = math.floor(G.GAME.dollars * card.ability.extra.x_dollars) - G.GAME.dollars
                if bonus > 0 then ease_dollars(bonus) end
            end
 
            return {
                card    = card,
            }
        end
 
        -- fires once at end of round; reset the payout value back to baseline
        if context.end_of_round and not context.repetition and not context.individual then
            card.ability.extra.dollars   = 0
            card.ability.extra.x_dollars = 1
            return { message = localize('k_reset') }
        end
    end,
}

SMODS.Joker {
    key = "cursive",
    config = {
        extra = {
            mult_gain   = 6,
            stored_mult = 0,
        },
    },
    pos = { x = 1, y = 2 },
    rarity = 2, -- Uncommon
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    loc_vars = function(self, info_queue, card)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { card.ability.extra.stored_mult, card.ability.extra.mult_gain } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { card.ability.extra.stored_mult, card.ability.extra.mult_gain } }
        end
        return { vars = { card.ability.extra.stored_mult, card.ability.extra.mult_gain } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers
            and context.before
            and next(context.poker_hands['Straight'] or {})
        then
            local has_ace = false
            for _, played_card in ipairs(context.full_hand or {}) do
                if played_card.base and played_card.base.value == 'Ace' then
                    has_ace = true
                    break
                end
            end
 
            if has_ace then
                card.ability.extra.stored_mult = card.ability.extra.stored_mult + card.ability.extra.mult_gain
 
                return {
                    card    = card,
                    message = localize('k_upgrade_ex'),
                }
            end
        end
 
        if context.joker_main
            and context.full_hand
            and next(context.poker_hands['Straight'] or {})
        then
            local qualifying_ranks
            if DCKST.gset(3) then
                qualifying_ranks = { ['8']=true, ['9']=true, ['10']=true, ['Jack']=true, ['Queen']=true, ['King']=true, ['Ace']=true }
            elseif DCKST.gset(2) then
                qualifying_ranks = { ['8']=true, ['9']=true, ['10']=true }
            else
                qualifying_ranks = { ['8']=true }
            end
 
            local has_qualifying_rank = false
            for _, played_card in ipairs(context.full_hand) do
                if played_card.base and qualifying_ranks[played_card.base.value] then
                    has_qualifying_rank = true
                    break
                end
            end
 
            if has_qualifying_rank and card.ability.extra.stored_mult > 0 then
                return {
                    card = card,
                    mult = card.ability.extra.stored_mult,
                }
            end
        end
    end,
}


SMODS.Joker{ --Strikethrough
    key = "strikethrough",
    config = {
        extra = {
            h1_addent = 2,
            h2_addent = 3,
            h3_addent = 4,
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    cost = 15,
    rarity = 'dckst_mediumwell',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        return { vars = { DCKST.gset_val(e.h1_addent, e.h2_addent, e.h3_addent) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if next(context.poker_hands["Straight"]) then
                local e = card.ability.extra
                local addent = DCKST.gset_val(e.h1_addent, e.h2_addent, e.h3_addent)

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end
                }))

                return {
                    card = card,
                    func = function()
                        G.jokers.config.card_limit       = G.jokers.config.card_limit       + addent
                        G.consumeables.config.card_limit = G.consumeables.config.card_limit + addent
                        return true
                    end,
                    message = localize('k_dckst_strikethrough')
                }
            end
        end
    end,
}

SMODS.Joker{
    key = "drop_cap",
    config = {
        extra = {
            xscore_h1 = 3,
            xscore_h2 = 30,
            escore_h3 = 3,
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },
    
    loc_vars = function(self, info_queue, card)
    if DCKST.gset(3) then
        return { key = self.key..'_h3', vars = { card.ability.extra.escore_h3 } }
    end
    local val = DCKST.gset_val(card.ability.extra.xscore_h1, card.ability.extra.xscore_h2, nil)
    return { vars = { val } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,
    
    calculate = function(self, card, context)
        if context.joker_main and not next(context.poker_hands["Straight"]) then
                if DCKST.gset(3) then
                    return { e_score = card.ability.extra.escore_h3 }
                elseif DCKST.gset(2) then
                    return { x_score = card.ability.extra.xscore_h2 }
                else
                    return { x_score = card.ability.extra.xscore_h1 }
                end
            end
    end,
}

SMODS.Joker {
    key = "braille",
    config = {
        extra = {
            xmult_gain = 1.5, 
            xmult_gain_h2 = 3,
            emult_gain = 0.25,
            storedval  = 1,
        },
    },
    pos = { x = 4, y = 2 },
    rarity = 'dckst_welldone',
    cost = 16,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    loc_vars = function(self, info_queue, card)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { card.ability.extra.emult_gain, card.ability.extra.storedval } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { card.ability.extra.xmult_gain_h2, card.ability.extra.storedval } }
        else
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.storedval } }
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers
            and context.before
            and next(context.poker_hands['Straight'] or {})
        then
            local suits_present = {}
            for _, played_card in ipairs(context.full_hand or {}) do
                if played_card.base and played_card.base.suit then
                    suits_present[played_card.base.suit] = true
                end
            end

            local unique_suit_count = 0
            for _ in pairs(suits_present) do
                unique_suit_count = unique_suit_count + 1
            end

            if unique_suit_count > 0 then
                -- gain rate is looked up live, per-gameset, every trigger
                local gain = DCKST.gset_val(
                    card.ability.extra.xmult_gain,
                    card.ability.extra.xmult_gain_h2,
                    card.ability.extra.emult_gain
                )

                card.ability.extra.storedval = card.ability.extra.storedval + (gain * unique_suit_count)

                return {
                    card    = card,
                    message = localize('k_upgrade_ex'),
                }
            end
        end

        if context.joker_main and card.ability.extra.storedval > 1 then
            if DCKST.gset(3) then
                return {
                    card       = card,
                    e_mult  = card.ability.extra.storedval,
                }
            else
                return {
                    card    = card,
                    x_mult  = card.ability.extra.storedval,
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "hieroglyph",
    config = { extra = {} },
    pos = { x = 0, y = 3 },
    rarity = 'dckst_medium',
    cost = 13,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers
            and context.before
            and context.poker_hands
            and not next(context.poker_hands['Straight'] or {})
        then
            context.poker_hands['Straight'] = context.scoring_hand or context.full_hand or {}
        end
    end,
}

SMODS.Joker {
    key = "italic",
    config = {
        extra = {
            h1_chance = 8,  -- 1 in 8
            h2_chance = 6,  -- 1 in 6
            h3_chance = 4,  -- 1 in 4
        }
    },
    pos = { x = 1, y = 3 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_dckst_wooden
        info_queue[#info_queue + 1] = G.P_CENTERS.j_crazy
        if DCKST.gset(3) then
            local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.h3_chance, 'j_dckst_italic')
            return { vars = { num, denom } }
        elseif DCKST.gset(2) then
            local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.h2_chance, 'j_dckst_italic')
            return { vars = { num, denom } }
        end
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.h1_chance, 'j_dckst_italic')
        return { vars = { num, denom } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.before and context.poker_hands and next(context.poker_hands['Straight']) then
            -- Room check: the Joker being created needs a slot (this Joker's own slot isn't freed).
            if #G.jokers.cards + G.GAME.joker_buffer >= G.jokers.config.card_limit then return end

            local chance = DCKST.gset_val(
                card.ability.extra.h1_chance,
                card.ability.extra.h2_chance,
                card.ability.extra.h3_chance
            )

            if SMODS.pseudorandom_probability(card, 'italic', 1, chance, 'j_dckst_italic') then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local new_joker = SMODS.add_card({
                            set = 'Joker',
                            key = 'j_crazy',
                            edition = 'e_dckst_wooden',
                        })
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
                return {
                    message = localize('k_plus_joker'),
                    card = card
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "bold",
    config = {
        extra = {
            h1_xmoney = 3,    -- X3
            h2_xmoney = 6,    -- X6
            h3_emoney = 1.5,  -- ^1.5
        }
    },
    pos = { x = 2, y = 3 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 17,
    rarity = 'dckst_welldone',
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { card.ability.extra.h3_emoney } }
        elseif DCKST.gset(2) then
            return { vars = { card.ability.extra.h2_xmoney } }
        end
        return { vars = { card.ability.extra.h1_xmoney } }
    end,

    calculate = function(self, card, context)
        if context.modify_final_cashout then
            local amount = to_number(context.amount) or 0
            if amount <= 0 then return end

            local bonus
            if DCKST.gset(3) then
                bonus = math.floor(amount ^ card.ability.extra.h3_emoney) - amount
            else
                local x = DCKST.gset_val(
                    card.ability.extra.h1_xmoney,
                    card.ability.extra.h2_xmoney,
                    card.ability.extra.h2_xmoney
                )
                bonus = amount * (x - 1)
            end

            if bonus and bonus > 0 then
                return {
                    modify = bonus,
                    message_card = card
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "outlined",
    config = {
        extra = {
            h1_per = 1,
            h3_per = 2,
            has_straight = nil,
        }
    },
    pos = { x = 3, y = 3 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 6,
    rarity = 2, -- Uncommon
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_crazy
        local crazies = #SMODS.find_card('j_crazy')
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { card.ability.extra.h3_per, crazies * card.ability.extra.h3_per } }
        else
            return { vars = { card.ability.extra.h1_per, crazies * card.ability.extra.h1_per } }
        end
    end,

    calculate = function(self, card, context)
    -- Resolve "contains a Straight" once per hand, while poker_hands is available.
    if context.before and context.poker_hands then
        card.ability.extra.has_straight = next(context.poker_hands['Straight']) and true or false
    end

    if context.repetition and context.cardarea == G.play and card.ability.extra.has_straight then
        local per = DCKST.gset_val(
            card.ability.extra.h1_per,
            card.ability.extra.h1_per,
            card.ability.extra.h3_per
        )
        local reps = math.floor(#SMODS.find_card('j_crazy') * per)
        if reps > 0 then
            return {
                repetitions = reps,
                message = localize('k_again_ex'),
                card = card
            }
        end
    end

    if context.after then
        card.ability.extra.has_straight = nil
    end
end,
}

SMODS.Joker {
    key = "rune",
    config = {
        extra = {
            h1_gain = 2,    -- +X2 per Straight
            h2_gain = 5,    -- +X5 per Straight
            h3_gain = 0.5,  -- +^0.5 per Straight

            xmult = 1,      -- current XMult (h1/h2)
            emult = 1,      -- current ^Mult (h3)
        }
    },
    pos = { x = 4, y = 3 },
    soul_pos = { x = 0, y = 4 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 18,
    rarity = 'dckst_exquisite',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

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

        -- Scale or reset, once per hand, in the before context (poker_hands is available here).
        if context.before and context.poker_hands and not context.blueprint then
            if next(context.poker_hands['Straight']) then
                if DCKST.gset(3) then
                    e.emult = e.emult + e.h3_gain
                else
                    e.xmult = e.xmult + DCKST.gset_val(e.h1_gain, e.h2_gain, e.h2_gain)
                end
                return {
                    message = localize('k_upgrade_ex'),
                    card = card
                }
            else
                local had = (DCKST.gset(3) and e.emult > 1) or (not DCKST.gset(3) and e.xmult > 1)
                e.xmult = 1
                e.emult = 1
                if had then
                    return {
                        message = localize('k_reset'),
                        card = card
                    }
                end
            end
        end

        -- Apply the current value when scoring.
        if context.joker_main then
            if DCKST.gset(3) then
                if e.emult > 1 then
                    return { emult = e.emult, card = card }
                end
            elseif e.xmult > 1 then
                return { xmult = e.xmult, card = card }
            end
        end
    end,
}

SMODS.Joker {
    key = "chalk",
    config = {
        extra = {
            h1_gain = 2,
            h2_gain = 4,
            h3_gain = 1,

            xmult = 1,
            emult = 1,
        }
    },
    pos = { x = 1, y = 4 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_crazy
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

    -- Scale: once per Crazy Joker present, when the hand contains a Straight.
    if context.other_joker and not context.blueprint then
        if context.other_joker.config.center.key == "j_crazy"
        and context.poker_hands and next(context.poker_hands['Straight']) then
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

    -- Reset on Ante change.
    if context.ante_change and context.ante_end and not context.blueprint then
        e.xmult = 1
        e.emult = 1
        return { message = localize('k_reset'), card = card }
    end

    -- Apply.
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
    key = "monospace",
    config = {
        extra = {
            h1_gain = 10,    -- +10 Mult
            h2_gain = 0.25,  -- +X0.25
            h3_gain = 0.15,  -- +^0.15

            mult = 0,        -- accumulated (h1)
            xmult = 1,       -- accumulated (h2)
            emult = 1,       -- accumulated (h3)

            rank = 5,        -- current target rank id (rerolled each hand)
            rank_value = '5' -- current rank's display value, for the description
        }
    },
    pos = { x = 2, y = 4 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then DCKST.monospace_reroll(card) end
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_gain, e.rank_value, e.emult } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { e.h2_gain, e.rank_value, e.xmult } }
        end
        return { vars = { e.h1_gain, e.rank_value, e.mult } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Scale: hand contains a Straight but not the target rank.
        if context.before and context.poker_hands and not context.blueprint then
            if next(context.poker_hands['Straight']) then
                local has_rank = false
                for _, c in ipairs(context.full_hand or {}) do
                    if not SMODS.has_no_rank(c) and c:get_id() == e.rank then
                        has_rank = true
                        break
                    end
                end
                if not has_rank then
                    if DCKST.gset(3) then
                        e.emult = e.emult + e.h3_gain
                    elseif DCKST.gset(2) then
                        e.xmult = e.xmult + e.h2_gain
                    else
                        e.mult = e.mult + e.h1_gain
                    end
                    return {
                        message = localize('k_upgrade_ex'),
                        card = card
                    }
                end
            end
        end

        -- Apply the accumulated value.
        if context.joker_main then
            if DCKST.gset(3) then
                if e.emult > 1 then return { emult = e.emult, card = card } end
            elseif DCKST.gset(2) then
                if e.xmult > 1 then return { xmult = e.xmult, card = card } end
            elseif e.mult > 0 then
                return { mult = e.mult, card = card }
            end
        end

        -- Reroll the target rank after every hand.
        if context.after and not context.blueprint then
            DCKST.monospace_reroll(card)
        end
    end,
}

-- Pick a new random rank, different from the current one.
DCKST.monospace_reroll = function(card)
    local e = card and card.ability and card.ability.extra
    if not e then return end
    local pool = {}
    for _, rank in pairs(SMODS.Ranks) do
        if rank.id ~= e.rank and not rank.in_pool_excluded then pool[#pool + 1] = rank end
    end
    if next(pool) then
        local pick = pseudorandom_element(pool, pseudoseed('dckst_monospace'..G.GAME.round_resets.ante))
        e.rank = pick.id
        e.rank_value = pick.key
    end
end

SMODS.Joker {
    key = "hegative",
    config = {},
    pos = { x = 3, y = 4 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 15,
    rarity = 'dckst_mediumwell',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        info_queue[#info_queue + 1] = G.P_CENTERS.j_crazy
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({
                        set = 'Joker',
                        key = 'j_crazy',
                        edition = 'e_negative',
                        key_append = 'dckst_helvetic'
                    })
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.DARK_EDITION,
                card = card
            }
        end
    end,
}

SMODS.Joker {
    key = "h_building",
    config = {
        extra = {
            -- Base gain per Straight (the bracketed value).
            h1_gain = 7,     -- +7 Chips
            h2_gain = 0.1,   -- +X0.1
            h3_gain = 0.02,  -- +^0.02

            -- Increase to the gain per Saturn used.
            h1_saturn = 35,  -- +35
            h2_saturn = 0.05,
            h3_saturn = 0.1,

            -- Stored totals.
            chips = 0,
            xchips = 1,
            echips = 1,
        }
    },
    pos = { x = 4, y = 4 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 5,
    rarity = 1, -- Common
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_saturn
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_gain, e.h3_saturn, e.echips } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { e.h2_gain, e.h2_saturn, e.xchips } }
        end
        return { vars = { e.h1_gain, e.h1_saturn, e.chips } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- 1. Add the gain to the stored total when the hand contains a Straight.
        if context.before and context.poker_hands and not context.blueprint then
            if next(context.poker_hands['Straight']) then
                if DCKST.gset(3) then
                    e.echips = e.echips + e.h3_gain
                elseif DCKST.gset(2) then
                    e.xchips = e.xchips + e.h2_gain
                else
                    e.chips = e.chips + e.h1_gain
                end
                return {
                    message = localize('k_upgrade_ex'),
                    card = card
                }
            end
        end

        -- 2. Saturn used: raise the gain itself.
        if context.using_consumeable and not context.blueprint
        and context.consumeable and context.consumeable.config
        and context.consumeable.config.center
        and context.consumeable.config.center.key == 'c_saturn' then
            if DCKST.gset(3) then
                e.h3_gain = e.h3_gain + e.h3_saturn
            elseif DCKST.gset(2) then
                e.h2_gain = e.h2_gain + e.h2_saturn
            else
                e.h1_gain = e.h1_gain + e.h1_saturn
            end
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                card = card
            }
        end

        -- 3. Return the stored total.
        if context.joker_main then
            if DCKST.gset(3) then
                if e.echips > 1 then return { echips = e.echips, card = card } end
            elseif DCKST.gset(2) then
                if e.xchips > 1 then return { xchips = e.xchips, card = card } end
            elseif e.chips > 0 then
                return { chips = e.chips, card = card }
            end
        end
    end,
}

SMODS.Joker {
    key = "dancing_h",
    config = {
        extra = {
            base_num = 2,     
            per_joker = 1,    
            odds = 13,        
        }
    },
    pos = { x = 0, y = 5 }, 
    soul_pos = { x = 1, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 8,
    rarity = 2, -- Uncommon
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        local numerator = e.base_num + e.per_joker * (G.jokers and #G.jokers.cards or 0)
        local num, denom = SMODS.get_probability_vars(card, numerator, e.odds, 'j_dckst_dancingh')
        return { vars = { num, denom, e.per_joker } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        if context.before and context.scoring_name then
            local numerator = e.base_num + e.per_joker * #G.jokers.cards
            if SMODS.pseudorandom_probability(card, 'dancingh', numerator, e.odds, 'j_dckst_dancingh') then
                return {
                    level_up = true,
                    level_up_hand = context.scoring_name,
                    message = localize('k_level_up_ex'),
                    card = card
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "gordon_ramsay_h",
    config = {
        extra = {
            h1_gain = 7,
            h2_gain = 0.2,
            h3_gain = 0.1,

            h1_eaten = 24,
            h2_eaten = 0.1,
            h3_eaten = 0.07,

            mult = 0,
            xmult = 1,
            emult = 1,
        }
    },
    pos = { x = 2, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 11,
    rarity = 'dckst_mediumrare',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_gain, e.h3_eaten, e.emult } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { e.h2_gain, e.h2_eaten, e.xmult } }
        end
        return { vars = { e.h1_gain, e.h1_eaten, e.mult } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Apply the stored value.
        if context.joker_main then
            if DCKST.gset(3) then
                if e.emult > 1 then return { emult = e.emult, card = card } end
            elseif DCKST.gset(2) then
                if e.xmult > 1 then return { xmult = e.xmult, card = card } end
            elseif e.mult > 0 then
                return { mult = e.mult, card = card }
            end
        end

        -- Blind selected: gain.
        if context.setting_blind and not context.blueprint then
            if DCKST.gset(3) then
                e.emult = e.emult + e.h3_gain
            elseif DCKST.gset(2) then
                e.xmult = e.xmult + e.h2_gain
            else
                e.mult = e.mult + e.h1_gain
            end
            return {
                message = localize('k_dckst_where_is_the_lamb_sauce'),
                card = card
            }
        end

        -- Playing cards destroyed: gain per card.
        if context.remove_playing_cards and not context.blueprint
        and context.removed and next(context.removed) then
            local count = #context.removed
            if DCKST.gset(3) then
                e.h3_gain = e.h3_gain + e.h3_eaten * count
            elseif DCKST.gset(2) then
                e.h2_gain = e.h2_gain + e.h2_eaten * count
            else
                e.h1_gain = e.h1_gain + e.h1_eaten * count
            end
            return {
                message = localize('k_dckst_idiot_sandwich'),
                card = card
            }
        end
    end,
}

SMODS.Joker {
    key = "lava_lamp_h",
    config = {
        extra = {
            h1_a_odds = 2,  h1_a_val = 1.6,
            h1_b_odds = 4,  h1_b_val = 0.8,
            h1_c_odds = 6,  h1_c_val = 12,

            h2_a_odds = 2,  h2_a_val = 3,
            h2_b_odds = 4,  h2_b_val = 0.5,
            h2_c_odds = 6,  h2_c_val = 25,

            h3_a_odds = 2,  h3_a_val = 2.75,
            h3_b_odds = 4,  h3_b_val = 0.8,
            h3_c_odds = 6, h3_c_val = 50,
        }
    },
    pos = { x = 3, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 7,
    rarity = 2, -- Uncommon
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true }, attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        local t = DCKST.gset(3) and 'h3' or DCKST.gset(2) and 'h2' or 'h1'
        local na, da = SMODS.get_probability_vars(card, 1, e[t..'_a_odds'], 'j_dckst_lavalamph_a')
        local nb, db = SMODS.get_probability_vars(card, 1, e[t..'_b_odds'], 'j_dckst_lavalamph_b')
        local nc, dc = SMODS.get_probability_vars(card, 1, e[t..'_c_odds'], 'j_dckst_lavalamph_c')
        local vars = { na, da, e[t..'_a_val'], nb, db, e[t..'_b_val'], nc, dc, e[t..'_c_val'] }
        if t == 'h1' then return { vars = vars } end
        return { key = self.key..'_'..t, vars = vars }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.poker_hands and next(context.poker_hands['Straight']) then
            local e = card.ability.extra
            local t = DCKST.gset(3) and 'h3' or DCKST.gset(2) and 'h2' or 'h1'
            local key = t == 'h3' and 'emult' or 'xmult'

            local ret = {}
            local rolled = false

            if SMODS.pseudorandom_probability(card, 'lavalamph_a', 1, e[t..'_a_odds'], 'j_dckst_lavalamph_a') then
                ret[key] = e[t..'_a_val']
                rolled = true
            end

            if SMODS.pseudorandom_probability(card, 'lavalamph_b', 1, e[t..'_b_odds'], 'j_dckst_lavalamph_b') then
                if ret[key] then
                    -- Both A and B hit: chain them through `extra` so both apply.
                    ret.extra = { [key] = e[t..'_b_val'], colour = G.C.RED }
                else
                    ret[key] = e[t..'_b_val']
                end
                rolled = true
            end

            if SMODS.pseudorandom_probability(card, 'lavalamph_c', 1, e[t..'_c_odds'], 'j_dckst_lavalamph_c') then
                ret.dollars = e[t..'_c_val']
                rolled = true
            end

            if rolled then
                ret.card = card
                return ret
            end
        end
    end,
}

SMODS.Joker {
    key = "hoth",
    config = {},
    pos = { x = 4, y = 5 },
    soul_pos = { x = 0, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 19,
    rarity = 'dckst_exquisite',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true },
    attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            -- Must have room.
            if #G.jokers.cards + G.GAME.joker_buffer >= G.jokers.config.card_limit then return end

            local attr = SMODS.Attributes and SMODS.Attributes['is_h']
            local candidates = {}
            for _, key in ipairs(attr and attr.keys or {}) do
                if G.P_CENTERS[key] and key ~= self.key then candidates[#candidates + 1] = key end
            end
            if not next(candidates) then return end

            local pick = pseudorandom_element(candidates, pseudoseed('dckst_hofthh'..G.GAME.round_resets.ante))

            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({ set = 'Joker', key = pick })
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                card = card
            }
        end
    end,
}

SMODS.Joker {
    key = "space_h",
    config = {
        extra = {
            h1_levels = 1,
            h2_levels = 2,
            h3_levels = 3,
        }
    },
    pos = { x = 1, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 15,
    rarity = 'dckst_mediumwell',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true },
    attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { vars = { e.h3_levels } }
        elseif DCKST.gset(2) then
            return { vars = { e.h2_levels } }
        end
        return { vars = { e.h1_levels } }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable
        and context.consumeable.ability and context.consumeable.ability.set == 'Planet' then
            local e = card.ability.extra
            local levels = DCKST.gset_val(e.h1_levels, e.h2_levels, e.h3_levels)
            return {
                level_up = levels,
                level_up_hand = 'Straight',
                message = localize('k_level_up_ex'),
                card = card
            }
        end
    end,
}

SMODS.Joker {
    key = "hedge",
    config = {
        extra = {
            h1_cards = 1,
            h2_cards = 2,
            h3_cards = 3,
        }
    },
    pos = { x = 2, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true },
    attributes = { 'is_h' },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { vars = { e.h3_cards } }
        elseif DCKST.gset(2) then
            return { vars = { e.h2_cards } }
        end
        return { vars = { e.h1_cards } }
    end,

    calculate = function(self, card, context)
        if context.before and context.poker_hands and next(context.poker_hands['Straight']) then
            local e = card.ability.extra
            local count = DCKST.gset_val(e.h1_cards, e.h2_cards, e.h3_cards)

            local new_cards = {}
            for i = 1, count do
                local seal = SMODS.poll_seal({ guaranteed = true, key = 'dckst_hedge_seal'..i })
                local rank = pseudorandom_element(SMODS.Ranks, pseudoseed('dckst_hedge_rank'..i..G.GAME.round_resets.ante))
                local suit = pseudorandom_element(SMODS.Suits, pseudoseed('dckst_hedge_suit'..i..G.GAME.round_resets.ante))
                new_cards[#new_cards + 1] = SMODS.add_card({
                    set = 'Base',
                    area = G.hand,
                    rank = rank.key,
                    suit = suit.key,
                    seal = seal,
                    skip_materialize = false
                })
            end

            if #new_cards > 0 then
                SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
            end
        end
    end,
}

SMODS.Joker {
    key = "encircled",
    pos = { x = 3, y = 6 },
    soul_pos = { x = 4, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hjokers',
    pools = { ["H"] = true },
    attributes = { 'is_h' },
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("H", HEX("BC002D"), G.C.WHITE, 1)
    end,
}

to_number = to_number or function(a) return a end

DCKST.encircled = DCKST.encircled or {}
local EN = DCKST.encircled

EN.debug = false       -- set true to log every key/amount seen by the hook
EN.kinds = nil         -- classifier, built lazily on first use

-- ---------------------------------------------------------------------
-- Classifier
--   add   : harmful when amount < 0
--   op    : multiplicative/exponential, harmful when amount < 1
--   hyper : {height, value}, harmful when value < 1
--   set   : eq_score, harmful when it would lower current chips
-- ---------------------------------------------------------------------
EN.build = function()
    local kinds = {
        -- chips and mult, including legacy aliases
        chips = 'add', h_chips = 'add', chip_mod = 'add',
        mult = 'add', h_mult = 'add', mult_mod = 'add',
        xchips = 'op', x_chips = 'op',
        xmult = 'op', x_mult = 'op', Xmult_mod = 'op',
        echips = 'op', e_chips = 'op',
        emult = 'op', e_mult = 'op',

        hypermult = 'hyper',
        hyperchips = 'hyper',

        -- score system
        score = 'add',
        x_score = 'op',
        e_score = 'op', ee_score = 'op', eee_score = 'op',
        hyper_score = 'hyper',
        eq_score = 'set',
    }

    -- Lowercased copies, so 'Xmult', 'Emult' and friends resolve too.
    local lowered = {}
    for k, v in pairs(kinds) do lowered[k:lower()] = v end
    for k, v in pairs(lowered) do if not kinds[k] then kinds[k] = v end end

    -- Anything Amulet registers (tetration, pentation, future additions).
    local reg = Talisman and Talisman.effects and Talisman.effects.listEffect
    if reg then
        for _, e in ipairs(reg) do
            for _, k in ipairs({ e.key, e.key2, e.attrKey }) do
                if type(k) == 'string' and not kinds[k] and not kinds[k:lower()] then
                    kinds[k] = e.hyper and 'hyper' or 'op'
                end
            end
        end
    end

    EN.kinds = kinds
end

-- Force a rebuild (for example after Amulet registers more effects).
EN.reset = function() EN.kinds = nil end

-- ---------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------
EN.num = function(v)
    local ok, n = pcall(function() return tonumber(to_number(v)) end)
    return ok and n or nil
end

EN.active = function()
    return next(SMODS.find_card('j_dckst_encircled')) ~= nil
end

EN.is_harmful = function(key, amount)
    if type(key) ~= 'string' then return false end
    if not EN.kinds then EN.build() end
    local kind = EN.kinds[key] or EN.kinds[key:lower()]
    if not kind then return false end

    if kind == 'hyper' then
        if type(amount) ~= 'table' then return false end
        local n = EN.num(amount[2])
        return n ~= nil and n < 1
    end

    if kind == 'set' then
        local new = EN.num(amount)
        local cur = EN.num(G.GAME and G.GAME.chips)
        return new ~= nil and cur ~= nil and new < cur
    end

    local n = EN.num(amount)
    if n == nil then return false end
    if kind == 'add' then return n < 0 end
    return n < 1
end

-- ---------------------------------------------------------------------
-- Hook (installed once)
-- ---------------------------------------------------------------------
if not EN.hooked then
    EN.hooked = true
    local calcindref = SMODS.calculate_individual_effect
    function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
        if EN.debug then
            sendInfoMessage("Encircled saw key: "..tostring(key).." amount: "
                ..(type(amount) == 'table' and ("{"..tostring(amount[1])..", "..tostring(amount[2]).."}") or tostring(amount)), "DCKST")
        end
        if EN.active() and EN.is_harmful(key, amount) then
            local holder = SMODS.find_card('j_dckst_encircled')[1]
            if holder then
                card_eval_status_text(holder, 'extra', nil, nil, nil, {
                    message = localize('k_dckst_nullified'),
                })
            end
            return true -- treated as handled, nothing is applied
        end
        return calcindref(effect, scored_card, key, amount, from_edition)
    end
end