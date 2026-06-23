SMODS.Edition {
    key = 'cosmic',
    shader = 'dckst_cosmic',
    config = {
        extra = {
        }
    },
    in_shop = true,
    weight = 2,
    extra_cost = 4,
    apply_to_float = true,
    disable_shadow = false,
    disable_base_shader = false,
    --sound = { sound = "generic1", per = 1, vol = 0.4 },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    on_apply = function(card)
        card.ability.e_dckst_cosmic_applied = true
        DCKST.manipulate(card, { value = 3 })
    end,

    on_remove = function(card)
        DCKST.manipulate(card, { value = 1 / 3 })
        card.ability.e_dckst_cosmic_applied = nil
    end,

    on_load = function(card)
        card.ability.e_dckst_cosmic_applied = true
        DCKST.manipulate(card, { value = 3 })
    end,
}

SMODS.Edition{
    key = "phosphorescent",
    shader = "dckst_phosphorescent",
    config = {
        extra = {
            mult = 10,
            x_chip = 3
        }
    },
    
    calculate =  function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                mult = card.edition.extra.mult,
                xchips = card.edition.extra.x_chip
            }
        end
        if context.pre_joker and (context.cardarea == G.jokers)  then
            return {
                mult = card.edition.extra.mult,
                xchips = card.edition.extra.x_chip
            }
        end
    end,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.edition.extra.mult,
                card.edition.extra.x_chip
            }
        }
    end,
    sound = { sound = "dckst_phosphorescent", per = 1, vol = 0.4 },
    in_shop = true,
    weight = 7,
    extra_cost = 5,
}

SMODS.Edition{
    key = "aetherescent",
    shader = "dckst_aetherescent",
    config = {
        extra = {
            chips = 20,
            x_mult = 1.7
        }
    },
    
    calculate =  function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                chips = card.edition.extra.chips,
                xmult = card.edition.extra.x_mult
            }
        end
        if context.pre_joker and (context.cardarea == G.jokers)  then
            return {
                chips = card.edition.extra.chips,
                xmult = card.edition.extra.x_mult
            }
        end
    end,
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.edition.extra.chips,
                card.edition.extra.x_mult
            }
        }
    end,
    sound = { sound = "dckst_aetherescent", per = 1, vol = 0.4 },
    in_shop = true,
    weight = 7,
    extra_cost = 5,
}

SMODS.Edition{
    key = "iridescent",
    shader = "dckst_iridescent",
    sound = { sound = "dckst_iridescent", per = 1, vol = 0.4 },
    config = {
        extra = {
            num = 1,
            den = 3
        }
    },
    
    calculate = function(self, card, context)
    if context.pre_joker and context.cardarea == G.jokers then
        if SMODS.pseudorandom_probability(
            card,
            'e_dckst_iridescent',
            card.edition.extra.num,
            card.edition.extra.den,
            'e_dckst_iridescent'
        ) then

            if #G.consumeables.cards < G.consumeables.config.card_limit then

                local tarot_type = pseudorandom_element(
                    {'Tarot', 'Catarot', 'neotarot'},
                    pseudoseed('e_dckst_iridescent_choice')
                )

                local message = localize('k_dckst_card_added')
                local colour = G.C.DARK_EDITION


                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0,
                            func = function()
                                play_sound('timpani')

                                SMODS.add_card({
                                    set = tarot_type,
                                    edition = 'e_negative'
                                })

                                card:juice_up(0.3, 0.5)

                                return true
                            end
                        }))

                        delay(0.6)

                        card_eval_status_text(
                            card,
                            'extra',
                            nil,
                            nil,
                            nil,
                            {
                                message = message,
                                colour = colour
                            }
                        )

                        return true
                    end
                }
            end
        end
    end
end,
    
    loc_vars = function (self, info_queue, card)
        local n, d = SMODS.get_probability_vars(card, card.edition.extra.num, card.edition.extra.den, 'e_dckst_iridescent')
        return {
            vars = { n, d, colours = { G.C.DCKST_RED, G.C.DCKST_TEAL } }
        }
    end,
    in_shop = true,
    weight = 3,
    extra_cost = 6,
}

SMODS.Edition{
    key = "prismatic",
    shader = "dckst_prismatic",
    config = {
        extra = {
            chips = 42,
            mult = 9
        }
    },
    
    calculate =  function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                chips = card.edition.extra.chips,
                mult = card.edition.extra.mult
            }
        end
        if context.pre_joker and (context.cardarea == G.jokers)  then
            return {
                chips = card.edition.extra.chips,
                mult = card.edition.extra.mult
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
    local chips = self.config.extra.chips
    local mult = self.config.extra.mult

    if card and card.edition and card.edition.extra then
        chips = card.edition.extra.chips or chips
        mult = card.edition.extra.mult or mult
    end

    return {
        vars = {
            chips,
            mult
        }
    }
end,
    sound = { sound = "dckst_prismatic", per = 1, vol = 0.4 },
    in_shop = true,
    weight = 7,
    extra_cost = 5,
}

SMODS.Edition {
    key = 'wooden',
    shader = 'dckst_wooden',
    config = { card_limit = 2 },
    in_shop = true,
    weight = 1,
    extra_cost = 9,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit } }
    end,
}