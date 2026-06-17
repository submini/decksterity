SMODS.Joker{ --Tamerlane
    key = "tamerlane",
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.9,
        }
    },
    pos = { x = 3, y = 2 },
    soul_pos = { x = 0, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,

    calculate = function(self, card, context)
        -- fires whenever a playing card changes suit (Death tarot, Wild card, etc.)
        if context.change_suit then
            -- only trigger if it's an actual suit conversion (new suit differs from old)
            if context.new_suit and context.old_suit and context.new_suit ~= context.old_suit then
                SMODS.scale_card(card, {
                    ref_table   = card.ability.extra,
                    ref_value   = 'xmult',
                    scalar_value = 'xmult_gain',
                    operation   = '+',
                    scaling_message = {
                        message = localize("k_dckst_suit_changed"),
                    }
                })
            end
        end

        -- apply xmult during joker main scoring
        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult,
            }
        end
    end
}

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
        x = 2,
        y = 2
    },
    soul_pos = {
        x = 3,
        y = 5
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
    atlas = "jokerswave1",
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

SMODS.Joker{ --THE ROOOOOOOOOOOOOOOOOOOOOOOOOOOOK
    key = "therook",
    config = {
        extra = {
            xmult      = 1,
            xmult_gain = 1.75,
        }
    },
    pos = { x = 4, y = 4 },
    soul_pos = { x = 2, y = 5 },
    display_size = { w = 71 * 1, h = 95 * 1 },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'jokerswave1',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            local leftmost = G.jokers.cards[1]

            -- if we ARE the leftmost, do nothing
            if leftmost and leftmost ~= card then
                -- destroy leftmost joker
                SMODS.destroy_cards(leftmost, nil, nil, true)

                -- gain +X1.75 Mult via scale_card
                SMODS.scale_card(card, {
                    ref_table    = card.ability.extra,
                    ref_value    = 'xmult',
                    scalar_value = 'xmult_gain',
                    operation    = '+',
                    scaling_message = {
                        message = localize("k_dckst_sacrifice"),
                    }
                })
            end
        end

        if context.joker_main then
            return { Xmult = card.ability.extra.xmult }
        end
    end
}

SMODS.Joker {
    key = "perrobabli",
    cost = 20,
    rarity = 4,
    pos = { x = 0, y = 7 },
    soul_pos = { x = 4, y = 5 },
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = "jokerswave1",

    calculate = function(self, card, context)
        if context.fix_probability and not context.blueprint then
            local num = context.numerator
            local den = context.denominator

            -- nudge both toward 1 in 2
            -- average between current ratio and 0.5
            local ratio = num / den
            local new_ratio = (ratio + 0.5) / 2

            -- keep denominator the same, adjust numerator
            local new_num = math.max(1, math.floor(new_ratio * den + 0.5))

            return {
                numerator = new_num,
                denominator = den
            }
        end
    end
}