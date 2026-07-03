SMODS.Seal {
    key = 'chartreuse',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_chips = 1.1,
            x_mult = 1.08,
        }
    },

    loc_vars = function(self, info_queue, card)
    return {
        vars = {
            self.config.extra.x_chips,
            self.config.extra.x_mult
        }
    }
end,

    badge_colour = HEX('7FFF00'),
    atlas = 'seals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_chips = card.ability.seal.extra.x_chips, x_mult = card.ability.seal.extra.x_mult }
        end
    end
}

SMODS.Seal {
    key = 'white',
    pos = { x = 1, y = 0 },
    atlas = 'seals',

    badge_colour = HEX('FFFFFF'),
    text_colour = HEX('000000'),

    config = {
        extra = {
            xmult = 1.1,
            xmult_crit = 2,
            odds = 4
        }
    },

    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(
            card,
            1,
            card.ability.seal.extra.odds,
            'dckst_white_seal'
        )

        return {
            vars = {
                card.ability.seal.extra.xmult,
                num,
                denom,
                card.ability.seal.extra.xmult_crit
            }
        }
    end,

    calculate = function(self, card, context)

        if context.main_scoring and context.cardarea == G.play then

            local is_crit = SMODS.pseudorandom_probability(
                card,
                'dckst_white_seal',
                1,
                card.ability.seal.extra.odds
            )

            if is_crit then
                return {
                    Xmult = card.ability.seal.extra.xmult_crit,
                }
            else
                return {
                    Xmult = card.ability.seal.extra.xmult
                }
            end
        end
    end
}

SMODS.Seal {
    key = 'cutesy',
    pos = { x = 3, y = 0 },
    atlas = 'seals',
    badge_colour = G.C.DCKST_RED,
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = { G.C.DCKST_RED } } }
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = 'Catarot' })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_dckst_card_added'), colour = G.C.DCKST_RED }
        end
    end
}

SMODS.Seal {
    key = 'teal',
    pos = { x = 2, y = 0 },
    atlas = 'seals',
    badge_colour = G.C.DCKST_TEAL,
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = { G.C.DCKST_TEAL } } }
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    SMODS.add_card({ set = 'neotarot' })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return { message = localize('k_dckst_card_added'), colour = G.C.DCKST_TEAL }
        end
    end
}

SMODS.Seal {
    key = 'periwinkle',
    pos = { x = 4, y = 0 },
    atlas = 'seals',
    badge_colour = G.C.DCKST_PERI,

    config = {
        extra = {
            prob_num = 1,
            prob_denom = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.seal.extra.prob_num,
                card.ability.seal.extra.prob_denom,
                'dckst_periwinkle_seal'
            )
        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.discard and context.other_card == card
        and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if SMODS.pseudorandom_probability(
                card,
                'dckst_periwinkle_seal',
                card.ability.seal.extra.prob_num,
                card.ability.seal.extra.prob_denom
            ) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = function()
                        SMODS.add_card({ set = 'Spectaclaw' })
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                return { message = localize('k_dckst_card_added'), colour = G.C.DCKST_PERI }
            end
        end
    end
}

SMODS.Seal {
    key = 'asterisk',
    pos = { x = 0, y = 1 },
    config = {
        extra = {
            times = 2
        }
    },
    text_colour = HEX('FFFFFF'),
    badge_colour = HEX('BC002D'),
    atlas = 'seals',
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.seal.extra.times } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.seal.extra.times,
            }
        end
    end
}

SMODS.Seal {
    key = 'asterism',
    pos = { x = 1, y = 1 },
    config = {
        extra = {
            times = 3
        }
    },
    badge_colour = HEX('FFFFFF'),
    text_colour = HEX('BC002D'),
    atlas = 'seals',
    unlocked = true,
    discovered = true,
    no_collection = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.seal.extra.times } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.seal.extra.times,
            }
        end
    end
}