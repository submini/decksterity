local create_mod_badges_ref = SMODS.create_mod_badges

function SMODS.create_mod_badges(obj, badges)

    if not (obj and obj.mod and obj.mod.id == "decksterity") then
        return create_mod_badges_ref(obj, badges)
    end

    badges.mod_set = badges.mod_set or {}

    if not badges.mod_set[obj.mod.id] then
        badges.mod_set[obj.mod.id] = true

        local misc = G.localization.misc.dckst_misc

        local mnind  = pseudorandom("decksterity_mod_name",       1, #misc.mod_label)
        local mftind = pseudorandom("decksterity_mod_flavor_text", 1, #misc.flavor_text)

        local label_lines  = misc.mod_label[mnind]
        local flavor_lines = misc.flavor_text[mftind]

        -- one DynaText row per line in the picked entry
        local text_nodes = {}

        for _, line in ipairs(label_lines) do
            text_nodes[#text_nodes + 1] = {
                n = G.UIT.R, config = { align = "cm" }, nodes = {
                    { n = G.UIT.O, config = { object = DynaText({
                        string   = line,
                        colours  = { obj.mod.badge_text_colour },
                        shadow   = true,
                        silent   = true,
                        scale    = 0.35
                    })}}
                }
            }
        end

        for _, line in ipairs(flavor_lines) do
            text_nodes[#text_nodes + 1] = {
                n = G.UIT.R, config = { align = "cm" }, nodes = {
                    { n = G.UIT.O, config = { object = DynaText({
                        string   = line,
                        colours  = { obj.mod.badge_text_colour },
                        shadow   = false,
                        silent   = true,
                        scale    = 0.22
                    })}}
                }
            }
        end

        badges[#badges + 1] = {
            n = G.UIT.R,
            config = { align = "cm" },
            nodes = {
                {
                    n = G.UIT.R,
                    config = {
                        align   = "cm",
                        shader  = "dckst_badge",
                        colour  = obj.mod.badge_colour,
                        minw    = 2.2,
                        minh    = 0.3,
                        r       = 1,
                        emboss  = 0.05,
                        padding = 0.05
                    },
                    nodes = text_nodes
                }
            }
        }
    end

    return create_mod_badges_ref(obj, badges)
end


-- =====================
-- UI CONFIG
-- =====================

SMODS.current_mod.ui_config = {
    colour          = {0.12549, 0.12549, 0.12549, 1},
    outline_colour  = {1.0, 0.455, 0.424, 1},
    back_colour     = {1.0, 0.455, 0.424, 1},
    tab_button_colour = {1.0, 0.455, 0.424, 1},
}


-- =====================
-- MAIN PANEL
-- =====================

SMODS.current_mod.custom_ui = function(mod_nodes)
    mod_nodes = EMPTY(mod_nodes)

    -- lil maxey card preview
    local tg = G.ROOM
    local maxeycard = Card(
        tg.T.x, tg.T.y,
        G.CARD_W, G.CARD_H,
        nil,
        G.P_CENTERS['j_dckst_lilmaxey'],
        { bypass_discovery_center = true, bypass_discovery_ui = true }
    )
    maxeycard.ambient_tilt = 0.2

    local node1 = {
        n = G.UIT.C,
        config = {align = "cm", padding = 0.3, r = 0.1, colour = {0.15, 0.08, 0.09, 1}, emboss = 0.05},
        nodes = {
            {
                n = G.UIT.R,
                config = {align = "cm"},
                nodes = {
                    -- card preview on the left
                    {
                        n = G.UIT.C,
                        config = {align = "cm", padding = 0.2},
                        nodes = {
                            {
                                n = G.UIT.O,
                                config = {
                                    object = maxeycard,
                                    w = G.CARD_W,
                                    h = G.CARD_H,
                                }
                            }
                        }
                    },
                    -- text on the right
                    {
                        n = G.UIT.C,
                        config = {align = "cm", padding = 0.2},
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = {align = "cm", padding = 0.05},
                                nodes = {
                                    {n = G.UIT.T, config = {text = "welcome to", scale = 0.5, colour = G.C.WHITE}}
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = {align = "tm"},
                                nodes = {
                                    {
                                        n = G.UIT.O,
                                        config = {
                                            object = DynaText{
                                                string = "decksterity.",
                                                scale = 1.1,
                                                colours = {{1.0, 0.455, 0.424, 1}},
                                                pop_in = 0.1,
                                                float = 1,
                                                bump_rate = 8,
                                                bump_amount = 4,
                                            }
                                        }
                                    }
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = {align = "cm", padding = 0.05},
                                nodes = {
                                    {n = G.UIT.T, config = {text = "- - - - - - - - - - - - - - - - - - -", scale = 0.4, colour = {1.0, 0.455, 0.424, 0.5}}}
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = {align = "cm", padding = 0.1},
                                nodes = {
                                    {n = G.UIT.T, config = {text = "deck with dexterity.", scale = 0.4, colour = G.C.WHITE}}
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = {align = "cm", padding = -2.5},
                                nodes = {
                                    {n = G.UIT.T, config = {text = "dexterity with a deck.", scale = 0.4, colour = G.C.WHITE}}
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = {align = "cm"},
                                nodes = {
                                    {
                                        n = G.UIT.C,
                                        config = {padding = 0.3},
                                        nodes = {
                                            {
                                                n = G.UIT.R,
                                                config = {},
                                                nodes = {
                                                    {n = G.UIT.T, config = {text = "created by mariopuff and UN4YA", scale = 0.3, colour = G.C.WHITE}}
                                                }
                                            },
                                            {
                                                n = G.UIT.R,
                                                config = {padding = 0.05, align = "cm"},
                                                nodes = {
                                                    {n = G.UIT.T, config = {text = "(c) 2025", scale = 0.2, colour = {1.0, 0.455, 0.424, 0.6}}}
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    table.insert(mod_nodes, node1)
end


-- =====================
-- MENU CARDS (title screen)
-- =====================

SMODS.current_mod.menu_cards = function()
    return {
        { key = 'j_dckst_lilmaxey' },
        func = function()
            local mycards = {}
            for _, c in ipairs(G.title_top.cards) do
                if c.config.center_key == 'j_dckst_lilmaxey' then
                    mycards[#mycards + 1] = c
                end
            end
            local maxey = mycards[1]
            if maxey then
                maxey.bypass_discovery_center = true
                maxey.ambient_tilt = 0.2
            end
        end
    }
end


-- =====================
-- CREDITS + EXTRA TABS
-- =====================

SMODS.current_mod.extra_tabs = function()
    local dckst_red     = {1.0, 0.455, 0.424, 1}
    local dckst_red_dim = {0.12549 ,0.12549, 0.12549, 1}
    local gray          = {0.6, 0.6, 0.6, 1}

    local function credit_row(role, names, role_note)
        local role_nodes = {
            {n = G.UIT.T, config = {text = role, scale = 0.34, colour = dckst_red}},
        }
        if role_note then
            role_nodes[#role_nodes + 1] = {n = G.UIT.T, config = {text = " " .. role_note, scale = 0.22, colour = gray}}
        end
        return {
            {
                n = G.UIT.R,
                config = {align = "lm", padding = 0.03},
                nodes = role_nodes
            },
            {
                n = G.UIT.R,
                config = {align = "lm", padding = -0.12},
                nodes = {
                    {n = G.UIT.T, config = {text = names, scale = 0.28, colour = G.C.WHITE}}
                }
            },
            {
                n = G.UIT.R,
                config = {align = "lm", padding = 0.0},
                nodes = {
                    {n = G.UIT.T, config = {text = " ", scale = 0.15, colour = G.C.WHITE}}
                }
            },
        }
    end

    return {
        {
            label = "Credits",
            tab_definition_function = function()
                local col1_nodes = {}
                local col2_nodes = {}

                for _, v in ipairs(credit_row("Creators", "mariopuff, UN4YA")) do
                    col1_nodes[#col1_nodes + 1] = v
                end
                for _, v in ipairs(credit_row("Art", "mariopuff, UN4YA, interseer")) do
                    col1_nodes[#col1_nodes + 1] = v
                end
                for _, v in ipairs(credit_row("Shaders", "mariopuff")) do
                    col1_nodes[#col1_nodes + 1] = v
                end
                for _, v in ipairs(credit_row("Writers", "mariopuff, UN4YA")) do
                    col1_nodes[#col1_nodes + 1] = v
                end

                for _, v in ipairs(credit_row("Sound Design", "UN4YA, mariopuff")) do
                    col2_nodes[#col2_nodes + 1] = v
                end
                for _, v in ipairs(credit_row("Playtesters", "mariopuff, UN4YA")) do
                    col2_nodes[#col2_nodes + 1] = v
                end
                for _, v in ipairs(credit_row("Inspirations", "Aikoyori's Shenanigans,")) do
                    col2_nodes[#col2_nodes + 1] = v
                end
                col2_nodes[#col2_nodes + 1] = {
                    n = G.UIT.R,
                    config = {align = "lm", padding = -0.25},
                    nodes = {{n = G.UIT.T, config = {text = "Cryptid, peakshitmod", scale = 0.28, colour = G.C.WHITE}}}
                }
                col2_nodes[#col2_nodes + 1] = {
                    n = G.UIT.R,
                    config = {align = "lm", padding = 0.0},
                    nodes = {{n = G.UIT.T, config = {text = " ", scale = 0.15, colour = G.C.WHITE}}}
                }

                return {
                    n = G.UIT.ROOT,
                    config = {
                        r = 0.5,
                        padding = 0.5,
                        colour = {0.15, 0.08, 0.09, 1},
                        align = "cm",
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = {align = "cm"},
                            nodes = {
                                {
                                    n = G.UIT.C,
                                    config = {padding = 0.2, align = "tm"},
                                    nodes = col1_nodes
                                },
                                {n = G.UIT.B, config = {h = 0.1, w = 0.3}},
                                {
                                    n = G.UIT.C,
                                    config = {padding = 0.2, align = "tm"},
                                    nodes = col2_nodes
                                },
                            }
                        },
                        {
                            n = G.UIT.R,
                            config = {align = "cm", padding = -0.1},
                            nodes = {
                                {n = G.UIT.T, config = {text = "Special Thanks", scale = 0.34, colour = dckst_red}}
                            }
                        },
                        {
                            n = G.UIT.R,
                            config = {align = "cm", padding = -0.5},
                            nodes = {
                                {n = G.UIT.T, config = {text = "interseer, SeftBunnY, CzarIsActual, beepybunny", scale = 0.26, colour = G.C.WHITE}}
                            }
                        },
                        {
                            n = G.UIT.R,
                            config = {align = "cm", padding = -0.5},
                            nodes = {
                                {n = G.UIT.T, config = {text = "zxcks2x, DefinitelyDinkey, Aikoyori, MathIsFun_", scale = 0.26, colour = G.C.WHITE}}
                            }
                        },
                        {
                            n = G.UIT.R,
                            config = {padding = 0.2, align = "cm"},
                            nodes = {
                                {n = G.UIT.T, config = {text = "thank you for playing decksterity!", scale = 0.28, colour = G.C.DCKST_RED}}
                            }
                        },
                        {
                            n = G.UIT.R,
                            config = {padding = -2, align = "cm"},
                            nodes = {
                                {n = G.UIT.T, config = {text = "non-commercial and unaffiliated with LocalThunk. do not redistribute.", scale = 0.18, colour = G.C.WHITE}}
                            }
                        },
                    }
                }
            end
        }
    }
end