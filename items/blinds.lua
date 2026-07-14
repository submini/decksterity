SMODS.Blind {
    key = "secant",
    dollars = 8,
    mult = 1.7,
    boss_colour = HEX('eb8334'),
    atlas = 'blinds',
    debuff = {
        mult_penalty = 0.7
    },
    loc_vars = function (self)
        return {
            vars = {self.debuff.mult_penalty}
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {0.7}
        }
    end,
    in_pool = function (self)
        return G.GAME.round_resets.ante >= 2
    end,
    boss = {min = 3, max = 12},
    pos = { y = 0 },
    
    calculate = function (self, blind, context)
        if context.individual and context.cardarea == G.play then
            -- Check if card has an enhancement (not base)
            if context.other_card.config.center.key and 
               context.other_card.config.center.key ~= 'c_base' then
                
                return {
                    x_mult = blind.debuff.mult_penalty,
                    card = context.other_card
                }
            end
        end
    end
}

SMODS.Blind {
    key = "cosecant",
    dollars = 9,
    mult = 1.7,
    boss_colour = HEX('34ed81'),
    atlas = 'blinds',
    debuff = {
        mult_penalty = 0.7
    },
    loc_vars = function (self)
        return {
            vars = {self.debuff.mult_penalty}
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {0.7}
        }
    end,
    in_pool = function (self)
        return G.GAME.round_resets.ante >= 2
    end,
    boss = {min = 4, max = 10},
    pos = { y = 1 },
    
    calculate = function (self, blind, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.config.center.key and 
               context.other_card.config.center.key == 'c_base' then
                
                return {
                    x_mult = blind.debuff.mult_penalty,
                    card = context.other_card
                }
            end
        end
    end
}

SMODS.Blind {
    key = 'foreclosure',
    boss = { min = 4 },
    pos = { y = 2 },
    dollars = 8,
    mult = 1.2,
    atlas = 'blinds',
    debuff = {
        price = 3
    },
    loc_vars = function (self)
        return {
            vars = {self.debuff.price}
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {self.debuff.price}
        }
    end,
    boss_colour = HEX('E8B923'),
    recalc_debuff = function(self, card, from_blind)
        -- Ensures Jokers are undebuffed if the blind is defeated or disabled (e.g., by Chicot)
        if G.GAME.blind and G.GAME.blind.disabled then
            return false
        end

        if card.area == G.jokers and card.sell_cost and card.sell_cost > self.debuff.price then
            return true
        end
        
        return false
    end
}

SMODS.Blind {
    key = 'vandal',
    boss = { min = 4, max = 14 },
    pos = { y = 3 },
    dollars = 8,
    mult = 1.2,
    atlas = 'blinds',
    boss_colour = HEX('bd8c4d'),
    press_play = function(self)
        local leftmost = G.jokers.cards[1]
        if leftmost then
            SMODS.destroy_cards(leftmost)
        end
    end,
}

SMODS.Blind {
    key = 'magpie',
    boss = { min = 1 },
    pos = { y = 4 },
    dollars = 7,
    mult = 1.7,
    atlas = 'blinds',
    boss_colour = HEX('4A4A6A'),

    debuff_hand = function(self, cards, hand, handname, check)
    if self.disabled then return end
    self.triggered = false

    for _, card in ipairs(cards) do
        local rank_key = card.base and card.base.value
        local rank_obj = rank_key and SMODS.Ranks[rank_key]
        local nominal = rank_obj and rank_obj.nominal

        if nominal and nominal < 7 then
            self.triggered = true
            return true
        end
    end
end
}

SMODS.Blind {
    key = 'hypochondriac',
    boss = { min = 3, max = 16 },
    pos = { y = 5 },
    dollars = 8,
    mult = 1.5,
    atlas = 'blinds',
    boss_colour = HEX('44aa44'),
    recalc_debuff = function(self, card, from_blind)
        if card.seal then
            return true
        end
        return false
    end,
}

SMODS.Blind {
    key = 'harmony',
    boss = { min = 2 },
    pos = { y = 6 },
    dollars = 7,
    mult = 1.5,
    atlas = 'blinds',
    boss_colour = HEX('DDA0DD'), -- soft plum/lavender, "harmony" tone

    debuff_hand = function(self, cards, hand, handname, check)
        if self.disabled then return end
        self.triggered = false

        if #cards > 1 then
            local first = cards[1]
            local first_suit = first.base and first.base.suit
            local first_rank = first.base and first.base.value

            local all_same_suit = true
            local all_same_rank = true

            for i = 2, #cards do
                local card = cards[i]
                local suit = card.base and card.base.suit
                local rank = card.base and card.base.value

                if suit ~= first_suit then all_same_suit = false end
                if rank ~= first_rank then all_same_rank = false end
            end

            if not all_same_rank and not all_same_suit then
                self.triggered = true
                return true
            end
        end
    end
}

SMODS.Blind {
    key = 'inflationism',
    boss = { min = 4 },
    pos = { y = 7 },
    dollars = 8,
    mult = 1,
    atlas = 'blinds',
    config = { extra = { multiplier = 1.5 } },
    boss_colour = HEX('ba7238'),

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.multiplier } }
    end,
    collection_loc_vars = function(self)
        return { vars = { 1.5 } }
    end,
}

local dckst_inflationism_discard_ref = G.FUNCS.discard_cards_from_highlighted
G.FUNCS.discard_cards_from_highlighted = function(e, hook)
    dckst_inflationism_discard_ref(e, hook)

    if G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.key == 'bl_dckst_inflationism'
        and not G.GAME.blind.disabled then

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            func = function()
                local multiplier = G.P_BLINDS.bl_dckst_inflationism.config.extra.multiplier
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * multiplier)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                play_sound('tarot2', 1.1, 0.4)
                SMODS.juice_up_blind()
                return true
            end
        }))
    end
end

SMODS.Blind {
    key = 'miser',
    boss = { min = 3 },
    pos = { y = 8 },
    dollars = 6,
    mult = 2,
    boss_colour = HEX('C0392B'),
    atlas = 'blinds',
    debuff = { dckst_no_get_money = true },
    config = { extra = { dollarset = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.dollarset } }
    end,
    collection_loc_vars = function(self)
        return { vars = { 0 } }
    end,

    set_blind = function(self)
        G.GAME.dollars = self.config.extra.dollarset
    end,
}

SMODS.Blind {
    key = 'numismatist',
    dollars = 5,
    mult = 2,
    atlas = 'blinds',
    pos = { y = 9 },
    boss = { min = 1 },
    boss_colour = HEX('2E7D32'),
    debuff = {},

    debuff_hand = function(self, cards, hand, handname, check)
        if self.disabled then return end
        self.triggered = false

        local dollars = math.floor(to_number(G.GAME.dollars))
        if dollars % 2 == 0 then
            self.triggered = true
            return true
        end
    end
}

SMODS.Blind {
    key = 'pendulum',
    dollars = 7,
    mult = 1.5,
    atlas = 'blinds',
    pos = { y = 10 },
    boss = { min = 3, max = 32 },
    boss_colour = HEX('36989c'),

    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if self.disabled then return mult, hand_chips, false end

        if G.GAME.hands_played % 2 == 0 then
            return mult, math.max(math.floor(hand_chips * 0.5 + 0.5), 0), true
        else
            return math.max(math.floor(mult * 0.5 + 0.5), 1), hand_chips, true
        end
    end
}

SMODS.Blind {
    key = "derivative",
    dollars = 5,
    mult = 2,
    atlas = 'blinds',
    pos = { y = 11 },
    boss = { min = 1 },
    boss_colour = HEX("6aad51"),
    calculate = function(self, blind, context)
    if context.debuff_hand then
        local hands = context.poker_hands or {}

        local is_straight = next(hands["Straight"] or {})
            or next(hands["Straight Flush"] or {})
            or next(hands["Royal Flush"] or {})

        if is_straight then
            return {
                debuff = true,
                cards = context.full_hand or {}
            }
        end
    end
end,
}

SMODS.Blind {
    key = "integral",
    dollars = 7,
    mult = 1.75,
    atlas = 'blinds',
    pos = { y = 12 },
    boss = { min = 2, max = 32 },
    boss_colour = HEX("ad5151"),
    calculate = function(self, blind, context)
    if context.debuff_hand then
        local hands = context.poker_hands or {}

        local is_straight = next(hands["Straight"] or {})
            or next(hands["Straight Flush"] or {})
            or next(hands["Royal Flush"] or {})

        if not is_straight then
            return {
                debuff = true,
                cards = context.full_hand or {}
            }
        end
    end
end,
}

SMODS.Blind {
    key = "distance",
    dollars = 8,
    mult = 1,
    pos = { y = 13 },
    boss = { min = 4, max = 25 },
    boss_colour = HEX("675497"),
    atlas = 'blinds',
    config = {extra = {multiplier = 1.75}},
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.extra.multiplier}}
    end,
    collection_loc_vars = function(self)
        return {vars = {self.config.extra.multiplier}}
    end,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * self.config.extra.multiplier)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                play_sound('tarot2', 1.1, 0.4)
                SMODS.juice_up_blind()
                return true
            end
        }))
        return mult, hand_chips, false
    end
}

SMODS.Blind {
    key = "scalage",
    dollars = 7,
    mult = 2,
    pos = { y = 14 },
    boss = { min = 2 },
    config = { extra = { thres = 25 } },
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.extra.thres}}
    end,
    collection_loc_vars = function(self)
        return {vars = {self.config.extra.thres}}
    end,
    atlas = 'blinds',
    boss_colour = HEX('21a66c'),

    debuff_hand = function(self, cards, hand, handname, check)
        self.triggered = false
 
        local total = 0
        for _, card in ipairs(cards) do
            total = total + get_nominal_value(card)
        end
 
        if total < self.config.extra.thres then
            self.triggered = true
            return true
        end
    end,
}

SMODS.Blind{
    key = "containment",
    dollars = 6,
    mult = 1.8,
    atlas = 'blinds',
    pos = { y = 15 },
    boss = { min = 4, max = 36 },
    boss_colour = HEX('91cf1f'),

    recalc_debuff = function(self, card, from_blind)
        if self.disabled then return false end
        if card.area ~= G.hand then return false end

        local cards = G.hand.cards
        if not cards or #cards == 0 then return false end

        -- 2 leftmost and 2 rightmost
        for i = 1, math.min(2, #cards) do
            if card == cards[i] then return true end
        end
        for i = math.max(1, #cards - 1), #cards do
            if card == cards[i] then return true end
        end

        return false
    end,

    debuff_card = function(self, card, from_blind)
        card:set_debuff(self:recalc_debuff(card, from_blind))
    end,

    set_blind = function(self)
        G.GAME.blind.disable_hand_reorder = true
    end,

    disable = function(self)
        G.GAME.blind.disable_hand_reorder = nil
    end,

    defeat = function(self)
        G.GAME.blind.disable_hand_reorder = nil
    end,

    drawn_to_hand = function(self)
        recalc_containment_debuffs(self)
    end,
}

function recalc_containment_debuffs(blind)
    if not G.hand or not G.hand.cards then return end
    for _, card in ipairs(G.hand.cards) do
        blind:debuff_card(card, false)
    end
end

-- Block dragging/reordering of hand cards while this blind is active and undefeated
local containment_can_be_moved_ref = Card.can_be_moved_to_hand
if Card.can_be_moved_to_hand then
    function Card:can_be_moved_to_hand(...)
        if G.GAME and G.GAME.blind and G.GAME.blind.disable_hand_reorder and self.area == G.hand then
            return false
        end
        return containment_can_be_moved_ref(self, ...)
    end
end

-- The actual drag/hover state used for reordering within CardArea is `states.drag.can`
local containment_align_ref = CardArea.align_cards
function CardArea:align_cards(...)
    if self == G.hand and G.GAME and G.GAME.blind and G.GAME.blind.disable_hand_reorder then
        for _, card in ipairs(self.cards) do
            card.states.drag.can = false
        end
    elseif self == G.hand and G.GAME and G.GAME.blind and not G.GAME.blind.disable_hand_reorder then
        for _, card in ipairs(self.cards) do
            card.states.drag.can = true
        end
    end
    local ret = containment_align_ref(self, ...)
    if self == G.hand and G.STATE == G.STATES.SELECTING_HAND
       and G.GAME and G.GAME.blind and G.GAME.blind.config
       and G.GAME.blind.config.blind and G.GAME.blind.config.blind.key == self.key then
        recalc_containment_debuffs(G.GAME.blind)
    end
    return ret
end




function switchie_should_flip(card)
    if not G.GAME.blind or G.GAME.blind.disabled then return false end
    if not G.hand then return false end

    -- Position this card WILL occupy once appended to the hand
    local final_position = #G.hand.cards + 1
    return (final_position % 2 == 1)
end

function recalc_switchie_flips()
    if not G.hand or not G.hand.cards or G.STATE ~= G.STATES.SELECTING_HAND then return end

    for i, card in ipairs(G.hand.cards) do
        local should_be_flipped = (i % 2 == 1)

        if should_be_flipped and card.facing == 'front' then
            card:flip()
        elseif not should_be_flipped and card.facing == 'back' then
            card:flip()
        end

        card.states.drag.can = false
    end
end

function switchie_active()
    return G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind
        and string.find(G.GAME.blind.config.blind.key, 'bl_dckst_switchie') and not G.GAME.blind.disabled
end

SMODS.Blind{
    key = "switchie",
    dollars = 8,
    mult = 1.6,
    atlas = 'blinds',
    pos = { y = 16 },
    boss = { min = 6, max = 14 },
    boss_colour = HEX('9dbfe3'),

    -- Cards drawn from deck to hand now arrive already face-down when odd
    stay_flipped = function(self, area, card)
        if area ~= G.hand then return false end
        return switchie_should_flip(card)
    end,

    -- After the draw completes, re-lock drag on the (now correctly-faced) hand
    drawn_to_hand = function(self)
        recalc_switchie_flips()
    end,

    disable = function(self)
        if not G.hand or not G.hand.cards then return end
        for _, card in ipairs(G.hand.cards) do
            card.states.drag.can = true
        end
    end,

    defeat = function(self)
        if not G.hand or not G.hand.cards then return end
        for _, card in ipairs(G.hand.cards) do
            card.states.drag.can = true
        end
    end,
}

local switchie_sort_value_ref = G.FUNCS.sort_hand_value
G.FUNCS.sort_hand_value = function(e)
    if switchie_active() then play_sound('cancel', 1, 0.4); return end
    if switchie_sort_value_ref then switchie_sort_value_ref(e) end
end

local switchie_sort_suit_ref = G.FUNCS.sort_hand_suit
G.FUNCS.sort_hand_suit = function(e)
    if switchie_active() then play_sound('cancel', 1, 0.4); return end
    if switchie_sort_suit_ref then switchie_sort_suit_ref(e) end
end

local switchie_align_ref = CardArea.align_cards
function CardArea:align_cards(...)
    local ret = switchie_align_ref(self, ...)
    if self == G.hand and G.STATE == G.STATES.SELECTING_HAND and switchie_active() then
        recalc_switchie_flips()
    end
    return ret
end



SMODS.Blind {
    key = "antivowelist",
    dollars = 6,
    mult = 1.75,
    atlas = 'blinds',
    pos = { y = 17 },
    boss = { min = 3, max = 14 },
    boss_colour = HEX('7a4fc2'),
    config = { extra = { lettermin = 3, lettermax = 5 } },
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.extra.lettermin, self.config.extra.lettermax }}
    end,
    collection_loc_vars = function(self)
        return {vars = {self.config.extra.lettermin, self.config.extra.lettermax }}
    end,

    recalc_debuff = function(self, card, from_blind)
    if self.disabled then return false end
    if card.ability.set ~= 'Joker' then return false end

    local center_key = card.config.center_key or (card.config.center and card.config.center.key)
    if not center_key then return false end

    local display_name = localize{ type = 'name_text', key = center_key, set = 'Joker' }
    if not display_name or display_name == 'ERROR' then return false end

    display_name = string.upper(display_name)
    local vowel_count = 0
    for i = 1, #display_name do
        local c = string.sub(display_name, i, i)
        if c == 'A' or c == 'E' or c == 'I' or c == 'O' or c == 'U' then
            vowel_count = vowel_count + 1
        end
    end
        return vowel_count >= self.config.extra.lettermin and vowel_count <= self.config.extra.lettermax
    end,

    debuff_card = function(self, card, from_blind)
        card:set_debuff(self:recalc_debuff(card, from_blind))
    end,

    set_blind = function(self)
        recalc_antivowelist_debuffs(self)
    end,

    -- Re-check whenever a joker's name could plausibly change or a joker
    -- is bought/added, since debuff state needs to track current jokers
    disable = function(self)
        if not G.jokers or not G.jokers.cards then return end
        for _, card in ipairs(G.jokers.cards) do
            if card.debuff then card:set_debuff(false) end
        end
    end,
}

function recalc_antivowelist_debuffs(blind)
    if not G.jokers or not G.jokers.cards then return end
    for _, card in ipairs(G.jokers.cards) do
        blind:debuff_card(card, false)
    end
end

-- Re-check whenever a joker is added to the joker area (bought, spawned, etc.)
-- while this blind is active, since new jokers need immediate evaluation
local antivowelist_emplace_ref = CardArea.emplace
function CardArea:emplace(card, ...)
    local ret = antivowelist_emplace_ref(self, card, ...)
    if self == G.jokers and G.GAME and G.GAME.blind and G.GAME.blind.config
       and G.GAME.blind.config.blind and G.GAME.blind.config.blind.key
       and string.find(G.GAME.blind.config.blind.key, 'bl_dckst_antivowelist')
       and not G.GAME.blind.disabled then
        recalc_antivowelist_debuffs(G.GAME.blind)
    end
    return ret
end

SMODS.Blind {
    key = "moneycharger",
    dollars = 5,
    mult = 2,
    pos = { y = 18 },
    atlas = 'blinds',
    boss = { min = 1, max = 48 },
    boss_colour = HEX('ede06d'),
    config = { extra = { money = 2 } },
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.extra.money}}
    end,
    collection_loc_vars = function(self)
        return {vars = {self.config.extra.money}}
    end,

    press_play = function(self)
        ease_dollars(-(self.config.extra.money))
    end,
}

SMODS.Blind {
    key = "storage",
    atlas = 'blinds',
    dollars = 8,
    mult = 1.6,
    pos = { y = 19 },
    boss = { min = 5, max = 20 },
    config = { extra = { money = 10, max = 2 } },
    boss_colour = HEX('23b87f'),

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.money, self.config.extra.max } }
    end,

    collection_loc_vars = function(self)
        return { vars = { self.config.extra.money, self.config.extra.max } }
    end,

    -- Initializes the tracker when the boss blind is locked in
    set_blind = function(self, blind, reset, silent)
        if not reset then
            G.GAME.blind.storage_hand_reduction = 0
            SMODS.dckst_storage_recalc()
        end
    end,

    -- Reverts the penalty when the blind is defeated, skipped, or negated
    disable = function(self)
        if G.GAME.blind and G.GAME.blind.storage_hand_reduction and G.GAME.blind.storage_hand_reduction > 0 then
            G.hand:change_size(G.GAME.blind.storage_hand_reduction)
            G.GAME.blind.storage_hand_reduction = 0
        end
    end
}

-- Recalculates and applies the hand-size penalty based on current money.
-- Safe to call any time; no-ops if The Storage isn't the active blind.
function SMODS.dckst_storage_recalc()
    if not (G.GAME and G.GAME.blind and not G.GAME.blind.disabled
        and G.GAME.blind.config and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.key == 'bl_dckst_storage') then
        return
    end

    local extra = G.GAME.blind.config.blind.config.extra or { money = 10, max = 2 }
    local req_money = extra.money or 10
    local min_hand_size = extra.max or 2

    local current_reduction = G.GAME.blind.storage_hand_reduction or 0
    local true_base = G.hand.config.card_limit + current_reduction

    -- Unwrap G.GAME.dollars in case it's an Amulet bignum (bigante)
    local dollars_raw = G.GAME.dollars or 0
    local current_funds = (Big and Big.is and Big.is(dollars_raw)) and dollars_raw.number or dollars_raw
    current_funds = math.max(0, current_funds)

    local desired_reduction = math.floor(current_funds / req_money)

    local max_possible_reduction = true_base - min_hand_size
    local target_reduction = math.max(0, math.min(desired_reduction, max_possible_reduction))

    local difference = target_reduction - current_reduction
    if difference ~= 0 then
        G.hand:change_size(-difference)
        G.GAME.blind.storage_hand_reduction = target_reduction
    end
end

-- Recalculate live whenever money changes, so mid-round dollar swings
-- (jokers, tags, shop, consumables) immediately update hand size.
local dckst_ease_dollars_ref = ease_dollars
function ease_dollars(mod, instant)
    dckst_ease_dollars_ref(mod, instant)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            SMODS.dckst_storage_recalc()
            return true
        end
    }))
end

SMODS.Blind {
    key = 'leftovers',
    atlas = 'blinds',
    pos = { y = 20 },
    dollars = 0,
    mult = 2,
    boss = { min = 3, max = 24 },
    boss_colour = HEX('6bcdc3'),

    set_blind = function(self, reset, silent)
        G.GAME.blind.dckst_leftovers_unplayed = nil
    end,
    calculate = function(self, blind, context)
        if context.end_of_round and not context.game_over and not G.GAME.blind.dckst_leftovers_unplayed then
            local hand_count = G.hand and #G.hand.cards or 0
            local deck_count = G.deck and #G.deck.cards or 0
            G.GAME.blind.dckst_leftovers_unplayed = hand_count + deck_count
        end
    end,
    calc_dollar_bonus = function(self, blind)
        local unplayed = G.GAME.blind.dckst_leftovers_unplayed or 0
        local loss = math.floor(unplayed * 0.5)
        return loss > 0 and -loss or nil
    end,
}

SMODS.Blind{
    key = 'randomization',
    atlas = 'blinds',
    pos = { y = 21 },
    dollars = 6,
    mult = 2,
    boss = { min = 1, max = 48 },
    boss_colour = HEX('b2402d'),

    -- Corrected hook signature: (self, reset, reset_count)
    set_blind = function(self, reset, reset_count)
        if not reset then
            local valid_ranks = {}
            local rank_tracker = {}
            
            if G.playing_cards then
                for _, card in ipairs(G.playing_cards) do
                    local rank_val = card.base.value
                    if not rank_tracker[rank_val] then
                        rank_tracker[rank_val] = true
                        table.insert(valid_ranks, rank_val)
                    end
                end
            end
            
            if #valid_ranks == 0 then table.insert(valid_ranks, 'Ace') end
            
            local init_rank = pseudorandom_element(valid_ranks, pseudoseed("kino_randomization_init"))
            
            -- Apply the value directly to the global active blind object
            if G.GAME and G.GAME.blind then
                G.GAME.blind.debuff = G.GAME.blind.debuff or {}
                G.GAME.blind.debuff.value = init_rank
            end
            
            if G.playing_cards then
                for _, _pcard in ipairs(G.playing_cards) do
                    SMODS.recalc_debuff(_pcard)
                end
            end
        end
    end,
    
    recalc_debuff = function(self, card, from_blind)
        if G.GAME and G.GAME.blind and G.GAME.blind.debuff and G.GAME.blind.debuff.value then
            if card.base.value == G.GAME.blind.debuff.value then
                return true
            end
        end
    end,

    -- 'calculate' DOES pass the blind object natively, so this remains safe
    calculate = function(self, blind, context)
        if context.after then
            local valid_ranks = {}
            local rank_tracker = {}

            for _, card in ipairs(G.playing_cards) do
                local rank_val = card.base.value
                
                if not rank_tracker[rank_val] then
                    rank_tracker[rank_val] = true
                    table.insert(valid_ranks, rank_val)
                end
            end

            if #valid_ranks == 0 then
                table.insert(valid_ranks, 'Ace')
            end
            
            local _rank = pseudorandom_element(valid_ranks, pseudoseed("kino_randomization_source"))
            
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                blind.debuff = blind.debuff or {}
                blind.debuff.value = _rank
                blind:wiggle()
                
                for _, _pcard in ipairs(G.playing_cards) do
                    SMODS.recalc_debuff(_pcard)
                end
            return true end }))
        end
    end
}

SMODS.Blind{
    key = 'tether',
    atlas = 'blinds',
    pos = { y = 22 },
    dollars = 5,
    mult = 2,
    boss = { min = 2, max = 48 },
    boss_colour = HEX('40557a'),
    debuff_hand = function(self, cards, hand, handname, check)
        local max_value = -1
        
        -- Step 1: Scan the remaining cards in the player's hand
        if G.hand and G.hand.cards then
            for _, c in ipairs(G.hand.cards) do
                local id = c:get_id()
                if id and id > max_value then
                    max_value = id
                end
            end
        end
        
        -- Step 2: Scan the cards currently being evaluated/played.
        -- We must check both, because depending on when the engine calls this hook, 
        -- the played cards may have already been moved out of G.hand.cards!
        if cards then
            for _, c in ipairs(cards) do
                local id = c:get_id()
                if id and id > max_value then
                    max_value = id
                end
            end
        end
        
        -- Edge case fail-safe
        if max_value == -1 then return false end
        
        -- Step 3: Verify if the cards the player is trying to play actually contain that highest rank
        local has_highest = false
        if cards then
            for _, c in ipairs(cards) do
                local id = c:get_id()
                if id and id == max_value then
                    has_highest = true
                    break
                end
            end
        end
        
        -- Returning TRUE means the hand is DEBUFFED/DISALLOWED. 
        -- So we return true if they do NOT have the highest card.
        return not has_highest
    end,
}

SMODS.Blind {
    key = 'tariffication',
    atlas = 'blinds',
    pos = { y = 23 },
    dollars = 5,
    mult = 2,
    boss = { min = 3, max = 24 },
    boss_colour = HEX('0bc052'),
    config = { extra = { dollars = 1 } },
    loc_vars = function(self)
        return { vars = { self.config.extra.dollars } }
    end,
    collection_loc_vars = function(self)
        return { vars = { self.config.extra.dollars } }
    end,
}

local dckst_calc_seal_ref = Card.calculate_seal
function Card:calculate_seal(context, ...)
    if context.discard and SMODS.is_active_blind('bl_dckst_tariffication') then
        ease_dollars(-G.GAME.blind.config.blind.config.extra.dollars)
    end
    return dckst_calc_seal_ref(self, context, ...)
end

SMODS.Blind {
    key = 'counterfeit',
    atlas = 'blinds',
    pos = { y = 24 },
    dollars = 7,
    mult = 1.75,
    boss = { min = 6, max = 18 },
    boss_colour = HEX('b6137e'),
    recalc_debuff = function(self, card, from_blind)
        if card.edition then
            return true
        end
    end,
}

local dckst_set_edition_ref = Card.set_edition
function Card:set_edition(edition, immediate, silent, delay)
    dckst_set_edition_ref(self, edition, immediate, silent, delay)
    if SMODS.is_active_blind('bl_dckst_counterfeit') then
        SMODS.recalc_debuff(self)
    end
end

SMODS.Blind {
    key = 'adblock',
    atlas = 'blinds',
    pos = { y = 25 },
    dollars = 5,
    mult = 2,
    boss = { min = 1, max = 48 },
    boss_colour = HEX('352726'),
    stay_flipped = function(self, area, card)
        if card.ability.set == 'Enhanced' or card.seal or card.edition then
            return true
        end
    end,
    calculate = function(self, blind, context)
        if context.setting_ability and context.other_card then
            SMODS.dckst_adblock_recalc(context.other_card)
        end
    end,
}

function SMODS.dckst_adblock_recalc(card)
    if not SMODS.is_active_blind('bl_dckst_adblock') then return end
    if not card.area or card.area ~= G.hand then return end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        delay = 0,
        func = function()
            local should_flip = card.ability.set == 'Enhanced' or card.seal or card.edition
            if should_flip and card.facing == 'front' then
                card:flip()
            elseif not should_flip and card.facing == 'back' then
                card:flip()
            end
            return true
        end
    }))
end

local dckst_adblock_set_edition_ref = Card.set_edition
function Card:set_edition(edition, immediate, silent, delay)
    dckst_adblock_set_edition_ref(self, edition, immediate, silent, delay)
    SMODS.dckst_adblock_recalc(self)
end

local dckst_adblock_set_seal_ref = Card.set_seal
function Card:set_seal(_seal, silent, immediate)
    dckst_adblock_set_seal_ref(self, _seal, silent, immediate)
    SMODS.dckst_adblock_recalc(self)
end

local function dckst_is_prime(n)
    if n < 2 then return false end
    if n == 2 then return true end
    if n % 2 == 0 then return false end
    for i = 3, math.floor(math.sqrt(n)), 2 do
        if n % i == 0 then return false end
    end
    return true
end

SMODS.Blind {
    key = 'primetime',
    atlas = 'blinds',
    pos = { y = 26 },
    dollars = 5,
    mult = 2,
    boss = { min = 1, max = 48 },
    boss_colour = HEX('7d64d8'),
    debuff_hand = function(self, cards, hand, handname, check)
        for _, card in ipairs(cards) do
            if not SMODS.has_no_rank(card) then
                local nominal = card.base.nominal
                if dckst_is_prime(nominal) then
                    return false
                end
            end
        end
        return true
    end,
}

SMODS.Blind {
    key = 'squarism',
    atlas = 'blinds',
    dollars = 5,
    mult = 2,
    pos = { y = 27 },
    boss = { min = 1, max = 32 },
    boss_colour = HEX('81b0b7'),

    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if self.disabled then return mult, hand_chips, false end

        local root = math.floor(math.sqrt(hand_chips) + 0.5)
        local squared = root * root

        if squared ~= hand_chips then
            return mult, squared, true
        end

        return mult, hand_chips, false
    end
}

SMODS.Blind {
    key = 'octanium',
    atlas = 'blinds',
    dollars = 8,
    mult = 1.75,
    pos = { y = 28 },
    boss = { min = 6, max = 24 },
    boss_colour = HEX('7c4a8c'),

   get_desc_numbers = function(self, card)
        local nums = {}
        local a = card.ability

        local meaningful_keys = {
            'mult', 'h_mult', 'x_mult', 'h_x_mult',
            'chips', 'h_chips', 'x_chips', 'h_x_chips',
            't_mult', 't_chips',
            'dollars', 'p_dollars', 'h_dollars',
            'repetitions', 'bonus',
        }

        for _, k in ipairs(meaningful_keys) do
            if type(a[k]) == 'number' and a[k] ~= 0 then
                nums[#nums + 1] = a[k]
            end
        end

        if type(a.extra) == 'table' then
            for k, v in pairs(a.extra) do
                if type(v) == 'number' then
                    nums[#nums + 1] = v
                end
            end
        elseif type(a.extra) == 'number' then
            nums[#nums + 1] = a.extra
        end

        if card.base and card.base.value and SMODS.Ranks[card.base.value] then
            local rank_data = SMODS.Ranks[card.base.value]
            if type(rank_data.nominal) == 'number' then
                nums[#nums + 1] = rank_data.nominal
            end
        end

        return nums
    end,

    contains_8_or_9 = function(self, card)
        local nums = self:get_desc_numbers(card)
        for _, n in ipairs(nums) do
            local str = tostring(math.abs(math.floor(n)))
            if str:find('8') or str:find('9') then return true end
        end
        return false
    end,

    recalc_debuff = function(self, card, from_blind)
        if self.disabled then return false end
        if card.ability.set ~= 'Joker' and not card.base then return false end
        return self:contains_8_or_9(card)
    end,

    set_blind = function(self)
        for _, card in ipairs(G.jokers.cards) do
            SMODS.recalc_debuff(card)
        end
        for _, card in ipairs(G.hand.cards) do
            SMODS.recalc_debuff(card)
        end
    end,
}

local octanium_align_cards = CardArea.align_cards
function CardArea:align_cards(...)
    local ret = octanium_align_cards(self, ...)

    if G.GAME and G.GAME.blind and SMODS.is_active_blind('bl_dckst_octanium')
        and (G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.DRAW_TO_HAND)
        and (self == G.hand or self == G.jokers) then
        for _, card in ipairs(self.cards) do
            SMODS.recalc_debuff(card)
        end
    end

    return ret
end

SMODS.Blind {
    key = 'giggling',
    atlas = 'blinds',
    dollars = 5,
    mult = 2,
    pos = { y = 29 },
    boss = { min = 1, max = 36 },
    boss_colour = HEX('f9d74e'),
    config = { extra = { required_faces = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.required_faces } }
    end,
    collection_loc_vars = function(self)
        return { vars = { 2 } }
    end,
    debuff_hand = function(self, cards, hand, handname, check)
        if self.disabled then return false end
        self.triggered = false

        local face_count = 0
        for _, card in ipairs(cards or {}) do
            if card and card.is_face and card:is_face() then
                face_count = face_count + 1
                if face_count >= self.config.extra.required_faces then
                    return false
                end
            end
        end

        self.triggered = true
        return true
    end,
}
