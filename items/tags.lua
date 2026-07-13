SMODS.Tag{
    key = "dexy",
    atlas = 'tags',
    pos = { x = 0, y = 0 },
    discovered = false,
    min_ante = 1,

    in_pool = function(self, args)
        return true
    end,

    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_dckst_jumbo_decksteritical_pack
	end,

    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("d", G.C.DCKST_RED, function()
				local key = "p_dckst_jumbo_decksteritical_pack"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}

SMODS.Tag{
    key = "carcana",
    atlas = 'tags',
    pos = { x = 1, y = 0 },
    discovered = false,
    min_ante = 1,

    in_pool = function(self, args)
        return true
    end,

    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_dckst_mega_carcana_pack_1
	end,

    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep(":3", G.C.DCKST_RED, function()
				local key = "p_dckst_mega_carcana_pack_1"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}

SMODS.Tag{
    key = "claw",
    atlas = 'tags',
    pos = { x = 2, y = 0 },
    discovered = false,
    min_ante = 1,

    in_pool = function(self, args)
        return true
    end,

    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_dckst_jumbo_spectaclaw_pack
	end,

    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep(":3", G.C.DCKST_PERI, function()
				local key = "p_dckst_jumbo_spectaclaw_pack"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}

SMODS.Tag{
    key = "neo",
    atlas = 'tags',
    pos = { x = 3, y = 0 },
    discovered = false,
    min_ante = 1,

    in_pool = function(self, args)
        return true
    end,

    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_dckst_mega_neoarcana_pack_1
	end,

    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.DCKST_TEAL, function()
				local key = "p_dckst_mega_neoarcana_pack_1"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}

SMODS.Tag{
    key = "tramway",
    atlas = 'tags',
    pos = { x = 4, y = 0 },
    discovered = false,
    min_ante = 1,

    in_pool = function(self, args)
        return true
    end,

    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_dckst_mega_tram_pack
	end,

    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.DCKST_NEONGREEN, function()
				local key = "p_dckst_mega_tram_pack"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}

SMODS.Tag {
    key = "phosphy",
	atlas = "tags",
    pos = { x = 5, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_dckst_phosphorescent
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_dckst_phosphorescent", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
    in_pool = function(self, args)
        return G.P_CENTERS["e_dckst_phosphorescent"].discovered
    end
}

SMODS.Tag {
    key = "aether",
	atlas = "tags",
    pos = { x = 0, y = 1 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_dckst_aetherescent
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_dckst_aetherescent", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
    in_pool = function(self, args)
        return G.P_CENTERS["e_dckst_aetherescent"].discovered
    end
}

SMODS.Tag {
    key = "prism",
	atlas = "tags",
    pos = { x = 1, y = 1 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_dckst_prismatic
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_dckst_prismatic", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
    in_pool = function(self, args)
        return G.P_CENTERS["e_dckst_prismatic"].discovered
    end
}

SMODS.Tag {
    key = "woody",
	atlas = "tags",
    pos = { x = 2, y = 1 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_dckst_wooden
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_dckst_wooden", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
    in_pool = function(self, args)
        return G.P_CENTERS["e_dckst_wooden"].discovered
    end
}

SMODS.Tag {
    key = "tax",
    atlas = "tags",
    pos = { x = 3, y = 1 }, 
    config = {},
    loc_txt = {
        name = "Tax Tag",
        text = {
            "Gain {C:money}$0.25{} for every",
            "card in {C:attention}deck{}",
        }
    },

    apply = function(self, tag, context)
        if context.type == "new_blind_choice" then

            local deck_size = #G.playing_cards
            local payout = math.floor(deck_size * 0.25 + 0.5)

            tag:yep( '$$',
                G.C.MONEY,
                function()
                    ease_dollars(payout, true)
                    return true
                end
            )
        end
    end,
}

SMODS.Tag {
    key = "sumeable",
    atlas = "tags",
    pos = { x = 4, y = 1 },
    config = { type = "immediate" },
    apply = function(self, tag, context)
        if context.type == "immediate" then
            tag:yep('+', G.C.GREEN, function()
                -- Add 2 random consumables regardless of space
                for i = 1, 2 do
                    -- Get random consumable type
                    local consumable_pool = {}
                    for k, v in pairs(G.P_CENTER_POOLS["Consumeables"]) do
                        if v.set then
                            table.insert(consumable_pool, v)
                        end
                    end
                    
                    if #consumable_pool > 0 then
                        local selected = pseudorandom_element(consumable_pool, pseudoseed('sumeable'))
                        
                        -- Create the card
                        local card = create_card('Consumeable', G.consumeables, nil, nil, nil, nil, selected.key)
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                    end
                end
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = "top_up_pro_max",
    min_ante = 3,
    pos = { x = 5, y = 1 },
    atlas = "tags",
    config = { spawn_jokers = 2, dollar_mult = 0.8 },
    loc_vars = function(self, info_queue, tag)
        return { vars = { tag.config.spawn_jokers, tag.config.dollar_mult } }
    end,
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            if not G.jokers or (G.jokers.config.card_limit - #G.jokers.cards) < 1 then
                return -- not enough room yet, tag stays and waits; no return value at all
            end

            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true

            local rares_in_posession = { 0 }
            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.rarity == 3 and not rares_in_posession[joker.config.center.key] then
                    rares_in_posession[1] = rares_in_posession[1] + 1
                    rares_in_posession[joker.config.center.key] = true
                end
            end
            local rare_pool_size = #G.P_JOKER_RARITY_POOLS[3]

            tag:yep('+', G.C.RED, function()
                local created = 0
                for _ = 1, tag.config.spawn_jokers do
                    if #G.jokers.cards < G.jokers.config.card_limit
                        and rare_pool_size > (rares_in_posession[1] + created) then
                        SMODS.add_card {
                            set = "Joker",
                            rarity = "Rare",
                            key_append = "dckst_tupm"
                        }
                        created = created + 1
                    end
                end

                ease_dollars(math.floor(G.GAME.dollars * (tag.config.dollar_mult - 1)), true)

                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            -- no `return true` here; evaluate_round expects a table or nil for eval-context tags
        end
    end,
    in_pool = function(self, args)
        return G.P_CENTERS["j_blueprint"].discovered
    end
}

SMODS.Tag {
    key = "fixy",
    min_ante = 4,
    atlas = "tags",
    pos = { x = 0, y = 2 },
    config = { type = "immediate", extra = { cardsmin = 5, cardsmax = 7 } },
    loc_vars = function(self, info_queue, tag)
        return { vars = { tag.config.extra.cardsmin, tag.config.extra.cardsmax } }
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then
            tag:yep('-', G.C.RED, function()
                -- Calculate how many cards to remove (5-7 random)
                local cards_to_remove = pseudorandom('fixy_count', tag.config.extra.cardsmin, tag.config.extra.cardsmax)
                
                -- Get all cards from deck
                local deck_cards = {}
                for i, card in ipairs(G.playing_cards) do
                    if card.area == G.deck then
                        table.insert(deck_cards, card)
                    end
                end
                
                -- Make sure we don't try to remove more cards than we have
                cards_to_remove = math.min(cards_to_remove, #deck_cards)
                
                -- Randomly select cards to remove
                for i = 1, cards_to_remove do
                    if #deck_cards > 0 then
                        local random_index = pseudorandom('fixy_select', 1, #deck_cards)
                        local card_to_remove = table.remove(deck_cards, random_index)
                        
                        -- Animate the card dissolving with a delay
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.15 * (i - 1),
                            blockable = false,
                            func = function()
                                -- Make card visible in center of screen first
                                card_to_remove.T.x = G.ROOM.T.w/2 - G.CARD_W/2
                                card_to_remove.T.y = G.ROOM.T.h/2 - G.CARD_H/2
                                card_to_remove:juice_up(0.3, 0.5)
                                
                                -- Then dissolve it
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.3,
                                    blockable = false,
                                    func = function()
                                        card_to_remove:start_dissolve(nil, nil, 1.6)
                                        return true
                                    end
                                }))
                                return true
                            end
                        }))
                    end
                end
                
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = 'temporahandy',
	atlas = "tags",
    min_ante = 2,
	pos = { x = 1, y = 2 },
    config = { type = 'round_start_bonus', extra = { hands = 1 } },
    loc_vars = function(self, info_queue, tag)
        return { vars = { tag.config.extra.hands } }
    end,
    
    apply = function(self, tag, context)
        if context.type == 'round_start_bonus' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Add 1 to current hands without modifying round_resets
                    ease_hands_played(tag.config.extra.hands)
                    tag:yep('+', G.C.BLUE, function()
                        tag.triggered = true
                        return true
                    end)
                    return true
                end
            }))
        end
    end
}

SMODS.Tag {
    key = 'temporatrashy',
	atlas = "tags",
    min_ante = 2,
	pos = { x = 2, y = 2 },
    config = { type = 'round_start_bonus', extra = { discards = 1 } },
    loc_vars = function(self, info_queue, tag)
        return { vars = { tag.config.extra.discards } }
    end,
    
    apply = function(self, tag, context)
        if context.type == 'round_start_bonus' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Add 1 to current discards without modifying round_resets
                    ease_discard(tag.config.extra.discards)
                    tag:yep('+', G.C.RED, function()
                        tag.triggered = true
                        return true
                    end)
                    return true
                end
            }))
        end
    end
}

SMODS.Tag {
    key = "price",
    pos = { x = 3, y = 2 },
    atlas = "tags",
    config = { discount = 0.5 },
    min_ante = 3,
    loc_vars = function(self, info_queue, tag)
        return { vars = { tag.config.discount * 100 } }
    end,
    apply = function(self, tag, context)
        if context.type == 'shop_final_pass' and G.shop and not G.GAME.dckst_price_tag_active then
            G.GAME.dckst_price_tag_active = tag.config.discount
            tag:yep('+', G.C.MONEY, function()
                if G.shop_jokers and G.shop_booster then
                    for _, card in pairs(G.shop_jokers.cards) do
                        card:set_cost()
                    end
                    for _, booster in pairs(G.shop_booster.cards) do
                        booster:set_cost()
                    end
                end
                if G.shop_vouchers then
                    for _, voucher in pairs(G.shop_vouchers.cards) do
                        voucher:set_cost()
                    end
                end
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

local price_tag_set_cost_ref = Card.set_cost
function Card:set_cost(...)
    price_tag_set_cost_ref(self, ...)
    if G.GAME.dckst_price_tag_active and self.cost and self.cost > 0 then
        self.cost = math.max(1, math.floor(self.cost * (1 - G.GAME.dckst_price_tag_active) + 0.5))
    end
end

local price_tag_end_shop_ref = G.FUNCS.toggle_shop

SMODS.Tag {
    key = "tag",
    atlas = "tags",
    pos = { x = 4, y = 2 },
    apply = function(self, tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.SECONDARY_SET.Tarot, function()
                local tag_key
                for i = 1, 10 do
                    tag_key = SMODS.poll_object({
                        type = 'Tag',
                        seed = 'dckst_tag_tag' .. i,
                    })
                    if tag_key ~= 'tag_tag' then break end
                end
                if tag_key and tag_key ~= 'tag_tag' then
                    add_tag(Tag(tag_key))
                end
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = "combo",
    atlas = "tags",
    pos = { x = 5, y = 2 },
	config = { type = "new_blind_choice" },
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_dckst_dexy" }
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_dckst_carcana" }
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_dckst_neo" }
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_dckst_tramway" }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("4+", G.C.FILTER, function()
				local tags = { "dckst_dexy", "dckst_carcana", "dckst_neo", "dckst_tramway" }
				for i, v in ipairs(tags) do
					local _tag = Tag("tag_" .. v)
					add_tag(_tag)
					if i == 1 then
						tag.triggered = true
						_tag:apply_to_run({ type = "new_blind_choice" })
					end
				end
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}

SMODS.Tag {
    key = "saturn",
    min_ante = 2,
    atlas = "tags",
    pos = { x = 0, y = 3 },
    config = { levels = 5, hand = 'Straight' },
    loc_vars = function(self, info_queue, tag)
        return { vars = { localize(tag.config.hand, 'poker_hands'), tag.config.levels } }
    end,
    apply = function(self, tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            SMODS.upgrade_poker_hands({ from = tag, hands = { tag.config.hand }, level_up = tag.config.levels })
            tag:yep('+', HEX('dd4111'), function()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = "crazy",
    atlas = "tags",
    pos = { x = 1, y = 3 },
    loc_vars = function(self, info_queue)
		info_queue[#info_queue+1] = G.P_CENTERS.j_crazy
		return { vars = {} }
	end,
    apply = function(self, tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('!!', G.C.RED, function()
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        local old_limit = G.jokers.config.card_limit
                        G.jokers.config.card_limit = math.huge

                        local new_joker = create_card(
                            'Joker',
                            G.jokers,
                            nil,
                            nil,
                            nil,
                            nil,
                            'j_crazy'
                        )
                        new_joker:add_to_deck()
                        G.jokers:emplace(new_joker)

                        G.jokers.config.card_limit = old_limit

                        play_sound('timpani')
                        new_joker:juice_up(0.5, 0.5)

                        return true
                    end
                }))

                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        G.CONTROLLER.locks[lock] = nil
                        return true
                    end
                }))

                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = "sextuple",
    min_ante = 5,
    atlas = "tags",
    pos = { x = 2, y = 3 },
    config = { copies = 5 },
    loc_vars = function(self, info_queue, tag)
        return { vars = { tag.config.copies } }
    end,
    apply = function(self, tag, context)
        if context.type == 'tag_add'
            and context.tag.key ~= 'tag_double'
            and context.tag.key ~= 'tag_dckst_sextuple'
            and context.tag.key ~= 'tag_dckst_septuple'
        then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.DARK_EDITION, function()
                if context.tag.ability and context.tag.ability.orbital_hand then
                    G.orbital_hand = context.tag.ability.orbital_hand
                end
                for _ = 1, tag.config.copies do
                    add_tag({ key = context.tag.key })
                end
                G.orbital_hand = nil
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
        end
    end
}

SMODS.Tag {
    key = "septuple",
    min_ante = 6,
    atlas = "tags",
    pos = { x = 3, y = 3 },
    config = { copies = 6 },
    loc_vars = function(self, info_queue, tag)
        return { vars = { tag.config.copies } }
    end,
    apply = function(self, tag, context)
        if context.type == 'tag_add'
            and context.tag.key ~= 'tag_double'
            and context.tag.key ~= 'tag_dckst_sextuple'
            and context.tag.key ~= 'tag_dckst_septuple'
        then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.DARK_EDITION, function()
                if context.tag.ability and context.tag.ability.orbital_hand then
                    G.orbital_hand = context.tag.ability.orbital_hand
                end
                for _ = 1, tag.config.copies do
                    add_tag({ key = context.tag.key })
                end
                G.orbital_hand = nil
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
        end
    end
}

SMODS.Tag {
    key = 'vault',
    atlas = 'tags',
    min_ante = 4,
    pos = { x = 4, y = 3 },
    config = {},
    apply = function(self, tag, context)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        play_sound('timpani')
        tag:yep("+", G.C.MONEY, function()
            return true
        end)
        tag.triggered = true
    end
}

SMODS.Tag {
    key = "h",
    atlas = "tags",
    pos = { x = 5, y = 3 },
    min_ante = 3,
    loc_vars = function(self, info_queue, tag)
        return { vars = { colours = { HEX('bc002d') } } }
    end,
    apply = function(self, tag, context)
        if context.type == 'immediate' then
            if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                tag:yep('H', HEX('bc002d'), function()
                    if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
                        local h_keys = {}
                        for k, v in pairs(G.P_CENTERS) do
                            if v.set == 'Joker' and v.pools and v.pools['H']
                                and (v.unlocked ~= false)
                                and not G.GAME.banned_keys[v.key]
                                and not (G.GAME.used_jokers[v.key] and not next(find_joker("Showman"))) then
                                h_keys[#h_keys + 1] = v.key
                            end
                        end
                        if #h_keys > 0 then
                            local key = pseudorandom_element(h_keys, pseudoseed('dckst_h_tag'))
                            local card = create_card('Joker', G.jokers, nil, nil, nil, nil, key)
                            card:add_to_deck()
                            G.jokers:emplace(card)
                        end
                    end
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
            else
                tag:nope()
            end
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = 'redeeming',
    atlas = 'tags',
    min_ante = 2,
    pos = { x = 0, y = 4 },
    config = {},
    apply = function(self, tag, context)
        local voucher_key = get_next_voucher_key(true)
        local center = G.P_CENTERS[voucher_key]

        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                local card = SMODS.create_card({
                    set = 'Voucher',
                    key = voucher_key,
                    area = G.vouchers, -- the persistent redeemed-voucher area, per the wiki
                })
                card:add_to_deck()
                if center.redeem then center:redeem(card) end
                G.GAME.used_vouchers[voucher_key] = true
                G.vouchers:emplace(card)
                card:start_materialize()
                return true
            end
        }))

        play_sound('timpani')
        tag:yep("+", HEX('ae65ff'), function()
            return true
        end)
        tag.triggered = true
    end
}

SMODS.Tag {
    key = 'lasting',
    atlas = 'tags',
    min_ante = 4, 
    pos = { x = 1, y = 4 }, 
    config = {},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {
            set = "Other",
            key = "dckst_evergreen"
        }
    end,
    apply = function(self, tag, context)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                local card = SMODS.create_card({
                    set = 'Joker',
                    area = G.jokers,
                })
                card:add_sticker('dckst_evergreen', true)
                card:add_to_deck()
                G.jokers:emplace(card)
                card:start_materialize()
                return true
            end
        }))

        play_sound('timpani')
        tag:yep("+", HEX('44f28e'), function()
            return true
        end)
        tag.triggered = true
    end
}

SMODS.Tag {
    key = 'fancy',
    atlas = 'tags',
    min_ante = 2,
    pos = { x = 2, y = 4 },
    config = {},
    apply = function(self, tag, context)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                local pool = {}
                for i = 1, #G.playing_cards do
                    if G.playing_cards[i].ability.effect ~= 'Stone Card' then
                        pool[#pool+1] = G.playing_cards[i]
                    end
                end

                local count = math.floor(#pool * 0.3 + 0.5)

                -- seeded selection without a full shuffle: mark indices via pseudorandom draws
                local remaining = {}
                for i = 1, #pool do remaining[i] = i end

                for n = 1, math.min(count, #pool) do
                    local roll = pseudorandom(pseudoseed('fancy_tag_select'..n))
                    local pick_idx = math.max(1, math.ceil(roll * #remaining))
                    local card_idx = remaining[pick_idx]
                    table.remove(remaining, pick_idx)

                    local card = pool[card_idx]
                    local enhancement_key = SMODS.poll_enhancement({
                        key = 'fancy_tag_enh'..n,
                        guaranteed = true,
                    })
                    if enhancement_key then
                        card:set_ability(G.P_CENTERS[enhancement_key])
                    end
                end

                return true
            end
        }))

        play_sound('timpani')
        tag:yep("+", G.C.FILTER, function()
            return true
        end)
        tag.triggered = true
    end
}

SMODS.Tag {
    key = 'bastet',
    atlas = 'tags',
    min_ante = 3,
    pos = { x = 3, y = 4 },
    config = {},
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            if not G.jokers or #G.jokers.cards < 1 or (G.jokers.config.card_limit - #G.jokers.cards) < 1 then
                return -- not enough jokers or room yet, tag stays and waits
            end

            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true

            local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('dckst_bastet_tag'..G.GAME.round_resets.ante))

            tag:yep('+', G.C.BLUE, function()
                local copied_joker = SMODS.copy_card(chosen_joker,
                    { strip_edition = chosen_joker.edition and chosen_joker.edition.negative }, nil, nil, nil, false)
                copied_joker:start_materialize()

                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
        end
    end
}

SMODS.Tag {
    key = 'beckoning',
    atlas = 'tags',
    pos = { x = 4, y = 4 },
    config = {},
    apply = function(self, tag, context)
        ease_dollars(math.floor(G.GAME.dollars * 3), true)
        play_sound('timpani')
        tag:yep("$", G.C.MONEY, function()
            return true
        end)
        tag.triggered = true
    end
}

SMODS.Tag {
    key = "concierge",
    atlas = "tags",
    pos = {x = 5, y = 4 },
    min_ante = 3,
    config = {type = "store_joker_modify"},
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            -- Verify the target card is a Joker and doesn't already possess an edition
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    
                    -- Dynamically compile a database of every registered edition in the current build
                    local available_editions = {}
                    for _, center in ipairs(G.P_CENTER_POOLS.Edition) do
                        if center.key ~= 'e_base' then
                            table.insert(available_editions, center.key)
                        end
                    end
                    
                    -- Pull a completely random key (e.g., 'e_foil', 'e_dckst_cosmic') with equal odds
                    local chosen_edition = pseudorandom_element(available_editions, pseudoseed('dckst_concierge_shop'))
                    
                    -- Safely apply the edition string directly to the card object
                    context.card:set_edition(chosen_edition, true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                
                tag.triggered = true
                return true
            end
        end
    end
}

SMODS.Tag {
    key = "ledger",
    atlas = "tags",
    pos = { x = 0, y = 5 },
    config = { type = 'immediate' },
    loc_vars = function(self, info_queue, tag)
        local current_hands = G.GAME and G.GAME.round_resets and G.GAME.round_resets.hands or 4
        local current_discards = G.GAME and G.GAME.round_resets and G.GAME.round_resets.discards or 3
        local current_payout = (current_hands * 2) + (current_discards * 1)
        
        return { vars = { current_payout, current_hands, current_discards } }
    end,
    apply = function(self, tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            
            -- Extracting the exact number of hands and discards the player currently possesses
            local hands = G.GAME.round_resets.hands or 4
            local discards = G.GAME.round_resets.discards or 3
            local total_payout = (hands * 2) + (discards * 1)
            
            -- Execute standard money-gain sequence with auditory and visual feedback
            tag:yep('+', G.C.MONEY, function()
                ease_dollars(total_payout)
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = "two",
    pos = { x = 1, y = 5 },
    atlas = "tags",
    config = { type = 'immediate' },
    min_ante = 4,
    loc_vars = function(self, info_queue, tag)
        return { vars = { 2 } }
    end,
    apply = function(self, tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            
            -- Trigger visual activation sequence
            tag:yep('+', G.C.FILTER, function()
                -- Defensive check: Determine which spelling convention the engine is active on
                if G.GAME.consumeable_slots then
                    G.GAME.consumeable_slots = G.GAME.consumeable_slots + 2
                elseif G.GAME.consumable_slots then
                    G.GAME.consumable_slots = G.GAME.consumable_slots + 2
                else
                    -- Fallback: If neither exists, initialize the standard key using the live container limit
                    G.GAME.consumeable_slots = (G.consumeables and G.consumeables.config.card_limit or 2) + 2
                end
                
                -- Synchronize the active live UI container limit using whichever key was populated
                if G.consumeables then
                    G.consumeables.config.card_limit = G.GAME.consumeable_slots or G.GAME.consumable_slots or 4
                end
                
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            
            tag.triggered = true
            return true
        end
    end
}