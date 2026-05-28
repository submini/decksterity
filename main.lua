local files = {
    "items/jokers/miscjokers",
    "items/jokers/legendaries"
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end