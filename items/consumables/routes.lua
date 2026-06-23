SMODS.ConsumableType {
    key = 'Route',
    primary_colour = G.C.WHITE,
    secondary_colour = G.C.DCKST_NEONGREEN,
    collection_rows = { 5, 5 },
    shop_rate = 2,
    default = 'c_dckst_route1',
	can_stack = true,
	can_divide = true,
}

SMODS.UndiscoveredSprite{
    key = "Route",
    atlas = "undiscoveredroute",
    pos = {x=0, y=0}
}

SMODS.Consumable {
    key = 'route_1',
    set = 'Route',
    pos = { x = 0, y = 0 },
    --pixel_size = { w = 66 * 1, h = 66 * 1 },
    display_size = {w = 66, h = 66},

    config = {
        extra = {
            aluminum_num = 2,
            aluminum_denom = 7
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_aluminum

        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.aluminum_num,
                card.ability.extra.aluminum_denom,
                'dckst_route1'
            )

        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route1',
                        card.ability.extra.aluminum_num,
                        card.ability.extra.aluminum_denom
                    ) then
                        target:set_ability(G.P_CENTERS.m_dckst_aluminum)
                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_3',
    set = 'Route',
    pos = { x = 1, y = 0 },
    --pixel_size = { w = 66, h = 66 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            mult_num = 2,
            mult_denom = 3,
            mult_gain = 9
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.mult_num,
                card.ability.extra.mult_denom,
                'dckst_route3'
            )

        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.mult_gain
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route3',
                        card.ability.extra.mult_num,
                        card.ability.extra.mult_denom
                    ) then
                        target.ability.perma_mult =
                            (target.ability.perma_mult or 0)
                            + card.ability.extra.mult_gain

                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_5',
    set = 'Route',
    pos = { x = 2, y = 0 },
    --pixel_size = { w = 66, h = 66 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            chips_num = 3,
            chips_denom = 5,
            chips_gain = 40
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.chips_num,
                card.ability.extra.chips_denom,
                'dckst_route5'
            )

        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.chips_gain
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route5',
                        card.ability.extra.chips_num,
                        card.ability.extra.chips_denom
                    ) then
                        target.ability.perma_bonus =
                            (target.ability.perma_bonus or 0)
                            + card.ability.extra.chips_gain

                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_6',
    set = 'Route',
    pos = { x = 3, y = 0 },
    --pixel_size = { w = 66, h = 66 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            evergreen_num = 1,
            evergreen_denom = 6
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "dckst_evergreen" }

        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.evergreen_num,
                card.ability.extra.evergreen_denom,
                'dckst_route6'
            )

        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.jokers.cards do
            local target = G.jokers.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route6',
                        card.ability.extra.evergreen_num,
                        card.ability.extra.evergreen_denom
                    ) then
                        target:add_sticker('dckst_evergreen', true)
                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_11',
    set = 'Route',
    pos = { x = 4, y = 0 },
    --pixel_size = { w = 66, h = 66 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            edition_num = 1,
            edition_denom = 11
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.edition_num,
                card.ability.extra.edition_denom,
                'dckst_route11'
            )

        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route11',
                        card.ability.extra.edition_num,
                        card.ability.extra.edition_denom
                    ) then
                        local edition = poll_edition(
                            'dckst_route11_edition',
                            nil,
                            false,
                            true
                        )

                        if edition then
                            target:set_edition(edition, true, true)
                            target:juice_up(0.3, 0.3)
                            play_sound('tarot2')
                        end
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_12',
    set = 'Route',
    pos = { x = 5, y = 0 },
    --pixel_size = { w = 66, h = 66 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            icy_num = 1,
            icy_denom = 3
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_icy

        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.icy_num,
                card.ability.extra.icy_denom,
                'dckst_route12'
            )

        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route12',
                        card.ability.extra.icy_num,
                        card.ability.extra.icy_denom
                    ) then
                        target:set_ability(G.P_CENTERS.m_dckst_icy)
                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_16',
    set = 'Route',
    pos = { x = 6, y = 0 },
    --pixel_size = { w = 66, h = 66 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            nature_num = 1,
            nature_denom = 2
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_nature

        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.nature_num,
                card.ability.extra.nature_denom,
                'dckst_route16'
            )

        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route16',
                        card.ability.extra.nature_num,
                        card.ability.extra.nature_denom
                    ) then
                        target:set_ability(G.P_CENTERS.m_dckst_nature)
                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_19',
    set = 'Route',
    pos = { x = 7, y = 0 },
    display_size = { w = 66, h = 66 },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)

                -- build valid consumable pool (LIKE YOUR TAG)
                local consumable_pool = {}

                for k, v in pairs(G.P_CENTER_POOLS["Consumeables"]) do
                    if v.set then
                        consumable_pool[#consumable_pool + 1] = v
                    end
                end

                if #consumable_pool > 0 then
                    local selected = pseudorandom_element(
                        consumable_pool,
                        pseudoseed('dckst_route19')
                    )

                    local card = create_card(
                        'Consumeable',
                        G.consumeables,
                        nil,
                        nil,
                        nil,
                        nil,
                        selected.key
                    )

                    if card then
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                    end
                end

                return true
            end
        }))
    end,

    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'route_30',
    set = 'Route',
    pos = { x = 0, y = 1 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            joker_count = 2
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.joker_count
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card
        local count = card.ability.extra.joker_count

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()

                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)

                -- safety check: must have room
                if #G.jokers.cards > G.jokers.config.card_limit - count then
                    return true
                end

                for i = 1, count do
                    local pool = {}

                    -- uncommon joker pool
                    for k, v in pairs(G.P_CENTER_POOLS["Joker"]) do
                        if v.rarity == 2 then
                            pool[#pool + 1] = v
                        end
                    end

                    if #pool > 0 then
                        local selected = pseudorandom_element(
                            pool,
                            pseudoseed('dckst_route30')
                        )

                        local joker = create_card(
                            'Joker',
                            G.jokers,
                            nil,
                            0.9,
                            nil,
                            nil,
                            selected.key
                        )

                        if joker then
                            joker:add_to_deck()
                            G.jokers:emplace(joker)
                        end
                    end
                end

                return true
            end
        }))
    end,

    can_use = function(self, card)
        return G.jokers and (#G.jokers.cards <= G.jokers.config.card_limit - 2)
    end
}

SMODS.Consumable {
    key = 'route_35',
    set = 'Route',
    pos = { x = 1, y = 1 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            metallurgic_num = 1,
            metallurgic_denom = 5
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_aluminum
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_potassium
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_cobalt
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_molybdenum
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_iridium
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_cerium
        return {
            vars = {
                SMODS.get_probability_vars(
                    card,
                    card.ability.extra.metallurgic_num,
                    card.ability.extra.metallurgic_denom,
                    'dckst_route35'
                )
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()

                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)

                local metallurgic_pool = {
                    G.P_CENTERS.m_dckst_aluminum,
                    G.P_CENTERS.m_dckst_potassium,
                    G.P_CENTERS.m_dckst_cobalt,
                    G.P_CENTERS.m_dckst_molybdenum,
                    G.P_CENTERS.m_dckst_iridium,
                    G.P_CENTERS.m_dckst_cerium
                }

                for i = 1, #G.hand.cards do
                    local target = G.hand.cards[i]

                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()

                            if SMODS.pseudorandom_probability(
                                card,
                                'dckst_route35',
                                card.ability.extra.metallurgic_num,
                                card.ability.extra.metallurgic_denom
                            ) then

                                local chosen = pseudorandom_element(
                                    metallurgic_pool,
                                    pseudoseed('dckst_route35_metallurgic')
                                )

                                if chosen then
                                    target:set_ability(chosen)
                                    target:juice_up(0.3, 0.3)
                                    play_sound('tarot2')
                                end
                            end

                            return true
                        end
                    }))
                end

                return true
            end
        }))
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_48',
    set = 'Route',
    pos = { x = 2, y = 1 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            seal_num = 1,
            seal_denom = 7
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.seal_num,
                card.ability.extra.seal_denom,
                'dckst_route48'
            )

        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()

                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)

                -- build seal pool safely (includes modded seals)
                local seal_pool = {}

                for k, v in pairs(G.P_SEALS) do
                    seal_pool[#seal_pool + 1] = k
                end

                for i = 1, #G.hand.cards do
                    local target = G.hand.cards[i]

                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()

                            if SMODS.pseudorandom_probability(
                                card,
                                'dckst_route48',
                                card.ability.extra.seal_num,
                                card.ability.extra.seal_denom
                            ) then

                                local chosen_seal = pseudorandom_element(
                                    seal_pool,
                                    pseudoseed('dckst_route48_seal')
                                )

                                if chosen_seal and G.P_SEALS[chosen_seal] then
                                    target:set_seal(chosen_seal, nil, true)
                                    target:juice_up(0.3, 0.3)
                                    play_sound('tarot2')
                                end
                            end

                            return true
                        end
                    }))
                end

                return true
            end
        }))
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_57',
    set = 'Route',
    pos = { x = 3, y = 1 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            odds_num = 1,
            odds_denom = 7,
            xchips_gain = 0.3
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.odds_num,
                card.ability.extra.odds_denom,
                'dckst_route57'
            )

        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.xchips_gain
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route57',
                        card.ability.extra.odds_num,
                        card.ability.extra.odds_denom
                    ) then
                        target.ability.perma_x_chips =
                            (target.ability.perma_x_chips or 1) + card.ability.extra.xchips_gain

                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_58',
    set = 'Route',
    pos = { x = 4, y = 1 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            mult_num = 1,
            mult_denom = 8,
            xmult_gain = 0.25
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.mult_num,
                card.ability.extra.mult_denom,
                'dckst_route58'
            )

        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.xmult_gain
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route58',
                        card.ability.extra.mult_num,
                        card.ability.extra.mult_denom
                    ) then
                        target.ability.perma_x_mult =
                            (target.ability.perma_x_mult or 1) + card.ability.extra.xmult_gain

                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_59',
    set = 'Route',
    pos = { x = 5, y = 1 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            serpentine_num = 1,
            serpentine_denom = 10
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_serpentine

        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.serpentine_num,
                card.ability.extra.serpentine_denom,
                'dckst_route59'
            )

        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route59',
                        card.ability.extra.serpentine_num,
                        card.ability.extra.serpentine_denom
                    ) then
                        target:set_ability(G.P_CENTERS.m_dckst_serpentine)
                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_64',
    set = 'Route',
    pos = { x = 6, y = 1 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            techno_num = 1,
            techno_denom = 5
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_techno

        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.techno_num,
                card.ability.extra.techno_denom,
                'dckst_route64'
            )

        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route64',
                        card.ability.extra.techno_num,
                        card.ability.extra.techno_denom
                    ) then
                        target:set_ability(G.P_CENTERS.m_dckst_techno)
                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_67',
    set = 'Route',
    pos = { x = 7, y = 1 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            edition_num = 1,
            edition_denom = 20
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_dckst_wooden

        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.edition_num,
                card.ability.extra.edition_denom,
                'dckst_route67'
            )

        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.jokers.cards do
            local target = G.jokers.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route67',
                        card.ability.extra.edition_num,
                        card.ability.extra.edition_denom
                    ) then
                        target:set_edition({
                            dckst_wooden = true
                        }, true)

                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_70',
    set = 'Route',
    pos = { x = 0, y = 2 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            smiley_num = 1,
            smiley_denom = 7
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "dckst_smiley", vars = { 9 } }

        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.smiley_num,
                card.ability.extra.smiley_denom,
                'dckst_route70'
            )

        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.cards do
            local target = G.hand.cards[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_route70',
                        card.ability.extra.smiley_num,
                        card.ability.extra.smiley_denom
                    ) then
                        target:add_sticker('dckst_smiley', true)
                        target:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route_72',
    set = 'Route',
    pos = { x = 1, y = 2 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            cards_created = 2
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { G.C.DCKST_RED, G.C.DCKST_TEAL }
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()

                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)

                local catarot_pool = {}
                local neotarot_pool = {}

                for k, v in pairs(G.P_CENTERS) do
                    if v.set == 'Catarot' then
                        catarot_pool[#catarot_pool + 1] = v
                    elseif v.set == 'neotarot' then
                        neotarot_pool[#neotarot_pool + 1] = v
                    end
                end

                if #catarot_pool > 0 then
                    local chosen = pseudorandom_element(
                        catarot_pool,
                        pseudoseed('dckst_route72_catarot')
                    )

                    local created = create_card(
                        'Consumable',
                        G.consumeables,
                        nil,
                        nil,
                        nil,
                        nil,
                        chosen.key
                    )

                    created:add_to_deck()
                    G.consumeables:emplace(created)
                end

                if #neotarot_pool > 0 then
                    local chosen = pseudorandom_element(
                        neotarot_pool,
                        pseudoseed('dckst_route72_neotarot')
                    )

                    local created = create_card(
                        'Consumable',
                        G.consumeables,
                        nil,
                        nil,
                        nil,
                        nil,
                        chosen.key
                    )

                    created:add_to_deck()
                    G.consumeables:emplace(created)
                end

                return true
            end
        }))
    end,

    can_use = function(self, card)
    return G.consumeables
        and #G.consumeables.cards < G.consumeables.config.card_limit
end
}

SMODS.Consumable {
    key = 'route_75',
    set = 'Route',
    pos = { x = 2, y = 2 },
    display_size = { w = 66, h = 66 },

    config = {
        extra = {
            joker_count = 3
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.joker_count
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card
        local count = card.ability.extra.joker_count

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()

                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)

                -- safety check: must have room
                if #G.jokers.cards > G.jokers.config.card_limit - count then
                    return true
                end

                for i = 1, count do
                    local pool = {}

                    -- uncommon joker pool
                    for k, v in pairs(G.P_CENTER_POOLS["Joker"]) do
                        if v.rarity == 1 then
                            pool[#pool + 1] = v
                        end
                    end

                    if #pool > 0 then
                        local selected = pseudorandom_element(
                            pool,
                            pseudoseed('dckst_route75')
                        )

                        local joker = create_card(
                            'Joker',
                            G.jokers,
                            nil,
                            0.9,
                            nil,
                            nil,
                            selected.key
                        )

                        if joker then
                            joker:add_to_deck()
                            G.jokers:emplace(joker)
                        end
                    end
                end

                return true
            end
        }))
    end,

    can_use = function(self, card)
        return G.jokers and (#G.jokers.cards <= G.jokers.config.card_limit - 3)
    end
}

SMODS.Consumable {
    key = 'route_78',
    set = 'Route',
    pos = { x = 3, y = 2 },
    display_size = { w = 66, h = 66 },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'routes',

    loc_vars = function(self, info_queue, card)
        local last_key = G.GAME.dckst_last_route
        local last_card = last_key and G.P_CENTERS[last_key] or nil

        local last_name = last_card and localize { type = 'name_text', key = last_card.key, set = 'Route' } or localize('k_none')
        local disallow = (not last_card) or (last_card.key == self.key)
        local colour = disallow and G.C.RED or G.C.GREEN

        -- add tooltip for that card
        if not disallow then
            info_queue[#info_queue + 1] = last_card
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_name .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }

        return { vars = { last_name, colours = { 
            G.C.DCKST_NEONGREEN,
     } }, main_end = main_end  }
    end,

    can_use = function(self, card)
        return (G.GAME.dckst_last_route and G.GAME.dckst_last_route ~= 'c_dckst_route_78')
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local last_key = G.GAME.dckst_last_route
                local last_card = last_key and G.P_CENTERS[last_key]

                if last_card and G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    card:juice_up(0.3, 0.5)
                    SMODS.add_card({ key = last_key })
                end

                return true
            end
        }))

        delay(0.6)
    end
}