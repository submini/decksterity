SMODS.Voucher {
    key = "expansionpermit",
    atlas = "vouchers",
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
    atlas = "vouchers",
    pos = { x = 0, y = 1 },
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

SMODS.Voucher {
    key = "extra_digits",
    atlas = 'vouchers', pos = { x = 1, y = 0 } ,
    cost = 10,
    config = {
        extras = {
            addentum = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extras.addentum
            }
        }
    end,
    redeem = function (self, card) 
        SMODS.change_play_limit(card.ability.extras.addentum)
        SMODS.change_discard_limit(card.ability.extras.addentum)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extras.addentum
        ease_hands_played(card.ability.extras.addentum)
    end,
    unredeem = function (self, card) 
        SMODS.change_play_limit(-card.ability.extras.addentum)
        SMODS.change_discard_limit(-card.ability.extras.addentum)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extras.addentum
        ease_hands_played(-card.ability.extras.addentum)
    end,
}

SMODS.Voucher {
    key = "ambidextrous",
    atlas = 'vouchers', pos = { x = 1, y = 1 } ,
    cost = 15,
    config = {
        extras = {
            addentum = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extras.addentum
            }
        }
    end,
    requires = {"v_dckst_extra_digits"},
    redeem = function (self, card) 
        SMODS.change_play_limit(card.ability.extras.addentum)
        SMODS.change_discard_limit(card.ability.extras.addentum)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extras.addentum
        ease_hands_played(card.ability.extras.addentum)
    end,
    unredeem = function (self, card) 
        SMODS.change_play_limit(-card.ability.extras.addentum)
        SMODS.change_discard_limit(-card.ability.extras.addentum)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extras.addentum
        ease_hands_played(-card.ability.extras.addentum)
    end,
}

SMODS.Voucher {
    key = "expired",
    atlas = 'vouchers', pos = { x = 2, y = 0 } ,
    cost = 10,
}

SMODS.Voucher {
    key = "double_downer",
    atlas = 'vouchers', pos = { x = 2, y = 1 } ,
    cost = 15,
    config = {
        extras = {
            addentum = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extras.addentum
            }
        }
    end,
    requires = {"v_dckst_expired"},

    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_voucher_limit(card.ability.extras.addentum)
                    return true
                end
            }))
        }
    end
}

SMODS.Voucher {
    key = 'meow',
    pos = { x = 3, y = 0 },
    config = { 
        extra = 2.4,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = "vouchers",
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            G.C.DCKST_RED
     }
        }
    }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.catarot_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.catarot_rate = G.GAME.catarot_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'feliphile',
    pos = { x = 3, y = 1 },
    config = { 
        extra = 8,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = "vouchers",
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            G.C.DCKST_RED
     }
        }
    }
    end,
    requires = {'v_dckst_meow'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.catarot_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.catarot_rate = G.GAME.catarot_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'new_major',
    pos = { x = 4, y = 0 },
    config = { 
        extra = 2.4,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = "vouchers",
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            G.C.DCKST_TEAL
     }
        }
    }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.neotarot_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.neotarot_rate = G.GAME.neotarot_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'beyond_arcana',
    pos = { x = 4, y = 1 },
    config = { 
        extra = 8,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = "vouchers",
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            G.C.DCKST_TEAL
     }
        }
    }
    end,
    requires = {'v_dckst_new_major'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.neotarot_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.neotarot_rate = G.GAME.neotarot_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'double_track',
    pos = { x = 5, y = 0 },
    config = { 
        extra = 2.4,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = "vouchers",
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            G.C.DCKST_NEONGREEN
     }
        }
    }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.route_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.route_rate = G.GAME.route_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'quad_track',
    pos = { x = 5, y = 1 },
    config = { 
        extra = 8,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = "vouchers",
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            G.C.DCKST_NEONGREEN
     }
        }
    }
    end,
    requires = {'v_dckst_double_track'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.route_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.route_rate = G.GAME.route_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

local tarot_use_ref = Card.use_consumeable

function Card:use_consumeable(...)
    local ret = tarot_use_ref(self, ...)

    if self.ability.set == "Tarot" then
        G.GAME.dckst_tarot_usage = G.GAME.dckst_tarot_usage or {}

        local key = self.config.center.key

        G.GAME.dckst_tarot_usage[key] =
            (G.GAME.dckst_tarot_usage[key] or 0) + 1
    end

    return ret
end

function get_most_used_tarot()
    if not G.GAME.dckst_tarot_usage then
        return nil
    end

    local best_key
    local best_count = 0

    for k,v in pairs(G.GAME.dckst_tarot_usage) do
        if v > best_count then
            best_key = k
            best_count = v
        end
    end

    return best_key
end

SMODS.Voucher {
    key = 'tarot_reading',
    pos = { x = 0, y = 2 },
    cost = 10,
    atlas = "vouchers",

    calculate = function(self, card, context)
        if context.create_booster_card
            and context.booster.config.center.kind == "Arcana"
            and context.index == 1 then

            local most_used_tarot = get_most_used_tarot()

            if most_used_tarot then
                return {
                    booster_create_flags = {
                        set = "Tarot",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key = most_used_tarot,
                    }
                }
            end
        end
    end,
}

SMODS.Voucher {
    key = 'foretold_prophecy',
    pos = { x = 0, y = 3 },
    cost = 15,
    atlas = "vouchers",

    config = {
        extra = {
            Xmult = 1.5
        }
    },

    requires = { 'v_dckst_tarot_reading' },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.other_consumeable then
            return {
                x_mult = card.ability.extra.Xmult,
                message_card = context.other_consumeable
            }
        end
    end
}

SMODS.Voucher({
    key = "money_buddy",
    cost = 10,
    unlocked = true,
    available = true,
    requires = {},
    config = { extra = 5 },
    pos = { x = 6, y = 0 },
    atlas = "vouchers",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra } }
    end,

    calculate = function(self, card, context)
        if context.modify_final_cashout then
            return {
                modify = card.ability.extra,
                cashout_row = {
                    name = "k_dckst_money_buddy",
                    text = "Money Buddy",
                    text_colour = G.C.MONEY,
                },
            }
        end
    end,
})

SMODS.Voucher({
    key = "cash_in_guru",
    cost = 10,
    unlocked = true,
    available = true,
    requires = { "v_dckst_money_buddy" },
    config = { extra = 5 },
    pos = { x = 6, y = 1 },
    atlas = "vouchers",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra } }
    end,

    calculate = function(self, card, context)
        if context.modify_final_cashout then
            return {
                modify = card.ability.extra,
                cashout_row = {
                    name = "k_dckst_cash_in_guru",
                    text = "Cash-in Guru",
                    text_colour = G.C.MONEY,
                },
            }
        end
    end,
})

SMODS.Voucher {
    key = "ahod",
    atlas = 'vouchers', pos = { x = 1, y = 2 } ,
    cost = 20,
    config = {
        extras = {
            addentum = 2
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extras.addentum
            }
        }
    end,
    requires = {"v_dckst_ambidextrous"},
    redeem = function (self, card) 
        SMODS.change_play_limit(card.ability.extras.addentum)
        SMODS.change_discard_limit(card.ability.extras.addentum)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extras.addentum
        ease_hands_played(card.ability.extras.addentum)
    end,
    unredeem = function (self, card) 
        SMODS.change_play_limit(-card.ability.extras.addentum)
        SMODS.change_discard_limit(-card.ability.extras.addentum)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extras.addentum
        ease_hands_played(-card.ability.extras.addentum)
    end,
}

SMODS.Voucher {
    key = "triple_troper",
    atlas = 'vouchers', pos = { x = 2, y = 2 } ,
    cost = 15,
    config = {
        extras = {
            addentum = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extras.addentum
            }
        }
    end,
    requires = {"v_dckst_double_downer"},
    
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_voucher_limit(card.ability.extras.addentum)
                    return true
                end
            }))
        }
    end
}

SMODS.Voucher {
    key = 'cat_astrophe',
    pos = { x = 3, y = 2 },
    config = { 
        extra = 14,
    },
    cost = 20,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = "vouchers",
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            G.C.DCKST_RED
     }
        }
    }
    end,
    requires = {'v_dckst_feliphile'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.catarot_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.catarot_rate = G.GAME.catarot_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'neo_madness',
    pos = { x = 4, y = 2 },
    config = { 
        extra = 14,
    },
    cost = 20,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = "vouchers",
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            G.C.DCKST_TEAL
     }
        }
    }
    end,
    requires = {'v_dckst_beyond_arcana'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.neotarot_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.neotarot_rate = G.GAME.neotarot_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'octo_track',
    pos = { x = 5, y = 2 },
    config = { 
        extra = 14,
    },
    cost = 20,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    atlas = "vouchers",
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            G.C.DCKST_NEONGREEN
     }
        }
    }
    end,
    requires = {'v_dckst_quad_track'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.route_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.route_rate = G.GAME.route_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher({
    key = "the_godfather",
    cost = 20,
    unlocked = true,
    available = true,
    requires = { "v_dckst_cash_in_guru" },
    config = { extra = 10 },
    pos = { x = 6, y = 2 },
    atlas = "vouchers",

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra } }
    end,

    calculate = function(self, card, context)
        if context.modify_final_cashout then
            return {
                modify = card.ability.extra,
                cashout_row = {
                    name = "k_dckst_the_godfather",
                    text = "The Godfather",
                    text_colour = G.C.MONEY,
                },
            }
        end
    end,
})