local dckst_vanilla_showdown_keys = {
    'bl_final_acorn',
    'bl_final_leaf',
    'bl_final_vessel',
    'bl_final_heart',
    'bl_final_bell',
}

for _, key in ipairs(dckst_vanilla_showdown_keys) do
    local blind = G.P_BLINDS[key]
    if blind then
        local ref_in_pool = blind.in_pool
        blind.in_pool = function(self, args)
            -- Preserve original in_pool behavior below Ante 24
            if G.GAME.round_resets.ante < 24 then
                if ref_in_pool then
                    return ref_in_pool(self, args)
                end
                return true
            end
            -- Ante 24+ showdown antes: exclude this vanilla blind entirely
            return false
        end
    end
end

----------------------------------------------------------------------------------------------------

SMODS.Blind {
    key = "secant",
    dollars = 8,
    mult = 1.7,
    boss_colour = HEX('eb8334'),
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
    pos = { y = 21 },
    dollars = 6,
    mult = 2,
    boss = { min = 1, max = 48 },
    boss_colour = HEX('b2402d'),
    debuff = {
        value = '2'
    },
    loc_vars = function(self)
        return {
            vars = { self.debuff.value }
        }
    end,
    collection_loc_vars = function(self)
        return {
            vars = { self.debuff.value }
        }
    end,

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

            self.debuff.value = init_rank

            if G.playing_cards then
                for _, _pcard in ipairs(G.playing_cards) do
                    SMODS.recalc_debuff(_pcard)
                end
            end
        end
    end,

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

            if #valid_ranks == 0 then table.insert(valid_ranks, 'Ace') end

            local _rank = pseudorandom_element(valid_ranks, pseudoseed("kino_randomization_source"))

            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                blind.debuff.value = _rank
                blind:wiggle()

                for _, _pcard in ipairs(G.playing_cards) do
                    SMODS.recalc_debuff(_pcard)
                end
                return true
            end }))
        end
    end
}

SMODS.Blind{
    key = 'tether',
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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
    atlas = 'blinds_ani',
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

    if G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind
        and SMODS.is_active_blind('bl_dckst_octanium')
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
    atlas = 'blinds_ani',
    dollars = 5,
    mult = 2,
    pos = { y = 29 },
    boss = { min = 1 },
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

-- SHOWDOWN

SMODS.Blind {
    key = 'chartreuse_coin',
    atlas = 'hardblinds',
    dollars = 8,
    mult = 2,
    pos = { y = 0 },
    boss = { min = 8, showdown = true },
    boss_colour = HEX('7FFF00'),

    set_blind = function(self)
        -- Reset the fractional carry each time this blind is selected,
        -- so a previous encounter's leftover fraction doesn't persist in.
        G.GAME.chartreuse_coin_carry = 0
    end,
 
    calculate = function(self, blind, context)
        -- context.individual is a boolean flag here, NOT a table with .card
        -- the scoring card itself is context.other_card
        if context.individual and context.cardarea == G.play then
            if context.other_card and not context.other_card.debuff then
                -- Unwrap G.GAME.dollars in case it's an Amulet bignum (bigante)
                local dollars_raw = G.GAME.dollars or 0
                local current_funds = (Big and Big.is and Big.is(dollars_raw)) and dollars_raw.number or dollars_raw
                current_funds = math.max(0, current_funds)
 
                -- Track the fractional dollar loss across scoring cards so the
                -- X0.97 multiplier is applied accurately over a whole hand,
                -- instead of truncating to $1 lost per card every time.
                G.GAME.chartreuse_coin_carry = G.GAME.chartreuse_coin_carry or 0
                local exact_loss = current_funds * 0.03 + G.GAME.chartreuse_coin_carry
                local lost = math.floor(exact_loss)
                G.GAME.chartreuse_coin_carry = exact_loss - lost
 
                if lost > 0 then
                    ease_dollars(-lost) -- animates the money counter down and applies the change
                    card_eval_status_text(context.other_card, 'dollars', -lost)
                end
            end
        end
    end,
}

SMODS.Blind {
    key = "silver_shield",
    dollars = 8,
    mult = 1,
    pos = { y = 1 },
    boss = { min = 8, max = 16, showdown = true },
    boss_colour = HEX('C0C0C0'),
    atlas = 'hardblinds',
    config = { extra = { multiplier = 1.11 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.multiplier } }
    end,
    collection_loc_vars = function(self)
        return { vars = { self.config.extra.multiplier } }
    end,

    -- Fires once per scoring card, same context pattern as Chartreuse Coin
    calculate = function(self, blind, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card and not context.other_card.debuff then
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
            end
        end
    end,
}

SMODS.Blind {
    key = "sapphire_sword",
    dollars = 8,
    mult = 2,
    pos = { y = 2 },
    boss = { min = 8, max = 16, showdown = true },
    boss_colour = HEX('1F6FC7'), -- sapphire blue
    atlas = 'hardblinds',

    -- Surfaces the CURRENT ante as the description variable so the tooltip
    -- always reflects the live value (e.g. "Base Chips and Mult are set to #1#")
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.round_resets.ante or 1 } }
    end,
    -- Collection screen has no active run/ante, so show a representative placeholder
    collection_loc_vars = function(self)
        return { vars = { '[Ante]' } }
    end,

    -- Overrides the base Chips and Mult of the played hand to the current Ante,
    -- regardless of what the hand would normally score.
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if self.disabled then return mult, hand_chips, false end

        local ante = G.GAME.round_resets.ante or 1
        return ante, ante, true
    end
}

SMODS.Blind { -- THANK YOU LOVELY! vermillion.toml
    key = "vermillion_rose",
    dollars = 8,
    mult = 2,
    pos = { y = 3 },
    boss = { min = 8, max = 16, showdown = true },
    boss_colour = HEX('D9381E'),
    atlas = 'hardblinds',

    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        return mult, hand_chips, false
    end
}

local dckst_evaluate_play_ref = G.FUNCS.evaluate_play
G.FUNCS.evaluate_play = function(e)
    dckst_evaluate_play_ref(e)
end

SMODS.Blind {
    key = "dandelion_arrow",
    dollars = 8,
    mult = 2,
    pos = { y = 4 },
    boss = { min = 8, max = 16, showdown = true },
    boss_colour = HEX('fddb6d'),
    atlas = 'hardblinds',
    config = { extra = { jokers = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.jokers } }
    end,
    collection_loc_vars = function(self)
        return { vars = { 2 } }
    end,

    set_blind = function(self, reset, silent)
        if not reset then
            local jokers = G.jokers and G.jokers.cards
            if jokers then
                for i = 1, math.min(self.config.extra.jokers, #jokers) do
                    local card = jokers[i]
                    card.ability.dckst_dandelion_permadebuff = true
                    SMODS.debuff_card(card, true, 'dckst_dandelion_arrow')
                end
            end
        end
    end,

    recalc_debuff = function(self, card, from_blind)
        if card and card.ability and card.ability.dckst_dandelion_permadebuff then
            return true
        end
    end,
}

SMODS.Blind {
    key = "periwinkle_feline",
    dollars = 11,
    mult = 1,
    pos = { y = 5 },
    boss = { min = 8, max = 24, showdown = true },
    boss_colour = HEX('c9a0dc'),
    atlas = 'hardblinds',
    config = { extra = { x_mult = 1.11 } },

    loc_vars = function(self, info_queue, card)
        local count = (G.GAME and G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.dckst_catarot) or 0
        return { vars = { self.config.extra.x_mult } }
    end,

    collection_loc_vars = function(self)
        return { vars = { self.config.extra.x_mult } }
    end,

    set_blind = function(self, reset, silent)
        if not reset then
            -- Store the true unscaled base chips once, so we can recompute
            -- cleanly from scratch any time the Catarot count changes.
            G.GAME.blind.dckst_periwinkle_base_chips = G.GAME.blind.chips
            G.GAME.blind.dckst_periwinkle_applied_scale = 1

            SMODS.dckst_periwinkle_recalc()
        end
    end,
}

function SMODS.dckst_periwinkle_recalc()
    if not (G.GAME and G.GAME.blind and not G.GAME.blind.disabled
        and G.GAME.blind.config and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.key == 'bl_dckst_periwinkle_feline') then
        return
    end

    local base_chips = G.GAME.blind.dckst_periwinkle_base_chips
    if not base_chips then return end

    local extra = G.GAME.blind.config.blind.config.extra
    local count = (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.dckst_catarot) or 0
    local target_scale = extra.x_mult ^ count

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        func = function()
            G.GAME.blind.chips = math.floor(base_chips * target_scale)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            play_sound('tarot2', 1.1, 0.4)
            SMODS.juice_up_blind()
            G.GAME.blind.dckst_periwinkle_applied_scale = target_scale
            return true
        end
    }))
end

SMODS.Blind {
    key = "pyrite_ball",
    dollars = 8,
    mult = 2,
    pos = { y = 6 },
    boss = { min = 8, max = 16, showdown = true },
    boss_colour = HEX('b8860b'),
    atlas = 'hardblinds',
    config = { extra = { required = 2 } },

    loc_vars = function(self, info_queue, card)
        local used = G.GAME.dckst_pyrite_used or 0
        return { vars = { self.config.extra.required, used } }
    end,
    collection_loc_vars = function(self)
        return { vars = { self.config.extra.required, 0 } }
    end,

    set_blind = function(self, reset, silent)
        if not reset then
            G.GAME.dckst_pyrite_used = 0
        end
    end,

    -- Debuffs all playing cards, same as Verdant Leaf
    calculate = function(self, blind, context)
        if blind.disabled then return end

        if context.debuff_card and context.debuff_card.area ~= G.jokers then
            return {
                debuff = true
            }
        end

        if context.using_consumeable then
            G.GAME.dckst_pyrite_used = (G.GAME.dckst_pyrite_used or 0) + 1

            if G.GAME.dckst_pyrite_used >= self.config.extra.required then
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        blind:disable()
                        return true
                    end
                }))
            end
        end
    end,

    -- Debuffs Jokers too, since Verdant Leaf intentionally excludes them
    -- but Pyrite Penny wants everything covered
    recalc_debuff = function(self, card, from_blind)
        if self.disabled then return false end
        if card.ability.set == 'Joker' then
            return true
        end
        return false
    end,
}

SMODS.Blind {
    key = "tyler_the_finisher",
    dollars = 8,
    mult = 2,
    pos = { y = 7 },
    boss = { min = 8, max = 16, showdown = true },
    boss_colour = HEX('7bc0cc'),
    atlas = 'hardblinds',
}

local dckst_tyler_ghpi_ref = G.FUNCS.get_poker_hand_info
G.FUNCS.get_poker_hand_info = function(hand)
    local text, disp_text, poker_hands, scoring_hand, disp_text_perm = dckst_tyler_ghpi_ref(hand)

    if SMODS.is_active_blind('bl_dckst_tyler_the_finisher') then
        local real_order = G.GAME.hands[text] and G.GAME.hands[text].order

        if real_order then
            -- Every hand type ranked below what was played, full stop.
            local weaker_hands = {}
            for hand_name, hand_data in pairs(G.GAME.hands) do
                if hand_data.order and hand_data.order > real_order then
                    weaker_hands[#weaker_hands + 1] = hand_name
                end
            end

            if #weaker_hands > 0 then
                local new_hand_name = pseudorandom_element(weaker_hands, pseudoseed('dckst_tyler'))
                text = new_hand_name
                disp_text = localize(new_hand_name, 'poker_hands')
                disp_text_perm = new_hand_name
                -- Keep the same scoring cards Balatro already selected for
                -- the original hand; we're just re-labeling the hand type
                -- and letting its base chips/mult apply instead.
            end
        end
    end

    return text, disp_text, poker_hands, scoring_hand, disp_text_perm
end

SMODS.Blind {
    key = "amethyst_amulet",
    dollars = 11,
    mult = 3,
    pos = { y = 8 },
    boss = { min = 16, max = 16, showdown = true },
    boss_colour = HEX('9966cc'),
    atlas = 'hardblinds',

    calculate = function(self, blind, context)
        if self.disabled then return end
        if context.discard and context.full_hand then
            local discarded = context.full_hand
            local count = math.ceil(#discarded / 2)

            if count > 0 then
                local to_destroy = {}
                for i = 1, count do
                    to_destroy[i] = discarded[i]
                end
                SMODS.destroy_cards(to_destroy)
            end
        end
    end,
}

SMODS.Blind {
    key = "leafy_limit",
    dollars = 11,
    mult = 3,
    pos = { y = 9 },
    boss = { min = 16, max = 16, showdown = true },
    boss_colour = HEX('6b8e23'),
    atlas = 'hardblinds',
    config = { extra = { addentum = -1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.addentum, self.config.extra.addentum } }
    end,
    collection_loc_vars = function(self)
        return { vars = { self.config.extra.addentum, self.config.extra.addentum } }
    end,

    set_blind = function(self, reset, silent)
        if not reset then
            SMODS.change_play_limit(self.config.extra.addentum)
            SMODS.change_discard_limit(self.config.extra.addentum)
            G.hand:change_size(self.config.extra.addentum)
        end
    end,

    disable = function(self)
        SMODS.change_play_limit(-self.config.extra.addentum)
        SMODS.change_discard_limit(-self.config.extra.addentum)
        G.hand:change_size(-self.config.extra.addentum)
    end,

    defeat = function(self)
        SMODS.change_play_limit(-self.config.extra.addentum)
        SMODS.change_discard_limit(-self.config.extra.addentum)
        G.hand:change_size(-self.config.extra.addentum)
    end,
}

SMODS.Blind {
    key = "onyx_obelisk",
    dollars = 11,
    mult = 3,
    pos = { y = 10 },
    boss = { min = 16, max = 16, showdown = true },
    boss_colour = HEX('353839'),
    atlas = 'hardblinds',
    config = { extra = { decay = 0.7 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.decay } }
    end,
    collection_loc_vars = function(self)
        return { vars = { self.config.extra.decay } }
    end,


    set_blind = function(self, reset, silent)
        if not reset then
            G.GAME.dckst_onyx_last_hand = nil
            G.GAME.dckst_onyx_repeat_count = 0
        end
    end,
 
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        if self.disabled then return mult, hand_chips, false end
 
        local last_hand = G.GAME.dckst_onyx_last_hand
        local repeat_count = G.GAME.dckst_onyx_repeat_count or 0
 
        if text == last_hand then
            repeat_count = repeat_count + 1
        else
            repeat_count = 0
        end
 
        G.GAME.dckst_onyx_last_hand = text
        G.GAME.dckst_onyx_repeat_count = repeat_count
 
        if repeat_count > 0 then
            local decay_mult = self.config.extra.decay ^ repeat_count
            local new_mult = math.max(1, math.floor(mult * decay_mult + 0.5))
            local new_chips = math.max(1, math.floor(hand_chips * decay_mult + 0.5))
            return new_mult, new_chips, true
        end
 
        return mult, hand_chips, false
    end,
}

SMODS.Blind {
    key = "diamond_die",
    dollars = 11,
    mult = 3,
    boss = { min = 16, max = 16, showdown = true },
    boss_colour = HEX('4beddb'),
    atlas = 'hardblinds',
    pos = { y = 11 },
    config = { extra = { rank = nil } },

    loc_vars = function(self)
        local rank_key = G.GAME and G.GAME.dckst_diamond_die_rank
        local rank_display = rank_key and localize(rank_key, 'ranks') or '[rank]'
        return { vars = { rank_display } }
    end,
    collection_loc_vars = function(self)
        return { vars = { '[rank]' } }
    end,

    set_blind = function(self, reset, silent)
        if not reset then
            G.GAME.dckst_diamond_die_pool = SMODS.dckst_diamond_die_build_pool()
            SMODS.dckst_diamond_die_reroll()
            SMODS.dckst_diamond_die_refresh_text()
        end
    end,

    disable = function(self)
        G.GAME.dckst_diamond_die_pool = nil
        G.GAME.dckst_diamond_die_rank = nil
    end,

    defeat = function(self)
        G.GAME.dckst_diamond_die_pool = nil
        G.GAME.dckst_diamond_die_rank = nil
    end,

    debuff_hand = function(self, cards, hand, handname, check)
        if self.disabled then return end
        self.triggered = false

        local rank_key = G.GAME.dckst_diamond_die_rank
        if not rank_key then return end

        for _, card in ipairs(cards) do
            if card.base and card.base.value == rank_key then
                return false
            end
        end

        self.triggered = true
        return true
    end,

    calculate = function(self, blind, context)
        if self.disabled then return end

        if context.after then
            SMODS.dckst_diamond_die_reroll()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    blind:wiggle()
                    SMODS.dckst_diamond_die_refresh_text()
                    return true
                end
            }))
        end
    end,
}

function SMODS.dckst_diamond_die_build_pool()
    local pool = {}
    local seen = {}
    if G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            local rank_key = card.base.value
            if rank_key and not seen[rank_key] then
                seen[rank_key] = true
                pool[#pool + 1] = rank_key
            end
        end
    end
    if #pool == 0 then pool = { 'Ace' } end
    return pool
end

function SMODS.dckst_diamond_die_reroll()
    local pool = G.GAME.dckst_diamond_die_pool
    if not pool or #pool == 0 then
        pool = SMODS.dckst_diamond_die_build_pool()
        G.GAME.dckst_diamond_die_pool = pool
    end
    G.GAME.dckst_diamond_die_rank = pseudorandom_element(pool, pseudoseed('dckst_diamond_die'))
end

function SMODS.dckst_diamond_die_refresh_text()
    if not (G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind) then
        return
    end
    if G.GAME.blind.config.blind.key ~= 'bl_dckst_diamond_die' then
        return
    end
    local blind_obj = G.GAME.blind.config.blind
    if blind_obj.loc_vars then
        local result = blind_obj:loc_vars()
        if result and result.vars then
            blind_obj.vars = result.vars
        end
    end
    G.GAME.blind:set_text()
end
    
SMODS.Blind {
    key = "fervent_fern",
    dollars = 11,
    mult = 3,
    boss = { min = 16, max = 16, showdown = true },
    boss_colour = HEX('4F7942'),
    atlas = 'hardblinds',
    pos = { y = 12 },
    config = { extra = { required = 23 } },

    loc_vars = function(self)
        local played = G.GAME.dckst_fervent_fern_scored or 0
        return { vars = { self.config.extra.required, played } }
    end,
    collection_loc_vars = function(self)
        return { vars = { self.config.extra.required, 0 } }
    end,

    set_blind = function(self, reset, silent)
        if not reset then
            G.GAME.dckst_fervent_fern_scored = 0
        end
    end,

    disable = function(self)
        G.GAME.dckst_fervent_fern_scored = nil
    end,

    defeat = function(self)
        G.GAME.dckst_fervent_fern_scored = nil
    end,

    calculate = function(self, blind, context)
        if blind.disabled then return end

        if context.debuff_card and context.debuff_card.area ~= G.jokers then
            return {
                debuff = true
            }
        end

        if context.before and context.full_hand then
            G.GAME.dckst_fervent_fern_scored = (G.GAME.dckst_fervent_fern_scored or 0) + #context.full_hand

            if G.GAME.dckst_fervent_fern_scored >= self.config.extra.required then
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        blind:disable()
                        return true
                    end
                }))
            end
        end
    end,
}

SMODS.Blind {
    key = "hypnotic_haze",
    dollars = 11,
    mult = 3,
    boss = { min = 16, max = 16, showdown = true },
    boss_colour = HEX('5b2b80'),
    atlas = 'hardblinds',
    pos = { y = 13 },

    set_blind = function(self, reset, silent)
        if not reset then
            G.GAME.dckst_hypnotic_haze_timer = 0

            for _, card in ipairs(G.jokers.cards) do
                if card.facing == 'front' then card:flip() end
            end
        end
    end,

    disable = function(self)
        G.GAME.dckst_hypnotic_haze_timer = nil
        for _, card in ipairs(G.jokers.cards) do
            if card.facing == 'back' then card:flip() end
        end
    end,

    defeat = function(self)
        G.GAME.dckst_hypnotic_haze_timer = nil
        for _, card in ipairs(G.jokers.cards) do
            if card.facing == 'back' then card:flip() end
        end
    end,

    -- Newly created/bought Jokers should also start face down while this blind is active
    calculate = function(self, blind, context)
        if blind.disabled then return end

        if context.setting_ability and context.other_card
            and context.other_card.ability.set == 'Joker'
            and context.other_card.facing == 'front' then
            context.other_card:flip()
        end
    end,
}

local dckst_hypnotic_haze_emplace_ref = CardArea.emplace
function CardArea:emplace(card, ...)
    local ret = dckst_hypnotic_haze_emplace_ref(self, card, ...)

    if self == G.jokers and G.GAME and G.GAME.blind and not G.GAME.blind.disabled
        and G.GAME.blind.config and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.key == 'bl_dckst_hypnotic_haze'
        and card.facing == 'front' then
        card:flip()
    end

    return ret
end

local dckst_hypnotic_haze_update_ref = Game.update
function Game:update(dt)
    dckst_hypnotic_haze_update_ref(self, dt)

    if G.GAME and G.GAME.blind and not G.GAME.blind.disabled
        and G.GAME.blind.config and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.key == 'bl_dckst_hypnotic_haze'
        and not G.SETTINGS.paused then

        local scaled_dt = dt * math.min(G.SETTINGS.GAMESPEED, 4)
        G.GAME.dckst_hypnotic_haze_timer = (G.GAME.dckst_hypnotic_haze_timer or 0) + scaled_dt

        if G.GAME.dckst_hypnotic_haze_timer >= 3.0 then
            G.GAME.dckst_hypnotic_haze_timer = G.GAME.dckst_hypnotic_haze_timer - 3.0

            if G.jokers and G.jokers.cards and #G.jokers.cards > 1 then
                G.jokers:shuffle('dckst_hypnotic_haze_jokers')
            end
            if G.hand and G.hand.cards and #G.hand.cards > 1 then
                G.hand:shuffle('dckst_hypnotic_haze_hand')
            end
        end
    end
end

SMODS.Blind {
    key = "calculator_core",
    dollars = 11,
    mult = 3,
    boss = { min = 16, max = 16, showdown = true },
    boss_colour = HEX('2f4f4f'),
    atlas = 'hardblinds',
    pos = { y = 14 },
    config = { extra = { min_thres = 25, max_thres = 29 } },

    loc_vars = function(self)
        return { vars = { self.config.extra.min_thres, self.config.extra.max_thres } }
    end,
    collection_loc_vars = function(self)
        return { vars = { self.config.extra.min_thres, self.config.extra.max_thres } }
    end,

    -- Same debuff_hand pattern as Scalage: fires on both live preview (check == true)
    -- and the real committed play, so the red "debuffed hand" warning shows as the
    -- player builds their hand -- not just at submission.
    debuff_hand = function(self, cards, hand, handname, check)
        if self.disabled then return end
        self.triggered = false

        local total = 0
        for _, card in ipairs(cards) do
            total = total + get_nominal_value(card)
        end

        if total < self.config.extra.min_thres or total > self.config.extra.max_thres then
            self.triggered = true
            return true
        end
    end,
}


-- FAR-REACHING BLINDS

SMODS.Blind {
    key = "shorted_signal",
    dollars = 17,
    mult = 5,
    boss = { min = 24, max = 32, showdown = true },
    boss_colour = SMODS.Gradients["dckst_shorted_signal"],
    atlas = 'hardblinds',
    pos = { y = 15 },
    config = { extra = { threshold = 0.5 } },

    loc_vars = function(self)
        return { vars = { number_format(self.config.extra.threshold * 100) } }
    end,
    collection_loc_vars = function(self)
        return { vars = { number_format(self.config.extra.threshold * 100) } }
    end,
}

local dckst_shorted_signal_eval_ref = G.FUNCS.evaluate_play -- i hope this doesnt error out
G.FUNCS.evaluate_play = function(e)
    local chips_before = to_number(G.GAME.chips) or 0

    dckst_shorted_signal_eval_ref(e)

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.6,
        func = function()
            if G.GAME.blind and not G.GAME.blind.disabled
                and G.GAME.blind.config and G.GAME.blind.config.blind
                and G.GAME.blind.config.blind.key == 'bl_dckst_shorted_signal' then

                local chips_after = to_number(G.GAME.chips) or 0
                local this_hand_score = chips_after - chips_before

                local required = to_number(G.GAME.blind.chips) or 0
                local threshold_score = required * G.GAME.blind.config.blind.config.extra.threshold

                if this_hand_score > threshold_score then
                    G.GAME.current_round.hands_left = 0
                end
            end

            return true
        end
    }))
end

SMODS.Blind {
    key = "malignant_monument",
    dollars = 17,
    mult = 5,
    boss = { min = 24, max = 32, showdown = true },
    boss_colour = SMODS.Gradients["dckst_malignant_monument"],
    atlas = 'hardblinds',
    pos = { y = 16 },
    config = { extra = { power = 1.25 } },

    loc_vars = function(self)
        return { vars = { self.config.extra.power } }
    end,
    collection_loc_vars = function(self)
        return { vars = { self.config.extra.power } }
    end,

    set_blind = function(self, reset, silent)
        if not reset then
            local base = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling
            G.GAME.blind.chips = math.floor(base ^ self.config.extra.power)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end,
}

SMODS.Blind {
    key = "total_terminal",
    dollars = 17,
    mult = 5,
    boss = { min = 24, max = 32, showdown = true },
    boss_colour = SMODS.Gradients["dckst_total_terminal"],
    atlas = 'hardblinds',
    pos = { y = 17 },

    contains_xmult = function(self, card)
        local a = card.ability

        local xmult_keys = {
            'x_mult', 'h_x_mult', 't_x_mult',
        }
        for _, k in ipairs(xmult_keys) do
            if type(a[k]) == 'number' and a[k] ~= 1 then
                return true
            end
        end

        if type(a.extra) == 'table' then
            for k, v in pairs(a.extra) do
                if type(v) == 'number' and (
                    string.find(string.lower(k), 'xmult')
                    or string.find(string.lower(k), 'x_mult')
                ) and v ~= 1 then
                    return true
                end
            end
        end

        return false
    end,

    recalc_debuff = function(self, card, from_blind)
        if self.disabled then return false end
        if card.ability.set ~= 'Joker' then return false end
        return self:contains_xmult(card)
    end,

    set_blind = function(self, reset, silent)
        if not reset then
            for _, card in ipairs(G.jokers.cards) do
                SMODS.recalc_debuff(card)
            end
        end
    end,
}

local dckst_total_terminal_emplace_ref = CardArea.emplace
function CardArea:emplace(card, ...)
    local ret = dckst_total_terminal_emplace_ref(self, card, ...)
    if self == G.jokers and G.GAME and G.GAME.blind and SMODS.is_active_blind
        and G.GAME.blind.config and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.key == 'bl_dckst_total_terminal'
        and SMODS.is_active_blind('bl_dckst_total_terminal')
        and not G.GAME.blind.disabled then
        SMODS.recalc_debuff(card)
    end
    return ret
end

local dckst_total_terminal_align_cards = CardArea.align_cards
function CardArea:align_cards(...)
    local ret = dckst_total_terminal_align_cards(self, ...)

    if G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind
        and SMODS.is_active_blind('bl_dckst_total_terminal')
        and (G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.DRAW_TO_HAND)
        and self == G.jokers then
        for _, card in ipairs(self.cards) do
            SMODS.recalc_debuff(card)
        end
    end

    return ret
end

SMODS.Blind {
    key = "versatile_versine",
    dollars = 17,
    mult = 5,
    boss = { min = 24, max = 32, showdown = true },
    boss_colour = SMODS.Gradients["dckst_versatile_versine"],
    atlas = 'hardblinds',
    pos = { y = 18 },
    config = { extra = { chip_mult = 0.7, mult_mult = 0.7 } },

    loc_vars = function(self)
        return { vars = { self.config.extra.chip_mult, self.config.extra.mult_mult } }
    end,
    collection_loc_vars = function(self)
        return { vars = { self.config.extra.chip_mult, self.config.extra.mult_mult } }
    end,
    
    set_blind = function(self, reset, silent)
        if not reset then
            G.GAME.dckst_versine_joker_triggers = 0
        end
    end,

    calculate = function(self, blind, context)
        if self.disabled then return end

        if context.individual and context.cardarea == G.play then
            if context.other_card and not context.other_card.debuff then
                return {
                    x_chips = self.config.extra.chip_mult,
                    card = context.other_card
                }
            end
        end
    end,
}

local dckst_versine_juice_up_ref = Card.juice_up
function Card:juice_up(...)
    dckst_versine_juice_up_ref(self, ...)

    if G.GAME and G.GAME.blind and not G.GAME.blind.disabled
        and G.GAME.blind.config and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.key == 'bl_dckst_versatile_versine'
        and self.ability and self.ability.set == 'Joker' then
        G.GAME.dckst_versine_joker_triggers = (G.GAME.dckst_versine_joker_triggers or 0) + 1
    end
end

local dckst_versine_trigger_effect_ref = Back.trigger_effect
function Back:trigger_effect(params, ...)
    local nu_chip, nu_mult = dckst_versine_trigger_effect_ref(self, params, ...)

    if params and params.context == 'final_scoring_step'
        and G.GAME and G.GAME.blind and not G.GAME.blind.disabled
        and G.GAME.blind.config and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.key == 'bl_dckst_versatile_versine'
        and not G.GAME.dckst_versine_applied_this_hand then

        local triggers = G.GAME.dckst_versine_joker_triggers or 0
        if triggers > 0 then
            local penalty = G.GAME.blind.config.blind.config.extra.mult_mult ^ triggers
            local base_mult = nu_mult or params.mult
            nu_mult = base_mult * penalty
            G.GAME.dckst_versine_applied_this_hand = true
        end
    end

    return nu_chip, nu_mult
end

SMODS.Blind {
    key = "withering_well",
    dollars = 17,
    mult = 5,
    boss = { min = 24, max = 32, showdown = true },
    boss_colour = SMODS.Gradients["dckst_withering_well"],
    atlas = 'hardblinds',
    pos = { y = 19 },

    calculate = function(self, blind, context)
        if self.disabled then return end

        if context.after then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local dollars_raw = G.GAME.dollars or 0
                    local current_funds = (Big and Big.is and Big.is(dollars_raw)) and dollars_raw.number or dollars_raw
                    current_funds = math.max(0, current_funds)

                    local loss = math.ceil(current_funds * 0.5)

                    if loss > 0 then
                        ease_dollars(-loss)
                        play_sound('tarot2', 1.1, 0.4)
                        blind:wiggle()
                    end

                    return true
                end
            }))
        end
    end,
}

SMODS.Blind {
    key = "molten_mass",
    dollars = 17,
    mult = 5,
    boss = { min = 24, max = 32, showdown = true },
    boss_colour = SMODS.Gradients["dckst_molten_mass"],
    atlas = 'hardblinds',
    pos = { y = 20 },

    calculate = function(self, blind, context)
        if self.disabled then return end

        if context.before and context.full_hand then
            for _, card in ipairs(context.full_hand) do
                if card.ability.set ~= 'Default' then
                    card:set_ability(G.P_CENTERS.c_base, true, true)
                end
                if card.seal then
                    card:set_seal(nil, true, true)
                end
                if card.edition then
                    card:set_edition(nil, true, true)
                end
            end
        end
    end,
}

SMODS.Blind {
    key = "gravity_gate",
    dollars = 17,
    mult = 5,
    boss = { min = 24, max = 32, showdown = true },
    boss_colour = SMODS.Gradients["dckst_gravity_gate"],
    atlas = 'hardblinds',
    pos = { y = 21 },

    set_blind = function(self, reset, silent)
        if not reset and not G.GAME.blind.dckst_gravity_gate_applied then
            local current_size = G.hand.config.card_limit
            local new_size = math.floor(current_size / 2)
            local delta = new_size - current_size

            G.GAME.blind.dckst_gravity_gate_delta = delta
            G.GAME.blind.dckst_gravity_gate_applied = true
            G.hand:change_size(delta)
        end
    end,

    disable = function(self)
        local delta = G.GAME.blind.dckst_gravity_gate_delta
        if delta and delta ~= 0 then
            G.hand:change_size(-delta)
            G.GAME.blind.dckst_gravity_gate_delta = nil
            G.GAME.blind.dckst_gravity_gate_applied = nil
        end
    end,

    defeat = function(self)
        local delta = G.GAME.blind.dckst_gravity_gate_delta
        if delta and delta ~= 0 then
            G.hand:change_size(-delta)
            G.GAME.blind.dckst_gravity_gate_delta = nil
            G.GAME.blind.dckst_gravity_gate_applied = nil
        end
    end,
}

SMODS.Blind {
    key = "astral_alignment",
    dollars = 17,
    mult = 5,
    boss = { min = 24, max = 32, showdown = true },
    boss_colour = SMODS.Gradients["dckst_astral_alignment"],
    atlas = 'hardblinds',
    pos = { y = 22 },
    config = { extra = { max_level = 3 } },

    loc_vars = function(self)
        return { vars = { self.config.extra.max_level } }
    end,
    collection_loc_vars = function(self)
        return { vars = { self.config.extra.max_level } }
    end,

    -- Same pattern as Scalage: runs on the live preview and the committed play,
    -- so the red "debuffed hand" warning appears as soon as the hand is selected.
    debuff_hand = function(self, cards, hand, handname, check)
        if self.disabled then return end
        self.triggered = false

        local hand_data = handname and G.GAME.hands[handname]
        if hand_data and to_number(hand_data.level) > self.config.extra.max_level then
            self.triggered = true
            return true
        end
    end,
}

SMODS.Blind {
    key = "cosmic_ceiling",
    dollars = 17,
    mult = 5,
    boss = { min = 24, max = 32, showdown = true },
    boss_colour = SMODS.Gradients["dckst_cosmic_ceiling"],
    atlas = 'hardblinds',
    pos = { y = 23 },

    calculate = function(self, blind, context)
        if blind.disabled then return end

        -- After scoring resolves, permanently debuff every card that was played
        if context.after and context.full_hand then
            local played = {}
            for i, card in ipairs(context.full_hand) do
                played[i] = card
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    for _, card in ipairs(played) do
                        if card and not card.removed then
                            -- Source-tagged debuff lives on the card itself, so it
                            -- outlasts the blind (same approach as Dandelion Arrow)
                            SMODS.debuff_card(card, true, 'dckst_cosmic_ceiling')
                            card:juice_up(0.4, 0.3)
                        end
                    end
                    play_sound('tarot2', 0.9, 0.4)
                    blind:wiggle()
                    return true
                end
            }))
        end
    end,
}

SMODS.Blind {
    key = "primordial_pulse",
    dollars = 17,
    mult = 5,
    boss = { min = 24, max = 32, showdown = true },
    boss_colour = SMODS.Gradients["dckst_primordial_pulse"],
    atlas = 'hardblinds',
    pos = { y = 24 },

    set_blind = function(self, reset, silent)
        if not reset then
            SMODS.dckst_pulse_clear_flags()
            SMODS.dckst_pulse_roll()
        end
    end,

    disable = function(self)
        SMODS.dckst_pulse_clear_flags()
        SMODS.dckst_pulse_recalc_all()
    end,

    defeat = function(self)
        SMODS.dckst_pulse_clear_flags()
        SMODS.dckst_pulse_recalc_all()
    end,

    recalc_debuff = function(self, card, from_blind)
        if self.disabled then return false end
        return card.ability and card.ability.dckst_pulse_debuff == true
    end,

    -- The beat: after each hand resolves, re-roll which halves are debuffed
    calculate = function(self, blind, context)
        if blind.disabled then return end

        if context.after then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if SMODS.dckst_pulse_active() then
                        SMODS.dckst_pulse_roll()
                        play_sound('tarot2', 1.1, 0.4)
                        blind:wiggle()
                    end
                    return true
                end
            }))
        end
    end,
}

function SMODS.dckst_pulse_active()
    return G.GAME and G.GAME.blind and not G.GAME.blind.disabled
        and SMODS.is_active_blind('bl_dckst_primordial_pulse')
end

-- Marks ceil(n/2) random cards from the list as debuffed, clears the rest
local function dckst_pulse_mark_half(cards, seed)
    local pool = {}
    for i, card in ipairs(cards) do pool[i] = card end
    if #pool == 0 then return end

    pseudoshuffle(pool, pseudoseed(seed))

    local count = math.ceil(#pool / 2)
    for i, card in ipairs(pool) do
        card.ability.dckst_pulse_debuff = (i <= count) or nil
    end
end

function SMODS.dckst_pulse_roll()
    dckst_pulse_mark_half(G.playing_cards or {}, 'dckst_pulse_deck')
    dckst_pulse_mark_half(G.jokers and G.jokers.cards or {}, 'dckst_pulse_jokers')
    SMODS.dckst_pulse_recalc_all()
end

function SMODS.dckst_pulse_clear_flags()
    for _, card in ipairs(G.playing_cards or {}) do
        card.ability.dckst_pulse_debuff = nil
    end
    if G.jokers and G.jokers.cards then
        for _, card in ipairs(G.jokers.cards) do
            card.ability.dckst_pulse_debuff = nil
        end
    end
end

function SMODS.dckst_pulse_recalc_all()
    for _, card in ipairs(G.playing_cards or {}) do SMODS.recalc_debuff(card) end
    if G.jokers and G.jokers.cards then
        for _, card in ipairs(G.jokers.cards) do SMODS.recalc_debuff(card) end
    end
end