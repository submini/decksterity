SMODS.Voucher {
    key = "expansionpermit",
    --atlas = "vouchers",
    pos = { x = 0, y = 0 }, 
    cost = 10,
    config = { extra = 1 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card and card.ability.extra or self.config.extra } }
    end,

    redeem = function(self, card)
        SMODS.change_booster_limit(card.ability.extra or self.config.extra)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(-(card.ability.extra or self.config.extra))
    end,
}

SMODS.Voucher {
    key = "prestigepermit",
    --atlas = "vouchers",
    pos = { x = 0, y = 0 },
    cost = 10,
    config = { extra = 1 },
    requires = {"v_dckst_expansionpermit"},

    loc_vars = function(self, info_queue, card)
        return { vars = { card and card.ability.extra or self.config.extra } }
    end,

    redeem = function(self, card)
        SMODS.change_booster_limit(card.ability.extra or self.config.extra)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(-(card.ability.extra or self.config.extra))
    end,
}