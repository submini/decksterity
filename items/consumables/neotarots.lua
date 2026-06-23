SMODS.ConsumableType {
    key = 'neotarot',
    primary_colour = G.C.WHITE,
    secondary_colour = G.C.DCKST_TEAL,
    collection_rows = { 7, 7 },
    shop_rate = 4,
    default = 'c_dckst_individual',
	can_stack = true,
	can_divide = true,
}

SMODS.UndiscoveredSprite{
    key = "neotarot",
    atlas = "undiscoveredneotarot",
    pos = {x=0, y=0}
}

SMODS.Consumable {
    key = 'individual',
    set = 'neotarot',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        local last_key = G.GAME.dckst_last_neotarot
        local last_card = last_key and G.P_CENTERS[last_key] or nil

        local last_name = last_card and localize { type = 'name_text', key = last_card.key, set = 'neotarot' } or localize('k_none')
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
            G.C.DCKST_TEAL,
     } }, main_end = main_end  }
    end,

    can_use = function(self, card)
        -- only usable if there’s a last Lenormand and it isn’t The Key itself
        return (G.GAME.dckst_last_neotarot and G.GAME.dckst_last_neotarot ~= 'c_dckst_individual')
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local last_key = G.GAME.dckst_last_neotarot
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

SMODS.Consumable {
    key = 'childhood',
    set = 'neotarot',
    pos = { x = 1, y = 0 },

    config = {
        extra = {
            cards = 3
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cards
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
            if not (v.config.center and v.config.center.key == 'm_dckst_nature') then
                candidates[#candidates + 1] = v
            end
        end

        pseudoshuffle(candidates, pseudoseed('dckst_childhood'))

        local amount = math.min(card.ability.extra.cards, #candidates)

        for i = 1, amount do
            local target = candidates[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    target:flip()
                    play_sound('card1')
                    target:juice_up(0.3, 0.3)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    target:set_ability(G.P_CENTERS.m_dckst_nature)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    target:flip()
                    play_sound('tarot2')
                    target:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.5)
    end,

    can_use = function(self, card)
        if not G.hand then
            return false
        end

        for _, v in ipairs(G.hand.cards) do
            if not (v.config.center and v.config.center.key == 'm_dckst_nature') then
                return true
            end
        end

        return false
    end
}

SMODS.Consumable {
    key = 'youth',
    set = 'neotarot',
    pos = { x = 2, y = 0 },

    config = {
        max_highlighted = 2,
        rank_increase = 2
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.max_highlighted,
                card.ability.rank_increase
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
                    assert(SMODS.modify_rank(
                        G.hand.highlighted[i],
                        card.ability.rank_increase
                    ))
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
                return true
            end
        }))

        delay(0.5)
    end,
    can_use = function(self, card)
    return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
end
}

SMODS.Consumable {
    key = 'maturity',
    set = 'neotarot',
    pos = { x = 3, y = 0 },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

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

        for _, joker in ipairs(G.jokers.cards) do
            local rarity = joker.config.center.rarity

            if rarity == 1 or rarity == 2 then
                candidates[#candidates + 1] = joker
            end
        end

        if #candidates > 0 then
            local chosen = pseudorandom_element(
                candidates,
                pseudoseed('dckst_maturity')
            )

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    local copy = copy_card(chosen, nil, nil, nil, chosen.edition)
                    copy:add_to_deck()
                    G.jokers:emplace(copy)

                    play_sound('timpani')
                    copy:juice_up(0.5, 0.5)

                    return true
                end
            }))
        end

        delay(0.5)
    end,

    can_use = function(self, card)
        if not G.jokers or not G.jokers.cards then
            return false
        end

        if #G.jokers.cards >= G.jokers.config.card_limit then
            return false
        end

        for _, joker in ipairs(G.jokers.cards) do
            local rarity = joker.config.center.rarity

            if rarity == 1 or rarity == 2 then
                return true
            end
        end

        return false
    end
}

SMODS.Consumable {
    key = 'old_age',
    set = 'neotarot',
    pos = { x = 4, y = 0 },

    config = {
        extra = {
            survivors = 2,
            money_mult = 0.85
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.survivors,
                card.ability.extra.money_mult
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

        local doomed = {}

        for i = card.ability.extra.survivors + 1, #G.hand.cards do
            doomed[#doomed + 1] = G.hand.cards[i]
        end

        for i = 1, #doomed do
            local percent = 1.15 - (i - 0.999) / (#doomed - 0.998) * 0.3

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    play_sound('card1', percent)
                    doomed[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        for i = 1, #doomed do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    doomed[i]:start_dissolve()
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                ease_dollars(math.floor(G.GAME.dollars * (card.ability.extra.money_mult - 1)))
                return true
            end
        }))

        delay(0.5)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > card.ability.extra.survivors
    end
}

SMODS.Consumable {
    key = 'morning',
    set = 'neotarot',
    pos = { x = 0, y = 1 },

    config = {
        extra = {
            jokers = 2,
            destroys = 2
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.jokers,
                card.ability.extra.destroys
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

        local room = G.jokers.config.card_limit - #G.jokers.cards
        local jokers_to_create = math.min(card.ability.extra.jokers, room)

        for i = 1, jokers_to_create do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    local new_joker = SMODS.create_card({
                        set = 'Joker',
                        rarity == 1,
                        area = G.jokers
                    })

                    new_joker:add_to_deck()
                    G.jokers:emplace(new_joker)

                    play_sound('timpani')
                    new_joker:juice_up(0.3, 0.5)

                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = function()

                local candidates = {}

                for _, v in ipairs(G.hand.cards) do
                    candidates[#candidates + 1] = v
                end

                pseudoshuffle(candidates, pseudoseed('dckst_morning'))

                local amount = math.min(
                    card.ability.extra.destroys,
                    #candidates
                )

                for i = 1, amount do
                    candidates[i]:start_dissolve()
                end

                return true
            end
        }))

        delay(0.6)
    end,

    can_use = function(self, card)
    return G.hand
        and #G.hand.cards > 0
        and G.jokers
        and #G.jokers.cards < G.jokers.config.card_limit
end
}

SMODS.Consumable {
    key = 'afternoon',
    set = 'neotarot',
    pos = { x = 1, y = 1 },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

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

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                local new_joker = create_card(
                    'Joker',
                    G.jokers,
                    nil,
                    nil,
                    nil,
                    nil,
                    nil,
                    'dckst_afternoon'
                )

                new_joker:add_to_deck()
                G.jokers:emplace(new_joker)

                play_sound('timpani')
                new_joker:juice_up(0.5, 0.5)

                return true
            end
        }))

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.jokers ~= nil
    end
}

SMODS.Consumable {
    key = 'evening',
    set = 'neotarot',
    pos = { x = 2, y = 1 },

    config = {
        extra = {
            money_mult = 1.5,
            cards_created = 10
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money_mult,
                card.ability.extra.cards_created
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

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                ease_dollars(
                    math.floor(
                        G.GAME.dollars *
                        (card.ability.extra.money_mult - 1)
                    )
                )
                return true
            end
        }))

        for i = 1, card.ability.extra.cards_created do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.05,
                func = function()

                    local new_card = create_playing_card({
                        front = pseudorandom_element(
                            G.P_CARDS,
                            pseudoseed('dckst_evening')
                        )
                    }, G.deck)

                    new_card:add_to_deck()

                    play_sound('card1')
                    new_card:juice_up(0.2, 0.2)

                    return true
                end
            }))
        end

        delay(0.8)
    end,

    can_use = function(self, card)
        return G.deck ~= nil
    end
}

SMODS.Consumable {
    key = 'night',
    set = 'neotarot',
    pos = { x = 3, y = 1 },

    config = {
        extra = {
            min_selected = 4,
            targets = 2,
            copies = 1
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.min_selected,
                card.ability.extra.targets,
                card.ability.extra.copies
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

        local selected = {}

        for _, v in ipairs(G.hand.highlighted) do
            selected[#selected + 1] = v
        end

        pseudoshuffle(selected, pseudoseed('dckst_night'))

        local amount = math.min(
            card.ability.extra.targets,
            #selected
        )

        for i = 1, amount do
            local target = selected[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    target:juice_up(0.3, 0.3)
                    play_sound('card1')
                    return true
                end
            }))

            for j = 1, card.ability.extra.copies do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local copy = copy_card(target, nil, nil, G.playing_card)

                        copy:add_to_deck()

                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, copy)

                        G.deck:emplace(copy)

                        copy:start_materialize()

                        return true
                    end
                }))
            end
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand
            and #G.hand.highlighted >= card.ability.extra.min_selected
    end
}

SMODS.Consumable {
    key = 'night',
    set = 'neotarot',
    pos = { x = 3, y = 1 },

    config = {
        extra = {
            min_selected = 4,
            targets = 2,
            copies = 1
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.min_selected,
                card.ability.extra.targets,
                card.ability.extra.copies
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

        local selected = {}

        for _, v in ipairs(G.hand.highlighted) do
            selected[#selected + 1] = v
        end

        pseudoshuffle(selected, pseudoseed('dckst_night'))

        local amount = math.min(
            card.ability.extra.targets,
            #selected
        )

        for i = 1, amount do
            local target = selected[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    target:juice_up(0.3, 0.3)
                    play_sound('card1')
                    return true
                end
            }))

            for j = 1, card.ability.extra.copies do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local copy = copy_card(target, nil, nil, G.playing_card)

                        copy:add_to_deck()

                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, copy)

                        G.deck:emplace(copy)

                        copy:start_materialize()

                        return true
                    end
                }))
            end
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand
            and #G.hand.highlighted >= card.ability.extra.min_selected
    end
}

SMODS.Consumable {
    key = 'earth_and_air',
    set = 'neotarot',
    pos = { x = 4, y = 1 },

    config = {
        extra = {
            stone_num = 1,
            stone_denom = 5,
            seal_num = 2,
            seal_denom = 7
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        info_queue[#info_queue + 1] = G.P_SEALS.dckst_white

        local numerator1, denominator1 =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.stone_num,
                card.ability.extra.stone_denom,
                'dckst_earth_air_stone'
            )

            local numerator2, denominator2 =
            SMODS.get_probability_vars(
                card,
                card.ability.extra.seal_num,
                card.ability.extra.seal_denom,
                'dckst_earth_air_seal'
            )

        return {
            vars = {
                numerator1,
                denominator1,
                numerator2,
                denominator2
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

                    local changed = false

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_earth_air_stone',
                        card.ability.extra.stone_num,
                        card.ability.extra.stone_denom
                    ) then
                        target:set_ability(G.P_CENTERS.m_stone)
                        changed = true
                    end

                    if SMODS.pseudorandom_probability(
                        card,
                        'dckst_earth_air_seal',
                        card.ability.extra.seal_num,
                        card.ability.extra.seal_denom
                    ) then
                        target:set_seal('dckst_white', nil, true)
                        changed = true
                    end

                    if changed then
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
    key = 'water_and_fire',
    set = 'neotarot',
    pos = { x = 0, y = 2 },

    config = {
        extra = {
            mult = 10,
            chips = 30,
            max_highlighted = 1
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
                card.ability.extra.max_highlighted
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card
        local target = G.hand.highlighted[1]

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

                target:flip()

                if pseudorandom('dckst_water_and_fire') < 0.5 then
                    target.ability.perma_mult =
                        (target.ability.perma_mult or 0)
                        + card.ability.extra.mult

                    card_eval_status_text(
                        target,
                        'extra',
                        nil,
                        nil,
                        nil,
                        {
                            message = '+' .. card.ability.extra.mult .. ' Mult',
                            colour = G.C.MULT
                        }
                    )
                else
                    target.ability.perma_bonus =
                        (target.ability.perma_bonus or 0)
                        + card.ability.extra.chips

                    card_eval_status_text(
                        target,
                        'extra',
                        nil,
                        nil,
                        nil,
                        {
                            message = '+' .. card.ability.extra.chips .. ' Chips',
                            colour = G.C.CHIPS
                        }
                    )
                end

                target:juice_up(0.3, 0.3)

                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                target:flip()
                play_sound('tarot2')
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.highlighted == card.ability.extra.max_highlighted
    end
}

SMODS.Consumable {
    key = 'dance',
    set = 'neotarot',
    pos = { x = 1, y = 2 },

    config = {
        extra = {
            repetitions = 2
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        local fool_c = G.GAME.last_tarot_planet and G.P_CENTERS[G.GAME.last_tarot_planet] or nil
        local last_tarot_planet = fool_c and localize {
            type = 'name_text',
            key = fool_c.key,
            set = fool_c.set
        } or localize('k_none')

        local colour = (not fool_c or fool_c.name == 'The Fool')
            and G.C.RED
            or G.C.GREEN

        if not (not fool_c or fool_c.name == 'The Fool') then
            info_queue[#info_queue + 1] = fool_c
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {
                            align = "m",
                            colour = colour,
                            r = 0.05,
                            padding = 0.05
                        },
                        nodes = {
                            {
                                n = G.UIT.T,
                                config = {
                                    text = ' ' .. last_tarot_planet .. ' ',
                                    colour = G.C.UI.TEXT_LIGHT,
                                    scale = 0.3,
                                    shadow = true
                                }
                            }
                        }
                    }
                }
            }
        }

        return {
            vars = {
                card.ability.extra.repetitions,
                last_tarot_planet
            },
            main_end = main_end
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

                for i = 1, card.ability.extra.repetitions do
                    SMODS.add_card({
                        key = G.GAME.last_tarot_planet
                    })
                end

                play_sound('timpani')

                return true
            end
        }))

        delay(0.6)
    end,

    can_use = function(self, card)
    if not G.consumeables then
        return false
    end

    local available =
        G.consumeables.config.card_limit
        - #G.consumeables.cards
        + (card.area == G.consumeables and 1 or 0)

    return G.GAME.last_tarot_planet
        and G.GAME.last_tarot_planet ~= 'c_fool'
        and available >= card.ability.extra.repetitions
end
}

SMODS.Consumable {
    key = 'shopping',
    set = 'neotarot',
    pos = { x = 2, y = 2 },

    config = {
        extra = {
            ante_cost = 1
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.round_resets.ante * card.ability.extra.ante_cost
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

                local tag_keys = {}

                for k, _ in pairs(G.P_TAGS) do
                    tag_keys[#tag_keys + 1] = k
                end

                local chosen_tag = pseudorandom_element(
                    tag_keys,
                    pseudoseed('dckst_shopping')
                )

                add_tag(Tag(chosen_tag))

                ease_dollars(
                    -(G.GAME.round_resets.ante * card.ability.extra.ante_cost)
                )

                play_sound('generic1')

                return true
            end
        }))

        delay(0.6)
    end,

    can_use = function(self, card)
        local cost =
            G.GAME.round_resets.ante * card.ability.extra.ante_cost

        return G.GAME
            and to_big(G.GAME.dollars):gte(to_big(cost))
    end
}

SMODS.Consumable {
    key = 'open_air',
    set = 'neotarot',
    pos = { x = 3, y = 2 },

    config = {
        extra = {
            min_selected = 5,
            seals = 2
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS.dckst_white

        return {
            vars = {
                card.ability.extra.min_selected,
                card.ability.extra.seals
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card
        local highlighted = {}

        for _, v in ipairs(G.hand.highlighted) do
            highlighted[#highlighted + 1] = v
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        pseudoshuffle(highlighted, pseudoseed('dckst_open_air'))

        local amount = math.min(
            card.ability.extra.seals,
            #highlighted
        )

        for i = 1, amount do
            local chosen = highlighted[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = function()
                    if chosen and chosen.set_seal then
                        chosen:set_seal('dckst_white', nil, true)

                        play_sound('tarot2')
                        chosen:juice_up(0.6, 0.5)
                    end

                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.6,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))

        delay(0.7)
    end,

    can_use = function(self, card)
        return G.hand
            and #G.hand.highlighted >= card.ability.extra.min_selected
    end
}

SMODS.Consumable {
    key = 'visual_arts',
    set = 'neotarot',
    pos = { x = 4, y = 2 },

    config = {
        max_highlighted = 1,
        extra = {
            odds = 5
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator =
            SMODS.get_probability_vars(
                card,
                1,
                card.ability.extra.odds,
                'dckst_visual_arts'
            )

        return {
            vars = {
                numerator,
                denominator,
                card.ability.max_highlighted
            }
        }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card
        local target = G.hand.highlighted[1]

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        if SMODS.pseudorandom_probability(
            card,
            'dckst_visual_arts',
            1,
            card.ability.extra.odds
        ) then

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()

                    local editions = {}

                    for _, edition in pairs(G.P_CENTER_POOLS.Edition) do
                        editions[#editions + 1] = edition
                    end

                    local chosen = pseudorandom_element(
                        editions,
                        pseudoseed('dckst_visual_arts_edition')
                    )

                    if chosen then
                        local edition_key = chosen.key:gsub("^e_", "")

                        target:set_edition({
                            [edition_key] = true
                        }, true)

                        play_sound('timpani')
                        target:juice_up(0.6, 0.5)

                        check_for_unlock({
                            type = 'have_edition'
                        })
                    end

                    return true
                end
            }))

        else

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()

                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.DCKST_TEAL,
                        align = (
                            G.STATE == G.STATES.TAROT_PACK
                            or G.STATE == G.STATES.SPECTRAL_PACK
                            or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
                        ) and 'tm' or 'cm',
                        offset = {
                            x = 0,
                            y = (
                                G.STATE == G.STATES.TAROT_PACK
                                or G.STATE == G.STATES.SPECTRAL_PACK
                                or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
                            ) and -0.2 or 0
                        },
                        silent = true
                    })

                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))

                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)

                    return true
                end
            }))

        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))

        delay(0.6)
    end,

    can_use = function(self, card)
        return G.hand
            and #G.hand.highlighted <= card.ability.max_highlighted and #G.hand.highlighted > 0
    end
}

SMODS.Consumable {
    key = 'spring',
    set = 'neotarot',
    pos = { x = 0, y = 3 },
    config = { max_highlighted = 1, extra = { mod_conv = 'm_dckst_serpentine' } },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',
    loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_serpentine

    return {
        vars = {
            card.ability.max_highlighted
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
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    key = 'summer',
    set = 'neotarot',
    pos = { x = 1, y = 3 },

    config = {
        max_highlighted = 5,
        extra = {
            mult = 1.25
        }
    },

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    atlas = 'neotarots',

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.mult, card.ability.max_highlighted }
        }
    end,

    use = function(self, card)
        local targets = G.hand and G.hand.highlighted or {}
        if not targets or #targets == 0 then return end

        local removed_count = 0

        -- flip DOWN phase
        for _, c in ipairs(targets) do
            c:flip()
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function()

                for _, c in ipairs(targets) do
                    if c.ability and c.ability.set and c.ability.set == 'Enhanced' then
                        c:set_ability(G.P_CENTERS.c_base)
                        removed_count = removed_count + 1
                    end

                    -- safety fallback for modded enhancement systems
                    if c.config and c.config.center and c.config.center.mod and c.config.center.mod.enhancement then
                        c:set_ability(G.P_CENTERS.c_base)
                        removed_count = removed_count + 1
                    end

                    c:flip()
                    c:juice_up(0.3, 0.4)
                end

                return true
            end
        }))

        -- money scaling (smooth and visible)
        G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.8,
    func = function()
        if removed_count > 0 then
            local mult = (card.ability.extra.mult ^ removed_count) - 1
            ease_dollars(
                math.floor(G.GAME.dollars * mult)
            )
        end
        return true
    end
}))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.0,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,

    can_use = function(self, card)
        return G.hand
            and G.hand.highlighted
            and #G.hand.highlighted <= card.ability.max_highlighted and #G.hand.highlighted ~= 0
    end
}

SMODS.Consumable {
    key = 'autumn',
    set = 'neotarot',
    pos = { x = 2, y = 3 },

    config = {
        extra = {
            mult = 1.4,
            targets = 1
        }
    },

    loc_vars = function(self, info_queue, card)
       info_queue[#info_queue + 1] = { set = "Other", key = "perishable", vars = {5, 5} }
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.targets
            }
        }
    end,

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    use = function(self, card, area, copier)
        local used_card = copier or card

        -- build safe joker pool
        local pool = {}
        if G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                if j and not j.debuff then
                    pool[#pool + 1] = j
                end
            end
        end

        if #pool == 0 then return end

        local target_count = math.min(card.ability.extra.targets, #pool)

        -- pick targets (no duplicates)
        local chosen = {}
        local pool_copy = {}

        for i = 1, #pool do
            pool_copy[i] = pool[i]
        end

        for i = 1, target_count do
            local pick = pseudorandom_element(pool_copy, pseudoseed('autumn_' .. i))
            if pick then
                chosen[#chosen + 1] = pick

                -- remove from pool_copy so no duplicates
                for k, v in ipairs(pool_copy) do
                    if v == pick then
                        table.remove(pool_copy, k)
                        break
                    end
                end
            end
        end

        -- juice activation
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        -- apply perishable
        for i = 1, #chosen do
            local c = chosen[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    if c and c.set_perishable then
                        c:set_perishable(true)
                        c:juice_up(0.6, 0.5)
                        play_sound('tarot2')
                    end
                    return true
                end
            }))
        end

        -- money multiplier (safe big-number aware)
        G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.6,
    func = function()
        if G.GAME and G.GAME.dollars then
            local current = to_big(G.GAME.dollars)
            local new_val = math.floor(current * to_big(card.ability.extra.mult))

            ease_dollars(new_val - current)
        end
        return true
    end
}))

        -- cleanup
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.8,
            func = function()
                if G.jokers then
                    G.jokers:unhighlight_all()
                end
                return true
            end
        }))
    end,

    can_use = function(self, card)
        if not (G.jokers and G.jokers.cards) then return false end

        for _, j in ipairs(G.jokers.cards) do
            if j and not j.debuff then
                return true
            end
        end

        return false
    end
}

SMODS.Consumable {
    key = 'winter',
    set = 'neotarot',
    pos = { x = 3, y = 3 },
    config = { max_highlighted = 2, extra = { mod_conv = 'm_dckst_icy' } },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',
    loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_dckst_icy

    return {
        vars = {
            card.ability.max_highlighted
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
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
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
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    key = 'the_game',
    set = 'neotarot',
    pos = { x = 4, y = 3 },

    config = {
        max_highlighted = 4,
        extra = {
            perma_bonus_value = 3
        }
    },

    loc_vars = function(self, info_queue, card)
    return {
        vars = {
            card.ability.extra.perma_bonus_value,
            card.ability.max_highlighted
        }
    }
    end,


    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'neotarots',

    use = function(self, card, area, copier)
        local used_card = copier or card
        local highlighted = G.hand and G.hand.highlighted or {}

        if #highlighted == 0 or #highlighted > 4 then return end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        -- visual juice per card (Fox-style)
        for i = 1, #highlighted do
            local c = highlighted[i]
            local percent = 1.15 - (i - 0.999) / (#highlighted - 0.998) * 0.3

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    play_sound('card1', percent)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.2)

        -- apply permanent mult
        for i = 1, #highlighted do
            local c = highlighted[i]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    c.ability.perma_mult = c.ability.perma_mult or 0
                    c.ability.perma_mult = c.ability.perma_mult + card.ability.extra.perma_bonus_value
                    return true
                end
            }))
        end

        -- cleanup
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))

        delay(0.5)
    end,

    can_use = function(self, card)
        return G.hand
            and G.hand.highlighted
            and #G.hand.highlighted > 0
            and #G.hand.highlighted <= 4
    end
}

SMODS.Consumable {
    key = 'collective',
    set = 'neotarot',
    atlas = 'neotarots',
    pos = { x = 0, y = 4 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    config = { extra = { neotars = 2 } },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
            card.ability.extra.neotars,
        colours = { 
            G.C.DCKST_TEAL
     }
        }
    }
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.neotars, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'neotarot' })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) or
            (card.area == G.consumeables)
    end
}