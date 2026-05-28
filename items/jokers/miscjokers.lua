
SMODS.Joker{ --Fiesta!
    key = "fiesta",
    config = {
        extra = {
            chips = 15,
            mult = 7,
            money = 1
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
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    --atlas = 'jokerswave1',
    pools = { ["Jokers"] = true, ["decksterity"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.money}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then
                return {
                    chips = card.ability.extra.chips
                }
            elseif context.other_card:is_suit("Hearts") then
                return {
                    mult = card.ability.extra.mult
                }
            elseif context.other_card:is_suit("Diamonds") then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.money
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        return true
                    end,
                    message = "+$"..tostring(card.ability.extra.money),
                    colour = G.C.MONEY
                }
            end
        end
    end
}


SMODS.Joker{ --Inset Joker
    key = "inset",
    config = {
        extra = {
            multgain = 2,
            storedmult = 0,
            freejokerslots = 0
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
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    --atlas = 'jokerswave1',
    pools = { ["Jokers"] = true, ["decksterity"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multgain, card.ability.extra.storedmult, ((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and (G.jokers and G.jokers.cards or {}) or {}))}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local multgain_value = card.ability.extra.multgain
            card.ability.extra.multgain = (card.ability.extra.multgain) * ((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {}))
            card.ability.extra.storedmult = (card.ability.extra.storedmult) + card.ability.extra.multgain
            card.ability.extra.multgain = (card.ability.extra.multgain) / ((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {}))
            return {
                mult = card.ability.extra.storedmult
            }
        end
    end
}

SMODS.Joker({
    key = 'slippin_jimmy',
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
    --atlas = 'jokerswave1',
    pools = { ["Jokers"] = true, ["decksterity"] = true },

    -- numerator and denominator stored in config so other mods can affect them
    config = { extra = { numerator = 1, denominator = 2 } },

    -- Pass the live numerator/denominator into the tooltip
    -- so mods that tweak probability are reflected in the description
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(
            card,
            card.ability.extra.numerator,
            card.ability.extra.denominator,
            'decksterity_slippin_jimmy'
        )
        return { vars = { num, denom } }
    end,
})

local _old_set_debuff = Card.set_debuff

Card.set_debuff = function(self, debuff, silent)
    -- Check if we should prevent this debuff with Slippin' Jimmy
    if debuff and G.jokers then
        for _, j in ipairs(G.jokers.cards) do
            if j.config.center.key == 'j_dckst_slippin_jimmy' then
                -- Pull numerator/denominator from the card's own config
                -- so probability-modifying effects from other mods are respected
                if SMODS.pseudorandom_probability(
                    j,
                    'slippin_jimmy_debuff',
                    j.ability.extra.numerator,
                    j.ability.extra.denominator,
                    'decksterity_slippin_jimmy' -- identifier matches loc_vars
                ) then
                    -- Debuff is prevented, return early without applying it
                    return
                end
                break
            end
        end
    end
    
    -- Call original set_debuff if we didn't prevent it
    return _old_set_debuff(self, debuff, silent)
end

SMODS.Joker{ --Prismatic Joker
    key = "prismatic",
    config = {
        extra = {
            mult = 10,
            mult_stored = 0
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
    --atlas = 'jokerswave1',
    pools = { ["Jokers"] = true, ["decksterity"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mult, card.ability.extra.mult_stored}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult_stored
            }
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card.edition ~= nil then
                card.ability.extra.mult_stored = (card.ability.extra.mult_stored) + card.ability.extra.mult
            end
        end
    end
}

SMODS.Joker{ --Loaded Dice
    key = "loadeddice",
    config = {
        extra = {
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
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    --atlas = 'jokerswave1',
    pools = { ["Jokers"] = true, ["decksterity"] = true },

   loc_vars = function(_, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
			return { vars = { } }
		end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 6) and (not (SMODS.get_enhancements(context.other_card)["m_lucky"] == true)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_lucky)
                        return true
                    end
                }))
                return {
                    message = localize("k_dckst_loadeddice")
                }
            end
        end
    end
}

SMODS.Joker{ --Swapped Joker
    key = "swapped",
    config = {
        extra = {
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
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    --atlas = 'jokerswave1',
    pools = { ["Jokers"] = true, ["decksterity"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, "Diamonds", nil))
                        return true
                    end
                }))
                return {
                    message = localize("k_dckst_swapped")
                }
            elseif context.other_card:is_suit("Diamonds") then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, "Spades", nil))
                        return true
                    end
                }))
                return {
                    message = localize("k_dckst_swapped")
                }
            elseif context.other_card:is_suit("Hearts") then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, "Clubs", nil))
                        return true
                    end
                }))
                return {
                    message = localize("k_dckst_swapped")
                }
            elseif context.other_card:is_suit("Clubs") then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, "Hearts", nil))
                        return true
                    end
                }))
                return {
                    message = localize("k_dckst_swapped")
                }
            end
        end
    end
}


SMODS.Joker{ --Stop Sign
    key = "stopsign",
    config = {
        extra = {
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
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    --atlas = 'jokerswave1',
    pools = { ["Jokers"] = true, ["decksterity"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                return {
                    func = function()
                        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    return true
                                end
                            }))
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            local target_joker = card
                            
                            if target_joker then
                                if target_joker.ability.eternal then
                                    target_joker.ability.eternal = nil
                                end
                                target_joker.getting_sliced = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                        return true
                                    end
                                }))
                            end
                            return true
                        end,
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}


SMODS.Joker{ --Extruded Joker
    key = "extruded",
    config = {
        extra = {
            x_mult_gain = 0.4,
            x_mult = 1,
            cards_destroyed = 0
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
    --atlas = 'jokerswave1',
    pools = { ["Jokers"] = true, ["decksterity"] = true },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.x_mult_gain, card.ability.extra.x_mult, card.ability.extra.cards_destroyed}}
    end,
    
    calculate = function(self, card, context)
        -- Handle card removal (can be multiple cards at once)
        if context.remove_playing_cards then
            local destroyed_count = context.removed and #context.removed or 1
            return {
                func = function()
                    card.ability.extra.x_mult = card.ability.extra.x_mult + (card.ability.extra.x_mult_gain * destroyed_count)
                    card.ability.extra.cards_destroyed = card.ability.extra.cards_destroyed + destroyed_count
                    return true
                end,
                message = localize("k_dckst_extruded"),
            }
        end
        
        -- Handle card selling (one at a time)
        if context.selling_card then
            return {
                func = function()
                    card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain
                    card.ability.extra.cards_destroyed = card.ability.extra.cards_destroyed + 1
                    return true
                end,
                message = localize("k_dckst_extruded"),
            }
        end
        
        -- Apply multiplier during joker evaluation
        if context.cardarea == G.jokers and context.joker_main then
            return {
                Xmult = card.ability.extra.x_mult
            }
        end
    end
}

SMODS.Joker{ --Pencil
    key = "pencil",
    config = {
        extra = {
            chip_gain = 8,
            chips = 0
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
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    --atlas = 'jokerswave1',
    pools = { ["Jokers"] = true, ["decksterity"] = true },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_gain, card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        -- Trigger when a card gets enhanced (setting_ability context fires when enhancement changes)
        if context.setting_ability then
            return {
                func = function()
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                    return true
                end,
                message = localize("k_dckst_pencil"),
            }
        end

        -- Apply chips during joker evaluation
        if context.cardarea == G.jokers and context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

SMODS.Joker{ --Coffee Mug
    key = "coffee_mug",
    config = {
        extra = {
            hand_size_bonus = 3,
            hands_played_this_round = 0
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
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    --atlas = 'jokerswave1',
    pools = { ["Jokers"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local current_bonus = card.ability.extra.hand_size_bonus - card.ability.extra.hands_played_this_round
        return { vars = { card.ability.extra.hand_size_bonus, math.max(0, current_bonus) } }
    end,

    calculate = function(self, card, context)
        -- At the start of a new round, reset the hands played counter
        if context.end_of_round and context.main_eval then
            return {
                func = function()
                    card.ability.extra.hands_played_this_round = 0
                    return true
                end
            }
        end

        -- When a hand is played, increase the hands played counter and decrease hand size
        if context.press_play then
            card.ability.extra.hands_played_this_round = card.ability.extra.hands_played_this_round + 1
            
            -- Calculate current bonus
            local current_bonus = card.ability.extra.hand_size_bonus - card.ability.extra.hands_played_this_round
            
            return {
                func = function()
                    if current_bonus > 0 then
                        G.hand:change_size(-1)
                    end
                    return true
                end
            }
        end

        -- Apply the hand size bonus at the start of the round
        if context.setting_blind then
            local bonus = card.ability.extra.hand_size_bonus
            
            return {
                func = function()
                    if bonus > 0 then
                        G.hand:change_size(bonus)
                    end
                    return true
                end,
                message = localize("k_dckst_coffee_mug"),
                colour = G.C.FILTER
            }
        end

        -- Handle hand_drawn event to reset if hand size changes
        if context.hand_drawn or context.other_drawn then
            return {
                func = function()
                    card.ability.extra.hands_played_this_round = 0
                    return true
                end
            }
        end

        return nil
    end
}

