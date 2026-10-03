SMODS.ConsumableType {
    key = 'Felimonial',
    primary_colour = G.C.DCKST_MAXEY_YELLOW,
    secondary_colour = G.C.DCKST_FELIMONIAL,
    text_colour = G.C.DCKST_MAXEY_YELLOW,
    collection_rows = { 5, 5 },
    shop_rate = 6,
    default = 'c_dckst_meow',
    can_stack = true,
    can_divide = true,
}

SMODS.UndiscoveredSprite{
    key = "Felimonial",
    atlas = "undiscoveredfelimonial",
    pos = {x=0, y=0},
}

local INTEREST_STEP = 25   -- $5 of extra interest = 25 more on G.GAME.interest_cap (5 per $5 held)

-- ---------- state ----------
local function F()
    G.GAME.dckst_felim = G.GAME.dckst_felim or {
        meow = 0, stalk = 0, pounce = 0, stare = 0,
        slink = 0, slink_live = 0,
        stretch = 0, stretch_live = 0,
        hiss_live = 0,
        burrow = {},
    }
    return G.GAME.dckst_felim
end

-- ---------- helpers ----------
local function in_blind()
    return G.hand and G.STATE == G.STATES.SELECTING_HAND
end

-- X$0.7 etc: keep floor(money * x)
local function pay(x)
    G.E_MANAGER:add_event(Event({
        trigger = 'after', delay = 0.2,
        func = function()
            local d = G.GAME.dollars
            if d > 0 then ease_dollars(math.floor(d * x) - d) end
            return true
        end
    }))
end

local function chance(seed, num, den, card)
    if SMODS.pseudorandom_probability then
        return SMODS.pseudorandom_probability(card or G.GAME.blind, seed, num, den, seed)
    end
    return pseudorandom(seed) < (G.GAME.probabilities.normal * num) / den
end

local function highlighted_jokers()
    return G.jokers and G.jokers.highlighted or {}
end

local function set_blind_chips(factor)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        func = function()
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips * factor)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            play_sound('tarot2', 1.1, 0.4)
            SMODS.juice_up_blind()
            return true
        end
    }))
end

local function most_played_hand()
    local best, tally = nil, 0
    for _, name in ipairs(G.handlist) do
        local h = G.GAME.hands[name]
        if h.visible and h.played > tally then best, tally = name, h.played end
    end
    return best
end

local function level_hand(card, hand, amount)
    if SMODS.smart_level_up_hand then
        SMODS.smart_level_up_hand(card, hand, false, amount)
        return
    end
    local g = G.GAME.hands[hand]
    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
        { handname = localize(hand, 'poker_hands'), chips = g.chips, mult = g.mult, level = g.level })
    level_up_hand(card, hand, false, amount)
    update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
        { mult = 0, chips = 0, handname = '', level = '' })
end

local function has_stickers(c)
    for k in pairs(SMODS.Stickers or {}) do
        if c.ability[k] then return true end
    end
    return false
end

local function edition_pool()
    local pool = {}
    for _, v in ipairs(G.P_CENTER_POOLS.Edition) do
        if v.key ~= 'e_base' then pool[#pool + 1] = v.key end  -- equal weights
    end
    return pool
end

-- ---------- scoring / blind integration ----------
local function felim_calculate(context)
    if not (G.GAME and G.GAME.dckst_felim) then return end
    local f = G.GAME.dckst_felim

    -- Stalk / Pounce: armed one-shots for the next hand played
    if context.final_scoring_step and (f.stalk > 0 or f.pounce > 0) then
        local head, tail
        local function push(fx)
            if tail then tail.extra = fx else head = fx end
            tail = fx
        end
        for _ = 1, f.stalk do
            if G.GAME.current_round.discards_used == 0 then push({ x_mult = 2 }) end
        end
        for _ = 1, f.pounce do push({ x_mult = 3 }) end
        f.stalk, f.pounce = 0, 0
        return head
    end

    -- Slink: temporarily raise hand size so the refill after the discard draws extra cards
    if context.pre_discard and f.slink > 0 then
        local n = 4 * f.slink
        f.slink = 0
        f.slink_live = f.slink_live + n
        G.hand:change_size(n)
    end

    -- ...and put it back once the refill is done (or, failing that, on the next hand)
    if (context.hand_drawn or context.before) and f.slink_live > 0 then
        G.hand:change_size(-f.slink_live)
        f.slink_live = 0
    end

    if context.starting_shop and f.meow > 0 then
        G.GAME.current_round.free_rerolls = (G.GAME.current_round.free_rerolls or 0) + f.meow
        calculate_reroll_cost(true)
        f.meow = 0
    end

    if context.setting_blind then
        -- Stretch: pending hand size becomes live for this Blind
        if f.stretch > 0 then
            local n = 2 * f.stretch
            f.stretch = 0
            f.stretch_live = f.stretch_live + n
            G.hand:change_size(n)
        end

        -- Stare: each charge gets a 1 in 5 roll against the next Boss Blind
        if f.stare > 0 and G.GAME.blind.boss then
            local hit = false
            for _ = 1, f.stare do
                if chance('dckst_stare', 1, 5) then hit = true end
            end
            f.stare = 0
            if hit then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.3,
                    func = function()
                        G.GAME.blind:disable()
                        play_sound('timpani')
                        return true
                    end
                }))
            end
        end

        -- Burrow: expire interest bonuses
        for i = #f.burrow, 1, -1 do
            if G.GAME.round_resets.ante >= f.burrow[i].ends then
                G.GAME.interest_cap = G.GAME.interest_cap - INTEREST_STEP
                table.remove(f.burrow, i)
            end
        end
    end

    -- Round-scoped hand size changes unwind here
    if context.end_of_round and not context.individual and not context.repetition and not context.game_over then
        local back = f.hiss_live - f.stretch_live
        if f.slink_live > 0 then back = back - f.slink_live end
        if back ~= 0 then G.hand:change_size(back) end
        f.hiss_live, f.stretch_live, f.slink_live = 0, 0, 0
    end
end

if SMODS.current_mod then
    local prev = SMODS.current_mod.calculate
    SMODS.current_mod.calculate = function(self, context)
        local a = prev and prev(self, context)
        local b = felim_calculate(context)
        if a and b then
            local tail = a
            while tail.extra do tail = tail.extra end
            tail.extra = b
            return a
        end
        return a or b
    end
else
    print('[DCKST] Felimonial: SMODS.current_mod is nil, hooks not installed')
end

-- ---------- card factory ----------
local function felimonial(order, key, def)
    SMODS.Consumable {
        key = key,
        set = 'Felimonial',
        atlas = 'felimonials',
        pos = { x = (order - 1) % 5, y = math.floor((order - 1) / 5) },
        cost = 5,
        unlocked = true,
        discovered = false,
        display_size = {w = 66, h = 66},
        config = { extra = def.extra or {} },

        loc_vars = function(self, info_queue, card)
            return { vars = def.vars and def.vars(card.ability.extra) or {} }
        end,

        can_use = function(self, card)
            return def.can_use == nil or def.can_use(card.ability.extra)
        end,

        use = function(self, card, area, copier)
            def.use(card.ability.extra, card)
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end,
    }
end

-- ---------- the twenty ----------
felimonial(1, 'meow', {
    extra = { rerolls = 2 },
    vars = function(ex) return { ex.rerolls } end,
    use = function(ex)
        if G.STATE == G.STATES.SHOP then
            G.GAME.current_round.free_rerolls = (G.GAME.current_round.free_rerolls or 0) + ex.rerolls
            calculate_reroll_cost(true)
        else
            F().meow = F().meow + ex.rerolls   -- applied when the next shop opens
        end
    end,
})

felimonial(2, 'purr', {
    extra = { hands = 1, discards = 1 },
    vars = function(ex) return { ex.hands, ex.discards } end,
    can_use = function() return in_blind() end,
    use = function(ex)
        ease_hands_played(ex.hands)
        ease_discard(ex.discards)
    end,
})

felimonial(3, 'hiss', {
    extra = { cut = 15, size = 1 },
    vars = function(ex) return { ex.cut, ex.size } end,
    can_use = function() return in_blind() end,
    use = function(ex)
        set_blind_chips(1 - ex.cut / 100)
        G.hand:change_size(-ex.size)
        F().hiss_live = F().hiss_live + ex.size  -- hand size to give back at end of round
    end,
})

felimonial(4, 'yowl', {
    extra = { x = 0.8 },
    vars = function(ex) return { ex.x } end,
    can_use = function()
        local s = G.GAME.round_resets.blind_states and G.GAME.round_resets.blind_states.Boss
        return G.STATE == G.STATES.BLIND_SELECT and s ~= 'Defeated' and s ~= 'Current'
    end,
    use = function(ex)
        G.from_boss_tag = true   -- same path as Director's Cut: no $10 charge
        G.FUNCS.reroll_boss()
        pay(ex.x)
    end,
})

felimonial(5, 'chirp', {
    extra = { value = 1 },
    vars = function(ex) return { ex.value } end,
    can_use = function() return G.jokers and #G.jokers.cards > 0 end,
    use = function(ex)
        for _, j in ipairs(G.jokers.cards) do
            j.ability.extra_value = (j.ability.extra_value or 0) + ex.value
            j:set_cost()
            j:juice_up(0.3, 0.4)
        end
    end,
})

felimonial(6, 'stalk', {
    extra = { x = 2 },
    vars = function(ex) return { ex.x } end,
    use = function() F().stalk = F().stalk + 1 end,
})

felimonial(7, 'pounce', {
    extra = { x = 3, cost = 0.7 },
    vars = function(ex) return { ex.x, ex.cost } end,
    use = function(ex)
        F().pounce = F().pounce + 1
        pay(ex.cost)
    end,
})

felimonial(8, 'leap', {
    extra = { num = 1, den = 2, cost = 0.5 },
    vars = function(ex) return { (G.GAME and G.GAME.probabilities.normal or 1) * ex.num, ex.den, ex.cost } end,
    can_use = function()
        local j = highlighted_jokers()
        return #j == 1 and not j[1].edition
    end,
    use = function(ex, card)
        local joker = highlighted_jokers()[1]
        if chance('dckst_leap', ex.num, ex.den, card) then
            local pool = edition_pool()
            local pick = pseudorandom_element(pool, pseudoseed('dckst_leap_edition'))
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.4,
                func = function()
                    joker:set_edition(pick, true)
                    return true
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.4,
                func = function()
                    attention_text({ text = localize('k_nope_ex'), scale = 1.3, hold = 1.4,
                        major = card, backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = 'tm', offset = { x = 0, y = -0.2 } })
                    return true
                end
            }))
        end
        pay(ex.cost)
    end,
})

felimonial(9, 'slink', {
    extra = { cards = 4 },
    vars = function(ex) return { ex.cards } end,
    use = function() F().slink = F().slink + 1 end,
})

felimonial(10, 'dash', {
    extra = { cost = 0.6 },
    vars = function(ex) return { ex.cost } end,
    can_use = function()
        return in_blind() and G.GAME.current_round.hands_left < G.GAME.round_resets.hands
    end,
    use = function(ex)
        ease_hands_played(G.GAME.round_resets.hands - G.GAME.current_round.hands_left)
        pay(ex.cost)
    end,
})

felimonial(11, 'knead', {
    extra = { levels = 2, cost = 0.7 },
    vars = function(ex) return { ex.levels, ex.cost } end,
    can_use = function() return most_played_hand() ~= nil end,
    use = function(ex, card)
        level_hand(card, most_played_hand(), ex.levels)
        pay(ex.cost)
    end,
})

felimonial(12, 'groom', {
    extra = { cost = 0.6 },
    vars = function(ex) return { ex.cost } end,
    can_use = function()
        local j = highlighted_jokers()
        return #j == 1 and has_stickers(j[1])
    end,
    use = function(ex)
        local joker = highlighted_jokers()[1]
        for k, sticker in pairs(SMODS.Stickers) do
            if joker.ability[k] then sticker:apply(joker, false) end
        end
        joker:set_cost()
        joker:juice_up(0.3, 0.5)
        pay(ex.cost)
    end,
})

felimonial(13, 'nap', {
    extra = { money = 5 },
    vars = function(ex) return { ex.money } end,
    can_use = function() return in_blind() and G.GAME.current_round.discards_left > 0 end,
    use = function(ex)
        local n = G.GAME.current_round.discards_left
        ease_discard(-n)
        ease_dollars(n * ex.money)
    end,
})

felimonial(14, 'loaf', {
    extra = { mult = 7 },
    vars = function(ex) return { ex.mult } end,
    can_use = function() return G.hand and #G.hand.cards > 0 end,
    use = function(ex)
        for _, c in ipairs(G.hand.cards) do
            c.ability.perma_mult = (c.ability.perma_mult or 0) + ex.mult
            c:juice_up(0.3, 0.4)
        end
    end,
})

felimonial(15, 'stretch', {
    extra = { size = 2, cost = 0.8 },
    vars = function(ex) return { ex.size, ex.cost } end,
    use = function(ex)
        F().stretch = F().stretch + 1
        pay(ex.cost)
    end,
})

local VANILLA_RARITY = { 'Common', 'Uncommon', 'Rare' }

felimonial(16, 'bat', {
    can_use = function()
        local j = highlighted_jokers()
        if #j ~= 1 then return false end
        local ed = j[1].edition
        return not j[1].ability.eternal and not (ed and ed.negative)
    end,
    use = function()
        local old = highlighted_jokers()[1]
        local r = old.config.center.rarity
        local legendary = (r == 4)
        local rarity = type(r) == 'number' and VANILLA_RARITY[r] or r   -- numbers -> keys, modded keys pass through
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.4,
            func = function()
                local new
                for _ = 1, 10 do
                    new = SMODS.create_card {
                        set = 'Joker', area = G.jokers, key_append = 'dckst_bat',
                        rarity = (not legendary) and rarity or nil,
                        legendary = legendary or nil,
                    }
                    if new.config.center.key ~= old.config.center.key then break end
                    new:remove()
                    new = nil
                end
                if new then
                    old:start_dissolve()
                    new:add_to_deck()
                    G.jokers:emplace(new)
                    new:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
    end,
})

felimonial(17, 'sniff', {
    extra = { pct = 50 },
    vars = function(ex) return { ex.pct } end,
    can_use = function() return in_blind() end,
    use = function(ex)
        G.deck:shuffle('dckst_sniff')   -- draw pile only; cards in hand are untouched
        local give = math.floor(G.GAME.round_resets.discards * ex.pct / 100)
        give = math.min(give, G.GAME.round_resets.discards - G.GAME.current_round.discards_left)
        if give > 0 then ease_discard(give) end
    end,
})

felimonial(18, 'scratch', {
    extra = { cards = 7 },
    vars = function(ex) return { ex.cards } end,
    can_use = function(ex)
        return G.hand and #G.hand.highlighted >= 1 and #G.hand.highlighted <= ex.cards
    end,
    use = function()
        local targets = {}
        for i, c in ipairs(G.hand.highlighted) do targets[i] = c end
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.4,
            func = function()
                if SMODS.destroy_cards then
                    SMODS.destroy_cards(targets)
                else
                    for _, c in ipairs(targets) do c:start_dissolve() end
                    SMODS.calculate_context({ remove_playing_cards = true, removed = targets })
                end
                return true
            end
        }))
    end,
})

felimonial(19, 'burrow', {
    extra = { dollars = 5, antes = 2 },
    vars = function(ex) return { ex.dollars, ex.antes } end,
    use = function(ex)
        G.GAME.interest_cap = G.GAME.interest_cap + INTEREST_STEP * (ex.dollars / 5)
        local b = F().burrow
        b[#b + 1] = { ends = G.GAME.round_resets.ante + ex.antes }
    end,
})

felimonial(20, 'stare', {
    extra = { num = 1, den = 5 },
    vars = function(ex) return { (G.GAME and G.GAME.probabilities.normal or 1) * ex.num, ex.den } end,
    use = function() F().stare = F().stare + 1 end,
})