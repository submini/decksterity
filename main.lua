local files = {
    "lib/atlas",
    "lib/ui",

    "items/shaders",
    "items/jokers/miscjokers",
    "items/jokers/legendaries",
    "items/gradients",
    "items/rarities",
    "items/editions",
    "items/enhancements",
    
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end