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