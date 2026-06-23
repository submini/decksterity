SMODS.Sound({
    key = "catarot_booster_pack_music",
    path = "catarotpack.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
    select_music_track = function(self)
        local booster = G.pack_cards
            and G.pack_cards.cards
            and SMODS.OPENED_BOOSTER

        if booster
            and booster.config
            and booster.config.center_key
            and string.find(booster.config.center_key, "carcana_pack", 1, true) 
        then
            return 1e11
        end
    end
})

-- editions
SMODS.Sound({
	key = "aetherescent",
	path = "e_aetherescent.ogg",
})

SMODS.Sound({
	key = "phosphorescent",
	path = "e_phosphorescent.ogg",
})

SMODS.Sound({
	key = "grainy",
	path = "e_grainy.ogg",
})

SMODS.Sound({
	key = "iridescent",
	path = "e_iridescent.ogg",
})

SMODS.Sound({
	key = "prismatic",
	path = "e_prismatic.ogg",
})