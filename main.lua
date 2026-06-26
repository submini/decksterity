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
    "items/jokers/legendaries",
    "items/jokers/hazardousjokers",

    "items/consumables/catarots",
    "items/consumables/neotarots",
    "items/consumables/spectaclaws",
    "items/consumables/routes",

    "items/rarities",
    "items/editions",
    "items/enhancements",
    "items/seals",
    "items/boosters",
    "items/stickers",
    "items/pokerhands",
    "items/stakes",
    "items/vouchers",
    
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end