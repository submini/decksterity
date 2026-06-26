local rank_order = {
    ['Ace'] = 14,
    ['King'] = 13,
    ['Queen'] = 12,
    ['Jack'] = 11,
    ['10'] = 10,
    ['9'] = 9,
    ['8'] = 8,
    ['7'] = 7,
    ['6'] = 6,
    ['5'] = 5,
    ['4'] = 4,
    ['3'] = 3,
    ['2'] = 2,
}

SMODS.PokerHand{
  key = 'two_three',
  mult = 4, chips = 45,
  l_mult = 2, l_chips = 20,
  visible = false,

  example = {
    { 'S_J', true }, { 'D_J', true }, { 'S_J', true }, { 'S_9', true }, { 'S_2', false },
  },

  evaluate = function(parts, hand)
    local rank_map, suit_map = {}, {}

    for _, c in ipairs(hand) do
      local rank = c.base.value
      local suit = c.base.suit

      rank_map[rank] = rank_map[rank] or {}
      suit_map[suit] = suit_map[suit] or {}

      table.insert(rank_map[rank], c)
      table.insert(suit_map[suit], c)
    end

    local rank_cards, suit_cards = {}, {}

    for _, cards in pairs(rank_map) do
      if #cards >= 3 then
        for _, v in ipairs(cards) do table.insert(rank_cards, v) end
      end
    end

    for _, cards in pairs(suit_map) do
      if #cards >= 3 then
        for _, v in ipairs(cards) do table.insert(suit_cards, v) end
      end
    end

    if #rank_cards == 0 or #suit_cards == 0 then return {} end

    -- merge_unique helper: flatten + dedupe
    local merged, seen = {}, {}
    for _, pile in ipairs({rank_cards, suit_cards}) do
      for _, v in ipairs(pile) do
        if not seen[v] then
          table.insert(merged, v)
          seen[v] = true
        end
      end
    end

    return { merged }
  end
}

-- helper: check if sum is triangular
local function is_triangular(n)
  local k = 1
  while (k * (k + 1) / 2) <= n do
    if (k * (k + 1) / 2) == n then return true end
    k = k + 1
  end
  return false
end

-- helper: convert card rank to numeric
local function card_value(c)
  local raw = c.base and c.base.value or nil
  local v

  if type(raw) == "number" then
    v = raw
  elseif type(raw) == "string" then
    if raw == "Ace" or raw == "A" then v = 14
    elseif raw == "Jack" or raw == "J" then v = 11
    elseif raw == "Queen" or raw == "Q" then v = 12
    elseif raw == "King" or raw == "K" then v = 13
    else
      v = tonumber(raw) or 0
    end
  else
    v = 0
  end

  -- apply Triangle’s rules
  if v == 14 then return 1 end            -- Ace = 1
  if v >= 11 and v <= 13 then return 10 end -- J/Q/K = 10
  return v
end

SMODS.PokerHand{
  key = 'triangle',
  mult = 3, chips = 20,
  l_mult = 1, l_chips = 10,
  visible = false,

  example = {
    { 'D_A', true }, { 'C_A', true }, { 'C_K', true }, { 'H_9', true }
  },

  evaluate = function(parts, hand)
    local sum = 0
    for _, c in ipairs(hand) do
      sum = sum + card_value(c)
    end
    if #hand >= 3 and is_triangular(sum) and sum > 10 then
      return { hand }
    else
      return {}
    end
  end
}

SMODS.PokerHandPart {
    key = 'umbra_base',
    func = function(hand)
        local faces, numbers, chosen = 0, 0, {}
        for i = 1, #hand do
            local card = hand[i]
            if card:is_face() then
                faces = faces + 1
                table.insert(chosen, card)
            else
                numbers = numbers + 1
                table.insert(chosen, card)
            end
        end

        -- must be exactly 4 faces + 1 number
        if faces == 4 and numbers == 1 then
            return { chosen }
        end
        return {}
    end
}

-- PokerHand: Umbra
SMODS.PokerHand {
    key = "umbra",
    chips = 35,
    mult = 4,
    l_chips = 15,
    l_mult = 2,
    visible = false,

    example = {
        { 'D_K', true },
        { 'C_K', true },
        { 'H_Q', true },
        { 'H_J', true },
        { 'S_6', true },
    },
    evaluate = function(parts, hand)
        return parts.dckst_umbra_base
    end
}

-- PokerHandPart: 4 numbers + 1 face
SMODS.PokerHandPart {
    key = 'antumbra_base',
    func = function(hand)
        local faces, numbers, chosen = 0, 0, {}
        for i = 1, #hand do
            local card = hand[i]
            if card:is_face() then
                faces = faces + 1
                table.insert(chosen, card)
            else
                numbers = numbers + 1
                table.insert(chosen, card)
            end
        end

        -- must be exactly 4 numbers + 1 face
        if numbers == 4 and faces == 1 then
            return { chosen }
        end
        return {}
    end
}

-- PokerHand: Antumbra
SMODS.PokerHand {
    key = "antumbra",
    visible = false,
    mult = 2,
    chips = 15,
    l_mult = 1,
    l_chips = 8,
    example = {
        { 'D_K', true },
        { 'C_9', true },
        { 'H_7', true },
        { 'H_5', true },
        { 'S_3', true },
    },
    evaluate = function(parts, hand)
        return parts.dckst_antumbra_base
    end
}

SMODS.PokerHandPart {
    key = "bipolar_flush_base",
    func = function(hand)
        if #hand ~= 5 then return {} end

        local red_cards   = {}
        local black_cards = {}

        for _, card in ipairs(hand) do
            local suit = card.base.suit
            if suit == "Hearts" or suit == "Diamonds" then
                red_cards[#red_cards + 1] = card
            else
                black_cards[#black_cards + 1] = card
            end
        end

        -- Must be exactly 3+2 or 2+3
        local majority, minority
        if #red_cards == 3 and #black_cards == 2 then
            majority, minority = red_cards, black_cards
        elseif #red_cards == 2 and #black_cards == 3 then
            majority, minority = black_cards, red_cards
        else
            return {}
        end

        -- Each color group must be internally same-suit (e.g. all Spades, all Hearts)
        local function same_suit(group)
            local s = group[1].base.suit
            for i = 2, #group do
                if group[i].base.suit ~= s then return false end
            end
            return true
        end

        if not same_suit(majority) or not same_suit(minority) then
            return {}
        end

        -- Return all 5 cards as one scoring group
        return { hand }
    end
}

SMODS.PokerHand {
    key = "bipolar_flush",
    chips = 30,
    mult = 3,
    l_chips = 20,
    l_mult = 2,
    visible = false,

    example = {
        { 'S_A', true  },  
        { 'S_K', true  },   
        { 'S_Q', true  },  
        { 'H_4', true  },   
        { 'H_2', true  }, 
    },

    evaluate = function(parts, hand)
        -- Delegate entirely to our registered PokerHandPart
        return parts.dckst_bipolar_flush_base
    end,
}


SMODS.PokerHand {
    key = "alterostraight",
    chips = 55,
    mult = 5,
    l_chips = 23,
    l_mult = 3,
    visible = false,

    example = {
        { 'H_9', true },
        { 'S_8', true },
        { 'D_7', true },
        { 'C_6', true },
        { 'H_5', true },
    },

    evaluate = function(parts, hand)
        -- No straight in this hand at all → bail
        if not parts._straight or #parts._straight == 0 then return {} end

        local straight_cards = parts._straight[1]

        local function color_of(card)
            local s = card.base.suit
            return (s == "Hearts" or s == "Diamonds") and "Red" or "Black"
        end

        -- Sort by nominal so we walk rank order, not play order
        local sorted = {}
        for _, card in ipairs(straight_cards) do
            sorted[#sorted + 1] = card
        end
        table.sort(sorted, function(a, b)
            return a.base.nominal < b.base.nominal
        end)

        -- Check strict color alternation
        local prev = color_of(sorted[1])
        for i = 2, #sorted do
            local cur = color_of(sorted[i])
            if cur == prev then return {} end
            prev = cur
        end

        return { straight_cards }
    end,
}