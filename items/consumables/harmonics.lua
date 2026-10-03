SMODS.ConsumableType {
    key = 'Harmonic',
    primary_colour = G.C.WHITE,
    secondary_colour = G.C.DCKST_HARMONIC_ORANGE,
    collection_rows = { 5, 5, 5 },
    shop_rate = 1,
    default = 'c_dckst_attack',
	can_stack = true,
	can_divide = true,
}

SMODS.UndiscoveredSprite{
    key = "Harmonic",
    atlas = "undiscoveredharmonic",
    pos = {x=0, y=0}
}

local HARMONIC_HANDS   = 4     -- default envelope length
local GAIN_AMP         = 2     -- Gain doubles the bonus portion (X1.5 -> X2, +2 hands -> +4 hands)
local COMPRESSOR_FLOOR = 0.25  -- stacked Compressors can cut at most 75% of a blind
local ECHOED_KEY       = 'dckst_echoed'

-- ---------- state ----------
local function H()
    G.GAME.dckst_harm = G.GAME.dckst_harm or {
        envs = {}, gain = 0, compress = 1, tempo_hands = 0, tempo_discards = 0,
    }
    return G.GAME.dckst_harm
end

local function amp_x(x, amp) return 1 + (x - 1) * (amp or 1) end

-- Consumes one Gain charge and returns the amplification for the Harmonic being used
local function take_gain()
    local h = H()
    if h.gain > 0 then
        h.gain = h.gain - 1
        return GAIN_AMP
    end
    return 1
end

local function add_env(kind, vals)
    local h = H()
    h.envs[#h.envs + 1] = {
        kind = kind, vals = vals, step = 1, remaining = HARMONIC_HANDS,
        amp = take_gain(), reps = 1,
    }
end

-- Envelopes that Sustain / Release can still act on (Released ones are already ending)
local function live_envs()
    local n = 0
    for _, e in ipairs(H().envs) do
        if not e.released then n = n + 1 end
    end
    return n
end

-- Ramps hold their final value if Sustain extends them past the last step
local function ramp(list, step) return list[math.min(step, #list)] end

local function equalize()
    local native = false
    for _, k in ipairs(SMODS.calculation_keys or {}) do
        if k == 'balance' then native = true break end
    end
    if native then return { balance = true } end
    return { func = function()
        local total = hand_chips + mult
        hand_chips = mod_chips(math.floor(total / 2))
        mult = mod_mult(math.floor(total / 2))
        update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
    end }
end

-- ---------- envelope behaviour ----------
-- final:      once per hand, at the last scoring step (after Jokers)
-- individual: once per scoring card
-- after:      bookkeeping once per hand
local ENV = {
    attack = {
        final = function(e) return { x_chips = amp_x(ramp(e.vals.ramp, e.step), e.amp) } end,
    },
    decay = {
        final = function(e) return { x_mult = amp_x(ramp(e.vals.ramp, e.step), e.amp) } end,
    },
    reverb = { -- an echo worth N% of the hand's score is exactly X(1+N); always applied last
        final = function(e) return { x_mult = 1 + e.vals.echo * e.amp } end,
    },
    equalizer = {
        final = function(e)
            local fx = equalize()
            fx.extra = { x_mult = amp_x(e.vals.x, e.amp) }
            return fx
        end,
    },
    piano_roll = {
        final = function(e, ctx)
            if e.last_hand == nil or e.last_hand ~= ctx.scoring_name then
                return { x_mult = amp_x(e.vals.x, e.amp) }
            end
        end,
        after = function(e, ctx) e.last_hand = ctx.scoring_name end,
    },
    volume = {
        final = function(e)
            return { x_chips = amp_x(e.vals.x_chips, e.amp), extra = { x_mult = amp_x(e.vals.x_mult, e.amp) } }
        end,
    },
    waveform = { -- odd steps boost Chips, even steps boost Mult (keeps alternating if Sustained)
        final = function(e)
            local x = amp_x(e.vals.x, e.amp)
            if e.step % 2 == 1 then return { x_chips = x } end
            return { x_mult = x }
        end,
    },
    panning = {
        individual = function(e, ctx)
            local sh = ctx.scoring_hand or {}
            local n, idx = #sh, nil
            for i, c in ipairs(sh) do
                if c == ctx.other_card then idx = i break end
            end
            if not idx then return end
            local out = {}
            if idx * 2 <= n + 1 then out.x_chips = amp_x(e.vals.x_chips, e.amp) end -- left half
            if idx * 2 >= n + 1 then out.x_mult = amp_x(e.vals.x_mult, e.amp) end   -- right half
            if next(out) then return out end
        end,
    },
    time_signature = {
        individual = function(e, ctx)
            local c = ctx.other_card
            if c and not SMODS.has_no_rank(c) then
                local id = c:get_id()
                if id >= 2 and id <= 8 then
                    return { x_mult = amp_x(e.vals.x_mult, e.amp) }
                end
            end
        end,
    },
}

-- ---------- scoring integration ----------
local function build_chain(list)
    local head, tail
    for _, fx in ipairs(list) do
        if tail then tail.extra = fx else head = fx end
        tail = fx
        while tail.extra do tail = tail.extra end
    end
    return head
end

local function harmonic_calculate(context)
    local h = G.GAME and G.GAME.dckst_harm
    if not h then return end

    -- Per-card effects (Panning, Time Signature)
    if context.individual and context.cardarea == G.play and context.other_card and #h.envs > 0 then
        local list = {}
        for _, e in ipairs(h.envs) do
            local def = ENV[e.kind]
            local fx = def and def.individual and def.individual(e, context)
            if fx then
                for _ = 1, e.reps or 1 do
                    local copy = copy_table(fx)
                    copy.card = context.other_card
                    list[#list + 1] = copy
                end
            end
        end
        if #list > 0 then return build_chain(list) end
    end

    -- Whole-hand effects, then tick every envelope by one hand
    if context.final_scoring_step and #h.envs > 0 then
        local list, echoes = {}, {}
        for _, e in ipairs(h.envs) do
            local def = ENV[e.kind]
            local fx = def and def.final and def.final(e, context)
            if fx then
                local bucket = (e.kind == 'reverb') and echoes or list
                for _ = 1, e.reps or 1 do bucket[#bucket + 1] = copy_table(fx) end
            end
            if def and def.after then def.after(e, context) end
            e.step = e.step + 1
            e.remaining = e.remaining - 1
        end
        for i = #h.envs, 1, -1 do
            if h.envs[i].remaining <= 0 then table.remove(h.envs, i) end
        end
        for _, fx in ipairs(echoes) do list[#list + 1] = fx end
        if #list > 0 then return build_chain(list) end
    end

    -- Next-blind effects (Compressor, Tempo)
    if context.setting_blind then
        local factor, hands, discards = h.compress, h.tempo_hands, h.tempo_discards
        h.compress, h.tempo_hands, h.tempo_discards = 1, 0, 0

        if factor < 1 then
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
        if hands ~= 0 or discards ~= 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if hands ~= 0 then ease_hands_played(hands) end
                    if discards ~= 0 then ease_discard(discards) end
                    play_sound('tarot2', 1.1, 0.4)
                    return true
                end
            }))
        end
    end
end

-- Chain onto any mod-level calculate that already exists
if SMODS.current_mod then
    local prev = SMODS.current_mod.calculate
    SMODS.current_mod.calculate = function(self, context)
        local a = prev and prev(self, context)
        local b = harmonic_calculate(context)
        if a and b then
            local tail = a
            while tail.extra do tail = tail.extra end
            tail.extra = b
            return a
        end
        return a or b
    end
else
    print('[DCKST] Harmonics: SMODS.current_mod is nil, scoring hooks not installed')
end

-- ---------- card factory ----------
local function harmonic(order, key, def)
    SMODS.Consumable {
        key = key,
        set = 'Harmonic',
        atlas = 'harmonics',
        pos = { x = (order - 1) % 5, y = math.floor((order - 1) / 5) },
        cost = 5,
        unlocked = true,
        discovered = false,
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

-- ---------- the fifteen ----------
harmonic(1, 'attack', {
    extra = { ramp = { 1.25, 1.5, 1.75, 2 } },
    vars = function(ex) return { ex.ramp[1], ex.ramp[2], ex.ramp[3], ex.ramp[4] } end,
    use = function(ex) add_env('attack', { ramp = copy_table(ex.ramp) }) end,
})

harmonic(2, 'decay', {
    extra = { ramp = { 2, 1.7, 1.4, 1.1 } },
    vars = function(ex) return { ex.ramp[1], ex.ramp[2], ex.ramp[3], ex.ramp[4] } end,
    use = function(ex) add_env('decay', { ramp = copy_table(ex.ramp) }) end,
})

harmonic(3, 'sustain', {
    extra = { hands = 3 },
    vars = function(ex) return { ex.hands } end,
    can_use = function() return live_envs() > 0 end,
    use = function(ex)
        for _, e in ipairs(H().envs) do
            if not e.released then e.remaining = e.remaining + ex.hands end
        end
    end,
})

harmonic(4, 'release', {
    can_use = function() return live_envs() > 0 end,
    use = function()
        -- Next hand applies every active effect twice, then all of them end
        for _, e in ipairs(H().envs) do
            if not e.released then
                e.remaining = 1
                e.reps = 2
                e.released = true
            end
        end
    end,
})

harmonic(5, 'delay', {
    extra = { cards = 2 },
    vars = function(ex) return { ex.cards } end,
    can_use = function(ex)
        return G.hand and #G.hand.highlighted >= 1 and #G.hand.highlighted <= ex.cards
    end,
    use = function()
        local targets = {}
        for i, c in ipairs(G.hand.highlighted) do targets[i] = c end
        for _, c in ipairs(targets) do
            if SMODS.Stickers[ECHOED_KEY] then SMODS.Stickers[ECHOED_KEY]:apply(c, true) end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.4,
            func = function()
                for _, c in ipairs(targets) do c:juice_up(0.3, 0.5) end
                play_sound('card1')
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
})

harmonic(6, 'reverb', {
    extra = { echo = 0.5 },
    vars = function(ex) return { ex.echo * 100 } end,
    use = function(ex) add_env('reverb', { echo = ex.echo }) end,
})

harmonic(7, 'compressor', {
    extra = { cut = 0.25 },
    vars = function(ex) return { ex.cut * 100 } end,
    use = function(ex)
        local h = H()
        local cut = ex.cut * take_gain()
        h.compress = math.max(COMPRESSOR_FLOOR, h.compress * (1 - cut))
    end,
})

harmonic(8, 'equalizer', {
    extra = { x = 1.5 },
    vars = function(ex) return { ex.x } end,
    use = function(ex) add_env('equalizer', { x = ex.x }) end,
})

harmonic(9, 'piano_roll', {
    extra = { x = 2 },
    vars = function(ex) return { ex.x } end,
    use = function(ex) add_env('piano_roll', { x = ex.x }) end,
})

harmonic(10, 'volume', {
    extra = { x_chips = 1.5, x_mult = 1.5 },
    vars = function(ex) return { ex.x_chips, ex.x_mult } end,
    use = function(ex) add_env('volume', { x_chips = ex.x_chips, x_mult = ex.x_mult }) end,
})

harmonic(11, 'panning', {
    extra = { x_chips = 1.5, x_mult = 1.25 },
    vars = function(ex) return { ex.x_chips, ex.x_mult } end,
    use = function(ex) add_env('panning', { x_chips = ex.x_chips, x_mult = ex.x_mult }) end,
})

harmonic(12, 'tempo', {
    extra = { hands = 2, discards = 1 },
    vars = function(ex) return { ex.hands, ex.discards } end,
    use = function(ex)
        local h, amp = H(), take_gain()
        h.tempo_hands = h.tempo_hands + ex.hands * amp
        h.tempo_discards = h.tempo_discards + ex.discards * amp
    end,
})

harmonic(13, 'time_signature', {
    extra = { x_mult = 1.5 },
    vars = function(ex) return { ex.x_mult } end,
    use = function(ex) add_env('time_signature', { x_mult = ex.x_mult }) end,
})

harmonic(14, 'waveform', {
    extra = { x = 2 },
    vars = function(ex) return { ex.x } end,
    use = function(ex) add_env('waveform', { x = ex.x }) end,
})

harmonic(15, 'gain', {
    extra = { charges = 2 },
    vars = function(ex) return { ex.charges } end,
    use = function(ex)
        -- Amplifies the next N Harmonics that carry numbers (Sustain, Release, Delay and Gain skip it)
        local h = H()
        h.gain = h.gain + ex.charges
    end,
})