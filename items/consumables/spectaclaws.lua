SMODS.ConsumableType {
    key = 'Spectaclaw',
    primary_colour = G.C.WHITE,
    secondary_colour = SMODS.Gradients["dckst_spectaclaw"],
    collection_rows = { 5, 5 },
    shop_rate = 0,
    default = 'c_dckst_bombay',
	can_stack = true,
	can_divide = true,
}

SMODS.UndiscoveredSprite{
    key = "Spectaclaw",
    atlas = "undiscoveredspectaclaw",
    pos = {x=0, y=0}
}

SMODS.Consumable {
    key = 'bombay',
    set = 'Spectaclaw',
    pos = { x = 0, y = 0 },

    config = {
        max_highlighted = 4,
        seal_num = 1,
        seal_denom = 3,
        money_mult = 0.5
    },

    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'spectaclaws',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        info_queue[#info_queue + 1] = G.P_SEALS.Red
        info_queue[#info_queue + 1] = G.P_SEALS.Blue

        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.seal_num,
                card.ability.seal_denom,
                'dckst_bombay'
            )

        return {
            vars = {
                card.ability.max_highlighted,
                numerator,
                denominator,
                card.ability.money_mult
            }
        }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local target = G.hand.highlighted[i]

                    target:set_ability(G.P_CENTERS.m_glass)

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_bombay',
                        card.ability.seal_num,
                        card.ability.seal_denom
                    ) then
                        target:set_seal(
                            pseudorandom('dckst_bombay_seal') < 0.5 and 'Red' or 'Blue',
                            nil,
                            true
                        )
                    end

                    return true
                end
            }))
        end

        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                local current = G.GAME.dollars or 0
                ease_dollars(math.floor(current * card.ability.money_mult) - current, true)
                return true
            end
        }))

        delay(0.5)
    end,

    can_use = function(self, card)
        return G.hand
            and #G.hand.highlighted > 0
            and #G.hand.highlighted <= card.ability.max_highlighted
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'britishshorthair',
    set = 'Spectaclaw',
    pos = { x = 1, y = 0 },

    config = {
        max_highlighted = 2,
        money_mult = 0.9
    },

    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'spectaclaws',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_consecutive

        return {
            vars = {
                card.ability.max_highlighted,
                card.ability.money_mult
            }
        }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(
                        G.P_CENTERS.m_dckst_consecutive
                    )
                    return true
                end
            }))
        end

        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                local current = G.GAME.dollars or 0
                ease_dollars(math.floor(current * card.ability.money_mult) - current, true)
                return true
            end
        }))

        delay(0.5)
    end,

    can_use = function(self, card)
        return G.hand
            and #G.hand.highlighted > 0
            and #G.hand.highlighted <= card.ability.max_highlighted
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'scottishfold',
    set = 'Spectaclaw',
    pos = { x = 2, y = 0 },

    config = {
        cards_to_modify = 3,
        money_mult = 0.8
    },

    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'spectaclaws',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.cards_to_modify,
                card.ability.money_mult
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

        local candidates = {}

        for _, v in ipairs(G.hand.cards) do
            candidates[#candidates + 1] = v
        end

        pseudoshuffle(candidates, pseudoseed('dckst_scottishfold'))

        local targets = {}

        for i = 1, math.min(card.ability.cards_to_modify, #candidates) do
            targets[#targets + 1] = candidates[i]
        end

        for i = 1, #targets do
            local percent = 1.15 - (i - 0.999) / (#targets - 0.998) * 0.3

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    targets[i]:flip()
                    play_sound('card1', percent)
                    targets[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        for i = 1, #targets do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local enhancement_pool = {}

                    for _, center in pairs(G.P_CENTERS) do
                        if center.set == "Enhanced" then
                            enhancement_pool[#enhancement_pool + 1] = center
                        end
                    end

                    if #enhancement_pool > 0 then
                        local enhancement = pseudorandom_element(
                            enhancement_pool,
                            pseudoseed('dckst_scottishfold')
                        )

                        targets[i]:set_ability(enhancement)
                    end

                    return true
                end
            }))
        end

        for i = 1, #targets do
            local percent = 0.85 + (i - 0.999) / (#targets - 0.998) * 0.3

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    targets[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    targets[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                local current = G.GAME.dollars or 0
                ease_dollars(math.floor(current * card.ability.money_mult) - current, true)
                return true
            end
        }))

        delay(0.5)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 2
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'diamondeye',
    set = 'Spectaclaw',
    pos = { x = 3, y = 0 },

    config = {
        extra = {
            suit_num = 4,
            suit_denom = 5,
            money_mult = 0.6
        }
    },

    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'spectaclaws',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.suit_num,
                card.ability.extra.suit_denom,
                'dckst_diamondeye'
            )
        return {
            vars = { numerator, denominator, card.ability.extra.money_mult }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card
        local hand_cards = G.hand.cards

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #hand_cards do
            local percent = 1.15 - (i - 0.999) / (#hand_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    hand_cards[i]:flip()
                    play_sound('card1', percent)
                    hand_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        for i = 1, #hand_cards do
            local target = hand_cards[i]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_diamondeye',
                        card.ability.extra.suit_num,
                        card.ability.extra.suit_denom
                    ) then
                        local suit = (pseudorandom('dckst_diamondeye_suit') < 0.5)
                            and 'Diamonds'
                            or 'Clubs'
                        SMODS.change_base(target, suit)
                    end
                    return true
                end
            }))
        end

        for i = 1, #hand_cards do
            local percent = 0.85 + (i - 0.999) / (#hand_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    hand_cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    hand_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                local current = G.GAME.dollars or 0
                ease_dollars(math.floor(current * card.ability.extra.money_mult) - current, true)
                return true
            end
        }))

        delay(0.5)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'mutatedbombay',
    set = 'Spectaclaw',
    pos = { x = 4, y = 0 },

    config = {
        extra = {
            select_count = 1,
            xmult_gain = 0.2,
            money_mult = 0.5
        }
    },

    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    atlas = 'spectaclaws',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.select_count,
                card.ability.extra.xmult_gain,
                card.ability.extra.money_mult
            }
        }
    end,

    can_use = function(self, card)
        return G.hand
            and #G.hand.highlighted <= card.ability.extra.select_count and #G.hand.highlighted > 0
            and #G.hand.cards > 1
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.4, 0.4)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local selected_index = nil
                for i, c in ipairs(G.hand.cards) do
                    if c.highlighted then
                        selected_index = i
                        break
                    end
                end
                if not selected_index then return true end

                local limit = selected_index - 1

                for i = 1, limit do
                    local tcard = G.hand.cards[i]
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1 * i,
                        func = function()
                            tcard.ability.perma_x_mult =
                                (tcard.ability.perma_x_mult or 1) + card.ability.extra.xmult_gain
                            tcard:juice_up(0.3, 0.3)
                            play_sound('tarot2')
                            return true
                        end
                    }))
                end

                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.6,
            func = function()
                local current = G.GAME.dollars or 0
                ease_dollars(math.floor(current * card.ability.extra.money_mult) - current, true)
                return true
            end
        }))
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'ojosazules',
    set = 'Spectaclaw',
    pos = { x = 0, y = 1 },

    config = {
        extra = {
            suit_num = 1,
            suit_denom = 3,
            money_mult = 0.75
        }
    },

    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'spectaclaws',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.suit_num,
                card.ability.extra.suit_denom,
                'dckst_ojosazules'
            )
        return {
            vars = { numerator, denominator, card.ability.extra.money_mult }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card
        local hand_cards = G.hand.cards

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for i = 1, #hand_cards do
            local percent = 1.15 - (i - 0.999) / (#hand_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    hand_cards[i]:flip()
                    play_sound('card1', percent)
                    hand_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        for i = 1, #hand_cards do
            local target = hand_cards[i]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_ojosazules',
                        card.ability.extra.suit_num,
                        card.ability.extra.suit_denom
                    ) then
                        SMODS.change_base(target, 'Clubs')
                    end
                    return true
                end
            }))
        end

        for i = 1, #hand_cards do
            local percent = 0.85 + (i - 0.999) / (#hand_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    hand_cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    hand_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                local current = G.GAME.dollars or 0
                ease_dollars(math.floor(current * card.ability.extra.money_mult) - current, true)
                return true
            end
        }))

        delay(0.5)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'americanwirehair',
    set = 'Spectaclaw',
    pos = { x = 1, y = 1 },

    config = {
        extra = {
            card_count = 3,
            money_mult = 0.5
        }
    },

    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'spectaclaws',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return {
            vars = {
                card.ability.extra.card_count,
                card.ability.extra.money_mult,
                colours = { G.C.DCKST_RED }
            },
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

        for i = 1, card.ability.extra.card_count do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15 * i,
                func = function()
                    local catarot_pool = {}
                    for _, center in pairs(G.P_CENTERS) do
                        if center.set == 'Catarot' then
                            catarot_pool[#catarot_pool + 1] = center
                        end
                    end

                    if #catarot_pool > 0 then
                        local chosen = pseudorandom_element(
                            catarot_pool,
                            pseudoseed('dckst_americanwirehair_' .. i)
                        )
                        local new_card = create_card('Consumable', G.consumeables, nil, nil, nil, nil, chosen.key)
                        new_card:set_edition({ negative = true }, true)
                        new_card:add_to_deck()
                        G.consumeables:emplace(new_card)
                        new_card:juice_up(0.3, 0.3)
                        play_sound('tarot2')
                    end

                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15 * card.ability.extra.card_count + 0.2,
            func = function()
                local current = G.GAME.dollars or 0
                ease_dollars(math.floor(current * card.ability.extra.money_mult) - current, true)
                return true
            end
        }))

        delay(0.5)
    end,

    can_use = function(self, card)
        return true
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'sokoke',
    set = 'Spectaclaw',
    pos = { x = 2, y = 1 },

    config = {
        extra = {
            max_highlighted = 1,
            money_mult = 0.6
        }
    },

    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'spectaclaws',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_dckst_cosmic
        return {
            vars = {
                card.ability.extra.max_highlighted,
                card.ability.extra.money_mult
            }
        }
    end,

    can_use = function(self, card)
        local j = G.jokers and G.jokers.highlighted
        return (j and #j or 0) == card.ability.extra.max_highlighted
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card
        local target = G.jokers and G.jokers.highlighted and G.jokers.highlighted[1]

        if not target then return end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                target:set_edition('e_dckst_cosmic', true)
                play_sound('tarot2', 1.0, 0.6)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.jokers:unhighlight_all()
                local current = G.GAME.dollars or 0
                ease_dollars(math.floor(current * card.ability.extra.money_mult) - current, true)
                return true
            end
        }))

        delay(0.5)
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'bastet',
    set = 'Spectaclaw',
    pos = { x = 3, y = 1 },

    config = {
        extra = {
            money_mult = 0.5
        }
    },

    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'spectaclaws',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money_mult
            }
        }
    end,

    use = function(self, card, area, copier)
        local deletable_jokers = {}
        for _, joker in ipairs(G.jokers.cards) do
            if not SMODS.is_eternal(joker, card) then deletable_jokers[#deletable_jokers + 1] = joker end
        end

        local chosen_joker = pseudorandom_element(G.jokers.cards, 'dckst_bastet_choice')

        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.4,
            func = function()
                local copied_joker = SMODS.copy_card(chosen_joker,
                    { strip_edition = chosen_joker.edition and chosen_joker.edition.negative }, nil, nil, nil, false)
                copied_joker:start_materialize()
                return true
            end
        }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            local current = G.GAME.dollars or 0
            ease_dollars(math.floor(current * card.ability.extra.money_mult) - current, true)
            return true
        end
    }))
end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards > 0
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'manekineko',
    set = 'Spectaclaw',
    pos = { x = 4, y = 1 },

    config = {
        extra = {
            money_mult = 0.7
        }
    },

    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'spectaclaws',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return {
            vars = {
                card.ability.extra.money_mult
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card
        local hand_cards = G.hand.cards

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        -- flip face-down
        for i = 1, #hand_cards do
            local percent = 1.15 - (i - 0.999) / (#hand_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    hand_cards[i]:flip()
                    play_sound('card1', percent)
                    hand_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        -- apply lucky enhancement
        for i = 1, #hand_cards do
            local target = hand_cards[i]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    target:set_ability(G.P_CENTERS.m_lucky)
                    return true
                end
            }))
        end

        -- flip face-up
        for i = 1, #hand_cards do
            local percent = 0.85 + (i - 0.999) / (#hand_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    hand_cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    hand_cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                local current = G.GAME.dollars or 0
                ease_dollars(math.floor(current * card.ability.extra.money_mult) - current, true)
                return true
            end
        }))

        delay(0.5)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,

    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}