sendInfoMessage("Hooking SMODS.calculate_main_scoring...", "decksterity")
local dckst_calcmainscoreref = SMODS.calculate_main_scoring
if not dckst_calcmainscoreref then
    sendWarnMessage("SMODS.calculate_main_scoring was NIL at hook time!", "decksterity")
end

local files = {
    "lib/functions",
    "lib/atlas",
    "lib/gradients",
    "lib/shaders",
    "lib/configui",
    "lib/ui",
    "lib/sounds",
    "lib/gameset",
    "lib/texteffects",
    "lib/attributes",

    "items/jokers/miscjokers",
    "items/jokers/hjokers",
    "items/jokers/nicosjokers",
    "items/jokers/legendaries",
    "items/jokers/hazardousjokers",

    "items/consumables/catarots",
    "items/consumables/neotarots",
    "items/consumables/harmonics",
    "items/consumables/felimonials",
    "items/consumables/exoplanets",
    "items/consumables/routes",
    "items/consumables/spectaclaws",

    "items/decks",
    "items/rarities",
    "items/editions",
    "items/enhancements",
    "items/seals",
    "items/boosters",
    "items/stickers",
    "items/pokerhands",
    "items/stakes",
    "items/vouchers",
    "items/challenges",
    "items/ranks",
    "items/tags",
    "items/blinds",
    "items/quips",
    
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end

SMODS.current_mod.optional_features = function()
    return {
        object_weights = true,
    }
end
