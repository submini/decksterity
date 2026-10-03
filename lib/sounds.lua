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
            and (string.find(booster.config.center_key, "carcana_pack", 1, true)  or string.find(booster.config.center_key, "spectaclaw_pack", 1, true))
        then
            return 1e12
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

SMODS.Sound({
	key = "wooden",
	path = "e_wooden.ogg",
})

SMODS.Sound({
	key = "shop_music",
	path = "shop.ogg",
	volume = 0.3,
    pitch = 1,
	select_music_track = function()
        local config = SMODS.current_mod and SMODS.current_mod.config or SMODS.Mods['decksterity'].config
		return G.STATE == G.STATES.SHOP and config.nicos_shop_music
	end,
})

SMODS.Sound({
	key = "altmainmenu1_music",
	path = "manifold5.1_2.ogg",
	volume = 0.3,
    pitch = 1,
	select_music_track = function()
    local config = SMODS.Mods['decksterity'].config
    return G.STAGE == G.STAGES.MAIN_MENU and config.alt_main_menu_music == 1
end,
})

SMODS.Sound({
	key = "altmainmenu2_music",
	path = "geodesic6.2.ogg",
	volume = 0.3,
    pitch = 1,
	select_music_track = function()
    local config = SMODS.Mods['decksterity'].config
    return G.STAGE == G.STAGES.MAIN_MENU and config.alt_main_menu_music == 2
end,
})

SMODS.Sound({
	key = "wavgunfire",
	path = "wavgunfire.ogg",
})

SMODS.Sound({
	key = "wavgunbeat_music",
	path = "wavgunmusic.ogg",
    sync = {
        ['music1'] = true,
        ['music2'] = true,
        ['music3'] = true,
        ['music4'] = true,
        ['music5'] = true,
    },
	volume = 1,
	select_music_track = function()
        return #DCKST.advanced_find_joker("j_dckst_wavgun", nil, nil, nil, true) ~= 0 and 1e5
	end,
})

--screensaver
SMODS.Sound({
	key = "win95",
	path = "win95.ogg",
})
SMODS.Sound({
	key = "winxp",
	path = "winxp.ogg",
})
SMODS.Sound({
	key = "win8",
	path = "win8.ogg",
})