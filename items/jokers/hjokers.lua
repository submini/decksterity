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
    pools = { ["H"] = true },
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
    pools = { ["H"] = true },
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