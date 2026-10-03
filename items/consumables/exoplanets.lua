SMODS.ConsumableType {
    key = 'Exoplanet',
    default = 'c_dckst_awasis',
    primary_colour = G.C.WHITE,
    secondary_colour = G.C.DCKST_EXOPLANET_BLUE,
    collection_rows = { 5 },
    shop_rate = 2.5
}

SMODS.Atlas {
    key = 'exoplanets',
    path = 'neotarots.png',
    px = 71,
    py = 95,
}

-- Chance that a Celestial pack slot becomes an Exoplanet (when one is eligible)
local EXOPLANET_CHANCE = 0.25

-- True if at least one Exoplanet's hand has been played.
-- Needed because an empty pool falls back to `default` (c_dckst_awasis),
-- which would otherwise spawn even when unplayed.
local function any_exoplanet_eligible()
    for _, center in ipairs(G.P_CENTER_POOLS.Exoplanet or {}) do
        local hand = G.GAME.hands[center.config.hand_type]
        if hand and hand.played > 0 then return true end
    end
    return false
end

-- Wrap each Celestial pack's own create_card, keeping its original behaviour
for key, booster in pairs(SMODS.Booster.obj_table) do
    if booster.kind == 'Celestial' then
        local original = booster.create_card
        SMODS.Booster:take_ownership(key, {
            create_card = function(self, card, i)
                local result = original(self, card, i)

                -- Leave Card objects and forced picks (e.g. Telescope's key) alone
                if type(result) == 'table' and not result.is
                   and not result.key
                   and any_exoplanet_eligible()
                   and pseudorandom('dckst_exo_pack' .. G.GAME.round_resets.ante) < EXOPLANET_CHANCE then
                    return {
                        set = 'Exoplanet',
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = 'dckst_exo',
                    }
                end
                return result
            end,
        }, true)
    end
end

local function exoplanet(args)
    SMODS.Consumable {
        key = args.key,
        set = 'Exoplanet',
        atlas = 'exoplanets',
        pos = { x = args.x, y = 0 },
        cost = 4,
        config = { hand_type = args.hand_type},
        in_pool = function(self, args)
            local hand = G.GAME.hands[self.config.hand_type]
            return hand ~= nil and hand.played > 0
        end,
        loc_vars = function(self, info_queue, card)
            local hand = G.GAME.hands[card.ability.hand_type]
            return {
                vars = {
                    hand.level,
                    localize(card.ability.hand_type, 'poker_hands'),
                    hand.l_mult,
                    hand.l_chips,
                    colours = { (hand.level == 1 and G.C.UI.TEXT_DARK
                        or G.C.HAND_LEVELS[math.min(7, hand.level)]) },
                },
            }
        end,
    }
end

exoplanet { key = 'awasis', x = 0, hand_type = 'dckst_two_three' }     
exoplanet { key = 'kepler_97b',  x = 1, hand_type = 'dckst_triangle' }      
exoplanet { key = 'noifasui',   x = 2, hand_type = 'dckst_umbra' }      
exoplanet { key = 'sweeps_4b',  x = 3, hand_type = 'dckst_antumbra' }   
exoplanet { key = 'lhs_1140b',  x = 4, hand_type = 'dckst_bipolar_flush' } 