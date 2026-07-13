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