SMODS.Sticker {
    key = 'evergreen',
    pos = { x = 0, y = 0 },
    sets = { Joker = true },
 
    badge_colour = HEX('44F28E'),
    default_compat = true,
    atlas = 'stickers',

    should_apply = function(self, card, center, area, bypass_roll)

    -- Explicit application (Consumables, events, etc.)
    if bypass_roll then
        return true
    end

    if card.ability and card.ability.eternal then return false end
    if card.ability and card.ability.perishable then return false end

    if self.sets[card.ability.set]
    and G.GAME.modifiers.dckst_spawn_zoomy then
        return true
    end

    return false
end,

 
    calculate = function(self, card, context)
        -- Block destruction, but explicitly allow selling.
        if context.check_eternal then
            if not (context.trigger and context.trigger.from_sell) then
                return { no_destroy = true }
            end
        end
    end
}

local old_add_sticker = Card.add_sticker 
function Card:add_sticker(sticker, bypass_check)

    if self.ability and self.ability.dckst_evergreen then 
        if sticker == "eternal" or sticker == "perishable" then 
            return 
        end 
    end

    if sticker == "dckst_evergreen" then 
        if self.ability and ( self.ability.eternal or self.ability.perishable ) then 
            return 
        end 
    end 
    
    return old_add_sticker(self, sticker, bypass_check) 
end
 
----------------------------------------------
------ PREVENT FLIP / DEBUFF (hooks) ----------
----------------------------------------------
-- Amber Acorn calls v:flip() directly on every card in G.jokers.cards, and
-- Crimson Heart calls card:set_debuff(true) directly on a Joker — neither goes
-- through a calculate context. So we hook the base Card methods themselves,
-- the same way the Slippin' Jimmy example hooks Card.set_debuff.
 
local _old_flip = Card.flip
Card.flip = function(self, ...)
    -- Only block the transition INTO face-down. If the card is already
    -- 'back' for some other reason, still let it flip back to 'front'.
    if self.ability and self.ability['dckst_evergreen'] and self.facing ~= 'back' then
        return
    end
    return _old_flip(self, ...)
end
 
local _old_set_debuff = Card.set_debuff
Card.set_debuff = function(self, debuff, silent)
    if debuff and self.ability and self.ability['dckst_evergreen'] then
        return
    end
    return _old_set_debuff(self, debuff, silent)
end


SMODS.Sticker{
    key = "smiley",
    pos = { x = 1, y = 0 },

    sets = {
        Joker = true,
        Default = true
    },

    badge_colour = HEX("FFD84D"),
    text_colour = HEX("000000"),
    default_compat = true,
     atlas = 'stickers',

    config = {
        mult = 9
    },

    should_apply = function(self, card, center, area, bypass_roll)

    -- Explicit application (Consumables, events, etc.)
    if bypass_roll then
        return true
    end

    if self.sets[card.ability.set]
    and G.GAME.modifiers.dckst_spawn_smiley then
        return true
    end

    return false
end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (card.ability.dckst_smiley and card.ability.dckst_smiley.mult) or 9
            }
        }
    end,

    calculate = function(self, card, context)

        local face_found = false

        if context.scoring_hand then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() then
                    face_found = true
                    break
                end
            end
        end

        if not face_found then
            return
        end

        local mult =
            (card.ability.dckst_smiley and card.ability.dckst_smiley.mult)
            or 9

        -- Joker sticker
        if context.joker_main then
            return {
                mult = mult
            }
        end

        -- Playing card sticker
        if context.main_scoring and context.cardarea == G.play then
            return {
                mult = mult
            }
        end
    end
}

SMODS.Sticker{
    key = "zoomy",
    pos = { x = 2, y = 0 },
     atlas = 'stickers',

    sets = {
        Joker = true
    },

    badge_colour = G.C.DCKST_RED,

    default_compat = true,

    should_apply = function(self, card, center, area, bypass_roll)

    -- Explicit application (Consumables, events, etc.)
    if bypass_roll then
        return true
    end

    if self.sets[card.ability.set]
    and G.GAME.modifiers.dckst_spawn_zoomy then
        return true
    end

    return false
end,

    loc_vars = function(self, info_queue, card)
        return {}
    end,

    calculate = function(self, card, context)

        -- Joker version
        if context.after
        and card.area == G.jokers
        then
            return {

                func = function()
                    DCKST.zoom(card, "dckst_zoomy_joker")
                end
            }
        end
    end
}

SMODS.Sticker{
    key = "deciduous",

    pos = { x = 3, y = 0 },
     atlas = 'stickers',

    sets = {
        Joker = true
    },

    badge_colour = HEX("E67E22"),
    text_colour = HEX("FFFFFF"),

    default_compat = true,

    config = {
        triggers_left = 8
    },

    should_apply = function(self, card, center, area, bypass_roll)

        if bypass_roll then
            return true
        end

        if card.ability.eternal
        or card.ability.perishable then
            return false
        end

        if DCKST.has_sticker(card, "dckst_evergreen") then
            return false
        end

        if self.sets[card.ability.set]
        and G.GAME.modifiers.dckst_spawn_deciduous
        then
            return true
        end

        return false
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                DCKST.get_counter(
                    card,
                    "dckst_deciduous",
                    "triggers_left",
                    8
                )
            }
        }
    end,

    calculate = function(self, card, context)

        -- Only count actual Joker activations.
        if not context.joker_main then
            return
        end

        -- Optional: ignore Blueprint/retriggers
        if context.blueprint
        or context.retrigger_joker then
            return
        end

        local expired, remaining =
            DCKST.decrement_sticker(
                card,
                "dckst_deciduous"
            )

        if expired then
            return {
                func = function()
                    DCKST.destroy_card(card)
                end
            }
        end

        return {
            message = tostring(remaining),
            colour = HEX("E67E22")
        }
    end
}

SMODS.Sticker{
    key = "halved",

    pos = { x = 4, y = 0 },
     atlas = 'stickers',

    sets = {
        Joker = true,
        Default = true
    },

    badge_colour = HEX("202020"),
    text_colour = HEX("FFFFFF"),

    default_compat = true,

    should_apply = function(self, card, center, area, bypass_roll)

        if bypass_roll then
            return true
        end

        if self.sets[card.ability.set]
        and G.GAME.modifiers.dckst_spawn_halved
        then
            return true
        end

        return false
    end,

    apply = function(self, card)
        DCKST.halve(card)
    end
}

