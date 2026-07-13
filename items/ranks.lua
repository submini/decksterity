-- helpers/rank_pool.lua (or wherever your shared utils live)
local dckst = SMODS.current_mod

function setPoolRankFlagEnable(rank, isEnable)
    if not G.GAME or G.GAME.pool_flags[rank] == isEnable then return end
    G.GAME.pool_flags[rank] = isEnable
end

function getPoolRankFlagEnable(rank)
    return (G.GAME and G.GAME.pool_flags[rank]) or false
end

local function dckst_rankCheck(self, args)
    if args and args.initial_deck then
        return false
    end
    return getPoolRankFlagEnable(self.key)
end

SMODS.Rank {
    hc_atlas = 'rank20_hi',
    lc_atlas = 'rank20',

    hidden = true,

    key = '20',
    card_key = '20',
    pos = { x = 0 },
    nominal = 20,

    next = { '2' },

    shorthand = '20',

    straight_edge = false,

    in_pool = dckst_rankCheck,
}

SMODS.Ranks['Ace'].next = { 'dckst_20', '2' }