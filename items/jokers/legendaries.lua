SMODS.Joker{ -- lil maxey!
    key = "lilmaxey",
    config = {
        extra = {
            xmult_left_bonus = 1.5,
            xmult_per_hand = 1.5,
            current_xmult = 1
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
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    --atlas = "jokerswave1",
    pools = { ["Jokers"] = true, ["decksterity"] = true },
    in_pool = function(self, args)
        return (
            not args
            or args.source ~= 'sho'
            or args.source == 'buf'
            or args.source == 'jud'
            or args.source == 'rif'
            or args.source == 'rta'
            or args.source == 'sou'
            or args.source == 'uta'
            or args.source == 'wra'
        ) and true
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_left_bonus,
                card.ability.extra.xmult_per_hand,
                card.ability.extra.current_xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.other_joker then
            -- Check if other_joker is to the left of maxey
            for _, joker in ipairs(G.jokers.cards) do
                if joker == card then
                    -- Reached maxey, other_joker is to the right or is maxey
                    break
                end
                if joker == context.other_joker then
                    -- Found other_joker before maxey, it's to the left
                    return {
                        Xmult = card.ability.extra.xmult_left_bonus
                    }
                end
            end
        end

        if context.cardarea == G.jokers and context.joker_main then
            card.ability.extra.current_xmult =
                card.ability.extra.current_xmult + card.ability.extra.xmult_per_hand
            return {
                Xmult = card.ability.extra.current_xmult
            }
        end
    end
}
