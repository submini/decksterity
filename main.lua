local files = {
    "lib/atlas",
    "lib/gradients",
    "lib/shaders",
    "lib/ui",
    "lib/functions",
    "lib/sounds",

    "items/jokers/miscjokers",
    "items/jokers/legendaries",

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
    
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end