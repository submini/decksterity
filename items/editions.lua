SMODS.Edition {
    key = 'cosmic',
    shader = 'dckst_cosmic',
    config = {
        extra = {
        }
    },
    in_shop = true,
    weight = 3,
    extra_cost = 4,
    apply_to_float = true,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        label = 'Cosmic',
    },
    --sound = { sound = "generic1", per = 1, vol = 0.4 },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    on_apply = function(card)
        if not card.ability.cosmic_scaled then
            local ante_mult = 3
            card.ability.cosmic_scaled = ante_mult
            -- Multiply ability values by ante number
            if card.ability.extra and card.ability.extra.chips then
                card.ability.extra.chips = card.ability.extra.chips * ante_mult
            end
            if card.ability.extra and card.ability.extra.mult then
                card.ability.extra.mult = card.ability.extra.mult * ante_mult
            end
            if card.ability.money then
                card.ability.money = card.ability.money * ante_mult
            end
        end
    end,
    
    on_remove = function(card)
        if card.ability.cosmic_scaled then
            local ante_mult = card.ability.cosmic_scaled
            -- Divide ability values to revert scaling
            if card.ability.extra and card.ability.extra.chips then
                card.ability.extra.chips = math.max(card.ability.extra.chips / ante_mult, 0)
            end
            if card.ability.extra and card.ability.extra.mult then
                card.ability.extra.mult = math.max(card.ability.extra.mult / ante_mult, 0)
            end
            if card.ability.money then
                card.ability.money = math.max(card.ability.money / ante_mult, 0)
            end
            card.ability.cosmic_scaled = nil
        end
    end
}
