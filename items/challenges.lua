-- Monkey-patch to force all blinds to be The Flint in this challenge
local _get_new_run_blind_choices = get_new_run_blind_choices
function get_new_run_blind_choices(ante)
    if G.GAME and G.GAME.challenge == 'ch_dckst_flint_and_steel' then
        return {
            { blind = G.P_BLINDS['bl_small'] },
            { blind = G.P_BLINDS['bl_big'] },
            { blind = G.P_BLINDS['bl_flint'] },
        }
    end
    return _get_new_run_blind_choices(ante)
end

SMODS.Challenge {
    key = "flint_and_steel",
    loc_txt = { name = "Flint & Steel" },

    rules = {
        custom = {
            { id = "dckst_flint_steel_active", value = true, no_ui = true },
        },
        modifiers = {
            { id = "reroll_cost", value = 99999 },
        },
    },

    deck = {
        type = "Challenge Deck",
        enhancement = "m_steel",
    },
}