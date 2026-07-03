SMODS.Back {
    key = 'permission',
    --atlas = 'decks',
    pos = { x = 0, y = 0 },
    config = {
    vouchers = { 'v_dckst_expansionpermit', 'v_dckst_prestigepermit' },
  },
  loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.vouchers[1], set = 'Voucher' },
                         localize { type = 'name_text', key = self.config.vouchers[2], set = 'Voucher' },
            }
        }
end
}

SMODS.Back {
    key = 'decimal',
    --atlas = 'decks',
    pos = { x = 1, y = 0 },
    config = { ante_scaling = 0.75, hands = -1, discards = -1, joker_slot = -1, consumable_slot = -1  },
}

SMODS.Back {
    key = 'hard',
    --atlas = 'decks',
    pos = { x = 2, y = 0 },
    config = { ante_scaling = 1.2, hands = -1, discards = -2, joker_slot = -1, consumable_slot = -1  },
}

SMODS.Back {
    key = 'graceful',
    --atlas = 'decks',
    pos = { x = 3, y = 0 },
    config = { consumable_slot = 2, consumables = { 'c_dckst_abyssinian', 'c_dckst_abyssinian' } },
    loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.consumables[1], set = 'Catarot' },
            colours = { 
            G.C.DCKST_RED
     }
            }
        }
end,
    apply = function(self, back)
        G.GAME.catarot_rate = G.GAME.catarot_rate * 3
    end
}

SMODS.Back {
    key = 'futuristic',
    --atlas = 'decks',
    pos = { x = 0, y = 1 },
    config = { consumable_slot = 1, consumables = { 'c_dckst_collective' } },
    loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.consumables[1], set = 'neotarot' },
            colours = { 
            G.C.DCKST_TEAL
     }
            }
        }
end,
    apply = function(self, back)
        G.GAME.neotarot_rate = G.GAME.neotarot_rate * 3
    end
}

SMODS.Back {
    key = 'rail',
    --atlas = 'decks',
    pos = { x = 1, y = 1 },
    config = { consumables = { 'c_dckst_route_19', 'c_dckst_route_19' } },
    loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.consumables[1], set = 'Route' },
            colours = { 
            G.C.DCKST_NEONGREEN
     }
            }
        }
end,
    apply = function(self, back)
        G.GAME.route_rate = G.GAME.route_rate * 2
    end
}

SMODS.Back {
    key = 'spectacle',
    --atlas = 'decks',
    pos = { x = 2, y = 1 },
    config = { consumables = { 'c_dckst_manekineko' } ,
    extra = {
    start_ante = 1,
    win_ante = 10,
    },
},
loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.consumables, set = 'Spectaclaw' },
            colours = { 
     }
            }
        }
end,
    apply = function(self, back)
        G.GAME.spectaclaw_rate = 2
        G.GAME.win_ante = self.config.extra.win_ante
        G.GAME.round_resets.ante = self.config.extra.start_ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.ante
    end
}

SMODS.Back {
    key = 'fresh',
    --atlas = 'decks',
    pos = { x = 3, y = 1 },

    calculate = function(self, card, context)
        if context.modify_shop_card
        and context.card.config.center.set == 'Joker'
        and not context.card.ability['dckst_evergreen'] then
            local num, denom = SMODS.get_probability_vars('dckst_fresh_evergreen', 1, 6, true)
            if SMODS.pseudorandom_probability(card, 'dckst_fresh_evergreen', num, denom) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.card:add_sticker('dckst_evergreen', true)
                        return true
                    end
                }))
            end
        end
    end,
}

SMODS.Back {
    key = 'gigglers',
    --atlas = 'decks',
    pos = { x = 0, y = 2 },

    calculate = function(self, card, context)
        if context.modify_shop_card
        and context.card.config.center.set == 'Joker'
        and not context.card.ability['dckst_smiley'] then
            local num, denom = SMODS.get_probability_vars('dckst_gigglers_smiley', 1, 4, true)
            if SMODS.pseudorandom_probability(card, 'dckst_gigglers_smiley', num, denom) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.card:add_sticker('dckst_smiley', true)
                        return true
                    end
                }))
            end
        end
    end,
}

SMODS.Back {
    key = 'twin',
    --atlas = 'decks',
    pos = { x = 1, y = 2 },

    loc_txt = {
        name = 'Twin Deck',
        text = {
            'Start with {C:attention}2 copies{}',
            'of each rank, deck has',
            '{C:attention}no face cards{}',
        },
    },

    initial_deck = {
        exclude = true,
        ranks = { 'Jack', 'Queen', 'King' },
    },

    apply = function(self, back)
        local extra_cards = {}
        for _, suit in pairs(SMODS.Suits) do
            if type(suit) == 'table' and suit.card_key then
                local in_pool = type(suit.in_pool) == 'function'
                    and suit:in_pool({ initial_deck = true })
                    or suit.in_pool ~= false
                if in_pool then
                    for _, rank in pairs(SMODS.Ranks) do
                        if type(rank) == 'table' and rank.card_key and not rank.face then
                            extra_cards[#extra_cards + 1] = { s = suit.card_key, r = rank.card_key }
                        end
                    end
                end
            end
        end
        G.GAME.starting_params.extra_cards = extra_cards
    end,
}

SMODS.Back {
    key = 'overclocked',
    --atlas = 'decks',
    pos = { x = 2, y = 2 },

    apply = function(self, back)
        G.GAME.starting_params.hands = (G.GAME.starting_params.hands or 0) + 2
        G.GAME.starting_params.discards = (G.GAME.starting_params.discards or 0) + 2
    end,

    calculate = function(self, back, context)
        if context.modify_hand then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    G.GAME.blind.chips = math.ceil(G.GAME.blind.chips * 1.15)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    SMODS.juice_up_blind()
                    return true
                end
            }))
        end
    end,
}

SMODS.Back {
    key = 'h',
    --atlas = 'decks',
    pos = { x = 3, y = 2 },
    config = { consumables = { 'c_dckst_minuet' } },

    calculate = function(self, back, context)
        if context.modify_weights then
            for _, entry in ipairs(context.pool) do
                local center = G.P_CENTERS[entry.key]
                if center and center.pools and center.pools['H'] then
                    entry.weight = entry.weight * 2
                end
            end
        end
    end,
}

SMODS.Back {
    key = 'microchip',
    --atlas = 'decks',
    pos = { x = 0, y = 3 },

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                    if SMODS.is_playing_card(card)
                    and not SMODS.has_enhancement(card, 'm_dckst_techno') then
                        local num, denom = SMODS.get_probability_vars('dckst_microchip', 1, 5, true)
                        if SMODS.pseudorandom_probability(card, 'dckst_microchip', num, denom) then
                            card:set_ability(G.P_CENTERS['m_dckst_techno'], true, true)
                        end
                    end
                end
                return true
            end
        }))
    end,
}

SMODS.Back {
    key = 'consumer',
    --atlas = 'decks',
    pos = { x = 1, y = 3 },

    config = {
        consumable_slot = 3,
    },

    loc_vars = function(self, info_queue, card)
        return {vars = { colours = { G.C.DCKST_RED, G.C.DCKST_TEAL, G.C.DCKST_NEONGREEN} }}
    end,

    apply = function(self, back)

        local sets = { 'Tarot', 'Planet', 'Catarot', 'neotarot', 'Route' }
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, set in ipairs(sets) do
                    SMODS.add_card({
                        set = set,
                        area = G.consumeables,
                        key_append = 'consumer_start_' .. set,
                    })
                end
                return true
            end
        }))
    end,
}

SMODS.Back {
    key = 'stellation',
    --atlas = 'decks',
    pos = { x = 2, y = 3 },
    config = {
    vouchers = { 'v_dckst_meow', 'v_dckst_new_major', 'v_dckst_double_track', 'v_overstock_norm', 'v_overstock_plus' },
  },
}

SMODS.Back {
    key = 'shopping',
    --atlas = 'decks',
    pos = { x = 3, y = 3 },

    apply = function(self, back)
    G.E_MANAGER:add_event(Event({
        func = function()
            for i = 1, 2 do
                local tag_key = SMODS.poll_object({
                    type = 'Tag',
                    seed = 'dckst_shop_tag' .. i,
                })
                if tag_key then
                    add_tag(Tag(tag_key))
                end
            end
            return true
        end
    }))
end,
}

SMODS.Back {
    key = 'overdraft',
    --atlas = 'decks',
    pos = { x = 0, y = 4 },
    apply = function(self)
        G.GAME.starting_params.dollars = 0
        
        -- Flag the modifier directly for safer verification
        G.GAME.modifiers.overdraft_deck = true
        
        -- Initialize tracking variables
        G.GAME.dckst_overdraft_round = 0
        G.GAME.dckst_overdraft_rerolls_left = 2
    end,
}

if calculate_reroll_cost then
    local dckst_calculate_reroll_cost_ref = calculate_reroll_cost
    
    function calculate_reroll_cost(skip_increment)
        if G.GAME.modifiers.overdraft_deck then
            -- Check if we entered a new round (which means a new shop visit)
            if G.GAME.dckst_overdraft_round ~= G.GAME.round then
                G.GAME.dckst_overdraft_round = G.GAME.round
                G.GAME.dckst_overdraft_rerolls_left = 2
            end
        end

        -- Protocol 1: Preserve Overdraft charges if the player has vanilla free rerolls active.
        if G.GAME.current_round.free_rerolls and G.GAME.current_round.free_rerolls > 0 then
            return dckst_calculate_reroll_cost_ref(skip_increment)
        end

        -- Protocol 2: Apply Overdraft Deck logic if active and charges remain.
        if G.GAME.modifiers.overdraft_deck
            and G.GAME.dckst_overdraft_rerolls_left
            and G.GAME.dckst_overdraft_rerolls_left > 0
        then
            G.GAME.current_round.reroll_cost = 0
            
            -- 'skip_increment' is only false/nil when the player actually executes the reroll.
            if not skip_increment then
                G.GAME.dckst_overdraft_rerolls_left = G.GAME.dckst_overdraft_rerolls_left - 1
            end
            
            -- Return immediately to prevent the base game from silently inflating the underlying cost.
            return
        end
        
        -- Protocol 3: Standard operation if Overdraft charges are exhausted.
        return dckst_calculate_reroll_cost_ref(skip_increment)
    end
end

SMODS.Back {
    key = 'ledeck',
    --atlas = 'decks',
    pos = { x = 1, y = 4 },
    
    -- Phase 1: Modify the starting deck
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                -- Scan all cards in the initial deck
                for _, card in ipairs(G.playing_cards) do
                    if card.base.value == '2' or card.base.value == '3' or card.base.value == '6' then
                        -- Apply the custom LeBronned enhancement
                        card:set_ability(G.P_CENTERS.m_dckst_lebronned, true, nil)
                    end
                end
                return true
            end
        }))
    end,

    -- Phase 2: Inject the X3 Multiplier during scoring
    calculate = function(self, back, context)
        -- We intercept the individual card scoring phase in the play area
        if context.individual and context.cardarea == G.play then
            -- Verify if the scored card is a 2, 3, or 6
            if context.other_card.base.value == '2' or 
               context.other_card.base.value == '3' or 
               context.other_card.base.value == '6' then
                
                return {
                    x_mult = 3,
                    card = context.other_card
                }
            end
        end
    end
}

SMODS.Back {
    key = "inflated",
    --atlas = 'decks',
    pos = { x = 2, y = 4 },
    apply = function(self)
        -- Flagging the modifier so we can detect it globally
        G.GAME.modifiers.inflated_deck = true
    end
}

-- Injecting into the core Card cost calculation
local dckst_card_set_cost_ref = Card.set_cost
function Card:set_cost()
    -- Execute standard cost and sell_cost calculations first
    dckst_card_set_cost_ref(self)
    
    -- If the Inflated Deck is active, apply our multiplier
    if G.GAME and G.GAME.modifiers and G.GAME.modifiers.inflated_deck then
        if self.ability and self.ability.set and self.config and self.config.center then
            local set = self.ability.set
            local is_consumable = self.config.center.consumeable
            
            -- Verify if the card is a Joker or any type of consumable 
            -- (Checks both vanilla sets and dynamically added SMODS consumables)
            if set == 'Joker' or set == 'Tarot' or set == 'Planet' or set == 'Spectral' or is_consumable then
                if self.sell_cost and self.sell_cost > 0 then
                    self.sell_cost = self.sell_cost * 3
                end
            end
        end
    end
end

SMODS.Back {
    name = "Bureaucracy Deck",
    key = "bureaucracy",
    --atlas = 'decks',
    pos = { x = 3, y = 4 },
    
    -- Steamodded natively supports injecting starting vouchers via the config table
    config = { 
        vouchers = { 'v_dckst_double_downer' }
    },
    
    apply = function(self)
        -- Flagging the modifier so we can detect it globally for the price alterations
        G.GAME.modifiers.bureaucracy_deck = true
    end
}

-- Injecting into the core Card cost calculation for the shop economy
local dckst_bur_set_cost_ref = Card.set_cost
function Card:set_cost()
    -- Execute standard cost calculations first (this also sets standard sell values)
    dckst_bur_set_cost_ref(self)
    
    -- If the Bureaucracy Deck is active, apply our economic multipliers
    if G.GAME and G.GAME.modifiers and G.GAME.modifiers.bureaucracy_deck then
        if self.ability and self.ability.set then
            
            -- Protocol 1: Vouchers receive a 50% discount
            if self.ability.set == 'Voucher' then
                self.cost = math.max(1, math.floor(self.cost * 0.5))
                
            -- Protocol 2: All standard shop inventory (Jokers, Consumables, Boosters) incurs a 50% tax
            elseif self.ability.set == 'Joker' 
                or self.ability.set == 'Tarot' 
                or self.ability.set == 'Planet' 
                or self.ability.set == 'Spectral' 
                or self.ability.set == 'Booster' 
                or (self.config and self.config.center and self.config.center.consumeable) then
                
                self.cost = math.max(1, math.floor(self.cost * 1.5))
            end
            
        end
    end
end

SMODS.Back {
    key = "nomad",
    --atlas = 'decks',
    pos = { x = 0, y = 5 },
    apply = function(self)
        -- Flagging the modifier so we can globally detect the deck
        G.GAME.modifiers.nomad_deck = true
    end
}

-- Monkey Patch 1: The Reroll Override
if calculate_reroll_cost then
    local dckst_nomad_calc_reroll_ref = calculate_reroll_cost
    function calculate_reroll_cost(skip_increment)
        if G.GAME.modifiers.nomad_deck then
            -- Contingency: We still respect free rerolls (e.g., Chaos the Clown)
            if G.GAME.current_round.free_rerolls and G.GAME.current_round.free_rerolls > 0 then
                return dckst_nomad_calc_reroll_ref(skip_increment)
            end
            
            -- Force the cost to exactly $2 and bypass standard increment logic entirely
            G.GAME.current_round.reroll_cost = 2
            return 
        end
        
        -- Standard operation if Nomad Deck is not active
        return dckst_nomad_calc_reroll_ref(skip_increment)
    end
end

-- Monkey Patch 2: The Economic Inflation
local dckst_nomad_set_cost_ref = Card.set_cost
function Card:set_cost()
    -- Execute standard vanilla cost calculations first
    dckst_nomad_set_cost_ref(self)
    
    -- If the Nomad Deck is active, apply the global markup
    if G.GAME and G.GAME.modifiers and G.GAME.modifiers.nomad_deck then
        if self.ability and self.ability.set then
            
            -- Targeting all standard purchasable shop inventory
            if self.ability.set == 'Joker' 
                or self.ability.set == 'Tarot' 
                or self.ability.set == 'Planet' 
                or self.ability.set == 'Spectral' 
                or self.ability.set == 'Booster' 
                or self.ability.set == 'Voucher'
                or (self.config and self.config.center and self.config.center.consumeable) then
                
                -- Multiply cost by 2, utilizing math.floor to prevent UI decimal errors
                self.cost = math.max(1, math.floor(self.cost * 2))
            end
            
        end
    end
end

SMODS.Back {
    key = "austerity",
    --atlas = 'decks',
    pos = { x = 1, y = 5 },
    apply = function(self)
        -- Starting in the red. The game engine accepts this natively.
        G.GAME.starting_params.dollars = -50
        
        -- Flagging the modifier so we can globally detect the deck
        G.GAME.modifiers.austerity_deck = true
    end
}

-- Monkey Patch: The Bailout Protocol
local dckst_aust_set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    -- Execute standard vanilla blind initialization first
    dckst_aust_set_blind_ref(self, blind, reset, silent)
    
    -- If the Austerity Deck is active, intercept the base reward and double it
    if G.GAME and G.GAME.modifiers and G.GAME.modifiers.austerity_deck then
        if self.dollars and self.dollars > 0 then
            self.dollars = self.dollars * 2
        end
    end
end

SMODS.Back {
    key = "minimalist",
    --atlas = 'decks',
    pos = { x = 2, y = 5 },
    
    initial_deck = {
        exclude = true,
        ranks = { '2', '3', '4', '5', '6' }
    },
    
    apply = function(self)
        -- Protocol 1: Apply the hand size penalty
        G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size - 1
    end
}

SMODS.Back {
    key = "refined",
    --atlas = 'decks',
    pos = { x = 3, y = 5 },
    
    apply = function(self)
        -- Flagging the modifier globally
        G.GAME.modifiers.refined_deck = true
        
        -- Retroactive Cull: 
        -- Because the starting deck is generated right BEFORE this apply function triggers,
        -- we must retroactively strip the chip values from your initial 52 cards.
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.playing_cards then
                    for _, card in pairs(G.playing_cards) do
                        if not card:is_face() then
                            card.base.nominal = 0
                        end
                    end
                end
                return true
            end
        }))
    end,
    
   calculate = function(self, arg1, arg2)
        local context = arg2 or arg1
        
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_face() then
                -- Face cards trigger the +10 Mult
                return {
                    mult = 10,
                    card = context.other_card
                }
            else
                -- Non-face cards force the UI to acknowledge the 0 chips
                return {
                    message = "+0",
                    colour = G.C.CHIPS,
                    card = context.other_card
                }
            end
        end
    end
}

-- Monkey Patch: The Future Generation Protocol
-- This ensures any new cards you create (e.g., from Standard Packs or Tarot cards)
-- also receive the 0-chip penalty if they are not face cards.
local dckst_refined_set_base_ref = Card.set_base
function Card:set_base(card_type)
    -- Execute standard vanilla generation first
    dckst_refined_set_base_ref(self, card_type)
    
    -- If the Refined Deck is active, strip the base chips from non-face cards
    if G.GAME and G.GAME.modifiers and G.GAME.modifiers.refined_deck then
        if not self:is_face() then
            self.base.nominal = 0
        end
    end
end

SMODS.Back {
    key = "lightbulb",
    --atlas = 'decks',
    pos = { x = 0, y = 6 },
    apply = function(self, back)
        G.GAME.modifiers.lightbulb_deck = true
    end,

    -- Corrected signature: self, back, context
    calculate = function(self, back, context)
        -- Protocol: Trigger payout immediately after a one-shot hand is scored
        if context.after and SMODS.last_hand_oneshot and G.GAME.modifiers.lightbulb_deck then
            
            -- Calculate the 50% bonus to reach the 1.5x total
            -- Using floor to match your requirement for rounding down
            local bonus = math.floor(G.GAME.dollars * 0.5)
            
            -- Inject the payout
            ease_dollars(bonus)
            
        end
    end
}

-- Hook into Blind generation to strip the reward permanently
local dckst_lightbulb_set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    dckst_lightbulb_set_blind_ref(self, blind, reset, silent)
    
    if G.GAME.modifiers.lightbulb_deck then
        -- Force reward to 0
        self.dollars = 0
    end
end

SMODS.Back {
    key = "handy",
    --atlas = 'decks',
    pos = { x = 1, y = 6 },
    config = {
        vouchers = { 'v_dckst_extra_digits', 'v_dckst_ambidextrous' }
    },
    apply = function(self)
        G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size - 1
    end
}

SMODS.Back{
    key = 'fancy',
    --atlas = 'decks',
    pos = { x = 2, y = 6 },
    config = {},
    calculate = function(self, back, context)
        if context.create_shop_card and context.set == 'Joker' then
            local roll = pseudorandom(pseudoseed('dckst_fancy_rarity'))
            return {
                shop_create_flags = {
                    rarity = 0.7 + roll * 0.3 
                }
            }
        end
    end,
}

local metallurgic_keys = {
    'm_dckst_aluminum',
    'm_dckst_potassium',
    'm_dckst_cobalt',
    'm_dckst_molybdenum',
    'm_dckst_iridium',
    'm_dckst_cerium',
}

SMODS.Back{
    key = 'metallurgic',
    --atlas = 'decks',
    pos = { x = 3, y = 6 },
    config = {},
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                for i, card in ipairs(G.playing_cards) do
                    local key = pseudorandom_element(metallurgic_keys, pseudoseed('dckst_metallurgic_' .. i))
                    card:set_ability(G.P_CENTERS[key], nil, true)
                end
                return true
            end
        }))
    end,
}

SMODS.Back{
    key = 'binary',
    --atlas = 'decks',
    pos = { x = 0, y = 7 },
    config = {},
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            delay = 0.15,
            func = function()
                for i, card in ipairs(G.playing_cards) do
                    local suit = pseudorandom_element({ 'Spades', 'Hearts', 'Diamonds', 'Clubs' }, pseudoseed('dckst_binary_suit_' .. i))
                    local rank = (i <= 26) and 'Ace' or '10'
                    assert(SMODS.change_base(card, suit, rank))
                end
                return true
            end
        }))
    end,
}

SMODS.Back {
    key = "marathon",
    name = "Marathon Deck",
    config = {
        scaling_mod = 0.75, 
        win_ante = 12
    },
    --atlas = 'decks',
    pos = { x = 1, y = 7 },

    -- Fires when the run starts with this deck
    apply = function(self)
        -- Set the target win condition
        G.GAME.win_ante = self.config.win_ante
        
        -- Modify the base blind scaling algorithm
        G.GAME.starting_params.ante_scaling = self.config.scaling_mod
    end
}

SMODS.Back {
    key = "monarch",
    -- atlas = 'decks',
    pos = { x = 2, y = 7 },
    
    apply = function(self)
        -- Flagging the modifier globally for the run
        G.GAME.modifiers.monarch_deck = true
    end,
    
    calculate = function(self, arg1, arg2)
        local context = arg2 or arg1
        
        -- Trigger when individual cards are being scored in the played hand
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_face() then
                -- Face cards trigger the X1.5 Mult
                return {
                    x_mult = 1.5,
                    card = context.other_card
                }
            else
                -- Non-face cards apply the X0.7 Mult penalty
                return {
                    x_mult = 0.7,
                    card = context.other_card
                }
            end
        end
    end
}

SMODS.Back {
    key = "blueprint",
    -- atlas = 'decks',
    pos = { x = 3, y = 7 },
    
    apply = function(self)
        -- Flagging the deck's active status in the mainframe
        G.GAME.modifiers.blueprint_deck = true
    end,
    
    calculate = function(self, arg1, arg2)
        local context = arg2 or arg1
        
        -- Trigger sequence upon successfully defeating a Blind
        if context.end_of_round and not context.individual and not context.repetition then
            
            -- Calculating available telemetry space for new Jokers
            local available_space = G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer)
            local jokers_to_spawn = math.min(3, available_space)
            
            if jokers_to_spawn > 0 then
                -- Lock the buffer to prevent asynchronous over-spawning
                G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_spawn
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i = 1, jokers_to_spawn do
                            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'blp_deck')
                            card:add_to_deck()
                            G.jokers:emplace(card)
                            card:start_materialize()
                        end
                        -- Release the buffer once materialized
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
            end
        end
    end
}

-- System Override: The Shop Exclusion Protocol
-- We must monkey patch the core generation function to enforce the shop ban.
local original_create_card = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    
    -- If the Blueprint Deck is active, monitor shop supply lines
    if G.GAME and G.GAME.modifiers and G.GAME.modifiers.blueprint_deck then
        -- Reroute Joker spawn requests in the shop to output Tarot cards instead
        if _type == 'Joker' and (area == G.shop_jokers or area == G.shop) then
            _type = 'Tarot'
        end
    end
    
    -- Proceed with the standard generation matrix using the filtered parameters
    return original_create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
end