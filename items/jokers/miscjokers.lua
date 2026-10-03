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
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
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
        x = 1,
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
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    
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
        x = 2,
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
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

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
        x = 3,
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
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
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
        x = 4,
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
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

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
        y = 1,
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
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
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
        x = 1,
        y = 1
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
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
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
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 12,
    rarity = "dckst_medium",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
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
        x = 3,
        y = 1
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
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
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

SMODS.Joker{ --Floating Island
    key = "floatingisland",
    config = {
        extra = {
            chipgain = 8,
            chips = 0
        }
    },
    pos = {
        x = 4,
        y = 1
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
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chipgain, card.ability.extra.chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.press_play then
            local common_count = 0
            for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                if joker ~= card and joker.config.center.rarity == 1 then
                    common_count = common_count + 1
                end
            end

            if common_count > 0 then
                local gain = common_count * card.ability.extra.chipgain
                card.ability.extra.chips = card.ability.extra.chips + gain
                return {
                    func = function()
                        return true
                    end
                }
            end
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
        y = 2
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
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

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

SMODS.Joker{ --Frontier
    key = "frontier",
    config = {
        extra = {
            multgain = 4,
            chipgain = 10
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.multgain, card.ability.extra.chipgain } }
    end,
    pos = {
        x = 1,
        y = 2
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
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    calculate = function(self, card, context)
        if context.other_joker then
            local to_left = false
            for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                if joker == card then
                    break
                end
                if joker == context.other_joker then
                    to_left = true
                    break
                end
            end

            if to_left then
                return {
                    chips = card.ability.extra.chipgain
                }
            else
                return {
                    mult = card.ability.extra.multgain
                }
            end
        end
    end
}

SMODS.Joker{ --Superstar
    key = "superstar",
    config = {
        extra = {
            multgain = 7,
            mult = 0
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 13,
    rarity = "dckst_medium",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multgain, card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                message = localize("k_dckst_superstar"),
                func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + card.ability.extra.multgain
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker{ --Cyanotype
    key = "cyanotype",
    config = {
        extra = {
            hands        = 5,
            handscounted = 0,
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 15,
    rarity = "dckst_mediumwell",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands, card.ability.extra.handscounted } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.handscounted = card.ability.extra.handscounted + 1

            if card.ability.extra.handscounted >= card.ability.extra.hands then
                -- find the leftmost joker that isn't self
                local target = nil
                for _, j in ipairs(G.jokers.cards) do
                    if j ~= card then
                        target = j
                        break
                    end
                end

                local has_space = (#G.jokers.cards + G.GAME.joker_buffer) < G.jokers.config.card_limit

                if target and has_space then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local target_key = target.config.center.key
                            local copy = create_card('Joker', G.jokers, nil, nil, nil, nil, target_key, 'dckst_cyanotype')

                            copy:add_to_deck()
                            G.jokers:emplace(copy)

                            -- carry over state the base create_card call won't replicate
                            if target.edition then
                                copy:set_edition(target.edition, true)
                            end
                            if target.ability.eternal then
                                copy:set_eternal(true)
                            end
                            if target.ability.perishable then
                                copy.ability.perishable = true
                                copy.ability.perish_tally = target.ability.perish_tally
                            end
                            -- copy over the joker's own tracked values (e.g. scaling counters)
                            if target.ability.extra then
                                for k, v in pairs(target.ability.extra) do
                                    copy.ability.extra[k] = v
                                end
                            end

                            G.GAME.joker_buffer = 0

                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.3,
                                func = function()
                                    card:start_dissolve({ G.C.RED }, nil, 1.6)
                                    return true
                                end
                            }))
                            return true
                        end
                    }))
                else
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                            card:start_dissolve({ G.C.RED }, nil, 1.6)
                            return true
                        end
                    }))
                end
            end
        end
    end
}

SMODS.Joker{ --THE KNICKS-
    key = "theknicks",
    config = {
        extra = {
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 16,
    rarity = "dckst_welldone",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, 8, 'j_dckst_theknicks') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.mod_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator * (3)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a97a160b', 1, 8, 'j_dckst_theknicks', true) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.DCKST_ORANGE}, nil, 1.6)
                                    return true
                                end
                            }))
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}


SMODS.Joker{ --Shoreline
    key = "shoreline",
    config = {
        extra = {
            chipgain = 25,
            chiploss = 6,
            chips = 0
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chipgain, card.ability.extra.chiploss, card.ability.extra.chips}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    card.ability.extra.chips = (card.ability.extra.chips) + card.ability.extra.chipgain
                    return true
                end,
                message = localize("k_dckst_shoreline")
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.chips = math.max(0, (card.ability.extra.chips) - card.ability.extra.chiploss)
            return {
                message = localize("k_dckst_oops"),
                extra = {
                    chips = card.ability.extra.chips,
                    colour = G.C.CHIPS
                }
            }
        end
    end
}

SMODS.Joker{ --Typewriter
    key = "typewriter",
    config = {
        extra = {
            numerator = 1,
            denominator = 3,
        }
    },
    pos = { x = 3, y = 3 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local n, d = SMODS.get_probability_vars(
            card,
            card.ability.extra.numerator,
            card.ability.extra.denominator,
            'j_dckst_typewriter'
        )
        return { vars = { n, d } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(
                    card,
                    'j_dckst_typewriter',
                    card.ability.extra.numerator,
                    card.ability.extra.denominator,
                    'j_dckst_typewriter'
                ) then
                    local copied_card = copy_card(
                        context.other_card, nil, nil, nil,
                        context.other_card.edition and context.other_card.edition.negative
                    )
                    if copied_card then
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        copied_card.playing_card = G.playing_card
                        table.insert(G.playing_cards, copied_card)
                        copied_card:add_to_deck()
                        G.deck:emplace(copied_card)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                copied_card:start_materialize()
                                return true
                            end
                        }))
                        card_eval_status_text(
                            context.blueprint_card or card,
                            'extra', nil, nil, nil,
                            { message = localize('k_dckst_ding'), colour = G.C.BLUE }
                        )
                    end
                end
            end
        end
    end
}

SMODS.Joker{ --Lucky Kitten
    key = "luckykitten",
    config = {
        extra = {
            chips = 7,
            maxhands = 4,
            hands = 0
        }
    },
    pos = { x = 4, y = 3 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_lucky_cat
        return { vars = { card.ability.extra.chips, card.ability.extra.maxhands, card.ability.extra.hands } }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            card.ability.extra.hands = card.ability.extra.hands + 1

            if card.ability.extra.hands >= card.ability.extra.maxhands then
                -- morph this card directly into Lucky Cat in place, no destroy/create needed
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.5, 0.5)
                        play_sound('tarot1')
                        card:set_ability(G.P_CENTERS['j_lucky_cat'], nil, true)
                        return true
                    end
                }))
            end
        end

        if context.individual and context.cardarea == G.play then
            if SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                return { chips = card.ability.extra.chips }
            end
        end
    end
}

SMODS.Joker{ --Airborne Piano
    key = "airbornepiano",
    config = {
        extra = {
            xmult = 5.6,
            xmultlose = 0.2
        }
    },
    pos = { x = 0, y = 4 },
    soul_pos = { x = 1, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmultlose } }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return { Xmult = card.ability.extra.xmult }
        end

        if context.individual and context.cardarea == G.play then
            if card.ability.extra.xmult - card.ability.extra.xmultlose <= 1 then
                -- message shows on the joker card itself
                card_eval_status_text(
                    context.blueprint_card or card,
                    'extra', nil, nil, nil,
                    { message = localize('k_dckst_crash'), colour = G.C.RED }
                )
                SMODS.destroy_cards(card, nil, nil, true)
            else
                card.ability.extra.xmult = math.max(1, card.ability.extra.xmult - card.ability.extra.xmultlose)
                card_eval_status_text(
                    context.blueprint_card or card,
                    'extra', nil, nil, nil,
                    { message = localize('k_dckst_altitude') }
                )
            end
        end
    end
}


SMODS.Joker{ --Pathogen
    key = "pathogen",
    config = {
        extra = {
            repetitions = 2
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 13,
    rarity = "dckst_medium",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = "jokerswave1",
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (G.GAME.current_round.hands_played == 0 and to_big(#context.full_hand) == to_big(2)) then
                for i = 1, 2 do
                    local cards_to_copy = {}
                    local target_index = 1
                    if context.full_hand[target_index] then
                        table.insert(cards_to_copy, context.full_hand[target_index])
                    end
                    for i, source_card in ipairs(cards_to_copy) do
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local copied_card = copy_card(source_card, nil, nil, G.playing_card)
                        copied_card:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, copied_card)
                        G.hand:emplace(copied_card)
                        playing_card_joker_effects({true})
                    end
                end
            end
        end
    end
}

SMODS.Joker{ --Pawprints
    key = "pawprints",
    config = {
        extra = {
            numerator = 1,
            denominator = 3,
        }
    },
    pos = { x = 2, y = 4 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 11,
    rarity = "dckst_mediumrare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local n, d = SMODS.get_probability_vars(
            card,
            card.ability.extra.numerator,
            card.ability.extra.denominator,
            'j_dckst_pawprints'
        )
        return { vars = { n, d } }
    end,

    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers then
            -- iterate over every card that was just scored
            for _, scored_card in ipairs(context.scoring_hand) do
                if SMODS.pseudorandom_probability(
                    card,
                    'j_dckst_pawprints',
                    card.ability.extra.numerator,
                    card.ability.extra.denominator,
                    'j_dckst_pawprints'
                ) then
                    -- grab all valid enhancements and pick one at random
                    local enhancements = {}
                    for k, v in pairs(G.P_CENTERS) do
                        if v.set == 'Enhanced' then
                            enhancements[#enhancements + 1] = k
                        end
                    end

                    if #enhancements > 0 then
                        local chosen = enhancements[math.random(#enhancements)]
                        scored_card:set_ability(G.P_CENTERS[chosen], nil, true)
                    end
                end
            end
        end
    end
} -- needs some visual fixing but otherwise works fine, will come back to it after polishing the rest of the jokers

SMODS.Joker{ --Mysterious Trail
    key = "mysterioustrail",
    config = {
        extra = {
            mult = 5,
            maxhands = 4,
            hands = 0,
        }
    },
    pos = { x = 3, y = 4 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        -- show tooltips for all four possible evolutions
        info_queue[#info_queue+1] = G.P_CENTERS.j_dckst_floatingisland
        info_queue[#info_queue+1] = G.P_CENTERS.j_mystic_summit
        info_queue[#info_queue+1] = G.P_CENTERS.j_dckst_shoreline
        info_queue[#info_queue+1] = G.P_CENTERS.j_castle
        return { vars = { card.ability.extra.mult, card.ability.extra.maxhands, card.ability.extra.hands } }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            card.ability.extra.hands = card.ability.extra.hands + 1

            if card.ability.extra.hands >= card.ability.extra.maxhands then
                -- pick one of the four evolutions at random using pseudoseed for seed consistency
                local evolutions = {
                    'j_dckst_floatingisland',
                    'j_mystic_summit',
                    'j_dckst_shoreline',
                    'j_castle',
                }
                local chosen = pseudorandom_element(evolutions, pseudoseed('j_dckst_mysterioustrail'))

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.8, 0.5)
                        play_sound('tarot1')
                        card:set_ability(G.P_CENTERS[chosen], nil, true)
                        return true
                    end
                }))
            end

            return { mult = card.ability.extra.mult }
        end
    end
}

SMODS.Joker{ --Appraisal
    key = "appraisal",
    config = {
        extra = {
            money_base    = 2,
            money_bonus   = 4,
        }
    },
    pos = { x = 0, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 7,
    rarity = 2, -- Uncommon
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money_base, card.ability.extra.money_bonus } }
    end,

    calculate = function(self, card, context)
    if context.after and context.cardarea == G.jokers and not context.blueprint then
        local full_hand = context.full_hand
        if not full_hand or #full_hand == 0 then return end

        local target = full_hand[#full_hand]
        if not target then return end

        local has_modifier =
            (target.config.center and target.config.center.set == 'Enhanced') or
            (target.seal and target.seal ~= nil) or
            (target.edition and next(target.edition))

        local payout_val = has_modifier
            and card.ability.extra.money_bonus
            or  card.ability.extra.money_base

        local blueprint_card = context.blueprint_card or card

        G.E_MANAGER:add_event(Event({
            func = function()
                ease_dollars(payout_val)
                card_eval_status_text(
                    blueprint_card,
                    'extra', nil, nil, nil,
                    { message = localize("k_dckst_appraisal") }
                )
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        SMODS.destroy_cards({ target })
                        return true
                    end
                }))
                return true
            end
        }))
    end
end
}

SMODS.Joker{ --Giggler
    key = "giggler",
    config = {
        extra = {
            mult_gain  = 7,
            mult       = 0,
        }
    },
    pos = { x = 1, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 11,
    rarity = 'dckst_mediumrare',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        -- before scoring: count unique face card ranks in scoring hand
        if context.before then
            local seen_ranks = {}
            local unique_count = 0

            for _, played_card in ipairs(context.scoring_hand) do
                if played_card:is_face() then
                    local rank = played_card.base.value
                    if not seen_ranks[rank] then
                        seen_ranks[rank] = true
                        unique_count = unique_count + 1
                    end
                end
            end

            if unique_count > 0 then
                SMODS.scale_card(card, {
                    ref_table    = card.ability.extra,
                    ref_value    = 'mult',
                    scalar_value = 'mult_gain',
                    -- custom operation: multiply gain by unique count
                    operation    = function(ref_table, ref_value, initial, change)
                        ref_table[ref_value] = initial + change * unique_count
                    end,
                    scaling_message = {
                        message = localize("k_dckst_laugh")
                    }
                })
            end
        end

        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    mult = card.ability.extra.mult,
                }
            end
        end
    end
}

SMODS.Joker{ --Napkin
    key = "napkin",
    config = {
        extra = {
            xmult       = 0.65,
            numerator   = 1,
            denominator = 7,
        }
    },
    pos = { x = 2, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_brainstorm
        local n, d = SMODS.get_probability_vars(
            card,
            card.ability.extra.numerator,
            card.ability.extra.denominator,
            'j_dckst_napkin'
        )
        return { vars = { card.ability.extra.xmult, n, d } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return { Xmult = card.ability.extra.xmult }
        end

        if context.after and context.cardarea == G.jokers then
            if SMODS.pseudorandom_probability(
                card,
                'j_dckst_napkin',
                card.ability.extra.numerator,
                card.ability.extra.denominator,
                'j_dckst_napkin'
            ) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.8, 0.5)
                        play_sound('tarot1')
                        card:set_ability(G.P_CENTERS['j_brainstorm'], nil, true)
                        return true
                    end
                }))
            end
        end
    end
}

SMODS.Joker{ --SON
    key = "son",
    config = {
        extra = {
            numerator   = 1,
            denominator = 3,
        }
    },
    pos = { x = 3, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local n, d = SMODS.get_probability_vars(
            card,
            card.ability.extra.numerator,
            card.ability.extra.denominator,
            'j_dckst_son'
        )
        return { vars = { n, d } }
    end,

    calculate = function(self, card, context)
        -- fires once per card held in hand at end of round
        if context.end_of_round and context.individual and context.cardarea == G.hand then
            local other = context.other_card

            -- check if it's a Jack
            if other.base.value == 'Jack' then
                if SMODS.pseudorandom_probability(
                    card,
                    'j_dckst_son',
                    card.ability.extra.numerator,
                    card.ability.extra.denominator,
                    'j_dckst_son'
                ) then
                    -- collect all valid enhancements
                    local enhancements = {}
                    for k, v in pairs(G.P_CENTERS) do
                        if v.set == 'Enhanced' then
                            enhancements[#enhancements + 1] = k
                        end
                    end

                    if #enhancements > 0 then
                        local chosen = enhancements[math.random(#enhancements)]
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                other:set_ability(G.P_CENTERS[chosen], nil, true)
                                other:juice_up(0.5, 0.3)
                                return true
                            end
                        }))
                        card_eval_status_text(
                            context.blueprint_card or card,
                            'extra', nil, nil, nil,
                            { message = localize('k_dckst_son'), colour = G.C.GREEN }
                        )
                    end
                end
            end
        end
    end
}

SMODS.Joker{ --Alchemist
    key = "alchemist",
    config = {
        extra = {
            sell_gain_sold      = 1,
            sell_gain_destroyed = 2,
            sell_bonus          = 0,
        }
    },
    pos = { x = 4, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.sell_gain_sold, card.ability.extra.sell_gain_destroyed } }
    end,

    -- helper to apply accumulated sell bonus to the card's sell_cost
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            card.sell_cost = (card.sell_cost or 0) + card.ability.extra.sell_bonus
        end
    end,

    calculate = function(self, card, context)
        local function apply_sell_bonus(amount)
            card.ability.extra.sell_bonus = card.ability.extra.sell_bonus + amount
            card.sell_cost = (card.sell_cost or 0) + amount
            card_eval_status_text(
                context.blueprint_card or card,
                'extra', nil, nil, nil,
                {
                    message = localize("k_dckst_alchemist")
                }
            )
        end

        -- another joker was sold
        if context.selling_card then
            local sold = context.card
            if sold and sold ~= card
               and sold.config.center
               and sold.config.center.set == 'Joker'
            then
                apply_sell_bonus(card.ability.extra.sell_gain_sold)
            end
        end

        -- another joker was destroyed
        if context.joker_type_destroyed then
            local destroyed = context.card
            if destroyed and destroyed ~= card
               and destroyed.config.center
               and destroyed.config.center.set == 'Joker'
            then
                apply_sell_bonus(card.ability.extra.sell_gain_destroyed)
            end
        end
    end
}

SMODS.Joker {
    key = "quadratic_equation",
    pos = { x = 1, y = 7 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 13,
    rarity = "dckst_medium",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    config = { extra = { mult = 0, next_gain = 1, card_count = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.next_gain, card.ability.extra.card_count } }
    end,

    calculate = function(self, card, context)
        -- count scored cards across the run
        if context.individual and context.cardarea == G.play and not context.blueprint then
            card.ability.extra.card_count = card.ability.extra.card_count + 1

            if card.ability.extra.card_count % 4 == 0 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.next_gain
                card.ability.extra.next_gain = card.ability.extra.next_gain + 2
                card.juice_up(card, 0.5, 0.5)
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end

        if context.joker_main and not context.blueprint then
            if card.ability.extra.mult > 0 then
                return {
                    mult = card.ability.extra.mult,
                }
            end
        end
    end
}

SMODS.Joker {
    key = "desklamp",
    pos = { x = 2, y = 7 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    config = { extra = { mult_per_joker = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_per_joker } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            -- count jokers to the right of this one
            local jokers_to_right = 0
            local found = false
            for _, joker in ipairs(G.jokers.cards) do
                if found then
                    jokers_to_right = jokers_to_right + 1
                end
                if joker == card then
                    found = true
                end
            end

            if jokers_to_right > 0 then
                local mult = jokers_to_right * card.ability.extra.mult_per_joker
                return {
                    mult = mult,
                }
            end
        end
    end
}

SMODS.Joker {
    key = "naturalist",
    pos = { x = 3, y = 7 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    config = { extra = { numerator = 1, denominator = 6 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_dckst_nature
        local num, den = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator)
        return { vars = { num, den } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'dckst_naturalist', card.ability.extra.numerator, card.ability.extra.denominator) then
                context.other_card:set_ability(G.P_CENTERS.m_dckst_nature)
                return {
                    message = localize('k_dckst_naturalized'),
                    colour = G.C.GREEN
                }
            end
        end
    end
}

SMODS.Joker {
    key = "stickynote",
    pos = { x = 4, y = 7 },
    pixel_size = { w = 67 * 1, h = 70 * 1 },
    display_size = {w = 67, h = 70},
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    config = { extra = { bonus = 5, target = nil } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bonus } }
    end,

    calc_dollar_bonus = function(self, card)
    end,

    calculate = function(self, card, context)
        -- pick a new random target joker at the start of each round
        if context.end_of_round and not context.blueprint then
            local valid = {}
            for _, joker in ipairs(G.jokers.cards) do
                if joker ~= card then
                    table.insert(valid, joker)
                end
            end
            if #valid > 0 then
                card.ability.extra.target = pseudorandom_element(valid, pseudoseed("stickynote"))
            end
        end

        -- apply the buff to the targeted joker
        if context.joker_main then
            if card.ability.extra.target and card.ability.extra.target.ability then
                return {
                    mult = card.ability.extra.bonus,
                    card = card.ability.extra.target
                }
            end
        end
    end
}

SMODS.Joker {
    key = "currency_exchange",
    pos = { x = 0, y = 8 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },


    calculate = function(self, card, context)
        if context.joker_main and not context.blueprint then
            return {
                swap = true,
                message = localize('k_dckst_swapped'),
                colour = G.C.FILTER
            }
        end
    end
}

SMODS.Joker {
    key = "coinjar",
    pos = { x = 1, y = 8 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    config = { extra = { saved = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.saved, G.GAME.round_resets.ante * 2 } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint then
            if G.GAME.blind.boss then
                local payout = card.ability.extra.saved
                if payout > 0 then
                    card.ability.extra.saved = 0
                    ease_dollars(payout)
                    card.juice_up(card, 0.8, 0.8)
                    return {
                        message = localize('k_dckst_coinjar_dump'),
                        colour = G.C.MONEY
                    }
                end
            else
                local gain = G.GAME.round_resets.ante * 2
                card.ability.extra.saved = card.ability.extra.saved + gain
                card.juice_up(card, 0.5, 0.5)
                return {
                    message = localize('k_dckst_coinjar_save'),
                    colour = G.C.MONEY
                }
            end
        end
    end
}

SMODS.Joker {
    key = "outline",
    pos = { x = 2, y = 8 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    config = { extra = { mult = 0, mult_gain = 1 } },
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end,

    calculate = function(self, card, context)
        local function is_joker_or_consumable(c)
            if c.ability.set == "Joker" then return true end
            for key, _ in pairs(SMODS.ConsumableTypes) do
                if c.ability.set == key then return true end
            end
            return false
        end

        if context.selling_card and not context.blueprint then
            if is_joker_or_consumable(context.card) then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end

        if context.joker_type_destroyed and not context.blueprint then
            if is_joker_or_consumable(context.card) then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end

        if context.joker_main and not context.blueprint then
            if card.ability.extra.mult > 0 then
                return {
                    mult = card.ability.extra.mult,
                }
            end
        end
    end
}

SMODS.Joker {
    key = "cupboard",
    pos = { x = 3, y = 8 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    config = { extra = { stored = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.stored } }
    end,

    calculate = function(self, card, context)
        -- accumulate chips from each scored card
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local c = context.other_card
            local chips = (c.base and c.base.nominal or 0)
                        + (c.ability and c.ability.perma_bonus or 0)
                        + (c.ability and c.ability.bonus or 0)
            card.ability.extra.stored = card.ability.extra.stored + math.floor(chips / 2)
        end

        -- dump stored as mult after all cards scored
        if context.joker_main and not context.blueprint then
            local stored = card.ability.extra.stored
            if stored > 0 then
                card.ability.extra.stored = 0
                return {
                    mult = stored                }
            end
        end

        -- reset at end of round just in case
        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.stored = 0
            return { message = localize('k_dckst_cupboard_reset') }
        end
    end
}

SMODS.Joker {
    key = "endpoints",
    pos = { x = 4, y = 8 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and not context.blueprint then
            local hand = context.scoring_hand
            if #hand < 1 then return end

            local leftmost = hand[1]
            local rightmost = hand[#hand]

            if context.other_card == leftmost or context.other_card == rightmost then
                -- avoid double-triggering if hand has only one card
                if #hand == 1 and context.other_card == leftmost then
                    return { repetitions = 2 }
                end
                return { repetitions = 2 }
            end
        end
    end
}

SMODS.Joker{ --The Town
    key = "thetown",
    config = {
        extra = {
            chips = 30,
            x_mult = 3,
            dollars = 3
        }
    },
    loc_vars = function(self, info, card)
        return { 
            vars = { 
                card.ability.extra.dollars, 
                card.ability.extra.chips, 
                card.ability.extra.x_mult 
            } 
        }
    end,
    pos = {
        x = 0,
        y = 9
    },
    display_size = {
        w = 71, 
        h = 95
    },
    cost = 11,
    rarity = "dckst_mediumrare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    
    calculate = function(self, card, context)
        -- Scoring Calculation
        if context.cardarea == G.jokers and context.joker_main then
            -- Safely checks if current cash ends in 0 using modulo
            if to_big(G.GAME.dollars) % to_big(10) == to_big(0) then
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                    Xmult = card.ability.extra.x_mult,
                    }
                }
            end
        end
        
        -- End of Round Payout Calculation
        if context.end_of_round and not context.game_over and context.main_eval then
            return {
                dollars = card.ability.extra.dollars,
                card = card
            }
        end
    end
}

SMODS.Joker {
    key = "cantor_set",
    pos = { x = 1, y = 9 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    config = { extra = { chips = 1 } },
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            local hand = G.hand.cards
            local size = #hand
            if size < 3 then return end

            local third = math.floor(size / 3)
            local start_idx = third + 1
            local end_idx = size - third

            local to_destroy = {}
            for i = start_idx, end_idx do
                to_destroy[#to_destroy + 1] = hand[i]
            end

            if #to_destroy == 0 then return end

            for _, c in ipairs(to_destroy) do
                c:start_dissolve()
            end

            local remaining = size - #to_destroy
            if remaining > 0 then
                card.ability.extra.chips = card.ability.extra.chips * (remaining / 2)
                card.juice_up(card, 0.5, 0.5)
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
            end
        end

        if context.joker_main and not context.blueprint then
            if card.ability.extra.chips > 0 then
                return {
                    chips = card.ability.extra.chips,
                }
            end
        end
    end
}

SMODS.Joker {
    key = "blkyn",
    pos = { x = 2, y = 9 },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    config = { extra = { x_mult = 1.0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end,

    calculate = function(self, card, context)
    if context.joker_main and not context.blueprint then
        local scored_set = {}
        for _, c in ipairs(context.scoring_hand) do
            scored_set[c] = true
        end

        for _, c in ipairs(G.play.cards) do
            if not scored_set[c] then
                local base = c.base and c.base.nominal or 2
                card.ability.extra.x_mult = card.ability.extra.x_mult + (1 / base)
                card.ability.extra.x_mult = math.floor(card.ability.extra.x_mult * 100 + 0.5) / 100
            end
        end

        if card.ability.extra.x_mult > 1.0 then
            return {
                Xmult = card.ability.extra.x_mult,
            }
        end
    end

    if context.end_of_round and context.main_eval and not context.blueprint then
        card.ability.extra.x_mult = 1.0
        return { message = localize('k_dckst_mikal') }
    end
end
}

SMODS.Joker {
    key = "einstein_tile",
    pos = { x = 3, y = 9 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    config = { extra = { xmult = 1.0, xmult_gain = 1.75 } },
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local suits_seen = {}
            local distinct = 0
            for _, c in ipairs(context.full_hand) do
                local suit = c.base.suit
                if not suits_seen[suit] then
                    suits_seen[suit] = true
                    distinct = distinct + 1
                end
            end

            if distinct >= 4 then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                return {
                    message = localize('k_upgrade_ex')                }
            end
        end

        if context.joker_main and not context.blueprint then
            if card.ability.extra.xmult > 1.0 then
                return {
                    Xmult = card.ability.extra.xmult,
                }
            end
        end
    end
}

SMODS.Joker {
    key = "peachtree",
    pos = { x = 4, y = 9 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    config = { extra = { xmult = 2 } },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
        local straight_hands = context.poker_hands["Straight"]
        if straight_hands and next(straight_hands) then
            for _, playing_card in pairs(context.scoring_hand or {}) do
                if playing_card:get_id() == 14 then
                    return {
                        Xmult = card.ability.extra.xmult
                    }
                end
            end
        end
    end
end
}

-- GAMESET ONES

SMODS.Joker {
    key = "aura_farming",
    pos = { x = 0, y = 0 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    config = {
        extra = {
            h1_mult = 10,
            h2_xmult = 2,
            h3_emult = 1.2,
        }
    },

    loc_vars = function(self, info_queue, card)
        local vars = {}
        if DCKST.gset(1) then
            vars = { card.ability.extra.h1_mult }
        elseif DCKST.gset(2) then
            vars = { card.ability.extra.h2_xmult }
        elseif DCKST.gset(3) then
            vars = { card.ability.extra.h3_emult }
        end
        return {
            key = self.key..'_h'..tostring(DCKST.gset()),
            vars = vars,
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local has_enhancement = (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)()

            if has_enhancement then
                if DCKST.gset(1) then
                    return {
                        mult = card.ability.extra.h1_mult,
                    }
                elseif DCKST.gset(2) then
                    return {
                        xmult = card.ability.extra.h2_xmult,
                    }
                elseif DCKST.gset(3) then
                    return {
                        emult = card.ability.extra.h3_emult,
                    }
                end
            end
        end
    end
}

SMODS.Joker {
    key = 'permutation',
    pos = { x = 1, y = 0 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local n = 0
        local r = 0

        if G.hand and G.hand.highlighted then
            n = #G.hand.highlighted
            -- Preview scoring cards using the game's own hand evaluator if available,
            -- otherwise fall back to treating all highlighted cards as scoring
            if G.FUNCS and G.FUNCS.get_poker_hand_info then
                local _, _, scoring_cards = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                r = scoring_cards and #scoring_cards or n
            else
                r = n
            end
        end

        return {
            vars = { n, r, DCKST.permutation(n, r) }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local n = #context.full_hand
            local r = #context.scoring_hand
            local permchips = DCKST.permutation(n, r)
            return {
                chips = permchips,
            }
        end
    end,
}

SMODS.Joker {
    key = 'wooden_ruler',
    pos = { x = 2, y = 0 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    config = {
        extra = {
            h1_mult_gain = 6,
            h1_mult_loss = 3,
            h2_xmult = 1.0,
            h2_xmult_step = 0.5,
            h3_emult = 1.0,
            h3_emult_step = 0.5,
        }
    },

    loc_vars = function(self, info_queue, card)
        if DCKST.gset(1) then
            return {
                key = self.key..'_h1',
                vars = { card.ability.extra.h1_mult_gain, card.ability.extra.h1_mult_loss },
            }
        elseif DCKST.gset(2) then
            return {
                key = self.key..'_h2',
                vars = { string.format('%.1f', card.ability.extra.h2_xmult) },
            }
        elseif DCKST.gset(3) then
            return {
                key = self.key..'_h3',
                vars = { string.format('%.1f', card.ability.extra.h3_emult) },
            }
        end
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local is_straight = context.scoring_name == "Straight"

            if DCKST.gset(1) then
                if is_straight then
                    return {
                        mult = card.ability.extra.h1_mult_gain,
                    }
                else
                    return {
                        mult = -card.ability.extra.h1_mult_loss,
                    }
                end

            elseif DCKST.gset(2) then
                local prev = card.ability.extra.h2_xmult
                if is_straight then
                    card.ability.extra.h2_xmult = prev + card.ability.extra.h2_xmult_step
                else
                    card.ability.extra.h2_xmult = math.max(0.1, prev - card.ability.extra.h2_xmult_step)
                end
                return {
                    xmult = card.ability.extra.h2_xmult,
                    colour = is_straight and G.C.MULT or G.C.RED,
                }

            elseif DCKST.gset(3) then
                local prev = card.ability.extra.h3_emult
                if is_straight then
                    card.ability.extra.h3_emult = prev + card.ability.extra.h3_emult_step
                else
                    card.ability.extra.h3_emult = math.max(0.1, prev - card.ability.extra.h3_emult_step)
                end
                return {
                    emult = card.ability.extra.h3_emult,
                    colour = is_straight and G.C.MULT or G.C.RED,
                }
            end
        end
    end,
}

SMODS.Joker {
    key = 'michael_here',
    pos = { x = 3, y = 0 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 11,
    rarity = "dckst_mediumrare",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    config = {
        extra = {
            rightmost_chance = 4, -- 1 in 4
        }
    },

    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local jokers = G.jokers.cards
            local leftmost = jokers[1]

            -- Preview assumes the default (non-hidden-roll) target: leftmost
            local target = leftmost
            local compatible = target and target ~= card

            local main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                            }
                        }
                    }
                }
            }

            if DCKST.gset(3) then
                return {
                    key = self.key..'_h3',
                    main_end = main_end,
                }
            end
            return {
                key = self.key,
                main_end = main_end,
            }
        end
    end,

    calculate = function(self, card, context)
    if not (context.joker_main or context.individual) then return end

    local jokers = G.jokers.cards
    if not jokers or #jokers == 0 then return end

    local leftmost = jokers[1]
    local rightmost = jokers[#jokers]

    local roll_rightmost = SMODS.pseudorandom_probability(card, 'michael_here_target', 1, card.ability.extra.rightmost_chance)
    local target_joker = roll_rightmost and rightmost or leftmost

    if target_joker == card then
        target_joker = nil
    end

    local ret = SMODS.blueprint_effect(card, target_joker, context)
    if ret then
        SMODS.calculate_effect(ret, card)

        if DCKST.gset(3) then
            local ret2 = SMODS.blueprint_effect(card, target_joker, context)
            if ret2 then
                SMODS.calculate_effect(ret2, card)
            end
        end
    end
end,
}

SMODS.Joker {
    key = 'thermometer',
    pos = { x = 4, y = 0},
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 12,
    rarity = "dckst_medium",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    config = {
        extra = {
            value = 0,
            step = 0.5,
        }
    },

    loc_vars = function(self, info_queue, card)
    local value = card.ability.extra.value
    local magnitude = math.abs(value)
    local is_mult = value >= 0

    if DCKST.gset(3) then
        return {
            key = self.key..'_h3',
            vars = { string.format('%.1f', value), string.format('%.1f', 1 + magnitude), is_mult and localize('k_mult') or localize('k_dckst_chips') },
        }
    end
    return {
        key = self.key,
        vars = { string.format('%.1f', value), string.format('%.1f', 1 + magnitude), is_mult and localize('k_mult') or localize('k_dckst_chips') },
    }
end,

    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
        if context.other_card:is_suit('Hearts') or context.other_card:is_suit('Diamonds') then
            card.ability.extra.value = card.ability.extra.value + card.ability.extra.step
            return {
                message = localize('k_dckst_hot'),
                colour = G.C.RED,
            }
        elseif context.other_card:is_suit('Clubs') or context.other_card:is_suit('Spades') then
            card.ability.extra.value = card.ability.extra.value - card.ability.extra.step
            return {
                message = localize('k_dckst_cold'),
                colour = G.C.BLUE,
            }
        end
    end

    if context.joker_main then
        local value = card.ability.extra.value
        local magnitude = math.abs(value)
        local is_mult = value >= 0

        if DCKST.gset(3) then
            if is_mult then
                return { e_mult = 1 + magnitude, colour = G.C.RED }
            else
                return { e_chips = 1 + magnitude, colour = G.C.BLUE }
            end
        else
            if is_mult then
                return { xmult = 1 + magnitude, colour = G.C.RED }
            else
                return { xchips = 1 + magnitude, colour = G.C.BLUE }
            end
        end
    end
end,
}

SMODS.Joker {
    key = "sinusoidal",
    pos = {
        x = 1,
        y = 1
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
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
    local v = 0
    if G.hand and G.hand.highlighted then
        for _, c in ipairs(G.hand.highlighted) do
            v = v + DCKST.get_nominal_value(c)
        end
    end
    local xmult = 1 + math.abs(math.sin(v) + math.cos(v ^ 2))
    return {
        vars = { string.format('%.2f', xmult) }
    }
end,

calculate = function(self, card, context)
    if context.joker_main then
        local v = 0
        for _, c in ipairs(context.scoring_hand) do
            v = v + DCKST.get_nominal_value(c)
        end
        local xmult = 1 + math.abs(math.sin(v) + math.cos(v ^ 2))
        return {
            xmult = xmult,
        }
    end
end,
}

SMODS.Joker {
    key = "subspace_tripmine",
    config = {
        extra = {
            chance = 3, -- 1 in 3
            h1_dollars = 3,
            h2_xmoney = 1.25,
            h3_xmoney = 3,
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    -- Subspace Tripmine
loc_vars = function(self, info_queue, card)
    local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, 'j_dckst_subspace_tripmine')
    if DCKST.gset(3) then
        return { key = self.key..'_h3', vars = { num, denom, card.ability.extra.h3_xmoney } }
    elseif DCKST.gset(2) then
        return { key = self.key..'_h2', vars = { num, denom, card.ability.extra.h2_xmoney } }
    end
    return { vars = { num, denom, card.ability.extra.h1_dollars } }
end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy then
            if DCKST.gset(3) then
                ease_dollars(G.GAME.dollars * (card.ability.extra.h3_xmoney - 1))
            elseif DCKST.gset(2) then
                ease_dollars(G.GAME.dollars * (card.ability.extra.h2_xmoney - 1))
            else
                ease_dollars(card.ability.extra.h1_dollars)
            end
            return { remove = true }
        end

        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            local is_face = context.other_card.base.value == 'Jack'
                or context.other_card.base.value == 'Queen'
                or context.other_card.base.value == 'King'

            if is_face and SMODS.pseudorandom_probability(card, 'subspace_tripmine', 1, card.ability.extra.chance) then
                context.other_card.should_destroy = true
                return {
                    message = localize('k_dckst_destroyed')
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "icbm",
    config = {
        extra = {
            chance = 6, -- 1 in 6
            h1_xmoney = 1.5,
            h2_xmoney = 2,
            h3_xmoney = 3.75,
        }
    },
    pos = {
        x = 3,
        y = 1
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
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    -- ICBM
loc_vars = function(self, info_queue, card)
    local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, 'j_dckst_icbm')
    if DCKST.gset(3) then
        return { key = self.key..'_h3', vars = { num, denom, card.ability.extra.h3_xmoney } }
    elseif DCKST.gset(2) then
        return { key = self.key..'_h2', vars = { num, denom, card.ability.extra.h2_xmoney } }
    end
    return { vars = { num, denom, card.ability.extra.h1_xmoney } }
end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy then
            return { remove = true }
        end

        if context.joker_main then
            if SMODS.pseudorandom_probability(card, 'icbm', 1, card.ability.extra.chance) then
                for _, c in ipairs(G.hand.cards) do
                    c.should_destroy = true
                end

                local xmoney = card.ability.extra.h1_xmoney
                if DCKST.gset(3) then
                    xmoney = card.ability.extra.h3_xmoney
                elseif DCKST.gset(2) then
                    xmoney = card.ability.extra.h2_xmoney
                end

                ease_dollars(G.GAME.dollars * (xmoney - 1))
                return {
                    message = localize('k_dckst_detonated'),
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "stephenson_218",
    config = {
        extra = {
            xmult_per_card = 1.1,
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    soul_pos = { x = 1, y = 2 },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 19,
    rarity = "dckst_exquisite",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local deck_count = G.deck and #G.deck.cards or 0
        local xmult = card.ability.extra.xmult_per_card ^ deck_count
        return {
            vars = { card.ability.extra.xmult_per_card, deck_count, string.format('%.1f', xmult) },
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local deck_count = #G.deck.cards
            local xmult = card.ability.extra.xmult_per_card ^ deck_count
            return {
                xmult = xmult,
            }
        end
    end,
}

SMODS.Joker {
    key = "mart",
    config = {
        extra = {
            chance = 4, -- 1 in 4
            xmult_per_card = 0.6,
            slots = 3
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, 'j_dckst_mart')
        return {
            vars = { num, denom, card.ability.extra.xmult_per_card, card.ability.extra.slots },
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
                return true
            end,
        }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
                return true
            end,
        }))
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if SMODS.pseudorandom_probability(card, 'mart', 1, card.ability.extra.chance) then
                card.ability.extra.triggered = true
                return {
                    message = localize('k_dckst_oops'),
                    colour = G.C.RED,
                }
            else
                card.ability.extra.triggered = false
            end
        end

        if context.individual and context.cardarea == G.play and card.ability.extra.triggered then
            return {
                xmult = card.ability.extra.xmult_per_card,
                colour = G.C.RED,
            }
        end
    end,
}

SMODS.Joker {
    key = "weeesta",
    config = {
        extra = {
            chip_gain = 15,
            mult_gain = 4,
            money_gain = 0.5,
            chips_total = 0,
            mult_total = 0,
            money_total = 0,
        }
    },
    pos = {
        x = 0,
        y = 0
    },
   display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 17,
    rarity = "dckst_welldone",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chip_gain, card.ability.extra.mult_gain, card.ability.extra.money_gain,
                card.ability.extra.chips_total, card.ability.extra.mult_total, card.ability.extra.money_total,
            }
        }
    end,

    calculate = function(self, card, context)
        -- Accumulation: runs per scored card, only grows storage, no payout
        if context.individual and context.cardarea == G.play then
        if context.other_card:is_suit("Clubs") then
            card.ability.extra.chips_total = card.ability.extra.chips_total + card.ability.extra.chip_gain
            return {
                message = localize('k_upgrade_ex')
            }
        elseif context.other_card:is_suit("Hearts") then
            card.ability.extra.mult_total = card.ability.extra.mult_total + card.ability.extra.mult_gain
            return {
                message = localize('k_upgrade_ex')
            }
        elseif context.other_card:is_suit("Diamonds") then
            card.ability.extra.money_total = card.ability.extra.money_total + card.ability.extra.money_gain
            return {
                message = localize('k_upgrade_ex')
            }
        end
    end

        -- Payout: runs once, after all cards have scored
        if context.joker_main then
            local result = {}
            if card.ability.extra.chips_total > 0 then
                result.chips = card.ability.extra.chips_total
            end
            if card.ability.extra.mult_total > 0 then
                result.mult = card.ability.extra.mult_total
            end
            if card.ability.extra.money_total > 0 then
                result.func = function()
                    ease_dollars(card.ability.extra.money_total)
                    return true
                end
                result.message = "+$"..tostring(card.ability.extra.money_total)
                result.colour = G.C.MONEY
            end

            if next(result) then
                return result
            end
        end
    end,
}

SMODS.Joker {
    key = "covalent_bond",
    config = {
        extra = {
            gain_per_pair = 0.2,
            mult_total = 1,
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        if DCKST.gset(3) then
            return {
                key = self.key..'_h3',
                vars = { card.ability.extra.gain_per_pair, card.ability.extra.mult_total },
            }
        end
        return {
            vars = { card.ability.extra.gain_per_pair, card.ability.extra.mult_total },
        }
    end,

    calculate = function(self, card, context)
    if context.joker_main then
        -- Count same-rank pairs across the played hand
        local rank_counts = {}
        for _, c in ipairs(context.full_hand) do
            local rank = c.base.value
            rank_counts[rank] = (rank_counts[rank] or 0) + 1
        end

        local pair_count = 0
        for _, count in pairs(rank_counts) do
            if count > 1 then
                pair_count = pair_count + (count - 1)
            end
        end

        if pair_count > 0 then
            card.ability.extra.mult_total = card.ability.extra.mult_total + (pair_count * card.ability.extra.gain_per_pair)
        end

        if DCKST.gset(3) then
            return {
                e_mult = card.ability.extra.mult_total
            }
        else
            return {
                xmult = card.ability.extra.mult_total
            }
        end
    end
end,
}

SMODS.Joker {
    key = "overtime",
    config = {
        extra = {
            per_hand = 2,
        }
    },
    pos = {
        x = 2,
        y = 3
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
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local remaining = G.GAME.current_round.hands_left or 0
        local value = card.ability.extra.per_hand * remaining
        if DCKST.gset(3) then
            return {
                key = self.key..'_h3',
                vars = { card.ability.extra.per_hand, remaining, value },
            }
        elseif DCKST.gset(2) then
            return {
                key = self.key..'_h2',
                vars = { card.ability.extra.per_hand, remaining, value },
            }
        end
        return {
            vars = { card.ability.extra.per_hand, remaining, value },
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local remaining = G.GAME.current_round.hands_left or 0
            local value = card.ability.extra.per_hand * remaining

            if DCKST.gset(3) then
                return {
                    e_chips = value,
                    colour = G.C.CHIPS,
                }
            elseif DCKST.gset(2) then
                return {
                    xmult = value,
                    colour = G.C.RED,
                }
            else
                return {
                    xchips = value,
                    colour = G.C.CHIPS,
                }
            end
        end
    end,
}

SMODS.Joker {
    key = 'isotope',
    config = {
        extra = {
            h1_xmult_gain = 0.5,
            h1_xmult = 2,

            h2_xmult_gain = 0.75,
            h2_xmult = 2,

            h3_emult_gain = 0.05,
            h3_emult = 1.1,
        }
    },
    pos = { x = 3, y = 3 },
    cost = 15,
    rarity = "dckst_mediumwell",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },
    loc_vars = function(self, info_queue, card)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { card.ability.extra.h3_emult_gain, card.ability.extra.h3_emult } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { card.ability.extra.h2_xmult_gain, card.ability.extra.h2_xmult } }
        end
        return { vars = { card.ability.extra.h1_xmult_gain, card.ability.extra.h1_xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            -- Lookup table pairing each gameset with its value/gain keys and scoring mode
            local gset_map = {
                [1] = { val_key = 'h1_xmult', gain_key = 'h1_xmult_gain', is_emult = false },
                [2] = { val_key = 'h2_xmult', gain_key = 'h2_xmult_gain', is_emult = false },
                [3] = { val_key = 'h3_emult', gain_key = 'h3_emult_gain', is_emult = true },
            }
            local active = gset_map[DCKST.gset()]

            local current = card.ability.extra[active.val_key]

            -- Grow for next trigger
            card.ability.extra[active.val_key] = current + card.ability.extra[active.gain_key]

            return {
                xmult = not active.is_emult and current or nil,
                e_mult = active.is_emult and current or nil,
                card = card
            }
        end
    end,
}

SMODS.Joker {
    key = "entropy",
    config = {
        extra = {}
    },
    pos = {
        x = 4,
        y = 3
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
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    -- Entropy
    loc_vars = function(self, info_queue, card)
        local count = 0
        local source = (G.hand and G.hand.highlighted and #G.hand.highlighted > 0)
            and G.hand.highlighted
            or (G.play and G.play.cards and #G.play.cards > 0 and G.play.cards or nil)

        if source then
            local ranks_seen = {}
            for _, c in ipairs(source) do
                if c.base and not ranks_seen[c.base.value] then
                    ranks_seen[c.base.value] = true
                    count = count + 1
                end
            end
        end

        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { count > 0 and count or 1 } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { count > 0 and count or 1 } }
        end
        return { vars = { count } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local ranks_seen = {}
            local count = 0
            for _, played_card in ipairs(context.full_hand) do
                if not ranks_seen[played_card.base.value] then
                    ranks_seen[played_card.base.value] = true
                    count = count + 1
                end
            end

            if DCKST.gset(3) then
                return {
                    e_mult = count > 0 and count or 1,
                    card = card
                }
            elseif DCKST.gset(2) then
                return {
                    xmult = count > 0 and count or 1,
                    card = card
                }
            end
            return {
                mult = count,
                card = card
            }
        end
    end,
}

SMODS.Joker {
    key = "toaster",
    config = {
        extra = {
            h1_chance = 4,  -- 1 in 4
            h1_mult = 4,

            h2_chance = 3,  -- 1 in 3
            h2_mult = 8,

            h3_chance = 2,  -- 1 in 2
            h3_mult = 10,
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 5,
    rarity = 1, -- Common
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    -- Toaster
    loc_vars = function(self, info_queue, card)
        if DCKST.gset(3) then
            local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.h3_chance, 'j_dckst_toaster')
            return { key = self.key..'_h3', vars = { num, denom, card.ability.extra.h3_mult } }
        elseif DCKST.gset(2) then
            local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.h2_chance, 'j_dckst_toaster')
            return { key = self.key..'_h2', vars = { num, denom, card.ability.extra.h2_mult } }
        end
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.h1_chance, 'j_dckst_toaster')
        return { vars = { num, denom, card.ability.extra.h1_mult } }
    end,

    calculate = function(self, card, context)
        if context.discard then
            local chance = DCKST.gset_val(
                card.ability.extra.h1_chance,
                card.ability.extra.h2_chance,
                card.ability.extra.h3_chance
            )
            local mult_bonus = DCKST.gset_val(
                card.ability.extra.h1_mult,
                card.ability.extra.h2_mult,
                card.ability.extra.h3_mult
            )

            if SMODS.pseudorandom_probability(card, 'toaster', 1, chance) then
                context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + mult_bonus
                context.other_card.should_discard = false

                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "power_set",
    config = {
        extra = {}
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 12,
    rarity = "dckst_medium",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    -- Power Set
    loc_vars = function(self, info_queue, card)
        local count = 0
        local source = (G.hand and G.hand.highlighted and #G.hand.highlighted > 0)
            and G.hand.highlighted
            or (G.play and G.play.cards and #G.play.cards > 0 and G.play.cards or nil)

        if source then
            local ranks_seen = {}
            for _, c in ipairs(source) do
                if c.base and not ranks_seen[c.base.value] then
                    ranks_seen[c.base.value] = true
                    count = count + 1
                end
            end
        end

        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { 2 ^ (count > 0 and count or 1) } }
        end
        return { vars = { 2 ^ count } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local ranks_seen = {}
            local count = 0
            for _, played_card in ipairs(context.full_hand) do
                if not ranks_seen[played_card.base.value] then
                    ranks_seen[played_card.base.value] = true
                    count = count + 1
                end
            end

            if DCKST.gset(3) then
                return {
                    e_mult = 2 ^ (count > 0 and count or 1),
                    card = card
                }
            end
            return {
                mult = 2 ^ count,
                card = card
            }
        end
    end,
}

SMODS.Joker {
    key = "abraham_lincoln",
    config = { extra = { h1_odds = 4, h3_odds = 2, chance_numerator = 1 } },
    pos = { x = 4, y = 4 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 8,
    rarity = 3, -- Rare
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local odds = DCKST.gset(3) and card.ability.extra.h3_odds or card.ability.extra.h1_odds
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.chance_numerator, odds, 'j_dckst_abraham_lincoln')
        return { vars = { num, denom } }
    end,

    calculate = function(self, card, context)
    if context.dckst_rescore then
        local odds = DCKST.gset(3) and card.ability.extra.h3_odds or card.ability.extra.h1_odds
        return { dckst_rescore_chance = odds, card = card }
    end
    end,
}

SMODS.Joker {
    key = "plan_b",
    config = {
        extra = {
            h1_selection_bonus = 2,
            h2_selection_bonus = 3,
            h3_selection_bonus = 5,
            hands_threshold = 3,
            bonus_active = false,
            bonus_amount_applied = 0
        }
    },
    pos = { x = 0, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 7,
    rarity = 2, -- Uncommon
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local bonus = DCKST.gset_val(card.ability.extra.h1_selection_bonus, card.ability.extra.h2_selection_bonus, card.ability.extra.h3_selection_bonus)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { bonus, card.ability.extra.hands_threshold } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { bonus, card.ability.extra.hands_threshold } }
        end
        return { vars = { bonus, card.ability.extra.hands_threshold } }
    end,

        calculate = function(self, card, context)
        if context.after or context.setting_blind then
            local bonus = DCKST.gset_val(card.ability.extra.h1_selection_bonus, card.ability.extra.h2_selection_bonus, card.ability.extra.h3_selection_bonus)
            local hands_left = G.GAME.current_round.hands_left or 0
            local should_be_active = hands_left < card.ability.extra.hands_threshold

            if should_be_active and not card.ability.extra.bonus_active then
                card.ability.extra.bonus_active = true
                card.ability.extra.bonus_amount_applied = bonus
                SMODS.change_play_limit(bonus)
                SMODS.change_discard_limit(bonus)
            elseif not should_be_active and card.ability.extra.bonus_active then
                card.ability.extra.bonus_active = false
                SMODS.change_play_limit(-card.ability.extra.bonus_amount_applied)
                SMODS.change_discard_limit(-card.ability.extra.bonus_amount_applied)
                card.ability.extra.bonus_amount_applied = 0
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.bonus_active = false
        card.ability.extra.bonus_amount_applied = 0
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.bonus_active then
            card.ability.extra.bonus_active = false
            SMODS.change_play_limit(-card.ability.extra.bonus_amount_applied)
            SMODS.change_discard_limit(-card.ability.extra.bonus_amount_applied)
            card.ability.extra.bonus_amount_applied = 0
        end
    end,
}

SMODS.Joker {
    key = "null_set",
    config = {
        extra = {
            h1_xmult = 3,
            h2_xmult = 6,
            h3_emult = 3,
        }
    },
    pos = { x = 1, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 7,
    rarity = 2, -- Uncommon
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { card.ability.extra.h3_emult } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { card.ability.extra.h2_xmult } }
        end
        return { vars = { card.ability.extra.h1_xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local no_discards = (G.GAME.current_round.discards_used or 0) == 0
            if no_discards then
                if DCKST.gset(3) then
                    return {
                        e_mult = card.ability.extra.h3_emult,
                        card = card
                    }
                end
                local xmult = DCKST.gset(2) and card.ability.extra.h2_xmult or card.ability.extra.h1_xmult
                return {
                    xmult = xmult,
                    card = card
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "ventilation_fan",
    config = {
        extra = {
            state = 1,
            draught_due = nil,

            -- 1 Breeze
            breeze = { 1.5, 2.5, 1.2 },
            -- 2 Gust: base, per card
            gust_base = { 50, 100, 1.5 },
            gust_per  = { 10, 20, 0.1 },
            -- 3 Draught
            draught = { 5, 10, 20 },
            -- 4 Updraft
            updraft = { 1, 2, 3 },
            -- 5 Crosswind
            crosswind = { 2, 3, 4 },
            -- 6 Cyclone
            cyclone = { 1, 2, 3 },
            -- 7 Storm
            storm = { 3, 5, 1.5 },
            storm_cost = 5,
        }
    },
    pos = { x = 2, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.state } }
    end,

    -- 3 Draught: paid at cash-out, but only if the flag was set before the fan turned.
    calc_dollar_bonus = function(self, card)
        local e = card.ability.extra
        if e.draught_due then
            local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1
            return e.draught[t]
        end
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra
        local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1
        local s = e.state

        -- Round won: resolve the current state's effect first, THEN advance.
        if context.end_of_round and context.main_eval
        and not context.game_over and not context.blueprint then
            local ret

            -- 3 Draught: flag the payout for the cash-out screen.
            if s == 3 then e.draught_due = true end

            -- 6 Cyclone: random consumables, if room.
            if s == 6 then
                local made = 0
                for i = 1, e.cyclone[t] do
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        made = made + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card({
                                    set = pseudorandom('dckst_cyclone'..i) > 0.5 and 'Tarot' or 'Planet'
                                })
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                    end
                end
                if made > 0 then ret = { message = localize('k_plus_consumable'), card = card } end
            end

            e.state = e.state % 7 + 1
            return ret or { message = localize('k_dckst_whirr'), card = card }
        end

        -- The Draught flag only needs to live until the next round begins.
        if context.setting_blind and not context.blueprint then
            e.draught_due = nil
        end

        -- 1 Breeze / 2 Gust / 7 Storm: main scoring.
        if context.joker_main then
            if s == 1 then
                if t == 3 then return { emult = e.breeze[t], card = card } end
                return { xmult = e.breeze[t], card = card }
            elseif s == 2 then
                local n = context.scoring_hand and #context.scoring_hand or 0
                if t == 3 then
                    return { xchips = e.gust_base[t] + e.gust_per[t] * n, card = card }
                end
                return { chips = e.gust_base[t] + e.gust_per[t] * n, card = card }
            elseif s == 7 then
                local ret = { dollars = -e.storm_cost, card = card }
                if t == 3 then ret.emult = e.storm[t] else ret.xmult = e.storm[t] end
                return ret
            end
        end

        -- 4 Updraft: level up the played hand.
        if s == 4 and context.before and context.scoring_name then
            return {
                level_up = e.updraft[t],
                level_up_hand = context.scoring_name,
                message = localize('k_level_up_ex'),
                card = card
            }
        end

        -- 5 Crosswind: retrigger the first scored card.
        if s == 5 and context.repetition and context.cardarea == G.play
        and context.scoring_hand and context.other_card == context.scoring_hand[1] then
            return { repetitions = e.crosswind[t], message = localize('k_again_ex'), card = card }
        end
    end,
}

SMODS.Joker {
    key = "troposphere",
    config = {
        extra = {
            h1_goal = 5,   h1_levels = 1,
            h2_goal = 10,  h2_levels = 2,
            h3_goal = 15,  h3_levels = 3,
            progress = 0,
        }
    },
    pos = { x = 3, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 13,
    rarity = 'dckst_medium',
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        info_queue[#info_queue + 1] = G.P_CENTERS.j_dckst_stratosphere
        local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1
        return { vars = { e['h'..t..'_levels'], e['h'..t..'_goal'], e.progress } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra
        local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1

        if context.end_of_round and context.main_eval and not context.game_over and not context.blueprint then
            -- One-shot: the Blind fell to the first hand played.
            if G.GAME.current_round.hands_played == 1 then
                -- Find the most played visible hand.
                local best, played = nil, -1
                for _, handname in ipairs(G.handlist) do
                    local h = G.GAME.hands[handname]
                    if h and SMODS.is_poker_hand_visible(handname) and to_number(h.played) > played then
                        best, played = handname, to_number(h.played)
                    end
                end

                if best then
                    SMODS.smart_level_up_hand(card, best, false, e['h'..t..'_levels'])
                end

                e.progress = e.progress + 1

                -- Evolve when the goal is met.
                if e.progress >= e['h'..t..'_goal'] then
                    local target = G.P_CENTERS['j_dckst_stratosphere']
                    if target then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:juice_up(0.8, 0.5)
                                play_sound('tarot1')
                                card:set_ability(target, nil, true)
                                return true
                            end
                        }))
                        return { message = localize('k_dckst_ascend'), card = card }
                    else
                        sendWarnMessage("j_dckst_stratosphere is not defined; Troposphere cannot evolve.", "DCKST")
                    end
                end

                return { message = localize('k_upgrade_ex'), card = card }
            end
        end
    end,
}

-- Leftmost Joker is protected if it's this Joker, Eternal, or Evergreen.
DCKST.stratosphere_protected = function(j, self_card)
    if not j or j == self_card then return true end
    if j.ability and (j.ability.eternal or j.ability.dckst_evergreen or j.ability.j_dckst_evergreen) then return true end
    if j.getting_sliced then return true end
    return false
end

SMODS.Joker {
    key = "stratosphere",
    config = {
        extra = {
            h1_gain = 3,    h1_goal = 10,
            h2_gain = 6,    h2_goal = 15,
            h3_gain = 1,    h3_goal = 20,

            xmult = 1,      -- accumulated (h1, h2)
            emult = 1,      -- accumulated (h3)
            progress = 0,
        }
    },
    pos = { x = 4, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 15,
    rarity = 'dckst_mediumwell',
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    in_pool = function(self, args) return false end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        info_queue[#info_queue + 1] = G.P_CENTERS.j_dckst_mesosphere
        local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1
        local total = t == 3 and e.emult or e.xmult
        return { key = t == 3 and (self.key..'_h3') or nil,
                 vars = { e['h'..t..'_gain'], e['h'..t..'_goal'], e.progress, total } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra
        local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1

        if context.before and not context.blueprint then
            local victim = G.jokers.cards[1]
            if DCKST.stratosphere_protected(victim, card) then return end

            local gain = e['h'..t..'_gain']
            if t == 3 then e.emult = e.emult + gain else e.xmult = e.xmult + gain end

            victim.getting_sliced = true
            e.progress = e.progress + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    victim:start_dissolve({ G.C.RED }, nil, 1.6)
                    return true
                end
            }))

            -- Evolve when the goal is met.
            if e.progress >= e['h'..t..'_goal'] then
    local target = G.P_CENTERS['j_dckst_mesosphere']

    if target then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function()
                card:juice_up(0.8, 0.5)
                play_sound('tarot1')
                card:set_ability(target, nil, true)
                return true
            end
        }))

        return {
            message = localize('k_dckst_ascend'),
            card = card
        }
    else
        sendWarnMessage(
            "j_dckst_mesosphere is not defined; Stratosphere cannot evolve.",
            "DCKST"
        )
    end
end

return {
    message = localize('k_upgrade_ex'),
    card = card
}
end

        -- Apply the accumulated value.
        if context.joker_main then
            if t == 3 then
                if e.emult > 1 then return { emult = e.emult, card = card } end
            elseif e.xmult > 1 then
                return { xmult = e.xmult, card = card }
            end
        end
    end,
}

SMODS.Joker {
    key = "mesosphere",
    config = {
        extra = {
            h1_gain = 1.5,  h1_goal = 25,
            h2_gain = 4,    h2_goal = 40,
            h3_gain = 0.75, h3_goal = 60,

            xmult = 1,
            emult = 1,
            progress = 0,
        }
    },
    pos = { x = 0, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 16,
    rarity = 'dckst_welldone',
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    in_pool = function(self, args) return false end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        info_queue[#info_queue + 1] = G.P_CENTERS.j_dckst_thermosphere
        local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1
        local total = t == 3 and e.emult or e.xmult
        return { key = t == 3 and (self.key..'_h3') or nil,
                 vars = { e['h'..t..'_gain'], e['h'..t..'_goal'], e.progress, total } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra
        local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1

        -- Register the rescore request with the sweep, and account for it immediately.
                if context.dckst_rescore and not context.blueprint then
            local hand = context.scoring_hand
            if not (hand and next(hand)) then return end

            local left, right = hand[1], hand[#hand]
            local targets = { left }
            if right ~= left then targets[#targets + 1] = right end

            local unique = #targets          -- 1 or 2, what progress counts
            local rescores = unique * 2      -- what the Mult gain scales with

            local gain = e['h'..t..'_gain'] * rescores
            if t == 3 then e.emult = e.emult + gain else e.xmult = e.xmult + gain end
            e.progress = e.progress + unique

            local evolving = false
            if e.progress >= e['h'..t..'_goal'] then
                local target_center = G.P_CENTERS['j_dckst_thermosphere']
                if target_center then
                    evolving = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after', delay = 0.5,
                        func = function()
                            card:juice_up(0.8, 0.5)
                            play_sound('tarot1')
                            card:set_ability(target_center, nil, true)
                            return true
                        end
                    }))
                else
                    sendWarnMessage("j_dckst_thermosphere is not defined; Mesosphere cannot evolve.", "DCKST")
                end
            end

            return {
                dckst_rescore_cards = targets,
                dckst_rescore_reps = 2,
                message = localize(evolving and 'k_dckst_ascend' or 'k_upgrade_ex'),
                card = card
            }
        end

        -- Apply the accumulated value.
        if context.joker_main then
            if t == 3 then
                if e.emult > 1 then return { emult = e.emult, card = card } end
            elseif e.xmult > 1 then
                return { xmult = e.xmult, card = card }
            end
        end
    end,
}

SMODS.Joker {
    key = "thermosphere",
    config = {
        extra = {
            h1_gain = 0.5,  h1_goal = 30,
            h2_gain = 1.5,  h2_goal = 50,
            h3_gain = 0.5,  h3_goal = 60,

            xscore = 1,
            escore = 1,
            progress = 0,
        }
    },
    pos = { x = 1, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 17,
    rarity = 'dckst_welldone',
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    in_pool = function(self, args) return false end,

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        info_queue[#info_queue + 1] = G.P_CENTERS.j_dckst_exosphere
        local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1
        local total = t == 3 and e.escore or e.xscore
        return { key = t == 3 and (self.key..'_h3') or nil,
                 vars = { e['h'..t..'_gain'], e['h'..t..'_goal'], e.progress, total } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra
        local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1

        -- Each scored card: light suits (Hearts, Diamonds) add to Score.
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local c = context.other_card
            if c and (c:is_suit('Hearts') or c:is_suit('Diamonds')) then
                local gain = e['h'..t..'_gain']
                if t == 3 then e.escore = e.escore + gain else e.xscore = e.xscore + gain end
                e.progress = e.progress + 1

                local evolving = false
                if e.progress >= e['h'..t..'_goal'] then
                    local target = G.P_CENTERS['j_dckst_exosphere']
                    if target then
                        evolving = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after', delay = 0.5,
                            func = function()
                                card:juice_up(0.8, 0.5)
                                play_sound('tarot1')
                                card:set_ability(target, nil, true)
                                return true
                            end
                        }))
                    else
                        sendWarnMessage("j_dckst_exosphere is not defined; Thermosphere cannot evolve.", "DCKST")
                    end
                end

                return {
                    message = localize(evolving and 'k_dckst_ascend' or 'k_upgrade_ex'),
                    card = card
                }
            end
        end

        -- Apply the accumulated value at joker_main, using the score system.
        if context.joker_main then
            if t == 3 then
                if e.escore > 1 then return { e_score = e.escore, card = card } end
            elseif e.xscore > 1 then
                return { x_score = e.xscore, card = card }
            end
        end
    end,
}

SMODS.Joker {
    key = "exosphere",
    pos = { x = 2, y = 6 },
    soul_pos = { x = 3, y = 2 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 20,
    rarity = 4, 
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    in_pool = function(self, args) return false end,

    config = {
        extra = {
            h1_mult = 1,    h1_gain = 0.5,
            h2_mult = 1,    h2_gain = 1,
            h3_emult = 1,   h3_gain = 0.4,
        }
    },

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_emult, e.h3_gain } }
        elseif DCKST.gset(2) then
            return { vars = { e.h2_mult, e.h2_gain } }
        end
        return { vars = { e.h1_mult, e.h1_gain } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra
        local t = DCKST.gset(3) and 3 or DCKST.gset(2) and 2 or 1

        -- thanks tetratia
        if t == 3 then
            SMODS.scale_card(card, {
                ref_table = e, ref_value = "h3_emult",
                scalar_value = "h3_gain",
                no_message = true,
            })
        elseif t == 2 then
            SMODS.scale_card(card, {
                ref_table = e, ref_value = "h2_mult",
                scalar_value = "h2_gain",
                no_message = true,
            })
        else
            SMODS.scale_card(card, {
                ref_table = e, ref_value = "h1_mult",
                scalar_value = "h1_gain",
                no_message = true,
            })
        end

        if context.joker_main then
            if t == 3 then
                return { e_mult = e.h3_emult, card = card }
            elseif t == 2 then
                return { x_mult = e.h2_mult, card = card }
            end
            return { x_mult = e.h1_mult, card = card }
        end
    end,
}

SMODS.Joker {
    key = "scott_here",
    config = {
        extra = {
            h1_chips = 64,
            h2_xchips_gain = 0.2,
            h3_echips_gain = 0.07,

            chips = 0,  
            xchips = 1,  
            echips = 1,  
        }
    },
    pos = { x = 3, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 13,
    rarity = "dckst_medium",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        if DCKST.gset(3) then
            return { key = self.key..'_h3', vars = { e.h3_echips_gain, e.echips } }
        elseif DCKST.gset(2) then
            return { key = self.key..'_h2', vars = { e.h2_xchips_gain, e.xchips } }
        end
        return { vars = { e.h1_chips, e.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local e = card.ability.extra
            if DCKST.gset(3) then
                if e.echips > 1 then
                    return { e_chips = e.echips, card = card }
                end
            elseif DCKST.gset(2) then
                if e.xchips > 1 then
                    return { xchips = e.xchips, card = card }
                end
            else
                if e.chips ~= 0 then
                    return { chips = e.chips, card = card }
                end
            end
        end
    end,
}

local scott_ref = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    local ret = scott_ref(effect, scored_card, key, amount, from_edition)

    if key == 'chips' or key == 'e_chips' or key == 'x_chips' or key == 'score' then
        if G.jokers then
            for _, j in ipairs(G.jokers.cards) do
                if j.config.center.key == 'j_dckst_scott_here' and j ~= effect.card then
                    local e = j.ability.extra
                    if DCKST.gset(3) then
                        e.echips = e.echips + e.h3_echips_gain
                    elseif DCKST.gset(2) then
                        e.xchips = e.xchips + e.h2_xchips_gain
                    else
                        e.chips = e.chips + e.h1_chips
                    end
                end
            end
        end
    end

    return ret
end

SMODS.Joker {
    key = "cfh",
    config = {
        extra = {
            handsleft = 3,
            h1_xmult = 1.9, h1_chips = 90,
            h2_xmult = 2.9, h2_chips = 180,
            h3_xmult = 3.9, h3_chips = 270,
        }
    },
    pos = { x = 4, y = 6 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        local handsleft = e.handsleft
        local xmult = DCKST.gset_val(e.h1_xmult, e.h2_xmult, e.h3_xmult)
        local chips = DCKST.gset_val(e.h1_chips, e.h2_chips, e.h3_chips)
        return { vars = { handsleft, xmult, chips } }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if G.GAME.current_round.hands_left == card.ability.extra.handsleft then
                local e = card.ability.extra
                local xmult = DCKST.gset_val(e.h1_xmult, e.h2_xmult, e.h3_xmult)
                local chips = DCKST.gset_val(e.h1_chips, e.h2_chips, e.h3_chips)

                return {
                    Xmult = xmult,
                    extra = {
                        chips = chips,
                    }
                }
            end
        end
    end,
}

SMODS.Joker {
    key = "sprite_cranberry",
    config = {
        extra = {
            h1_gain = 0.12,
            h2_gain = 0.23,
            h3_gain = 0.04,
            xmult = 1,
            emult = 1,
        }
    },
    pos = { x = 2, y = 10 },
    display_size = { w = 71, h = 95 },
    cost = 12,
    rarity = "dckst_medium",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave2',
    pools = { ["Joker"] = true, ["decksterity"] = true },

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
        
        -- Triggered during evaluation of other Jokers
        if context.other_joker and context.other_joker ~= card then
            if context.other_joker:is_rarity("Uncommon") or context.other_joker:is_rarity("Rare") then
                if DCKST.gset(3) then
                    e.emult = e.emult + e.h3_gain
                else
                    e.xmult = e.xmult + DCKST.gset_val(e.h1_gain, e.h2_gain, e.h2_gain)
                end
                return { message = localize('k_upgrade_ex') }
            end
        end

        -- Triggered during main scoring phase
        if context.joker_main then
            if DCKST.gset(3) then
                return { e_mult = e.emult }
            else
                return { x_mult = e.xmult }
            end
        end
    end,
}