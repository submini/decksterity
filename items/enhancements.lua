SMODS.Enhancement {
    key = 'nature',
    pos = { x = 0, y = 0 },
    config = {
        mult = 3,
        bonus = 30,
        extra = {
            dollars0 = 0.75
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.mult, card.ability.bonus, card.ability.extra.dollars0 } }
    end,
    --atlas = 'enhancements',
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
                    local target_dollars = G.GAME.dollars + 0.75
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(0.75), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}