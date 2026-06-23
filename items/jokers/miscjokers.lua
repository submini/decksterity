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
    perishable_compat = true,
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
    perishable_compat = true,
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
    eternal_compat = true,
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
            local target = G.jokers.cards[1]
            if target and target ~= card then
                if (#G.jokers.cards + G.GAME.joker_buffer) < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copy = copy_card(target, nil, nil, G.jokers)
                            copy:add_to_deck()
                            G.jokers:emplace(copy)
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            end

            -- self-destruct after copy
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
    eternal_compat = true,
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
    eternal_compat = true,
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
    perishable_compat = true,
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
    perishable_compat = true,
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
    perishable_compat = true,
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
    perishable_compat = true,
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