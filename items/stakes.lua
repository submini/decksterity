local set_cost_ref = Card.set_cost
function Card.set_cost(self)
    set_cost_ref(self)  -- vanilla logic runs first; self.cost is now the baseline

    if  G.GAME
    and G.GAME.modifiers.dandy_booster_per_ante
    and self.ability
    and self.ability.set == 'Booster'
    then
        -- G.GAME.round_resets.ante holds the current ante number (1–8)
        self.cost = self.cost + (G.GAME.round_resets.ante or 0)
    end
end

SMODS.Stake({
    key = 'dandy',
    pos = { x = 0, y = 0 },
    sticker_pos = { x = 0, y = 0 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

    applied_stakes = { 'blue' },
    above_stake = 'stake_blue',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX('FFCC00'),

    modifiers = function(self)
        G.GAME.modifiers.dandy_booster_per_ante = true
    end,
})

SMODS.Stake {
    key = "feline",
    applied_stakes = { 'blue' },
    above_stake = 'stake_dckst_dandy',
    pos = { x = 1, y = 0 },
    sticker_pos = { x = 1, y = 0 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = G.C.DCKST_RED,

    modifiers = function()
        G.GAME.modifiers.dckst_spawn_zoomy = true
    end,
}

SMODS.Stake {
    key = "chroma",
    applied_stakes = { 'purple', 'dckst_feline' },
    above_stake = 'stake_purple',
    pos = { x = 2, y = 0 },
    sticker_pos = { x = 2, y = 0 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX('126f3a'),

    modifiers = function()
        G.GAME.edition_rate = G.GAME.edition_rate * 0.1
        return true
    end,
}

SMODS.Stake {
    key = "clay",
    applied_stakes = { 'gold', 'dckst_chroma' },
    above_stake = 'stake_gold',
    pos = { x = 3, y = 0 },
    sticker_pos = { x = 3, y = 0 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX('999999'),

    calculate = function(self, context)
        -- Trigger when the blind is actively selected
        if context.setting_blind then
            
            -- Enqueue an event so the card addition happens smoothly
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    -- 1. Generate a random front for the card using a seeded pool
                    local front = pseudorandom_element(G.P_CARDS, pseudoseed('clay_stake_card'))
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    
                    -- 2. Spawn the card unenhanced (c_base) in the middle of the screen
                    local card = Card(
                        G.play.T.x + G.play.T.w/2 - G.CARD_W/2, 
                        G.play.T.y + G.play.T.h/2 - G.CARD_H/2, 
                        G.CARD_W, 
                        G.CARD_H, 
                        front, 
                        G.P_CENTERS.c_base, 
                        {playing_card = G.playing_card}
                    )
                    
                    card:start_materialize()
                    G.play:emplace(card)
                    table.insert(G.playing_cards, card)
                    
                    -- 3. Flip animation and sound effect
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function() 
                            card:flip()
                            play_sound('card1', 1)
                            card:juice_up(0.3, 0.3)
                            return true 
                        end 
                    }))
                    
                    -- 4. Move the newly created card out of the play area and into the deck
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5,
                        func = function() 
                            G.play:remove_card(card)
                            card:add_to_deck()
                            G.deck:emplace(card)
                            return true
                        end 
                    }))
                    
                    return true
                end
            }))
        end
    end
}

SMODS.Stake {
    key = "storm",
    applied_stakes = { 'gold' },
    above_stake = 'stake_dckst_clay',
    pos = { x = 4, y = 0 },
    sticker_pos = { x = 0, y = 1 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("495969"),
    calculate = function(self, context)
        -- Debuff the hand if no duplicates are detected
        if context.debuff_hand then
            if not DCKST.has_duplicate_ranks(context.full_hand) then
                return {
                    debuff = true,
                    debuff_text = localize('k_dckst_storm_stake_warning'),
                }
            end
        end
    end
}

SMODS.Stake {
    key = "fall",
    applied_stakes = { 'dckst_clay' },
    above_stake = 'stake_dckst_storm',
    pos = { x = 0, y = 1 },
    sticker_pos = { x = 1, y = 1 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("b45f06"),

    modifiers = function()
        G.GAME.modifiers.dckst_spawn_deciduous = true
    end,
}

SMODS.Stake {
    key = "cuprum",
    applied_stakes = { 'dckst_clay' },
    above_stake = 'stake_dckst_fall',
    pos = { x = 1, y = 1 },
    sticker_pos = { x = 2, y = 1 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

    prefix_config = {
        above_stake = { mod = false },
        applied_stakes = { mod = false },
    },

    colour = HEX("c9744f"),

    calculate = function(self, context)
        if context.setting_blind then
            G.GAME.round_resets.reroll_cost =
                G.GAME.base_reroll_cost + (G.GAME.round_resets.ante or 1)

            G.GAME.current_round.reroll_cost =
                G.GAME.round_resets.reroll_cost
        end
    end
}

SMODS.Stake {
    key = "silver",
    applied_stakes = { 'dckst_fall' },
    above_stake = 'stake_dckst_cuprum',
    pos = { x = 2, y = 1 },
    sticker_pos = { x = 3, y = 1 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',
    

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("c4c4c4"),

    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
    end,
}

SMODS.Stake {
    key = "hollow",
    applied_stakes = { 'dckst_fall' },
    above_stake = 'stake_dckst_silver',
    pos = { x = 3, y = 1 },
    sticker_pos = { x = 0, y = 2 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("202020"),

    calculate = function (self, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.config.center.key then
                
                return {
                    x_mult = 0.9,
                    x_chips = 0.95,
                    card = context.other_card
                }
            end
        end
    end
}

SMODS.Stake {
    key = "solar",
    applied_stakes = { 'dckst_silver' },
    above_stake = 'stake_dckst_hollow',
    pos = { x = 4, y = 1 },
    sticker_pos = { x = 1, y = 2 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("FFDD47"),

    calculate = function(self, context)
        -- context.setting_blind fires once per round, right when a new blind is selected
        if context.setting_blind then
            -- Initialise our own round counter on first use
            if not G.GAME.solar_stake_rounds then
                G.GAME.solar_stake_rounds = 0
            end
 
            G.GAME.solar_stake_rounds = G.GAME.solar_stake_rounds + 1
 
            if G.GAME.solar_stake_rounds % 3 == 0 then
                -- Snapshot cards first so dissolving doesn't mutate the list mid-loop
                local to_destroy = {}
                if G.consumeables and G.consumeables.cards then
                    for _, card in ipairs(G.consumeables.cards) do
                        to_destroy[#to_destroy + 1] = card
                    end
                end
 
                if #to_destroy > 0 then
                    -- "Solar Flare!" notification
                    G.E_MANAGER:add_event(Event({
                        trigger = "immediate",
                        func = function()
                            attention_text({
                                text   = localize('k_dckst_solar_flare'),
                                scale  = 1.3,
                                hold   = 2,
                                colour = G.C.RED,
                                align  = "cm",
                                offset = { x = 0, y = -2.7 },
                                major  = G.play,
                            })
                            return true
                        end,
                    }))
 
                    -- Dissolve each consumable with a small stagger
                    for i, card in ipairs(to_destroy) do
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay   = 0.15 * i,
                            func    = function()
                                -- card:start_dissolve() is the correct removal method
                                if card and card.T then
                                    card:start_dissolve(nil, true)
                                end
                                return true
                            end,
                        }))
                    end
                end
            end
        end
    end,
 
    -- Reset our counter when a new run starts
    modifiers = function(self)
        G.GAME.solar_stake_rounds = 0
    end,
}

SMODS.Stake {
    key = "lunar",
    colour = HEX("A0C0FF"), 
    applied_stakes = { 'dckst_silver' },
    above_stake = 'stake_dckst_solar',
    pos = { x = 0, y = 2 },
    sticker_pos = { x = 2, y = 2 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },

    calculate = function(self, context)
        local blind = G.GAME.blind
 
        if context.blind_disabled then
            for i = 1, #G.hand.cards do
                if G.hand.cards[i].facing == 'back' then
                    G.hand.cards[i]:flip()
                end
            end
            for _, playing_card in pairs(G.playing_cards) do
                playing_card.ability.lunar_flipped = nil
            end
        end
 
        if not blind or blind.disabled then return end
 
        if context.stay_flipped and context.to_area == G.hand and
            SMODS.pseudorandom_probability(blind, 'lunar_stake_flip', 1, 8, true) then
            return {
                stay_flipped = true
            }
        end
    end,

    modifiers = function(self)
        -- nothing to initialise, but required placeholder keeps parity with Solar Stake
    end,
}

SMODS.Stake {
    key = "satellite",
    applied_stakes = { 'dckst_silver' },
    above_stake = 'stake_dckst_lunar',
    pos = { x = 1, y = 2 },
    sticker_pos = { x = 3, y = 2 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("80FFCC"),

    calculate = function(self, context)
        -- Un-debuff the previously debuffed joker when the blind ends (beat or skip)
        if context.blind_disabled or context.beat_boss then
            if G.GAME.satellite_debuffed_joker_id then
                for _, card in ipairs(G.jokers.cards) do
                    if card.sort_id == G.GAME.satellite_debuffed_joker_id then
                        card:set_debuff(false)
                        break
                    end
                end
                G.GAME.satellite_debuffed_joker_id = nil
            end
        end
 
        -- Debuff the leftmost joker when a new blind is selected
        if context.setting_blind then
            -- Un-debuff previous target first (in case it wasn't cleared, e.g. on skip)
            if G.GAME.satellite_debuffed_joker_id then
                for _, card in ipairs(G.jokers.cards) do
                    if card.sort_id == G.GAME.satellite_debuffed_joker_id then
                        card:set_debuff(false)
                        break
                    end
                end
                G.GAME.satellite_debuffed_joker_id = nil
            end
 
            if G.jokers and #G.jokers.cards > 0 then
                local target = G.jokers.cards[1]  -- leftmost = index 1
                target:set_debuff(true)
                target:juice_up(0.3, 0.3)
                play_sound('tarot2')
                G.GAME.satellite_debuffed_joker_id = target.sort_id
            end
        end
    end,
 
    modifiers = function(self)
        G.GAME.satellite_debuffed_joker_id = nil
    end,
}

local orig_set_cost = Card.set_cost
function Card.set_cost(self, ...)
    orig_set_cost(self, ...)  -- run vanilla logic first
    if G.GAME and G.GAME.platina_stake_active
        and self.ability and self.ability.set == 'Joker' then
        self.sell_cost = 0
    end
end

SMODS.Stake {
    key = "platina",
    applied_stakes = { 'dckst_lunar' },
    above_stake = 'stake_dckst_satellite',
    pos = { x = 2, y = 2 },
    sticker_pos = { x = 0, y = 3 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("E8E8FF"),

    modifiers = function(self)
        G.GAME.platina_stake_active = true
    end,
}

SMODS.Stake {
    key = "bismuth",
    applied_stakes = { 'dckst_lunar' },
    above_stake = 'stake_dckst_platina',
    pos = { x = 3, y = 2 },
    sticker_pos = { x = 1, y = 3 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("C080FF"),

    modifiers = function()
		G.GAME.win_ante = 12
	end,
}

SMODS.Stake {
    key = "solitaire",
    applied_stakes = { 'dckst_platina' },
    above_stake = 'stake_dckst_bismuth',
    pos = { x = 4, y = 2 },
    sticker_pos = { x = 2, y = 3 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("51cfa7"),

    modifiers = function()
        G.GAME.modifiers.dckst_spawn_halved = true
    end,
}

SMODS.Stake {
    key = "h",
    applied_stakes = { 'dckst_platina' },
    above_stake = 'stake_dckst_solitaire',
    pos = { x = 0, y = 3 },
    sticker_pos = { x = 3, y = 3 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("bc002d"),

    calculate = function(self, context)
        -- context.setting_blind fires once per round, right when a new blind is selected
        if context.setting_blind then
            -- Initialise our own round counter on first use
            if not G.GAME.h_stake_rounds then
                G.GAME.h_stake_rounds = 0
            end

            G.GAME.h_stake_rounds = G.GAME.h_stake_rounds + 1

            if G.GAME.h_stake_rounds % 8 == 0 then
                -- Snapshot valid cards from the main deck matrix
                local valid_cards = {}
                if G.playing_cards then
                    for _, card in ipairs(G.playing_cards) do
                        if not card.removed then
                            valid_cards[#valid_cards + 1] = card
                        end
                    end
                end

                if #valid_cards > 0 then
                    G.E_MANAGER:add_event(Event({
                        trigger = "immediate",
                        func = function()
                            attention_text({
                                text   = localize('k_dckst_cards_removed'),
                                scale  = 1.3,
                                hold   = 2,
                                colour = G.C.RED,
                                align  = "cm",
                                offset = { x = 0, y = -2.7 },
                                major  = G.play,
                            })
                            return true
                        end,
                    }))

                    -- Select exactly 8 random cards (or fewer if the deck is dangerously depleted)
                    local to_destroy = {}
                    local cards_to_remove = math.min(8, #valid_cards)
                    
                    for i = 1, cards_to_remove do
                        -- Utilizing standard pseudorandom seeding to preserve run integrity
                        local idx = math.floor(pseudorandom('h_stake_decay') * #valid_cards) + 1
                        local chosen_card = table.remove(valid_cards, idx)
                        if chosen_card then
                            to_destroy[#to_destroy + 1] = chosen_card
                        end
                    end

                    -- Dissolve each targeted deck card with a slight staggered delay
                    for i, card in ipairs(to_destroy) do
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay   = 0.15 * i,
                            func    = function()
                                if card and card.T then
                                    card:start_dissolve(nil, true)
                                end
                                return true
                            end,
                        }))
                    end
                end
            end
        end
    end,

    -- Reset the tracking parameter when a fresh operational run is initialized
    modifiers = function(self)
        G.GAME.h_stake_rounds = 0
    end,
}

SMODS.Stake {
    key = "atomic",
    applied_stakes = { 'dckst_platina' },
    above_stake = 'stake_dckst_h',
    pos = { x = 1, y = 3 },
    sticker_pos = { x = 0, y = 4 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("FF9966"),

    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 3
    end,
}

-- Intercept the global card creation matrix
local create_card_ref = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    -- Execute standard card creation first to generate the base object
    local card = create_card_ref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    
    -- Verify the Jimbo Stake protocol is active and the generated card is a Joker
    if G.GAME.modifiers.jimbo_stake and card and card.ability and card.ability.set == 'Joker' then
        
        -- Target only the shop and booster pack sectors
        if area == G.shop_jokers or area == G.pack_cards then
            
            -- Prevent recursive overriding if the game naturally spawned a Jimbo
            if card.config.center.key ~= 'j_joker' then
                
                -- Calculate the 1 in 5 (20%) probability parameter
                if pseudorandom('jimbo_stake_chance') < 0.2 then
                    -- Override the card's center core with the standard Jimbo
                    card:set_ability(G.P_CENTERS['j_joker'])
                end
            end
        end
    end
    
    return card
end

SMODS.Stake {
    key = "jimbo",
    applied_stakes = { 'dckst_platina' },
    above_stake = 'stake_dckst_atomic',
    pos = { x = 2, y = 3 },
    sticker_pos = { x = 1, y = 4 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("fda200"),

    modifiers = function(self)
        G.GAME.modifiers.jimbo_stake = true
    end,
}

SMODS.Stake {
    key = "antimatter",
    applied_stakes = { 'dckst_solitaire' },
    above_stake = 'stake_dckst_jimbo',
    pos = { x = 3, y = 3 },
    sticker_pos = { x = 2, y = 4 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',
    

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("20124d"),

    modifiers = function(self)
        if G.GAME and G.GAME.starting_params then
            G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 2
        end
    end,
}

local card_calc_ref = Card.calculate_joker
function Card:calculate_joker(context)
    -- Allow the card to perform its standard calculation first
    local ret = card_calc_ref(self, context)

    -- Verify the stake is active and the card is not currently debuffed
    if G.GAME.modifiers.shattered_stake and not self.debuff then
        
        -- PHASE 1: PLAYING CARDS
        -- Balatro explicitly passes 'context.destroying_card' during the scoring sequence
        if context.destroying_card then
            -- If the card already decided to shatter (e.g., it is actually a Glass card), preserve that state
            if ret then return ret end
            
            -- 1 in 3 chance, factoring in probability modifiers like Oops! All 6s
            if pseudorandom('shatter_card') < 1 / 3 then
                return true -- Returning true directly interfaces with Balatro's native glass shatter animation
            end
        end

        -- PHASE 2: JOKERS
        -- If a Joker returns a populated table, it has successfully "triggered" an effect
        if self.ability.set == 'Joker' and ret and type(ret) == 'table' then
            -- A failsafe to prevent the game from attempting to dissolve the Joker multiple times in one frame
            if not self.shattered_stake_queued then
                
                -- 1 in 3 chance to shatter on trigger
                if pseudorandom('shatter_joker') < 1 / 3 then
                    self.shattered_stake_queued = true
                    
                    -- Queue the destruction immediately after the trigger animation completes
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.25,
                        func = function()
                            self:start_dissolve({G.C.RED})
                            return true
                        end
                    }))
                end
            end
        end
    end

    return ret
end

SMODS.Stake {
    key = "shattered",
    applied_stakes = { 'dckst_solitaire' },
    above_stake = 'stake_dckst_antimatter',
    pos = { x = 4, y = 3 },
    sticker_pos = { x = 3, y = 4 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("96C8D9"),

    modifiers = function(self)
        G.GAME.modifiers.shattered_stake = true
    end,
}

local end_round_ref = end_round
function end_round()
    end_round_ref()

    if G.GAME.modifiers.exalted_stake and not G.GAME.game_over then
        if G.GAME.blind and G.GAME.blind:get_type() == 'Boss' then
            if G.GAME.round_resets.ante % 2 == 0 then
                
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.0, 
                    func = function()
                        local current_money = G.GAME.dollars
                        local is_talisman = (type(current_money) == 'table' and to_big)
                        local safe_zero = is_talisman and to_big(0) or 0
                        
                        if current_money > safe_zero then
                            local deduction
                            
                            -- Calculate and explicitly ASSIGN the floored value
                            if is_talisman then
                                deduction = current_money * to_big(0.67)
                                if deduction.floor then 
                                    deduction = deduction:floor() -- Correct assignment for BigNum
                                end
                            else
                                deduction = math.floor(current_money * 0.67)
                            end
                            
                            if deduction > safe_zero then
                                local subtraction = is_talisman and (deduction * to_big(-1)) or -deduction
                                ease_dollars(subtraction)
                                
                                -- Explicitly ASSIGN the floored bank balance after tax injection
                                if is_talisman then
                                    if G.GAME.dollars.floor then 
                                        G.GAME.dollars = G.GAME.dollars:floor() -- Correct assignment for BigNum
                                    end
                                else
                                    G.GAME.dollars = math.floor(G.GAME.dollars)
                                end
                                
                                -- Clean any residual formatting symbols from the UI readout
                                local disp_string = string.gsub(tostring(deduction), "%.0$", "")
                                
                                attention_text({
                                    text = "-$" .. disp_string .. localize('k_dckst_exalted'),
                                    scale = 1.2,
                                    hold = 2.5,
                                    colour = G.C.RED,
                                    align = "cm",
                                    offset = { x = 0, y = -2 },
                                    major = G.play,
                                })
                                play_sound('tarot1') 
                            end
                        end
                        return true
                    end
                }))
            end
        end
    end
end

SMODS.Stake {
    key = "exalted",
    applied_stakes = { 'dckst_solitaire' },
    above_stake = 'stake_dckst_shattered',
    pos = { x = 0, y = 4 },
    sticker_pos = { x = 0, y = 5 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("FFD700"),

    modifiers = function(self)
        G.GAME.modifiers.exalted_stake = true
    end,
}

SMODS.Stake {
    key = "continual",
    applied_stakes = { 'dckst_solitaire' },
    above_stake = 'stake_dckst_exalted',
    pos = { x = 1, y = 4 },
    sticker_pos = { x = 1, y = 5 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("00C853"),

    modifiers = function()
		G.GAME.win_ante = 16
	end,
}

SMODS.Stake {
    key = "universal",
    applied_stakes = { 'dckst_antimatter' },
    above_stake = 'stake_dckst_continual',
    pos = { x = 2, y = 4 },
    sticker_pos = { x = 2, y = 5 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("1E4ED8"),

    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 2
    end,
}

SMODS.Stake {
    key = "nebular",
    applied_stakes = { 'dckst_antimatter' },
    above_stake = 'stake_dckst_universal',
    pos = { x = 3, y = 4 },
    sticker_pos = { x = 3, y = 5 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("E040FB"),

    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 50
    end,
}

SMODS.Stake {
    key = "penultimate",
    applied_stakes = { 'dckst_antimatter' },
    above_stake = 'stake_dckst_entropic',
    pos = { x = 4, y = 4 },
    sticker_pos = { x = 0, y = 6 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

    prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("BC6C25"),

    -- Adjust the structural shop limits at the inception of the run
    modifiers = function(self)
        if G.GAME and G.GAME.shop_settings then
            -- Directly downscales the baseline shop card slots from 2 down to 1
            -- Enforces a lower boundary of 1 so the shop never entirely breaks
            G.GAME.shop_settings.joker_max = math.max(1, G.GAME.shop_settings.joker_max - 1)
        end
    end,
}

SMODS.Stake {
    key = "ultimate",
    applied_stakes = { 'dckst_universal' },
    above_stake = 'stake_dckst_penultimate',
    pos = { x = 0, y = 5 },
    sticker_pos = { x = 1, y = 6 },

    atlas = 'stakes',
    sticker_atlas = 'stakestickers',

     prefix_config = {
        above_stake     = { mod = false },
        applied_stakes  = { mod = false },
    },
    colour = HEX("000000"),

    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 5
    end,
}