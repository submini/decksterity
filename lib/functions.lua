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

DCKST = DCKST or {}

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

function DCKST.sparkly_trigger(self, card)
    -- card.ability[self.key] is the table Steamodded stores this
    -- sticker's `config` in once it's applied to a card. Guard
    -- against it being missing (e.g. sticker toggled some other way).
    local data = card.ability[self.key]
    if type(data) ~= 'table' then
        data = { mult = 0 }
        card.ability[self.key] = data
    end

    data.mult = (data.mult or 0) + 1

    return {
        mult = data.mult,
        colour = G.C.MULT,
        message = localize('k_upgrade_ex'),
        card = card,
    }
end

function DCKST.get_sparkly_bonus(self, card)
    local data = card and card.ability and card.ability[self.key]
    return (data and data.mult) or 0
end