
SMODS.Joker{ --Pillaring
    key = "pillaring",
    config = {
        extra = {
            emultgain = 1.5,
            emult = 1
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 80,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    --atlas = "hazardousjokers1"
    pools = { ["Joker"] = false, ["decksterity"] = false, ["decksterity_hazardous"] = true },

    in_pool = function()
        return DCKST.gset(3)
    end,
    
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.emultgain, card.ability.extra.emult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            card.ability.extra.emult = (card.ability.extra.emult) + card.ability.extra.emultgain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.DARK_EDITION
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = card.ability.extra.emult
            }
        end
    end
}