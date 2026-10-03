SMODS.Sticker {
    key = 'evergreen',
    pos = { x = 0, y = 0 },
    sets = { Joker = true },
 
    badge_colour = HEX('44F28E'),
    default_compat = true,
    compat_exceptions = { j_mr_bones, j_dckst_benny },
    atlas = 'stickers',

    should_apply = function(self, card, center, area, bypass_roll)

    -- Explicit application (Consumables, events, etc.)
    if bypass_roll then
        return true
    end

    if card.ability and card.ability.eternal then return false end
    if card.ability and card.ability.perishable then return false end


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
            return false
        end 
    end

    if sticker == "dckst_evergreen" then 
        if self.ability and ( self.ability.eternal or self.ability.perishable ) then 
            return false
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
    and G.GAME.modifiers.dckst_spawn_zoomy and pseudorandom((area == G.pack_cards and 'dckst_packs_zoomy_' or 'dckst_zoomy_')..G.GAME.round_resets.ante) > 0.7 then
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
    compat_exceptions = { j_mr_bones, j_dckst_benny },

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

        if card.ability and card.ability.eternal then return false end
        if card.ability and card.ability.perishable then return false end

        if self.sets[card.ability.set]
        and G.GAME.modifiers.dckst_spawn_deciduous and pseudorandom((area == G.pack_cards and 'dckst_packs_deciduous_' or 'dckst_deciduous_')..G.GAME.round_resets.ante) > 0.7
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
        and G.GAME.modifiers.dckst_spawn_halved and pseudorandom((area == G.pack_cards and 'dckst_packs_halved_' or 'dckst_halved_')..G.GAME.round_resets.ante) > 0.7
        then
            return true
        end

        return false
    end,

    apply = function(self, card)
        DCKST.halve(card)
    end
}

local ECHO_ODDS  = { 1, 2 }
local ECHO_CHAIN = false 
local ECHO_CAP   = 5   

local function echo_vars(card)
    if not card or not G.GAME or not G.GAME.probabilities then
        return ECHO_ODDS[1], ECHO_ODDS[2]
    end
    if SMODS.get_probability_vars then
        return SMODS.get_probability_vars(card, ECHO_ODDS[1], ECHO_ODDS[2], 'dckst_echoed')
    end
    return G.GAME.probabilities.normal * ECHO_ODDS[1], ECHO_ODDS[2]
end

local function echo_roll(card)
    if SMODS.pseudorandom_probability then
        return SMODS.pseudorandom_probability(card, 'dckst_echoed', ECHO_ODDS[1], ECHO_ODDS[2], 'dckst_echoed')
    end
    return pseudorandom('dckst_echoed') < G.GAME.probabilities.normal * ECHO_ODDS[1] / ECHO_ODDS[2]
end

SMODS.Sticker {
    key = 'echoed',
    atlas = 'stickers',
    pos = { x = 5, y = 0 },
    badge_colour = HEX('7fd1c7'),
    sets = { Default = true, Enhanced = true },
    default_compat = true,
    rate = 0,
    needs_enable_flag = false,

    loc_vars = function(self, info_queue, card)
        local n, d = echo_vars(card)
        return { vars = { n, d } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card == card then
            local reps = 0
            while reps < ECHO_CAP and echo_roll(card) do
                reps = reps + 1
                if not ECHO_CHAIN then break end
            end
            if reps > 0 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = reps,
                    card = card,
                }
            end
        end
    end,
}