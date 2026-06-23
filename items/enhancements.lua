SMODS.Enhancement {
    key = 'felious',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            retriggers = 2,
            odds = 4
        }
    },
    atlas = 'enhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(
            card,
            1,
            card.ability.extra.odds,
            'dckst_felious'
        )

        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.retriggers
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(
                card,
                'dckst_felious',
                1,
                card.ability.extra.odds
            ) then
                return {
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
        end
    end
}

SMODS.Enhancement {
    key = 'nature',
    pos = { x = 1, y = 0 },
    config = {
        mult = 3,
        bonus = 30,
        extra = {
            dollars = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.mult, card.ability.bonus, card.ability.extra.dollars } }
    end,
    atlas = 'enhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 1
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(1), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}

SMODS.Enhancement {
    key = 'starry',
    pos = { x = 2, y = 0 },

    config = {
        extra = {
            odds = 6,
            levels = 1
        }
    },
    atlas = 'enhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(
            card,
            1,
            card.ability.extra.odds,
            'dckst_starry'
        )

        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.levels
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_5b629caf', 1, card.ability.extra.odds, 'm_dckst_starry', false) then
                local target_hand
                target_hand = context.scoring_name or "High Card"
                SMODS.calculate_effect({level_up = card.ability.extra.levels,
                level_up_hand = target_hand}, card)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex')})
            end
        end
    end
}

SMODS.Enhancement {
    key = 'random',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            mult_min = 0,
            mult_max = 10
        }
    },
    atlas = 'enhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_min,
                card.ability.extra.mult_max
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                mult = pseudorandom(
                    'dckst_random',
                    card.ability.extra.mult_min,
                    card.ability.extra.mult_max
                )
            }
        end
    end
}

SMODS.Enhancement {
    key = 'consecutive',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            xmult = 1.5
        }
    },
    atlas = 'enhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 0.5,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if next(context.poker_hands["Straight"]) then
                return {
                    x_mult = card.ability.extra.xmult
                }
            end
        end
    end
}

SMODS.Enhancement {
    key = 'striped',
    pos = { x = 0, y = 1 },
    config = {
        extra = {
            chips = 10,
            mult = 10
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips, card.ability.extra.mult
            }
        }
    end,
    atlas = 'enhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            -- coin flip (1 = chips, 2 = mult)
            local flip = pseudorandom_element({1, 2}, pseudoseed('striped_flip'))
            if flip == 1 then
                return {chips = card.ability.extra.chips}
            else
                return {mult = card.ability.extra.mult}
            end
        end
    end
}

SMODS.Enhancement {
    key = 'lebronned',
    pos = { x = 1, y = 1 },
    config = {
        mult = 6,
        bonus = 23
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.bonus, card.ability.mult
            }
        }
    end,

    atlas = 'enhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
}

SMODS.Enhancement {
    key = 'francaise',
    pos = { x = 2, y = 1 },
    config = {
        mult = 3,
        bonus = 33
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.bonus, card.ability.mult
            }
        }
    end,
    atlas = 'enhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false
}

SMODS.Enhancement {
    key = 'serpentine',
    pos = { x = 3, y = 1 },
    config = {
        extra = {
            cards = 3
        }
    },
    atlas = 'enhancements',
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 0,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cards
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            for i = 1, card.ability.extra.cards do
                draw_card(G.deck, G.hand, 100, 'up', true)
            end

            return {
                message = localize('k_dckst_slither'), colour = G.C.GREEN
            }
        end
    end
}

SMODS.Enhancement {
    key = 'giggling',
    pos = { x = 4, y = 1 },
    config = {
        extra = {
            mult_gain = 2,
            current_mult = 0
        }
    },
    atlas = 'enhancements',
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_gain,
                card.ability.extra.current_mult
            }
        }
    end,

    calculate = function(self, card, context)
    -- Give the accumulated mult when scored
    if context.main_scoring and context.cardarea == G.play then
        if card.ability.extra.current_mult > 0 then
            return {
                mult = card.ability.extra.current_mult
            }
        end
    end

    -- Gain mult if a face card was scored
    if context.after and context.scoring_hand then
        local face_found = false

        for _, scored_card in ipairs(context.scoring_hand) do
            if scored_card:is_face() then
                face_found = true
                break
            end
        end

        if face_found then
            card.ability.extra.current_mult =
                card.ability.extra.current_mult +
                card.ability.extra.mult_gain

            return {
                message = localize('k_dckst_laugh'),
                colour = G.C.MULT
            }
        end
    end
end
}

SMODS.Enhancement {
    key = 'techno',
    pos = { x = 0, y = 2 },
    config = {
        extra = {
            mult = 2,
            odds = 8,
            multiplier = 2
        }
    },
    atlas = 'enhancements',
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(
            card,
            1,
            card.ability.extra.odds,
            'dckst_techno'
        )

        return {
            vars = {
                card.ability.extra.mult,
                numerator,
                denominator,
                card.ability.extra.multiplier
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.after and context.scoring_hand then
            if SMODS.pseudorandom_probability(
                card,
                'dckst_techno',
                1,
                card.ability.extra.odds
            ) then
                card.ability.extra.mult =
                    card.ability.extra.mult *
                    card.ability.extra.multiplier

                return {
                    message = localize('k_dckst_techno_upgrade')
                }
            end
        end
    end
}

SMODS.Enhancement {
    key = 'icy',
    pos = { x = 1, y = 2 },

    config = {
        extra = {
            mult = 6,
            chips = 18,
            melts_at = 6,
            uses = 0
        }
    },

    atlas = 'enhancements',
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
                card.ability.extra.melts_at,
                card.ability.extra.uses
            }
        }
    end,

    calculate = function(self, card, context)
        -- scoring effect
        if context.main_scoring and context.cardarea == G.play then

            -- increment use counter
            card.ability.extra.uses = (card.ability.extra.uses or 0) + 1

            local ret = {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }

            -- melt condition
            if card.ability.extra.uses >= card.ability.extra.melts_at then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        card:set_ability(G.P_CENTERS.c_base)
                        return true
                    end
                }))

                ret.message = localize('k_dckst_melted')
                ret.colour = G.C.BLUE
            end

            return ret
        end
    end
}

SMODS.Enhancement {
    key = 'h',
    pos = { x = 2, y = 2 },
    config = {
        extra = {
            mult = 12,
            else_mult = 6
        }
    },
    atlas = 'enhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult, card.ability.extra.else_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if next(context.poker_hands["Straight"]) then
                return {
                    mult = card.ability.extra.mult
                }
            else
                return {
                    mult = card.ability.extra.else_mult
                }
            end
        end
    end
}

SMODS.Enhancement {
    key = 'onomatopoetic',
    pos = { x = 3, y = 2 },

    config = {
        extra = {
            chips = 20,
            mult = 4,
            dollars = 1
        }
    },

    atlas = 'enhancements',
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then

            local roll = pseudorandom('dckst_onomatopoetic', 1, 3)

            if roll == 1 then
                return {
                    chips = card.ability.extra.chips,
                }

            elseif roll == 2 then
                return {
                    mult = card.ability.extra.mult,
                }

            else
                return {
                    dollars = card.ability.extra.dollars,
                }
            end
        end
    end
}

SMODS.Enhancement {
    key = 'aluminum',
    pos = { x = 4, y = 2 },

    config = {
        extra = {
            base_chips = 15,
            chips_per_joker = 5,
            mult_per_card = 1
        }
    },

    atlas = 'enhancements',
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        local joker_count = G.jokers and #G.jokers.cards or 0
        local hand_count = G.hand and #G.hand.cards or 0

        local joker_chips = joker_count * card.ability.extra.chips_per_joker
        local hand_mult = hand_count * card.ability.extra.mult_per_card

        return {
            vars = {
                card.ability.extra.base_chips,   -- #1#
                card.ability.extra.chips_per_joker, -- #2#
                card.ability.extra.mult_per_card, -- #3#

                joker_chips,   -- #4#
                hand_mult,     -- #5#
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local joker_count = #G.jokers.cards
            local hand_count = #G.hand.cards

            local chips = card.ability.extra.base_chips
                + (joker_count * card.ability.extra.chips_per_joker)

            local mult = hand_count * card.ability.extra.mult_per_card

            return {
                chips = chips,
                mult = mult
            }
        end
    end
}

SMODS.Enhancement {
    key = 'potassium',
    pos = { x = 0, y = 3 },

    config = {
        extra = {
            mult = 15,
            odds = 4
        }
    },

    atlas = 'enhancements',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(
            card,
            1,
            card.ability.extra.odds,
            'dckst_potassium'
        )

        return {
            vars = {
                card.ability.extra.mult,
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then

            local ret = {
                mult = card.ability.extra.mult
            }

            if SMODS.pseudorandom_probability(
                card,
                'dckst_potassium',
                1,
                card.ability.extra.odds
            ) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))

                ret.message = localize('k_extinct_ex')
            end

            return ret
        end
    end
}

SMODS.Enhancement {
    key = 'cobalt',
    pos = { x = 1, y = 3 },
    config = {
        extra = {
            xmult = 1.3
        }
    },
    atlas = 'enhancements',
    any_suit = false,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    replace_base_card = true,
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
                return {
                    x_mult = card.ability.extra.xmult
                }
        end
    end
}

SMODS.Enhancement {
    key = 'molybdenum',
    pos = { x = 2, y = 3 },

    config = {
        bonus = 15
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.bonus
            }
        }
    end,

    atlas = 'enhancements',



    calculate = function(self, card, context)
        if context.debuff_card == card then
            return {
                remove_debuff = true
            }
        end
    end
}

local old_set_debuff = Card.set_debuff

Card.set_debuff = function(self, debuff, silent)

    if debuff and self.config and self.config.center then
        if self.config.center.key == 'm_dckst_molybdenum' then
            return
        end
    end

    return old_set_debuff(self, debuff, silent)
end

SMODS.Enhancement {
    key = 'iridium',
    pos = { x = 3, y = 3 },
    atlas = 'enhancements',

    config = {
        extra = {
            xmult = 0.8,
            dollars = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult, card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_mult = card.ability.extra.xmult, dollars = card.ability.extra.dollars }
        end
    end

}

SMODS.Enhancement {
    key = 'cerium',
    pos = { x = 4, y = 3 },
    atlas = 'enhancements',
    config = { bonus = 0, extra = { bonusgain = 5 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.bonusgain, card.ability.bonus
            }
        }
    end,


    calculate = function(self, card, context)
        if context.after and SMODS.last_hand_oneshot then
            card.ability.bonus = card.ability.bonus + card.ability.extra.bonusgain
            return { message = localize('k_dckst_cerium') }
        end
    end
}