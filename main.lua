local files = {
    "lib/atlas",
    "lib/gradients",
    "lib/shaders",
    "lib/configui",
    "lib/ui",
    "lib/functions",
    "lib/sounds",
    "lib/gameset",

    "items/jokers/miscjokers",
    "items/jokers/hjokers",
    "items/jokers/legendaries",
    "items/jokers/hazardousjokers",

    "items/consumables/catarots",
    "items/consumables/neotarots",
    "items/consumables/spectaclaws",
    "items/consumables/routes",

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
    
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end

SMODS.current_mod.optional_features = function()
    return {
        object_weights = true,
    }
end
