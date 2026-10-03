DCKST = DCKST or {}

-- WE ARE NOT COPYING CRYPTID WE SWEAR
function DCKST.manipulate(card, args)
    if not card or not card.config or not card.config.center then return end
    args = args or { value = 1 }

    -- walk ability table
    DCKST.manipulate_table(card.ability, args)
    -- walk base table
    DCKST.manipulate_table(card.base, args)
end

function DCKST.manipulate_table(tbl, args)
    if type(tbl) ~= "table" then return end
    for k, v in pairs(tbl) do
        if type(v) == "number" then
            -- skip protected keys that should never be scaled
            if k ~= "e_dckst_cosmic_ante"
            and k ~= "cost"
            and k ~= "sell_cost"
            and k ~= "extra_cost" then
                tbl[k] = v * (args.value or 1)
            end
        elseif type(v) == "table" then
            DCKST.manipulate_table(v, args)
        end
    end
end

function DCKST.find_index(tbl, value)
    for i, v in ipairs(tbl) do
        if v == value then
            return i
        end
    end
end

function DCKST.swap_cards(area, a, b)
    if not area or not area.cards then
        return false
    end

    local cards = area.cards

    if not cards[a] or not cards[b] then
        return false
    end

    cards[a], cards[b] = cards[b], cards[a]

    area:align_cards()

    return true
end

function DCKST.zoom(card, seed)
    if not card
    or not card.area
    or not card.area.cards
    then
        return false
    end

    local cards = card.area.cards

    if #cards <= 1 then
        return false
    end

    local current = DCKST.find_index(cards, card)

    if not current then
        return false
    end

    local target = pseudorandom(
        seed or "dckst_zoom",
        1,
        #cards
    )

    -- reroll once or twice so it actually moves
    if target == current and #cards > 1 then
        target = pseudorandom(
            (seed or "dckst_zoom") .. "_reroll",
            1,
            #cards
        )
    end

    if target == current then
        return false
    end

    return DCKST.swap_cards(card.area, current, target)
end

function DCKST.has_sticker(card, sticker_key)
    return card
        and card.ability
        and card.ability[sticker_key]
end

function DCKST.get_sticker_data(card, sticker_key)
    if not DCKST.has_sticker(card, sticker_key) then
        return nil
    end

    return card.ability[sticker_key]
end

function DCKST.has_sticker(card, sticker_key)
    return card
        and card.ability
        and card.ability[sticker_key]
end

function DCKST.get_sticker_data(card, sticker_key)
    if not DCKST.has_sticker(card, sticker_key) then
        return nil
    end

    return card.ability[sticker_key]
end

function DCKST.get_counter(card, sticker_key, field, default)
    local data = DCKST.get_sticker_data(card, sticker_key)

    if not data then
        return default
    end

    return data[field] or default
end

function DCKST.decrement_sticker(card, sticker_key)
    local data = DCKST.get_sticker_data(card, sticker_key)

    if not data then
        return false, nil
    end

    data.triggers_left = math.max(
        0,
        (data.triggers_left or 0) - 1
    )

    return data.triggers_left <= 0,
           data.triggers_left
end

function DCKST.destroy_card(card)
    if not card then
        return
    end

    G.E_MANAGER:add_event(Event({
        func = function()

            if card.ability and card.ability.eternal then
                return true
            end

            card:start_dissolve()

            return true
        end
    }))

end

function DCKST.halve(card)
    if not card then return end

    card.ability.dckst_halved =
        card.ability.dckst_halved or {}

    if card.ability.dckst_halved.applied then
        return
    end

    DCKST.manipulate_table_halved(card.ability)
    DCKST.manipulate_table_halved(card.base)

    card.ability.dckst_halved.applied = true
end

function DCKST.manipulate_table_halved(tbl)
    if type(tbl) ~= "table" then
        return
    end

    for k, v in pairs(tbl) do

        if type(v) == "number" then

            if k ~= "e_dckst_cosmic_ante"
            and k ~= "cost"
            and k ~= "sell_cost"
            and k ~= "extra_cost"
            then
                tbl[k] = v * 0.5
            end

        elseif type(v) == "table" then

            DCKST.manipulate_table_halved(v)

        end
    end
end

function DCKST.has_duplicate_ranks(hand_table)
    local ranks = {}
    for _, card in ipairs(hand_table) do
        local rank = card.base.value
        if ranks[rank] then
            return true 
        end
        ranks[rank] = true
    end
    return false
end

-- IM BALING IT IM BALING IT SO GOOD

DCKST.gset = function(set)
    if set then
        return G.PROFILES[G.SETTINGS.profile].dckst_gameset == set
    end
    return G.PROFILES[G.SETTINGS.profile].dckst_gameset
end

DCKST.set_gset = function(set)
    G.PROFILES[G.SETTINGS.profile].dckst_gameset = set
end

DCKST.change_gset = function()
    local p = G.PROFILES[G.SETTINGS.profile]
    p.dckst_gameset = (p.dckst_gameset % 3) + 1
end

DCKST.gset_overridable = function(set, override)
    return override and DCKST.gset(override) or DCKST.gset(set)
end

DCKST.gset_val = function(humb,honed,haza)
    if DCKST.gset(1) then return humb end
    if DCKST.gset(2) then return honed end
    if DCKST.gset(3) then return haza end
end

DCKST.gset_val_overrridable = function(humb,honed,haza)
    if DCKST.gset(1) then return humb end
    if DCKST.gset(2) then return honed end
    if DCKST.gset(3) then return haza end
end

DCKST.gset_val_overridable = function(humb,honed,haza,override)
    if DCKST.gset_overridable(1,override) then return humb end
    if DCKST.gset_overridable(2,override) then return honed end
    if DCKST.gset_overridable(3,override) then return haza end
end

DCKST.gameset_pool = function(required)
    return function()
        return DCKST.gset() >= required
    end
end

-- thank you aikoyori
local easedol = ease_dollars
ease_dollars = function(amnt, insta)
    if G.GAME.blind and G.GAME.blind.debuff.dckst_no_get_money and not G.GAME.blind.disabled then
        return 
    end
    return easedol(amnt, insta)
end

-- for the scalage
function get_nominal_value(card)
    if card.base.nominal then
        return card.base.nominal
    end
 
    local fallback_map = {
        ["Ace"] = 11,
        ["King"] = 10,
        ["Queen"] = 10,
        ["Jack"] = 10,
        ["10"] = 10,
        ["9"] = 9,
        ["8"] = 8,
        ["7"] = 7,
        ["6"] = 6,
        ["5"] = 5,
        ["4"] = 4,
        ["3"] = 3,
        ["2"] = 2,
    }
 
    return fallback_map[card.base.value] or 0
end

DCKST.factorial = function(n)
    if n <= 1 then return 1 end
    local result = 1
    for i = 2, n do
        result = result * i
    end
    return result
end

DCKST.permutation = function(n, r)
    if r > n or r < 0 then return 0 end
    return DCKST.factorial(n) / DCKST.factorial(n - r)
end

local RANK_CHIP_VALUES = {
    ['2'] = 2, ['3'] = 3, ['4'] = 4, ['5'] = 5, ['6'] = 6,
    ['7'] = 7, ['8'] = 8, ['9'] = 9, ['10'] = 10,
    ['Jack'] = 10, ['Queen'] = 10, ['King'] = 10, ['Ace'] = 11,
}

DCKST.get_nominal_value = function(c)
    if c.base and c.base.value then
        return RANK_CHIP_VALUES[c.base.value] or 0
    end
    return 0
end

DCKST.rescoring = DCKST.rescoring or {}

DCKST.rescore_sweep = function(context, scoring_hand)
    if not (context and G and G.play) then return end
    if context.cardarea ~= G.play then return end
    if DCKST.rescore_active then return end -- no nested sweeps.
    if not (context.scoring_hand and next(context.scoring_hand)) then return end

    local function announce_once(state, source)
        if state.announced then return end
        state.announced = true
        card_eval_status_text(source, 'extra', nil, nil, nil, {
            message = localize('k_dckst_rescored'),
            -- sound needed here (added later)
        })
    end

    local function safe_score(card)
        if not (card and Object.is(card, Card)) then return end
        if card.removed or card.debuff then return end
        SMODS.score_card(card, context)
    end

    local function to_reps(...)
        for i = 1, select('#', ...) do
            local v = select(i, ...)
            local n = tonumber(to_number(v))
            if n and n >= 1 then return math.min(math.floor(n), 25) end -- sane cap.
        end
        return 1
    end

    DCKST.rescore_active = true
    local ok, err = pcall(function()
        -- 1. Edition-driven self rescore, scanned directly (no context dispatch needed).
        for _, c in ipairs(context.scoring_hand) do
            if Object.is(c, Card) and c.edition and c.edition.dckst_vhs and not c.debuff and c:can_calculate() then
                local state = {}
                for _ = 1, to_reps(c.edition.rescores) do
                    announce_once(state, c)
                    safe_score(c)
                end
            end
        end

        -- 2. Joker-driven rescores.
        local rescorecalc = {}
        SMODS.calculate_context({
            dckst_rescore = true,
            poker_hands = context.poker_hands,
            scoring_hand = context.scoring_hand,
            scoring_name = context.scoring_name
        }, rescorecalc)

        for _, eval in pairs(rescorecalc) do
            for _, eval2 in pairs(eval) do
                -- prevent unintended extra execution when retriggering.
                if type(eval2) == 'table' and eval2.card and not (eval2.retrigger_flag or eval2.retrigger_card) then
                    local extra = type(eval2.card.ability and eval2.card.ability.extra) == 'table' and eval2.card.ability.extra or {}
                    local state = {}

                    if eval2.dckst_rescore_self then
                        for _ = 1, to_reps(eval2.dckst_rescore_self, extra.rescores) do
                            announce_once(state, eval2.card)
                            safe_score(eval2.card)
                        end
                    elseif eval2.dckst_rescore_all then
                        for _ = 1, to_reps(eval2.dckst_rescore_all, extra.rescores) do
                            announce_once(state, eval2.card)
                            for _, scored_card in ipairs(context.scoring_hand) do
                                safe_score(scored_card)
                            end
                        end
                    elseif eval2.dckst_rescore_chance then
                        local odds = tonumber(to_number(eval2.dckst_rescore_chance)) or tonumber(to_number(extra.odds)) or 2
                        if odds < 1 then odds = 1 end
                        for _, scored_card in ipairs(context.scoring_hand) do
                            if SMODS.pseudorandom_probability(eval2.card, 'dckst_rescore', 1, odds, 'dckst_rescore') then
                                announce_once(state, scored_card)
                                safe_score(scored_card)
                            end
                        end
                    elseif eval2.dckst_rescore_cards then
                        -- NEW: rescore a specific, named list of cards (Mesosphere).
                        local reps = to_reps(eval2.dckst_rescore_reps, extra.rescores)
                        for _, target in ipairs(eval2.dckst_rescore_cards) do
                            for _ = 1, reps do
                                announce_once(state, target)
                                safe_score(target)
                            end
                        end
                    end
                end
            end
        end
    end)
    DCKST.rescore_active = nil -- always cleared, even on error.

    if not ok then sendErrorMessage("rescore_sweep failed: "..tostring(err), "DCKST") end
end

local calcmainscoreref = SMODS.calculate_main_scoring
function SMODS.calculate_main_scoring(context, scoring_hand)
    calcmainscoreref(context, scoring_hand)
    DCKST.rescore_sweep(context, scoring_hand)
end

-- astronomica's score system (thanks astronomica!)

for _, v in ipairs({
	'eq_score',
	'score',
	'x_score',
	'e_score',
	'ee_score',
	'eee_score',
	'hyper_score',
}) do
	table.insert(SMODS.scoring_parameter_keys, v)
end

local scorescie = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
	local ret = scorescie(effect, scored_card, key, amount, from_edition)
	if ret then
		return ret
	end

	--

	if (key == 'eq_score') then
		if not Amulet.config_file.disable_anims then
			DCKST.status_text_scoremod(scored_card or effect.card or effect.focus, amount, 'eq')
		end
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.chips = to_big(amount)
				G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)

				return true
			end
		}))
		return true
	end

	if (key == 'score') then
		if not Amulet.config_file.disable_anims then
			DCKST.status_text_scoremod(scored_card or effect.card or effect.focus, amount, 'add')
		end
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.chips = to_big(G.GAME.chips):add(amount)
				G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)

				return true
			end
		}))
		return true
	end

	if (key == 'x_score') then
		if not Amulet.config_file.disable_anims then
			DCKST.status_text_scoremod(scored_card or effect.card or effect.focus, amount, 'x')
		end
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.chips = to_big(G.GAME.chips):mul(amount)
				G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)

				return true
			end
		}))
		return true
	end

	if (key == 'e_score') then
		if not Amulet.config_file.disable_anims then
			DCKST.status_text_scoremod(scored_card or effect.card or effect.focus, amount, 'e')
		end
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.chips = to_big(G.GAME.chips):pow(amount)
				G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)

				return true
			end
		}))
		return true
	end

	if (key == 'ee_score') then
		if not Amulet.config_file.disable_anims then
			DCKST.status_text_scoremod(scored_card or effect.card or effect.focus, amount, 'ee')
		end
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.chips = to_big(G.GAME.chips):tetrate(amount)
				G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)

				return true
			end
		}))
		return true
	end

	if (key == 'eee_score') then
		if not Amulet.config_file.disable_anims then
			DCKST.status_text_scoremod(scored_card or effect.card or effect.focus, amount, 'eee')
		end
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.chips = to_big(G.GAME.chips):arrow(3, amount)
				G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)

				return true
			end
		}))
		return true
	end

	if (key == 'hyper_score') then
		if not Amulet.config_file.disable_anims then
			DCKST.status_text_scoremod(scored_card or effect.card or effect.focus, amount[2], amount[1])
		end
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.chips = to_big(G.GAME.chips):arrow(amount[1], amount[2])
				G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)

				return true
			end
		}))
		return true
	end
end

function DCKST.status_text_scoremod(card, amount, stype, sound) --this function is mostly just shorthand -lily
	local operator = nil

	if not string.find(stype, "score$") and not (type(stype) == "number") then
		stype = stype .. "score"
		-- allows for some leniency, so you can type "add" instead of "addscore"
	end

	operator = ({
		["eqscore"] = "=",
		["addscore"] = "+",
		["xscore"] = "x",
		["escore"] = "^",
		["eescore"] = "^^",
		["eeescore"] = "^^^"
	})[stype]

	if type(stype) == "number" then
		operator = "{" .. stype .. "}"
		sound = "eescore"
	end

	if stype == "eeescore" then
		sound = "eescore"
	end





	card_eval_status_text(card, "extra", nil, nil, nil,
		{ message = operator .. number_format(amount), colour = G.C.PURPLE, sound = "dckst_" .. (sound or stype) })
end

SMODS.Sound({ key = 'eqscore', path = 'EqualsScore.ogg' })
SMODS.Sound({ key = 'addscore', path = 'AdditiveScore.ogg' })
SMODS.Sound({ key = 'xscore', path = 'MultiplicativeScore.ogg' })
SMODS.Sound({ key = 'escore', path = 'ExponentialScore.ogg' })
SMODS.Sound({ key = 'eescore', path = 'TetrationalScore.ogg' })

-- thanks Cryptid!
function DCKST.advanced_find_joker(name, rarity, edition, ability, non_debuff, area)
	local jokers = {}
	if not G.jokers or not G.jokers.cards then
		return {}
	end
	local filter = 0
	if name then
		filter = filter + 1
	end
	if edition then
		filter = filter + 1
	end
	if type(rarity) ~= "table" then
		if type(rarity) == "string" then
			rarity = { rarity }
		else
			rarity = nil
		end
	end
	if rarity then
		filter = filter + 1
	end
	if type(ability) ~= "table" then
		if type(ability) == "string" then
			ability = { ability }
		else
			ability = nil
		end
	end
	if ability then
		filter = filter + 1
	end
	-- return nothing if function is called with no useful arguments
	if filter == 0 then
		return {}
	end
	if not area or area == "j" then
		for k, v in pairs(G.jokers.cards) do
			if v and type(v) == "table" and (non_debuff or not v.debuff) then
				local check = 0
				if name and v.ability.name == name then
					check = check + 1
				end
				if
					edition
					and (v.edition and v.edition.key == edition) --[[ make this use Cryptid.safe_get later? if it's possible anyways]]
				then
					check = check + 1
				end
				if rarity then
					--Passes as valid if rarity matches ANY of the values in the rarity table
					for _, a in ipairs(rarity) do
						if v.config.center.rarity == a then
							check = check + 1
							break
						end
					end
				end
				if ability then
					--Only passes if the joker has everything in the ability table
					local abilitycheck = true
					for _, b in ipairs(ability) do
						if not v.ability[b] then
							abilitycheck = false
							break
						end
					end
					if abilitycheck then
						check = check + 1
					end
				end
				if check == filter then
					table.insert(jokers, v)
				end
			end
		end
	end
	if not area or area == "c" then
		for k, v in pairs(G.consumeables.cards) do
			if v and type(v) == "table" and (non_debuff or not v.debuff) then
				local check = 0
				if name and v.ability.name == name then
					check = check + 1
				end
				if
					edition
					and (v.edition and v.edition.key == edition) --[[ make this use Cryptid.safe_get later? if it's possible anyways]]
				then
					check = check + 1
				end
				if ability then
					--Only passes if the joker has everything in the ability table
					local abilitycheck = true
					for _, b in ipairs(ability) do
						if not v.ability[b] then
							abilitycheck = false
							break
						end
					end
					if abilitycheck then
						check = check + 1
					end
				end
				--Consumables don't have a rarity, so this should ignore it in that case (untested lmfao)
				if check == filter then
					table.insert(jokers, v)
				end
			end
		end
	end
	return jokers
end