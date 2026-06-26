-- ── palette ──────────────────────────────────────────────────────────────────

local DCKST_RED  = {1.0, 0.455, 0.424, 1}
local DCKST_DARK = {0.15, 0.08, 0.09, 1}
local DCKST_DIM  = {1.0, 0.455, 0.424, 0.4}
local DCKST_GRAY = {0.6,  0.6,  0.6,  1}

-- ── gameset table (shared with gameset.lua) ───────────────────────────────────

local GAMESETS = {
    { id = 1, key = "humble",    label = "Humble",    colour = {0.38, 0.78, 0.49, 1} },
    { id = 2, key = "honed",     label = "Honed",     colour = {0.93, 0.70, 0.22, 1} },
    { id = 3, key = "hazardous", label = "Hazardous", colour = {1.0,  0.30, 0.28, 1} },
}

-- ── helpers ───────────────────────────────────────────────────────────────────

function DCKST_gameset()
    return G.PROFILES[G.SETTINGS.profile].dckst_gameset or 1
end

local function dckst_sync_gameset(val)
    G.PROFILES[G.SETTINGS.profile].dckst_gameset = val
    SMODS.Mods['decksterity'].config.gameset = val
    SMODS.save_mod_config(SMODS.Mods['decksterity'])
    G:save_progress()
end

-- ── config tab ────────────────────────────────────────────────────────────────

SMODS.current_mod.config_tab = function()
    local config = SMODS.Mods['decksterity'].config

    -- label + optional sublabel on the left, widget on the right
    local function setting_row(label, sublabel, cycle_node)
        return {
            n = G.UIT.R,
            config = { align = "cm", padding = -0.3 },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { align = "cm", minw = 4.5 },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "cm" },
                            nodes = {
                                { n = G.UIT.T, config = {
                                    text   = label,
                                    scale  = 0.35,
                                    colour = G.C.WHITE,
                                }},
                            }
                        },
                        sublabel
                            and {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.08 },
                                nodes = {
                                    { n = G.UIT.T, config = {
                                        text   = sublabel,
                                        scale  = 0.24,
                                        colour = DCKST_GRAY,
                                    }},
                                }
                            }
                            or { n = G.UIT.B, config = { h = 0.01, w = 0.01 } },
                    }
                },
                { n = G.UIT.B, config = { h = 0.1, w = 0.3 } },
                {
                    n = G.UIT.C,
                    config = { align = "cm" },
                    nodes = { cycle_node },
                },
            }
        }
    end

    -- gameset options derived from the shared table so they stay in sync
    local gs_options = {}
    for _, gs in ipairs(GAMESETS) do gs_options[#gs_options + 1] = gs.label end

    return {
        n = G.UIT.ROOT,
        config = {
            r       = 0.5,
            padding = 0.4,
            colour  = DCKST_DARK,
            align   = "cm",
        },
        nodes = {
            -- heading
            {
                n = G.UIT.R,
                config = { align = "cm", padding = 0.08 },
                nodes = {
                    { n = G.UIT.T, config = {
                        text   = "settings",
                        scale  = 0.75,
                        colour = DCKST_RED,
                    }},
                }
            },
            -- divider
            {
                n = G.UIT.R,
                config = { align = "cm", padding = -0.08 },
                nodes = {
                    { n = G.UIT.T, config = {
                        text   = "- - - - - - - - - - - - - - - - - - -",
                        scale  = 0.35,
                        colour = DCKST_DIM,
                    }},
                }
            },
            -- shop music
            setting_row(
                "nicopatty's Shop Music",
                'from "nico\'s nextbots vol. 2"',
                create_option_cycle({
                    label          = '',
                    scale          = 0.8,
                    options        = { 'On', 'Off' },
                    opt_callback   = 'dckst_toggle_shop_music',
                    current_option = config.nicos_shop_music and 1 or 2,
                })
            ),
            -- alt main menu music
            setting_row(
                "Alt Main Menu Music",
                "by UN4YA, manifold 5.1 or geodesic 6.2",
                create_option_cycle({
                    label          = '',
                    scale          = 0.8,
                    options        = { 'Off', '1', '2' },
                    opt_callback   = 'dckst_toggle_alt_main_menu',
                    current_option = (config.alt_main_menu_music == false
                                      or config.alt_main_menu_music == nil) and 1
                                  or (config.alt_main_menu_music == 1)        and 2
                                  or 3,
                })
            ),
            -- gameset  (sublabel = nil, so the blank spacer fires instead)
            setting_row(
                "Gameset",
                nil,
                create_option_cycle({
                    label          = '',
                    scale          = 0.8,
                    options        = gs_options,
                    opt_callback   = 'dckst_toggle_gameset',
                    current_option = config.gameset or 1,
                })
            ),
        }
    }
end

-- ── config callbacks ──────────────────────────────────────────────────────────

G.FUNCS.dckst_toggle_shop_music = function(e)
    local config = SMODS.Mods['decksterity'].config
    config.nicos_shop_music = (e.to_val == 'On')
    SMODS.save_mod_config(SMODS.Mods['decksterity'])
end

G.FUNCS.dckst_toggle_alt_main_menu = function(e)
    local config = SMODS.Mods['decksterity'].config
    if     e.to_val == 'Off' then config.alt_main_menu_music = false
    elseif e.to_val == '1'   then config.alt_main_menu_music = 1
    else                          config.alt_main_menu_music = 2
    end
    SMODS.save_mod_config(SMODS.Mods['decksterity'])
end

G.FUNCS.dckst_toggle_gameset = function(e)
    for i, gs in ipairs(GAMESETS) do
        if gs.label == e.to_val then dckst_sync_gameset(i); return end
    end
end

-- ── onboarding modal ──────────────────────────────────────────────────────────

local function dckst_gameset_modal()
    G.SETTINGS.paused = true

    local function gameset_btn(gs)
        return {
            n = G.UIT.C,
            config = {
                align   = "cm",
                padding = 0.25,
                r       = 0.1,
                minw    = 3.2,
                minh    = 1.4,
                colour  = gs.colour,
                button  = "dckst_choose_gameset_" .. gs.key,
                hover   = true,
                shadow  = true,
                emboss  = 0.05,
                id      = "dckst_gs_btn_" .. gs.key,
            },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0.05 },
                    nodes = {
                        { n = G.UIT.T, config = {
                            text   = localize('k_dckst_gameset_' .. gs.key),
                            scale  = 0.5,
                            colour = G.C.WHITE,
                            shadow = true,
                        }},
                    }
                },
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = -0.05 },
                    nodes = {
                        { n = G.UIT.T, config = {
                            text   = localize('k_dckst_gameset_' .. gs.key .. '_desc'),
                            scale  = 0.28,
                            colour = {1, 1, 1, 0.85},
                            shadow = true,
                            wrap   = true,
                            maxw   = 3.0,
                        }},
                    }
                },
            }
        }
    end

    local btn_nodes = {}
    for i, gs in ipairs(GAMESETS) do
        btn_nodes[#btn_nodes + 1] = gameset_btn(gs)
        if i < #GAMESETS then
            btn_nodes[#btn_nodes + 1] = { n = G.UIT.B, config = { w = 0.25, h = 0.1 } }
        end
    end

    G.FUNCS.overlay_menu({
        definition = {
            n = G.UIT.ROOT,
            config = {
                align       = "cm",
                colour      = {0.32, 0.36, 0.41, 0.6},
                padding     = 32.01,
                r           = 0.1,
                can_collide = true,
            },
            nodes = {{
                n = G.UIT.R,
                config = {
                    align         = "cm",
                    r             = 0.12,
                    padding       = 0.5,
                    colour        = DCKST_DARK,
                    emboss        = 0.06,
                    minh          = 6,
                    minw          = 12,
                    can_collide   = true,
                },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { align = "cm", padding = 0.1 },
                        nodes = {
                            { n = G.UIT.T, config = {
                                text   = "welcome to decksterity.",
                                scale  = 0.65,
                                colour = DCKST_RED,
                                shadow = true,
                            }},
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = { align = "cm", padding = 0.0 },
                        nodes = {
                            { n = G.UIT.T, config = {
                                text   = "choose your experience",
                                scale  = 0.38,
                                colour = {1, 1, 1, 0.7},
                            }},
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = { align = "cm", padding = 0.08 },
                        nodes = {
                            { n = G.UIT.T, config = {
                                text   = "- - - - - - - - - - - - - - - - - - -",
                                scale  = 0.35,
                                colour = DCKST_DIM,
                            }},
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = { align = "cm", padding = 0.2 },
                        nodes  = btn_nodes,
                    },
                    {
                        n = G.UIT.R,
                        config = { align = "cm", padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = {
                                text   = "you can change this any time in the mod settings.",
                                scale  = 0.26,
                                colour = {1, 1, 1, 0.45},
                            }},
                        }
                    },
                }
            }}
        },
        config = {
            align  = "cm",
            offset = { x = 0, y = 0 },
            major  = G.ROOM_ATTACH,
            bond   = "Weak",
            no_esc = true,
        },
    })
end

-- choice callbacks (one per tier, registered at load time)
for _, gs in ipairs(GAMESETS) do
    G.FUNCS["dckst_choose_gameset_" .. gs.key] = function(e)
        dckst_sync_gameset(gs.id)
        G.PROFILES[G.SETTINGS.profile].dckst_onboarding_complete = true
        G:save_progress()
        G.SETTINGS.paused = false
        G.FUNCS.exit_overlay_menu()
    end
end

-- ── show onboarding once per profile when the main menu is entered ────────────

local _main_menu = Game.main_menu
function Game:main_menu(ctx)
    local r = _main_menu(self, ctx)
    if G.PROFILES
        and G.SETTINGS.profile
        and G.PROFILES[G.SETTINGS.profile]
        and not G.PROFILES[G.SETTINGS.profile].dckst_onboarding_complete
    then
        dckst_gameset_modal()
    end
    return r
end

-- re-trigger onboarding immediately when the player resets their profile
local _reset_profile = G.FUNCS.reset_profile
G.FUNCS.reset_profile = function(e)
    _reset_profile(e)
    -- profile table has been wiped and re-initialised by now;
    -- dckst_onboarding_complete is gone so just show the modal directly
    dckst_gameset_modal()
end