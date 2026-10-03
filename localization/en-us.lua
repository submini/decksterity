return {
    descriptions = {
        Back = {
            b_dckst_permission = {
                name = "Permission Deck",
                text = {
                    'Start with {C:attention,T:v_dckst_expansionpermit}Expansion Permit{}',
                    'and {C:attention,T:v_dckst_prestigepermit}Prestige Permit{}'
                }
            },
            b_dckst_decimal = {
                name = "Decimal Deck",
                text = {
                    "{X:attention,C:white}X0.75{} all blind requirements,",
                    "{C:red}-1 Discard{}, {C:red}-1{} {C:blue}Hand{},",
                    "{C:red}-1{} Joker slot,",
                    "{C:red}-1{} Consumable slot"
                }
            },
            b_dckst_hard = {
                name = "Hard Deck",
                text = {
                    "{X:attention,C:white}X1.2{} all blind requirements,",
                    "{C:red}-2 Discards{}, {C:red}-1{} {C:blue}Hand{},",
                    "{C:red}-1{} Joker slot,",
                    "{C:red}-1{} Consumable slot"
                }
            },
            b_dckst_graceful = {
                name = "Graceful Deck",
                text = {
                    "Start run with 2 copies of",
                    "{V:1,T:c_dckst_abyssinian}Abyssinian{} and {C:attention}4{} consumable",
                    "slots. {V:1}Catarots{} appear {B:1,C:white}X3{} as",
                    "often in shop"
                }
            },
            b_dckst_futuristic = {
                name = "Futuristic Deck",
                text = {
                    "Start run with {V:1,T:c_dckst_collective}COLLECTIVE.{}",
                    "and {C:attention}4{} consumable slots.",
                    "{V:1}Neo-Tarots{} appear {B:1,C:white}X3{} as",
                    "often in shop"
                }
            },
            b_dckst_rail = {
                name = "Rail Deck",
                text = {
                    'Start run with 2',
                    'copies of {V:1,T:c_dckst_route_19}Route 19{},',
                    "{V:1}Routes{} appear {B:1,C:white}X2{} as",
                    "often in shop"
                }
            },
            b_dckst_spectacle = {
            name = "Spectacle Deck",
            text = {
                "Start run with a {C:dckst_spectaclaw,T:c_dckst_manekineko}maneki-neko!{},",
                "{C:dckst_spectaclaw}Spectaclaw{} cards may",
                "appear in shop,",
                "Win at {C:attention}Ante 10{}"
                }
            },
            b_dckst_fresh = {
                name = 'Fresh Deck',
                text = {
                    'Jokers in the shop have',
                    'a fixed {C:green}1 in 6{} chance to',
                    'get an {C:attention,T:dckst_evergreen}Evergreen{} sticker',
                },
            },
             b_dckst_gigglers = {
                name = 'Giggler\'s Deck',
                text = {
                    'Jokers in the shop have',
                    'a fixed {C:green}1 in 4{} chance to',
                    'get a {C:attention}Smiley{} sticker',
                    -- T:dckst_smiley later
                },
            },
            b_dckst_twin = {
                name = 'Twin Deck',
                text = {
                    'Start run with {C:attention}2{} copies',
                    'of each rank, deck',
                    'has {C:red}no face cards{}'
                }
            },
            b_dckst_overclocked = {
                name = 'Overclocked Deck',
                text = {
                    '{C:blue}+2{} Hands and {C:red}+2{} Discards',
                    'per round, required chips',
                    'increase by {C:attention}15%{} before',
                    'each hand played',
                }
            },
            b_dckst_h = {
                name = 'H Deck',
                text = {
                    'Every {C:attention}number card{} in deck',
                    'start as {C:enhanced,T:m_dckst_h}H Cards{},',
                    'start run with {C:attention,T:c_dckst_minuet}Minuet{}'
                }
            },
            b_dckst_microchip = {
                name = "Microchip Deck",
                text = {
                    'All cards in deck have a fixed',
                    '{C:green}1 in 5{} chance to start',
                    'as {C:attention,T:m_dckst_techno}Techno{} cards',
                }
            },
            b_dckst_consumer = {
                name = 'Consumer Deck',
                text = {
                    'Start with {C:attention}5{} consumable slots',
                    'and {C:attention}1{} random card from each:',
                    '{C:tarot}Tarot{}, {C:planet}Planet{}, {V:1}Catarot{},',
                    '{V:2}Neo-Tarot{}, and {V:3}Route{}',
                }
            },
            b_dckst_stellation = {
                name = "Stellation Deck",
                text = {
                    'Start with {C:attention,T:v_dckst_meow}meow!{},',
                    '{C:attention,T:v_dckst_new_major}New Major{}, {C:attention,T:v_dckst_double_track}Double Track{},',
                    '{C:attention,T:v_overstock_norm}Overstock{}, and {C:attention,T:v_overstock_plus}Overstock Plus{}'
                }
            },
            b_dckst_shopping = {
                name = "Shopping Deck",
                text = {
                    'Start run with',
                    '{C:attention}2{} random tags',
                }
            },
            b_dckst_overdraft = {
                name = "Overdraft Deck",
                text = {
                    '{C:money}Start{} with {C:money}$2{}',
                    'The first {C:attention}3{} shop',
                    '{C:attention}rerolls{} are {C:money}free{}',
                }
            },
            b_dckst_ledeck = {
                name = 'LeDeck',
                text = {
                    "All {C:attention}2s{}, {C:attention}3s{}, and {C:attention}6s{}",
                    "start as {C:enhanced,T:m_dckst_lebronned}LeBronned Cards{}",
                    "and give {X:mult,C:white} X3 {} Mult when scored"
                }
            },
            b_dckst_inflated = {
                name = "Inflated Deck",
                text = {
                    "Sell value of all {C:attention}Jokers{}",
                    "and {C:attention}Consumables{} are {C:money,s:1.1,E:1}tripled{}"
                }
            },
            b_dckst_bureaucracy = {
                name = "Bureaucracy Deck",
                text = {
                    "Start with {C:attention,T:v_dckst_double_downer}Double Downer{}",
                    "{C:attention}Vouchers{} are {C:green}half price{}",
                    "All other items are {X:attention,C:white}X1.5{} more expensive"
                }
            },
            b_dckst_nomad = {
                name = "Nomad Deck",
                text = {
                    "Every reroll costs {C:money}$2{}",
                    "Every shop item is",
                    "{X:attention,C:white}X2{} more expensive",
                    "{C:inactive}(Sell value unaffected){}"
                }
            },
            b_dckst_austerity = {
                name = "Austerity Deck",
                text = {
                    "Start with {C:red}$-50{}",
                    "Blinds give {X:money,C:white}X2{} more",
                    "reward money"
                }
            },
            b_dckst_minimalist = {
                name = "Minimalist Deck",
                text = {
                    "All ranks lower than {C:attention}7{} are",
                    "removed from the deck",
                    "{C:red}-1{} hand size"
                }
            },
            b_dckst_refined = {
                name = "Refined Deck",
                text = {
                    "{C:attention}Face cards{} also give",
                    "{C:mult}+10{} Mult when scored",
                    "All other ranks have",
                    "{C:chips}+0{} base chips"
                }
            },
            b_dckst_lightbulb = {
                name = "Lightbulb Deck",
                text = {
                    '{C:attention,E:2,s:1.1}One-shotting{} a Blind yields',
                    '{X:money,C:white}X$1.5{}, Blinds give no',
                    'reward when defeated'
                }
            },
            b_dckst_handy = {
                name = "Handy Deck",
                text = {
                    'Start with {C:attention,T:v_dckst_extra_digits}Extra Digits{}',
                    'and {C:attention,T:v_dckst_ambidextrous}Ambidextrous{},',
                    '{C:red}-1{} hand size'
                }
            },
            b_dckst_decksterity_fancy = {
                name = "Fancy Deck",
                text = {
                    '{C:common}Common{} Jokers',
                    'cannot appear',
                    'in {C:attention}shop{}',
                }
            },
            b_dckst_metallurgic = {
                name = "Metallurgic Deck",
                text = {
                    'Every card gets',
                    'a random {C:attention}Metallurgic{}',
                    'enhancement',
                }
            },
            b_dckst_binary = {
                name = 'Binary Deck',
                text = {
                    'Deck has {C:attention}26 10s{}',
                    'and {C:attention}26 Aces{}',
                    '{C:inactive}(Suits are randomized){}',
                }
            },
            b_dckst_marathon = {
                name = "Marathon Deck",
                text = {
                    "Blind requirements scale",
                    "{C:attention}25%{} slower,",
                    "win at Ante {C:attention}12{}"
                }
            },
            b_dckst_monarch = {
                name = "Monarch Deck",
                text = {
                    'Every {C:attention}face{} card gives',
                    '{X:mult,C:white}X1.5{} Mult when scored,',
                    '{C:attention}other{} ranks give {X:mult,C:white}X0.7{} Mult'
                }
            },
            b_dckst_blueprint = {
                name = "Blueprint Deck",
                text = {
                    'Defeating a {C:attention}Blind{} spawns {C:attention}3{}',
                    'random Jokers',
                    '{C:inactive}(Must have room){},',
                    'shop {C:red,E:2}no longer{} sells Jokers'
                }
            },
            b_dckst_fragile = {
                name = 'Fragile Deck',
                text = {
                    'Start with {C:money}$20{} and',
                    '{C:attention}1{} additional copy',
                    'of each {C:attention}rank{}.',
                    'Every starting card',
                    'is {C:attention,T:m_glass}Glass{}'
                }
            },
            b_dckst_microwave = {
                name = 'Microwave Deck',
                text = {
                    '{C:attention,E:1,s:1.1}Levels up{} most played',
                    'at the start of each round,',
                    'every played card has a fixed',
                    '{C:green}1 in 6{} chance to be',
                    '{C:red,E:2}destroyed{} when played'
                }
            },
            b_dckst_consecutive = {
                name = 'Consecutive Deck',
                text = {
                    'Hands only containing',
                    '{C:attention}Straights{} are',
                    'allowed to be played',
                }
            },
            b_dckst_deadline = {
                name = 'Deadline Deck',
                text = {
                    'Start with {C:attention}6{} {C:red}Discards{}',
                    'and {C:attention}2{} {C:blue}Hands{}',
                }
            },
            b_dckst_plaintext = {
                name = 'Plaintext Deck',
                text = {
                    'Every {C:attention}base{} card',
                    '(no enhancement)',
                    'gives {X:mult,C:white} X1.5 {} Mult',
                }
            },
            b_dckst_decksterity_icosagon = {
                name = 'Icosagon Deck',
                text = {
                    'Start with 2',
                    '{C:enhanced}enhanced{} {C:attention}20s{}',
                    'for each {C:inactive}(Vanilla){} {C:attention}suit{}',
                }
            },
            b_dckst_decksterity_hexadeck = {
                name = 'Hexa-Deck',
                text = {
                    'Every {C:attention,T:tag_double}Double Tag{} is replaced',
                    'with {C:attention,T:tag_dckst_sextuple}Sextuple Tags{}, {C:red}-$4{} for',
                    'each skipped blind'
                }
            },
            b_dckst_decksterity_heptadeck = {
                name = 'Hepta-Deck',
                text = {
                    'Every {C:attention,T:tag_double}Double Tag{} is replaced',
                    'with {C:attention,T:tag_dckst_septuple}Septuple Tags{}, {C:red}-$6{} for',
                    'each skipped blind'
                }
            },
        },
        Blind = {
            bl_dckst_secant = {
                name = "The Secant",
                text = {
                    'Enhanced cards give',
                    'X#1# Mult'
                }
            },
            bl_dckst_cosecant = {
                name = "The Cosecant",
                text = {
                    'Base cards give',
                    'X#1# Mult'
                }
            },
            bl_dckst_foreclosure = {
                name = 'The Foreclosure',
                text = {
                    "Jokers with sell value",
                    ">$#1# are debuffed"
                }
            },
            bl_dckst_vandal = {
                name = 'The Vandal',
                text = {
                    'When hand is played, the',
                    'leftmost Joker is destroyed'
                }
            },
            bl_dckst_magpie = {
                name = 'The Magpie',
                text = {
                    'Only cards with a',
                    'nominal of 7 and',
                    'up can be played'
                }
            },
            bl_dckst_hypochondriac = {
                name = 'The Hypochondriac',
                text = {
                    'Cards with seals',
                    'are debuffed'
                }
            },
            bl_dckst_harmony = {
                name = 'The Harmony',
                text = {
                    'Every played card must',
                    'be of the same rank',
                    'or suit'
                }
            },
            bl_dckst_inflationism = {
                name = 'The Inflationism',
                text = {
                    'When cards are discarded,',
                    'increases blind requirement',
                    'by X#1#'
                }
            },
            bl_dckst_miser = {
                name = 'The Miser',
                text = {
                    'Money is set to $#1#,',
                    'cannot change during',
                    'the round'
                }
            },
            bl_dckst_numismatist = {
                name = 'The Numismatist',
                text = {
                    'Hand can only score',
                    'if owned money is odd',
                    '{C:inactive}(Ignores decimals){}'
                }
            },
            bl_dckst_pendulum = {
                name = 'The Pendulum',
                text = {
                    'Alternates between halving',
                    'Chips and Mult before hand',
                    'scores every hand'
                }
            },
            bl_dckst_derivative = {
                name = "The Derivative",
                text = {
                    "Hands that contain",
                    "Straights are not",
                    "allowed to be played"
                }
            },
            bl_dckst_integral = {
                name = "The Integral",
                text = {
                    "Hands that do not",
                    "contain Straights are",
                    "not allowed to be played"
                }
            },
            bl_dckst_distance = {
                name = "The Distance",
                text = {
                    "Score requirement increases",
                    "by X#1# per hand"
                }
            },
            bl_dckst_scalage = {
                name = 'The Scalage',
                text = {
                    'Sum of all played cards\'',
                    'nominal value must be',
                    'equal to or larger than #1#'
                }
            },
            bl_dckst_containment = {
                name = 'The Containment',
                text = {
                    'The 2 leftmost and rightmost',
                    'cards in hand are debuffed,',
                    'cannot drag cards'
                }
            },
            bl_dckst_switchie = {
                name = 'The Switchie',
                text = {
                    'Cards in hand with',
                    'odd-numbered positions',
                    'are drawn face down,',
                    'cannot drag or sort cards'
                }
            },
            bl_dckst_antivowelist = {
                name = 'The Antivowelist',
                text = {
                    'Jokers containing #1#~#2#',
                    'vowels are debuffed',
                    '{s:0.8}[A, E, I, O, U, Y]{}'
                }
            },
            bl_dckst_moneycharger = {
                name = 'The Moneycharger',
                text = {
                    'When hand is played, -$#1#'
                }
            },
            bl_dckst_storage = {
                name = 'The Storage',
                text = {
                    "For every $#1# owned,",
                    "-1 Hand size",
                    "{C:inactive}(Minimum #2# Hand size){}"
                }
            },
            bl_dckst_leftovers = {
                name = 'The Leftovers',
                text = {
                    'Lose $0.5 for every',
                    'unplayed card when Round ends',
                    '{C:inactive}(Rounded down)'
                }
            },
            bl_dckst_randomization = {
                name = 'The Randomization',
                text = {
                    'A random rank is',
                    'debuffed each hand'
                }
            },
            bl_dckst_tether = {
                name = 'The Tether',
                text = {
                    'Played hand must contain',
                    'the highest rank in hand'
                }
            },
            bl_dckst_tariffication = {
                name = 'The Tariffication',
                text = {
                    'Lose $#1# for each',
                    'card discarded'
                }
            },
            bl_dckst_counterfeit = {
                name = 'The Counterfeit',
                text = {
                    'Jokers and playing cards',
                    'with Editions are debuffed'
                }
            },
            bl_dckst_adblock = {
                name = 'The Ad-Block',
                text = {
                    'Playing cards with an',
                    'Enhancement, Seal, or Edition',
                    'are drawn face down'
                }
            },
            bl_dckst_primetime = {
                name = 'The Primetime',
                text = {
                    'Hand must contain a card',
                    'with a prime nominal value'
                }
            },
            bl_dckst_squarism = {
                name = 'The Squarism',
                text = {
                    'Before hand scores, Chips',
                    'are rounded down to the',
                    'nearest perfect square'
                }
            },
            bl_dckst_octanium = {
                name = 'The Octanium',
                text = {
                    'Debuffs a Joker or playing card',
                    'if its description has the',
                    'number 8 or 9 (If possible)',
                }
            },
            bl_dckst_giggling = {
                name = 'The Giggling',
                text = {
                    'Played hand must contain',
                    'at least #1# face cards'
                }
            },
            bl_dckst_chartreuse_coin = {
                name = 'Chartreuse Coin',
                text = {
                    'X$0.97 when a card scores'
                }
            },
            bl_dckst_silver_shield = {
                name = 'Silver Shield',
                text = {
                    'X#1# blind requirements',
                    'when a card scores'
                }
            },
            bl_dckst_sapphire_sword = {
                name = 'Sapphire Sword',
                text = {
                    'Base Chips and Mult',
                    'are set to #1#'
                }
            },
            bl_dckst_vermillion_rose = {
                name = 'Vermillion Rose',
                text = {
                    'Final Mult is divided by',
                    'the sum of remaining',
                    'Hands and Discards',
                    '{C:inactive}(Does nothing when 0){}'
                }
            },
            bl_dckst_dandelion_arrow = {
                name = 'Dandelion Arrow',
                text = {
                    'The #1# leftmost Jokers',
                    'are permanently debuffed'
                }
            },
            bl_dckst_periwinkle_feline = {
                name = 'Periwinkle Feline',
                text = {
                    'X#1# score requirement per',
                    'Catarot used this run'
                }
            },
            bl_dckst_pyrite_ball = {
                name = 'Pyrite Ball',
                text = {
                    'All Jokers and playing',
                    'cards debuffed until #1#',
                    'consumables used'
                }
            },
            bl_dckst_tyler_the_finisher = {
                name = 'Tyler, The Finisher',
                text = {
                    'Every scoring hand is randomly',
                    'replaced with another valid',
                    'poker hand of a lower rank'
                }
            },
            bl_dckst_amethyst_amulet = {
                name = 'Amethyst Amulet',
                text = {
                    'When cards are discarded,',
                    'half of them rounded up',
                    'are destroyed'
                }
            },
            bl_dckst_leafy_limit = {
                name = 'Leafy Limit',
                text = {
                    '#1# card selection limit,',
                    '#1# hand size'
                }
            },
            bl_dckst_onyx_obelisk = {
                name = 'Onyx Obelisk',
                text = {
                    'When hand type is',
                    'already played, X#1#',
                    'base Chips and Mult',
                    '{C:inactive}(stacks){}'
                }
            },
            bl_dckst_diamond_die = {
                name = 'Diamond Die',
                text = {
                    'Hand must contain',
                    'a #1#, rank changes',
                    'every hand'
                }
            },
            bl_dckst_fervent_fern = {
                name = 'Fervent Fern',
                text = {
                    'All cards debuffed until',
                    '#1# cards played'
                }
            },
            bl_dckst_hypnotic_haze = {
                name = 'Hypnotic Haze',
                text = {
                    'All Jokers are face down,',
                    'all Jokers and playing cards',
                    'randomly change position',
                    'every 3 in-game seconds'
                }
            },
            bl_dckst_calculator_core = {
                name = 'Calculator Core',
                text = {
                    'Sum of all played cards\'',
                    'nominal value must be',
                    'between #1# and #2#'
                }
            },
            bl_dckst_shorted_signal = {
                name = 'Shorted Signal',
                text = {
                    'If played hand exceeds',
                    '#1#% of required score,',
                    'lose the run'
                }
            },
            bl_dckst_malignant_monument = {
                name = 'Malignant Monument',
                text = {
                    'Ridiculously large blind'
                }
            },
            bl_dckst_total_terminal = {
                name = 'Total Terminal',
                text = {
                    'All {X:mult,C:white}XMult{} Jokers',
                    'are debuffed (If possible)'
                }
            },
            bl_dckst_versatile_versine = {
                name = 'Versatile Versine',
                text = {
                    'X#1# Chips every time',
                    'a card scores, X#2#',
                    'Mult every time a',
                    'a Joker triggers'
                }
            },
            bl_dckst_withering_well = {
                name = 'Withering Well',
                text = {
                    'Money is halved at',
                    'the end of every',
                    'hand played (Rounded down)'
                }
            },
            bl_dckst_molten_mass = {
                name = 'Molten Mass',
                text = {
                    'Played cards lose all',
                    'Enhancements, Seals,',
                    'and Editions before scoring'
                }
            },
            bl_dckst_gravity_gate = {
                name = 'Gravity Gate',
                text = {
                    'Hand size is halved',
                    '(Rounded down)'
                }
            },
            bl_dckst_astral_alignment = {
                name = 'Astral Alignment',
                text = {
                    'Hand will not score', 
                    'if hand is above level #1#'
                }
            },
            bl_dckst_cosmic_ceiling = {
                name = 'Cosmic Ceiling',
                text = {
                    'All played cards are',
                    'permanently debuffed'
                }
            },
            bl_dckst_primordial_pulse = {
                name = 'Primordial Pulse',
                text = {
                    'Debuffs half of the deck',
                    'and half of all Jokers',
                    'at random, rerolls',
                    'every hand'
                }
            },
        },
        Joker = {
            j_dckst_fiesta = {
                name = "Fiesta!",
                text = {
                    'Scored {C:clubs}Clubs{} give {C:chips}+#1#{} chips,',
                    'scored {C:hearts}Hearts{} give {C:mult}+#2#{} Mult,',
                    'scored {C:diamonds}Diamonds{} give {C:money}+$#3#{}'
                }
            },
            j_dckst_inset = {
                name = "Inset Joker",
                text = {
                    'This Joker gains {C:mult}+2{} Mult',
                    'for every {C:attention}empty{} Joker',
                    'slot when hand scored',
                    '{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}',
                    '{C:inactive}(#3# empty slots){}'
                }
            },
            j_dckst_slippin_jimmy = {
                name = "Slippin' Jimmy",
                text = {
                    'When a {C:attention}Boss Blind{} debuffs',
                    'a card, {C:green}#1# in #2#{} chance',
                    'to ignore it',
                }
            },
            j_dckst_prismatic = {
                name = "Prismatic Joker",
                text = {
                    'This Joker gains {C:mult}+10{} Mult',
                    'if scored card has',
                    'an {C:dark_edition}Edition{}',
                    '{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}'
                }
            },
            j_dckst_loadeddice = {
                name = "Loaded Dice",
                text = {
                    'Every {C:attention}non-Lucky{} scored {C:attention}6{}',
                    'is turned into a {C:attention}Lucky Card{}'
                }
            },
            j_dckst_swapped = {
                name = "Swapped Joker",
                text = {
                    'Converts each played {C:hearts}Heart{}',
                    'into a {C:clubs}Club{}, {C:diamonds}Diamond{} into a',
                    '{C:spades}Spade{}, {C:clubs}Club{} into a {C:hearts}Heart{},',
                    'and {C:spades}Spade{} into a {C:diamonds}Diamond{}'
                }
            },
            j_dckst_stopsign = {
                name = "Stop Sign",
                text = {
                    'Disable the current {C:attention}Boss{}',
                    '{C:attention}Blind{} effect when entered,',
                    'then {C:mult}self-destructs{}'
                }
            },
            j_dckst_extruded = {
                name = "Extruded Joker",
                text = {
                    "This Joker gains {X:mult,C:white}+X#1#{} Mult",
                    "for each card destroyed or sold",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
                    "{C:inactive}(Cards destroyed/sold: #3#){}"
                }
            },
            j_dckst_pencil = {
                name = "Pencil",
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "when a card is enhanced",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips){}"
                }
            },
            j_dckst_floatingisland = {
                name = 'Floating Island',
                text = {
                    'This Joker gains {C:chips}+#1#{} Chips',
                    'for every {C:common}Common{} Joker',
                    'when hand played',
                    '{C:inactive}(Currently{} {C:chips}+#2#{} {C:inactive}Chips){}'
                }
            },
            j_dckst_frontier = {
                name = 'Frontier',
                text = {
                    'Jokers to the {C:attention}right{} of',
                    'this Joker give {C:mult}+#1#{} Mult',
                    'Jokers to the {C:attention}left{} of',
                    'this Joker give {C:chips}+#2#{} Chips',
                }
            },
            j_dckst_coffee_mug = {
                name = "Coffee Mug",
                text = {
                    "Starts with {C:attention}+#1#{} hand size",
                    "each round. Decreases by",
                    "{C:attention}-1{} hand size per",
                    "hand played",
                }
            },
            j_dckst_lilmaxey = {
                name = "{C:dark_edition,E:dckst_rainbow_wiggle}lil' maxey!{}",
                text = {
                    'Jokers to the {C:attention}left{} of',
                    '{E:1}this cat{} give {X:mult,C:white}X#1#{} Mult{},',
                    'she also gains {X:mult,C:white}+X#2#{} Mult',
                    'for each hand played',
                    '{C:inactive}(Currently {X:mult,C:white}X#3#{} {C:inactive}Mult){}'
            },
        },
        j_dckst_cyanotype = {
            name = "Cyanotype",
            text = {
                    'Creates a copy of the',
                    '{C:attention,E:1,s:1.1}leftmost{} owned Joker',
                    'after {C:attention}#1#{} {C:blue}hands{} and',
                    'then {C:red}self-destructs{}',
                    '{C:inactive}(Currently {C:attention}#2#{}{C:inactive}/#1# hands){}'
            },
        },
        j_dckst_superstar = {
            name = "Superstar",
            text = {
                    'This Joker gains {C:mult}+#1#{}',
                    'Mult for each {C:attention}Blind{} beaten',
                    '{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}'
            }
        },
        j_dckst_theknicks = {
            name = "THE KNICKS-",
            text = {
                    '{C:attention}Triples{} every {C:green,E:1,s:1.1}probability{}',
                    '{C:green,E:1,s:1.1}numerator{} but has a',
                    'fixed {C:green}1 in 8{} chance',
                    'to {C:red}explode{} at end',
                    'of round'
            }
        },
        j_dckst_shoreline = {
            name = "Shoreline",
            text = {
                    'This Joker gains {C:chips}+#1#{}',
                    'Chips at the {C:attention}start{}',
                    'of every round, but',
                    'loses {C:red}-#2#{} Chips per',
                    '{C:blue}hand{} played',
                    '{C:inactive}(Currently{} {C:chips}+#3#{} {C:inactive}Chips){}'
            }
        },
        j_dckst_typewriter = {
            name = "Typewriter",
            text = {
                '{C:green}#1# in #2#{} chance',
                'to {C:attention}copy{} a scored',
                '{C:attention}face card{} to deck'
            }
        },
        j_dckst_luckykitten = {
            name = "Lucky Kitten",
            text = {
                '{C:chips}+#1#{} Chips when a',
                '{C:attention}Lucky{} card is scored,',
                'evolves into {C:attention}Lucky Cat{}',
                'after {C:attention}#2#{} {C:blue}hands{}',
                '{C:inactive}({}{C:attention}#3#{}{C:inactive}/#2# hands){}'
            }
        },
        j_dckst_airbornepiano = {
            name = "Airborne Piano",
            text = {
                '{X:mult,C:white}X#1#{} Mult, loses {X:mult,C:white}-X#2#{} Mult',
                'when a card is scored'
            }
        },
        j_dckst_pathogen = {
            name = "Pathogen",
            text = {
                    'If first {C:blue}hand{} of round',
                    'has exactly {C:attention}2{} fixed cards,',
                    '{C:attention}copy{} the left card {C:attention}twice{}'
            }
        },
        j_dckst_pawprints = {
            name = "Pawprints",
            text = {
                    'When {C:blue}hand{} is done scoring,',
                    '{C:green}#1# in #2#{} chance a {C:attention}scored{}',
                    'card is {C:enhanced}enhanced{} into a',
                    'random {C:enhanced}Enhancement{}'
            }
        },
        j_dckst_mysterioustrail = {
            name = "Mysterious Trail",
            text = {
                    '{C:mult}+#1#{} Mult, randomly evolves',
                    'into {C:attention}one of four Jokers{}',
                    'after {C:attention}#2#{} {C:blue}hands{}',
                    '{C:inactive}({}{C:attention}#3#{}{C:inactive}/#2# hands){}'
            }
        },
        j_dckst_tamerlane = {
            name = "Tamerlane",
            text = {
                'This Joker gains {X:mult,C:white}+X#2#{} Mult',
                'when a card is {C:attention}converted{}',
                'from one suit to another',
                '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}',
            }
        },
        j_dckst_therook = {
            name = 'THE ROOOOOOOOOOOOOOOOOOOOOOOOOOOOK',
            text = {
                'At end of round, this Joker',
                'destroys the {C:attention}leftmost{} Joker',
                'and gains {X:mult,C:white}+X#2#{} Mult',
                '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}',
            }
        },
        j_dckst_appraisal = {
            name = "Appraisal",
            text = {
                    'After hand scored, destroys',
                    '{C:attention}rightmost{} playing card and',
                    'gives {C:money}+$#1#{}, {C:money}+$#2#{} instead if',
                    'card has an {C:attention}enhancement{},',
                    '{C:attention}seal{} or {C:attention}edition{}',
            }
        },
        j_dckst_giggler = {
            name = "Giggler",
            text = {
                    'This Joker gains {C:mult}+#1#{} Mult',
                    'for each unique {C:attention}face card{}',
                    'scored this hand',
                    '{C:inactive}(Currently {C:mult}+#2#{}{C:inactive} Mult){}'
            }
        },
        j_dckst_napkin = {
            name = "Napkin",
            text = {
                '{X:mult,C:white}X#1#{} Mult',
                '{C:green}#2# in #3#{} chance to evolve',
                'into {C:attention}Brainstorm{} after',
                'each hand'
            }
        },
        j_dckst_son = {
            name = "SON",
            text = {
                'At end of round, each',
                '{C:attention}Jack{} in hand has a',
                '{C:green}#1# in #2#{} chance to receive',
                'a random {C:attention}enhancement{}',
            }
        },
        j_dckst_alchemist = {
            name = "Alchemist",
            text = {
                'Gains {C:money}+$#1#{} sell value when',
                'a Joker is {C:attention}sold{}, and',
                '{C:money}+$#2#{} sell value when',
                'a Joker is {C:attention}destroyed{}',
            }
        },
        j_dckst_desklamp = {
            name = "Desk Lamp",
            text = {
                '{C:mult}+#1#{} Mult for each',
                'Joker to the {C:attention}right{}',
                'of this one',
            }
        },
        j_dckst_stickynote = {
            name = "Sticky Note",
            text = {
                'At end of round, slaps',
                '{C:mult}+#1#{} Mult{} onto a',
                '{C:attention}random{} Joker',
                'for the next round',
            }
        },
        j_dckst_coinjar = {
            name = "Coin Jar",
            text = {
                'Collects {C:money}+$#2#{} at end',
                'of each round (scales',
                'with {C:attention}Ante{}).',
                'Dumps {C:money}$#1#{} when a',
                '{C:attention}Boss Blind{} is beaten',
                '{C:inactive}(Currently {C:money}$#1#{}{C:inactive} saved){}'
            }
        },
        j_dckst_cupboard = {
            name = "Cupboard",
            text = {
                'Stores {C:chips}half{} the {C:chips}Chips{}',
                'each scored card gives,',
                'then gives stored value',
                'as {C:mult}Mult{} after hand',
            }
        },
        j_dckst_thetown = {
            name = "The Town",
            text = {
                'Earn {C:money}$#1#{} at end of round.',
                'If money ends with {C:attention}0{}, this',
                'Joker gives {C:chips}+#2#{} Chips and',
                '{X:mult,C:white}X#3#{} Mult'
            }
        },
        j_dckst_blkyn = {
            name = "BLKYN",
            text = {
            'Played but {C:attention}unscored{}',
            'cards add {C:chips,E:1,s:1.1}1/base value{}',
            'to {X:mult,C:white}XMult{}',
            'Resets each {C:attention}round{}',
            '{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult){}',
            }
        },
        j_dckst_peachtree = {
            name = "Peachtree",
            text = {
                'If hand contains a',
                '{C:attention}Straight{} and an {C:attention}Ace{},',
                '{E:1,s:1.1}Trae{} gives {X:mult,C:white}X#1#{} Mult',
            }
        },
        j_dckst_perrobabli = {
            name = "Perrobabli",
            text = {
                'All {C:green,s:1.1,E:1}probabilities{}',
                'are pulled toward',
                '{C:green}1 in 2{}',
            }
        },
        j_dckst_quadratic_equation = {
            name = "Quadratic Equation",
            text = {
                'Gains {C:mult}+#2#{} Mult{}',
                'every {C:attention}4{} cards scored',
                'Mult gain increases by',
                '{C:mult}+2{} every {C:attention}4{} cards',
                '{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult)',
                '"{C:inactive}({}{C:attention}#3#{}{C:inactive} cards scored){}',
            }
        },
        j_dckst_naturalist = {
            name = "Naturalist",
            text = {
                'Each scored card has a',
                '{C:green}#1# in #2#{} chance to',
                'become a {C:attention}Nature{} card',
            }
        },
        j_dckst_currency_exchange = {
            name = "Currency Exchange",
            text = {
                'Swaps {C:chips}Chips{} and',
                '{C:mult}Mult{} during scoring',
            }
        },
        j_dckst_outline = {
            name = "Outline Joker",
            text = {
                'Gains {C:mult}+#2#{} Mult for each',
                '{C:attention}Joker{} or {C:attention}consumable{}',
                'sold or destroyed',
                '{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult){}'
            }
        },
        j_dckst_endpoints = {
            name = "Endpoints",
            text = {
                'Retriggers the {C:attention}leftmost{}',
                'and {C:attention}rightmost{} scoring',
                'card {C:attention}twice{}',
            }
        },
        j_dckst_cantor_set = {
            name = "Cantor Set",
            text = {
                '{C:red}Destroys{} the {C:attention}middle third{}',
                'of cards held in hand,',
                'then multiplies {C:chips}Chips{}',
                'by {C:chips}half{} the remaining',
                'cards in hand',
                '{C:inactive}(Currently {C:chips}+#1#{}{C:inactive} Chips){}'
            }
        },
        j_dckst_einstein_tile = {
            name = "Einstein Tile",
            text = {
                'Gains {X:mult,C:white}+X#2#{} Mult if',
                'played hand contains',
                'at least {C:attention}4{} cards each',
                'with {C:attention}distinct suits{}',
                '{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult){}'
            }
        },
        j_dckst_aura_farming_h1 = {
            name = "Aura Farming",
            text = {
                'Every {C:attention}scored{} {C:enhanced}enhanced{}',
                'card gives {C:mult}+#1#{} Mult'
            }
        },
        j_dckst_aura_farming_h2 = {
            name = "Aura Farming",
            text = {
                'Every {C:attention}scored{} {C:enhanced}enhanced{}',
                'card gives {X:mult,C:white}X#1#{} Mult'
            }
        },
        j_dckst_aura_farming_h3 = {
            name = "Aura Farming",
            text = {
                'Every {C:attention}scored{} {C:enhanced}enhanced{}',
                'card gives {X:dark_edition,C:white}^#1#{} Mult'
            }
        },
        j_dckst_permutation = {
            name = 'Permutation',
            text = {
                'Gives {C:chips}Chips{} equal to',
                '{C:attention}P(n, r){}, where {C:attention}n{} is cards',
                'played and {C:attention}r{} is scoring cards',
            }
        },
        j_dckst_wooden_ruler_h1 = {
            name = 'Wooden Ruler',
            text = {
                'This Joker gains {C:mult}+#1#{} Mult if',
                'played hand contains a {C:attention}Straight{},',
                'loses {C:red}-#2#{} Mult otherwise'
            }
        },
        j_dckst_wooden_ruler_h2 = {
            name = 'Wooden Ruler',
            text = {
                'This Joker gains {X:mult,C:white}+X0.5{} Mult if',
                'played hand contains a {C:attention}Straight{},',
                'loses {X:red,C:white}-X0.5{} Mult otherwise',
                '{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult){}'
            }
        },
        j_dckst_wooden_ruler_h3 = {
            name = 'Wooden Ruler',
            text = {
                'This Joker gains {X:dark_edition,C:white}+^0.5{} Mult',
                'power if played hand contains a',
                '{C:attention}Straight{}, loses {C:white,X:dark_edition}-^0.5{} Mult otherwise',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#1#{}{C:inactive} Mult){}'
            }
        },
        j_dckst_michael_here = {
            name = 'Michael here!',
            text = {
                'Copies the ability of',
                'the {C:attention}leftmost{} Joker',
                '{C:inactive,s:0.8}(...Or is it?){}'
            }
        },
        j_dckst_michael_here_h3 = {
            name = 'Michael here!',
            text = {
                'Copies the ability of',
                'the {C:attention}leftmost{} Joker {C:attention}twice{}',
                '{C:inactive,s:0.8}(...Or is it?){}'
            }
        },
        j_dckst_thermometer = {
            name = 'Thermometer',
            text = {
                '{C:hearts}Light{} suits {C:red}+0.5{} temp,',
                '{C:clubs}Dark{} suits {C:blue}-0.5{} temp',
                'Positive temp gives {X:mult,C:white}XMult{},',
                'negative gives {X:chips,C:white}XChips{}',
                '{C:inactive}(Currently {C:attention}#1#{}: {X:attention,C:white}X#2#{} #3#){}'
            }
        },
        j_dckst_thermometer_h3 = {
            name = 'Thermometer',
            text = {
                '{C:hearts}Light{} suits {C:red}+0.5{} temp,',
                '{C:clubs}Dark{} suits {C:blue}-0.5{} temp',
                'Positive temp gives {C:white,X:dark_edition}^Mult{},',
                'negative gives {C:white,X:dark_edition}^Chips{}',
                '{C:inactive}(Currently {C:attention}#1#{}: {C:white,X:dark_edition}^#2#{} #3#){}'
            }
        },
        j_dckst_lebron_james_h1 = {
            name = 'LeBron James',
            text = {
                'Every scored {C:attention}2{}, {C:attention}3{}, {C:attention}6{}, or {C:attention}King{}',
                'gives {X:mult,C:white}X#1#{} Mult, LeBron',
                'also gives {X:mult,C:white}X#2#{} Mult'
            }
        },
        j_dckst_lebron_james_h2 = {
            name = 'LeBron James',
            text = {
                'Every scored {C:attention}2{}, {C:attention}3{}, {C:attention}6{}, or {C:attention}King{}',
                'gives {X:mult,C:white}X#1#{} Mult, LeBron',
                'also gives {X:mult,C:white}X#2#{} Mult'
            }
        },
        j_dckst_lebron_james_h3 = {
            name = 'LeBron James',
            text = {
                'Every scored {C:attention}2{}, {C:attention}3{}, {C:attention}6{}, or {C:attention}King{}',
                'gives {C:white,X:dark_edition}^#1#{} Mult, LeBron',
                'also gives {C:white,X:dark_edition}^#2#{} Mult'
            }
        },
        j_dckst_sinusoidal = {
            name = 'Sinusoidal Joker',
            text = {
                'Gives {X:mult,C:white}XMult{} equal to',
                '{C:attention}1 + |sin(v) + cos(v^2)|{},',
                '{C:inactive,s:0.7}(where {C:attention,s:0.7}v{C:inactive,s:0.7} is the total nominal{}',
                '{C:inactive,s:0.7}value of scoring cards in radians)',
                '{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult){}'
            }
        },
        j_dckst_subspace_tripmine = {
            name = 'Subspace Tripmine',
            text = {
                'All {C:attention}face cards{} in hand have a',
                '{C:green}#1# in #2#{} chance to be destroyed',
                'and give {C:money}$#3#{} after scoring'
            }
        },
        j_dckst_subspace_tripmine_h2 = {
            name = 'Subspace Tripmine',
            text = {
                'All {C:attention}face cards{} in hand have a',
                '{C:green}#1# in #2#{} chance to be destroyed',
                'and give {C:white,X:money}X$#3#{} after scoring'
            }
        },
        j_dckst_subspace_tripmine_h3 = {
            name = 'Subspace Tripmine',
            text = {
                'All {C:attention}face cards{} in hand have a',
                '{C:green}#1# in #2#{} chance to be destroyed',
                'and give {C:white,X:money}X$#3#{} after scoring'
            }
        },
        j_dckst_icbm = {
            name = 'ICBM',
            text = {
                '{C:green}#1# in #2#{} chance to destroy',
                'all cards in hand and give',
                '{C:white,X:money}X$#3#{} after scoring'
            }
        },
        j_dckst_icbm_h2 = {
            name = 'ICBM',
            text = {
                '{C:green}#1# in #2#{} chance to destroy',
                'all cards in hand and give',
                '{C:white,X:money}X$#3#{} after scoring'
            }
        },
        j_dckst_icbm_h3 = {
            name = 'ICBM',
            text = {
                '{C:green}#1# in #2#{} chance to destroy',
                'all cards in hand and give',
                '{C:white,X:money}X$#3#{} after scoring'
            }
        },
        j_dckst_stephenson_218 = {
            name = 'Stephenson 2-18',
            text = {
                'Gives {X:mult,C:white}X#1#{} Mult for every',
                'card remaining in deck',
                '{C:inactive}(Currently {C:attention}#2#{}{C:inactive} cards,',
                '{X:mult,C:white}X#3#{}{C:inactive} Mult){}'
            }
        },
        j_dckst_mart = {
            name = 'Mart',
            text = {
                'Does {C:attention,E:1}nothing{}',
                '{C:attention}+#4#{} Joker slots'
            }
        },
        j_dckst_weeesta = {
            name = 'Wee-esta!',
            text = {
                'This Joker gains {C:chips}+#1#{} Chips when a',
                '{C:clubs}Club{} is scored, {C:mult}+#2#{} Mult when a',
                '{C:hearts}Heart{} is scored, and {C:money}+$#3#{} when a',
                '{C:diamonds}Diamond{} is scored',
                '{C:inactive}(Currently {C:chips}+#4#{}{C:inactive} Chips, {C:mult}+#5#{}{C:inactive} Mult, {C:money}+$#6#{}{C:inactive}){}'
            }
        },
        j_dckst_covalent_bond = {
            name = 'Covalent Bond',
            text = {
                'This Joker gains',
                '{X:mult,C:white}+X#1#{} Mult for',
                'every {C:attention}pair{} of cards',
                'with the same {C:attention}rank{}',
                'in played hand',
                '{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult){}'
            }
        },
        j_dckst_covalent_bond_h3 = {
            name = 'Covalent Bond',
            text = {
                'This Joker gains',
                '{C:white,X:dark_edition}+^#1#{} Mult for',
                'every {C:attention}pair{} of cards',
                'with the same {C:attention}rank{}',
                'in played hand',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{}{C:inactive} Mult){}'
            }
        },
        j_dckst_overtime = {
            name = 'Overtime!',
            text = {
                'Gives {X:chips,C:white}X#1#{} Chips for every',
                'remaining hand',
                '{C:inactive}(Currently {C:attention}#2#{}{C:inactive} left: {X:chips,C:white}X#3#{}{C:inactive} Chips){}'
            }
        },
        j_dckst_overtime_h2 = {
            name = 'Overtime!',
            text = {
                'Gives {X:mult,C:white}X#1#{} Mult for every',
                'remaining hand',
                '{C:inactive}(Currently {C:attention}#2#{}{C:inactive} left: {X:mult,C:white}X#3#{}{C:inactive} Mult){}'
            }
        },
        j_dckst_overtime_h3 = {
            name = 'Overtime!',
            text = {
                'Gives {C:white,X:dark_edition}^#1#{} Chips for every',
                'remaining hand',
                '{C:inactive}(Currently {C:attention}#2#{}{C:inactive} left: {C:white,X:dark_edition}^#3#{}{C:inactive} Chips){}'
            }
        },
        j_dckst_isotope = {
            name = 'Isotope',
            text = {
                'Every time this',
                'Joker is {C:attention}triggered{},',
                'it gains {C:white,X:mult}+X#1#{} Mult',
                '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
            }
        },
        j_dckst_isotope_h2 = {
            name = 'Isotope',
            text = {
                'Every time this',
                'Joker is {C:attention}triggered{},',
                'it gains {C:white,X:mult}+X#1#{} Mult',
                '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
            }
        },
        j_dckst_isotope_h3 = {
            name = 'Isotope',
            text = {
                'Every time this',
                'Joker is {C:attention}triggered{},',
                'it gains {C:white,X:dark_edition}+^#1#{} Mult',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Mult)'
            }
        },
        j_dckst_entropy = {
            name = 'Entropy',
            text = {
                'Gives {C:mult}+#1#{} Mult for every',
                '{C:attention}unique{} rank in played hand'
            }
        },
        j_dckst_entropy_h2 = {
            name = 'Entropy',
            text = {
                'Gives {X:mult,C:white}X#1#{} Mult for every',
                '{C:attention}unique{} rank in played hand'
            }
        },
        j_dckst_entropy_h3 = {
            name = 'Entropy',
            text = {
                'Gives {X:dark_edition,C:white}^#1#{} Mult for every',
                '{C:attention}unique{} rank in played hand'
            }
        },
        j_dckst_toaster = {
            name = 'Toaster',
            text = {
                'When a card is {C:red}discarded{},',
                '{C:green}#1# in #2#{} chance for it',
                'to be given a permanent',
                '{C:mult}+#3#{} Mult bonus'
            }
        },
        j_dckst_toaster_h2 = {
            name = 'Toaster',
            text = {
                'When a card is {C:red}discarded{},',
                '{C:green}#1# in #2#{} chance for it',
                'to be given a permanent',
                '{C:mult}+#3#{} Mult bonus'
            }
        },
        j_dckst_toaster_h3 = {
            name = 'Toaster',
            text = {
                'When a card is {C:red}discarded{},',
                '{C:green}#1# in #2#{} chance for it',
                'to be given a permanent',
                '{C:mult}+#3#{} Mult bonus'
            }
        },
        j_dckst_power_set = {
            name = 'Power Set',
            text = {
                'Gives {C:mult}+{C:inactive}2^{C:attention}c{}{C:inactive} = {C:mult}+#1#{} Mult,',
                'where {C:attention}c{} is the number',
                'of {C:attention}unique{} ranks in',
                'played hand'
            }
        },
        j_dckst_power_set_h3 = {
            name = 'Power Set',
            text = {
                'Gives {C:white,X:dark_edition}^{C:inactive}(2^{C:attention}c{}{C:inactive}) = {C:white,X:dark_edition}^#1#{} Mult,',
                'where {C:attention}c{} is the number',
                'of {C:attention}unique{} ranks in',
                'played hand'
            }
        },
        j_dckst_fuke = {
            name = 'Fuke',
            text = { { '{C:inactive,E:1}Delicious classic!' }, { 
                '{C:white,X:dckst_blindsize}X#1#{} Blind size for', 'every card scored',
                '{C:inactive}(Blind size will be {C:dckst_blindsize}#3#{C:inactive},',
                '{C:inactive}if all cards score)'
             } }
        },
        j_dckst_benny = {
            name = 'benny',
            text = {
                -- k_dckst_benny_line1 goes here
                -- k_dckst_benny_line2 goes here
                'of Blind size, {C:red,E:2}self-destructs{}',
                '{C:inactive}(percentage changes randomly',
                '{C:inactive}every in-game second)'
            }
        },
        j_dckst_abraham_lincoln = {
            name = 'Abraham Lincoln',
            text = { {
                'All cards have a {C:green}#1# in #2#{}',
                'chance to be {C:attention,E:1}rescored{}', },
                { '{C:inactive,s:0.5}(Four score and seven years ago our fathers',
                '{C:inactive,s:0.5}brought forth upon this continent, a new nation,',
                '{C:inactive,s:0.5}conceived in Liberty, and dedicated to the',
                '{C:inactive,s:0.5}proposition that all men are created equal.)' }
            }
        },
        j_dckst_plan_b = {
            name = 'Plan B',
            text = {
                '{C:attention}+#1#{} card selection limit',
                'when less than {C:attention}#2#{} hands',
                'remaining'
            }
        },
        j_dckst_plan_b_h2 = {
            name = 'Plan B',
            text = {
                '{C:attention}+#1#{} card selection limit',
                'when less than {C:attention}#2#{} hands',
                'remaining'
            }
        },
        j_dckst_plan_b_h3 = {
            name = 'Plan B',
            text = {
                '{C:attention}+#1#{} card selection limit',
                'when less than {C:attention}#2#{} hands',
                'remaining'
            }
        },
        j_dckst_null_set = {
            name = 'Null Set',
            text = {
                '{C:mult}X#1#{} Mult if no {C:red}discards{}',
                'are used this round'
            }
        },
        j_dckst_null_set_h2 = {
            name = 'Null Set',
            text = {
                '{C:mult}X#1#{} Mult if no {C:red}discards{}',
                'are used this round'
            }
        },
        j_dckst_null_set_h3 = {
            name = 'Null Set',
            text = {
                '{C:white,X:dark_edition}^#1#{} Mult if no {C:red}discards{}',
                'are used this round'
            }
        },
        j_dckst_ventilation_fan = {
            name = "Ventilation Fan",
            text = {
                "Cycles through {C:attention}7{} events,",
                "changes when round ends",
                "{C:inactive}(Currently {C:white,X:attention}#1#{C:inactive})",
            }
        },
        j_dckst_troposphere = {
            name = "troposphere",
            text = {
                { '{C:attention,E:1}Levels up{} the most played', 'hand by {C:attention}#1#{} level(s) when', '{C:attention}one-shotting{} a Blind' }, 
                { '{C:attention}One-shot{} a Blind {C:attention}#2#{} {C:inactive}[#3#]{}', 'times to move onto the', 'next level {C:inactive}(stratosphere)' }
            }
        },
        j_dckst_stratosphere = {
            name = 'stratosphere',
            text = {
                { 'This Joker gains {X:mult,C:white}+X#1#{} Mult', 'when hand played and', '{C:red,E:2}destroys{} {C:attention}leftmost{} Joker', '{C:inactive}(excluding itself)', '{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)' },
                { 'Destroy {C:attention}#2#{} {C:inactive}[#3#]{} Jokers', 'to move onto the', 'next level {C:inactive}(mesosphere)' }
            }
        },
        j_dckst_stratosphere_h3 = {
            name = 'stratosphere',
            text = {
                { 'This Joker gains {X:dark_edition,C:white}+^#1#{} Mult', 'when hand played and', '{C:red,E:2}destroys{} {C:attention}leftmost{} Joker', '{C:inactive}(excluding itself)', '{C:inactive}(Currently {X:dark_edition,C:white}^#4#{C:inactive} Mult)' },
                { 'Destroy {C:attention}#2#{} {C:inactive}[#3#]{} Jokers', 'to move onto the', 'next level {C:inactive}(mesosphere)' }
            }
        },
        j_dckst_mesosphere = {
            name = 'mesosphere',
            text = {
                { '{C:attention,E:1}Rescores{} the {C:attention}leftmost{} and', '{C:attention}rightmost{} cards in hand', 'twice and gains {C:white,X:mult}+X#1#{}', 'Mult for each rescore', '{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)' },
                { 'Rescore {C:attention}#2#{} {C:inactive}[#3#]{} cards to', 'move onto the next', 'level {C:inactive}(thermosphere)' }
            }
        },
        j_dckst_mesosphere_h3 = {
            name = 'mesosphere',
            text = {
                { '{C:attention,E:1}Rescores{} the {C:attention}leftmost{} and', '{C:attention}rightmost{} cards in hand', 'twice and gains {C:white,X:dark_edition}+^#1#{}', 'Mult for each rescore', '{C:inactive}(Currently {X:dark_edition,C:white}^#4#{C:inactive} Mult)' },
                { 'Rescore {C:attention}#2#{} {C:inactive}[#3#]{} cards to', 'move onto the next', 'level {C:inactive}(thermosphere)' }
            }
        },
        j_dckst_thermosphere = {
            name = 'thermosphere',
            text = {
                {'Scored cards with {C:attention}light', '{C:attention}suits{} add {C:white,X:purple}+X#1#{} Score', 'to this Joker', '{C:inactive}(Currently {X:purple,C:white}X#4#{C:inactive} Score)' },
                { 'Score {C:attention}#2#{} {C:inactive}[#3#]{} {C:attention}light-suited', 'cards to move onto the', ' final level {C:inactive}(exosphere)' }
            }
        },
        j_dckst_thermosphere_h3 = {
            name = 'thermosphere',
            text = {
                {'Scored cards with {C:attention}light', '{C:attention}suits{} add {C:white,X:dark_edition}+^#1#{} Score', 'to this Joker', '{C:inactive}(Currently {X:dark_edition,C:white}^#4#{C:inactive} Score)' },
                { 'Score {C:attention}#2#{} {C:inactive}[#3#]{} {C:attention}light-suited', 'cards to move onto the', ' final level {C:inactive}(exosphere)' }
            }
        },
        j_dckst_exosphere = {
            name = 'exosphere',
            text = {
                'This Joker gains {C:white,X:mult}+X#2#{}',
                'Mult when {X:attention,C:white}anything{} happens',
                '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)',
                '{C:inactive,s:0.7}Tetratia you madlad{}'
            }
        },
        j_dckst_exosphere_h3 = {
            name = 'exosphere',
            text = {
                'This Joker gains {C:white,X:dark_edition}+^#2#{}',
                'Mult when {X:attention,C:white}anything{} happens',
                '{C:inactive}(Currently {X:dark_edition,C:white}^#1#{C:inactive} Mult)',
                '{C:inactive,s:0.7}Tetratia you madlad{}'
            }
        },
        j_dckst_scott_here = {
            name = 'Scott here!',
            text = {
                'This Joker gains {C:chips}+#1#',
                'Chips whenever {C:chips}Chips{} are',
                '{C:attention}modified{} in any way',
                '{C:inactive,s:0.8}(exclusing himself)',
                '{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)',
            }
        },
        j_dckst_scott_here_h2 = {
            name = 'Scott here!',
            text = {
                'This Joker gains {C:white,X:chips}+X#1#',
                'Chips whenever {C:chips}Chips{} are',
                '{C:attention}modified{} in any way',
                '{C:inactive,s:0.8}(exclusing himself)',
                '{C:inactive}(Currently {C:white,X:chips}X#2#{C:inactive} Chips)',
            }
        },
        j_dckst_scott_here_h3 = {
            name = 'Scott here!',
            text = {
                'This Joker gains {C:white,X:dark_edition}+^#1#',
                'Chips whenever {C:chips}Chips{} are',
                '{C:attention}modified{} in any way',
                '{C:inactive,s:0.8}(exclusing himself)',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Chips)',
            }
        },
        j_dckst_cfh = {
            name = 'Cowboy From Hell',
            text = {
                'If the amount of {C:blue}hands{}',
                'left equals {C:attention}#1#, {X:mult,C:white}X#2#{} Mult',
                'and {C:chips}+#3#{} Chips'
            }
        },
        j_dckst_smileghost = {
            name = 'smileghost',
            text = {
                '{C:green}#1# in #2#{} chance to give {C:attention}+#3#{}',
                '{C:red}Discard(s){} when at least {C:attention}#7#',
                'cards are discarded, {C:green}#4# in #5#{}',
                'chance to give {C:attention}+#6#{} {C:blue}Hand(s){} when',
                'at least {C:attention}#7#{} cards are played'
            }
        },
        j_dckst_blonk = {
            name = 'blonk',
            text = {
                'This nextbot will {C:attention,E:1}jump{} after',
                'hand is played, jumping height',
                'will be {C:attention}added{} to {X:mult,C:white}XMult{} and',
                'given in the same hand',
                '{C:inactive}(X#1#-X#2#)',
                '{C:inactive}(Currently {C:white,X:mult}X#3#{C:inactive} Mult)',
            }
        },
        j_dckst_blonk_h3 = {
            name = 'blonk',
            text = {
                'This nextbot will {C:attention,E:1}jump{} after',
                'hand is played, jumping height',
                'will be {C:attention}added{} to {X:dark_edition,C:white}^Mult{} and',
                'given in the same hand',
                '{C:inactive}(^#1#-^#2#)',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#3#{C:inactive} Mult)',
            }
        },
        j_dckst_wavgun = {
            name = "wavgun",
            text = {
                { "Can disable a",
                "{C:attention}Boss{} Blind {C:attention}#2#{} times",
                "{C:inactive}({C:attention}#1#{C:inactive}/#2# shots used){}", },
                { '{C:inactive,s:0.8}Right-click the card to fire!' }
            }
        },
        j_dckst_sunshine = {
            name = 'sunshine',
            text = {
                'When a {C:attention}2{}, {C:attention}3{}, or {C:attention}6{} is',
                'scored, this nextbot', 'gains {C:white,X:purple}+X#1#{} Score',
                '{C:inactive}(Currently {C:white,X:purple}X#2#{C:inactive} Score)',
            }
        },
        j_dckst_sunshine_h3 = {
            name = 'sunshine',
            text = {
                'When a {C:attention}2{}, {C:attention}3{}, or {C:attention}6{} is',
                'scored, this nextbot', 'gains {C:white,X:dark_edition}+^#1#{} Score',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Score)',
            }
        },
        j_dckst_dream = {
            name = 'dream',
            text = { 
                'Randomizes any {C:attention}positive{} change',
                'to {C:chips}Chips{}, {C:mult}Mult{}, or {C:purple}Score{}',
                'from {X:attention,C:white}X1{} to {X:attention,C:white}X100{}'
             }
        },
        j_dckst_liminesque = {
            name = 'liminesque',
            text = {
                'Score {C:attention}#1#{} {C:inactive}[#2#]{} Straights',
                'to unlock {X:dark_edition,C:white}^^^#3#{} Mult'
            }
        },
        j_dckst_liminesque_h3 = {
            name = 'liminesque',
            text = {
                'Score {C:attention}#1#{} {C:inactive}[#2#]{} Straights',
                'to unlock {X:dark_edition,C:white}^^^^#3#{} Mult'
            }
        },
        j_dckst_speed_coil = {
            name = 'speed coil',
            text = {
                'Gains {C:white,X:mult}+X#1#{} Mult for',
                'every {C:attention}game speed{} unit',
                'when hand is played',
                '{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)',
            }
        },
        j_dckst_speed_coil_h3 = {
            name = 'speed coil',
            text = {
                'Gains {C:white,X:dark_edition}+^#1#{} Mult for',
                'every {C:attention}game speed{} unit',
                'when hand is played',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Mult)',
            }
        },
        j_dckst_gravity_coil = {
            name = 'speed coil',
            text = {
                'Gains {C:white,X:chips}+X#1#{} Chips for',
                'every {C:attention}game speed{} unit',
                'when hand is played',
                '{C:inactive}(Currently {C:white,X:chips}X#2#{C:inactive} Chips)',
            }
        },
        j_dckst_gravity_coil_h3 = {
            name = 'speed coil',
            text = {
                'Gains {C:white,X:dark_edition}+^#1#{} Chips for',
                'every {C:attention}game speed{} unit',
                'when hand is played',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Chips)',
            }
        },
        j_dckst_dev_envmap = {
            name = 'dev_envmap',
            text = {
                '{C:inactive}Your Windows system',
                '{C:inactive}needs to upgrade.'
            }
        },
        j_dckst_polb = {
            name = 'polb',
            text = {
                'Scored {C:attention}dark-suited{} cards add',
                '{C:white,X:chips}+X#1#{} Chips to this nextbot',
                '{C:inactive}(Currently {C:white,X:chips}X#2#{C:inactive} Chips)',
            }
        },
        j_dckst_polb_h3 = {
            name = 'polb',
            text = {
                'Scored {C:attention}dark-suited{} cards add',
                '{C:white,X:dark_edition}+^#1#{} Chips to this nextbot',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Chips)',
            }
        },
        j_dckst_jermias = {
            name = 'jermias',
            text = {
                '{C:white,X:dark_edition}^^#1#{} Mult. Nothing else.',
                '{C:inactive,s:0.6,E:1}Hehehehahahehehehehehah!'
            }
        },
        j_dckst_follower = {
            name = 'follower',
            text = {
                'Stores final {C:mult}Mult{} amount',
                'of hand and returns it',
                'as {C:purple}Score{} next hand'
            }
        },
        j_dckst_follower_h2 = {
            name = 'follower',
            text = {
                'Stores final {C:mult}Mult{} amount',
                'of hand, divides it by',
                '{C:attention}#1#{}, and returns it',
                'as {C:white,X:purple}XScore{} next hand'
            }
        },
        j_dckst_follower_h3 = {
            name = 'follower',
            text = {
                'Stores final {C:mult}Mult{} amount',
                'of hand, divides it by',
                '{C:attention}#1#{}, and returns it',
                'as {C:white,X:dark_edition}^Score{} next hand'
            }
        },
        j_dckst_morevariedpathfinder = {
            name = 'morevariedpathfinder'
        },
        j_dckst_hopper = {
            name = 'hopper',
            text = {
                'Hops every {C:attention}in-game second{},',
                'returns hops amount as {C:mult}Mult',
                '{C:inactive}(Hopped {C:attention}#1#{C:inactive} times)'
            }
        },
        j_dckst_cootie = {
            name = 'cootie',
            text = {
                'This nextbot gains {X:mult,C:white}+X#1#{} Mult',
                'whenever a {C:dckst_nico_green}nico\'s nextbots{}', 
                'Joker triggers',
                '{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)',
            }
        },
        j_dckst_cootie_h3 = {
            name = 'cootie',
            text = {
                'This nextbot gains {X:dark_edition,C:white}+^#1#{} Mult',
                'whenever a {C:dckst_nico_green}nico\'s nextbots{}', 
                'Joker triggers',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Mult)',
            }
        },
        j_dckst_jess = {
            name = { 'jess', '{s:0.5}(maxwell)' },
            text = {
                'This nextbot completes a',
                '{C:attention}revolution{} every {C:attention}#3#{} in-game',
                'seconds, gives {X:purple,C:white}X#1#{} Score',
                'per revolutions completed',
                '{C:inactive}({C:attention}#2#{C:inactive} revolutions, {X:purple,C:white}X#4#{C:inactive} Score)',
            }
        },
        j_dckst_jess_h3 = {
            name = { 'jess', '{s:0.5}(maxwell)' },
            text = {
                'This nextbot completes a',
                '{C:attention}revolution{} every {C:attention}#3#{} in-game',
                'seconds, gives {X:dark_edition,C:white}^#1#{} Score',
                'per revolutions completed',
                '{C:inactive}({C:attention}#2#{C:inactive} revolutions, {X:dark_edition,C:white}^#4#{C:inactive} Score)',
            }
        },
        j_dckst_screensaver = {
            name = 'screensaver',
            text = {
                'When this nextbot is {C:attention}in possession,',
                'spawns random {C:red,E:2}error messages',
                'throughout the screen. Gains {C:white,X:mult}+X#1#{}', 
                'Mult per {C:attention}window closed',
                '{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)',
            }
        },
        j_dckst_screensaver_h3 = {
            name = 'screensaver',
            text = {
                'When this nextbot is {C:attention}in possession,',
                'spawns random {C:red,E:2}error messages',
                'throughout the screen. Gains {C:white,X:dark_edition}+^#1#{}', 
                'Mult per {C:attention}window closed',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Mult)',
            }
        },
        j_dckst_sprite_cranberry = {
            name = 'Sprite Cranberry',
            text = {
                'When an {C:uncommon}Uncommon{} or {C:rare}Rare{}', 
                'Joker {C:attention}triggers{}, gain {C:white,X:mult}+X#1#{} Mult',
                '{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)',
                '{C:inactive,s:0.6}It\'s the thir- thirstiest time, of the year!',
            }
        },
         j_dckst_sprite_cranberry_h3 = {
            name = 'Sprite Cranberry',
            text = {
                'When an {C:uncommon}Uncommon{} or {C:rare}Rare{}', 
                'Joker {C:attention}triggers{}, gain {C:white,X:dark_edition}+^#1#{} Mult',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Mult)',
                '{C:inactive,s:0.6}It\'s the thir- thirstiest time, of the year!',
            }
        },

        -- H JOKERS
        j_dckst_majuscule = {
            name = "Majuscule",
            text = {
                '{X:mult,C:white}X#1#{} Mult if played',
                'hand contains a {C:attention}Straight{}'
            }
        },
        j_dckst_miniscule = {
            name = "Miniscule",
            text = {
                '{X:chips,C:white}X#1#{} Chips if played',
                'hand contains a {C:attention}Straight{}'
            }
        },
        j_dckst_fraktur = {
            name = 'Fraktur',
            text = {
                '{C:attention,E:1}Rescores{} all scoring cards',
                'once if played hand',
                'contains a {C:attention}Straight{}'
            }
        },
        j_dckst_superscript = {
            name = 'Superscript',
            text = {
                '{X:purple,C:white}X#1#{} Score per card',
                'played if played hand',
                'contains a {C:attention}Straight{}'
            }
        },
        j_dckst_superscript_h2 = {
            name = 'Superscript',
            text = {
                '{X:purple,C:white}X#1#{} Score per card',
                'played if played hand',
                'contains a {C:attention}Straight{}'
            }
        },
        j_dckst_superscript_h3 = {
            name = 'Superscript',
            text = {
                '{C:white,X:dark_edition}^#1#{} Score per card',
                'played if played hand',
                'contains a {C:attention}Straight{}'
            }
        },
        j_dckst_subscript = {
            name = 'Subscript',
            text = {
                'This H gains {X:purple,C:white}+X#1#{} Score',
                'every {C:attention}third{} card scored if',
                'played hand contains a {C:attention}Straight{}',
                '{C:inactive}(Currently {X:purple,C:white}X#2#{C:inactive} Score)'
                }
        },
        j_dckst_subscript_h2 = {
            name = 'Subscript',
            text = {
                'This H gains {X:purple,C:white}+X#1#{} Score',
                'every {C:attention}third{} card scored if',
                'played hand contains a {C:attention}Straight{}',
                '{C:inactive}(Currently {X:purple,C:white}X#2#{C:inactive} Score)'
            }
        },
        j_dckst_subscript_h3 = {
            name = 'Subscript',
            text = {
                'This H gains {C:white,X:dark_edition}+^#1#{} Score',
                'every {C:attention}third{} card scored if',
                'played hand contains a {C:attention}Straight{}',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Score)'
            }
        },
        j_dckst_h_bar = {
            name = 'H-Bar',
            text = {
                'Every in-game second this',
                'H {C:attention}remains in possession{}, it',
                'gains {C:white,X:dckst_blindsize}X1.054571817{} units.',
                'When a {C:attention}Blind{} is selected,',
                '{C:dckst_blindsize}-#1#{} Blind size'
            }
        },
        j_dckst_aitch = {
            name = 'Aitch',
            text = {
                { '{C:attention}8{}s can now be',
                'counted as {C:attention}6{}s or {C:attention}7{}s', },
                { '{C:attention,s:0.7}CTRL + Click{C:inactive,s:0.7} the 8 in hand to', '{C:inactive,s:0.7}change its representative rank!'}
            }
        },
        j_dckst_aitch_h2 = {
            name = 'Aitch',
            text = {
                { '{C:attention}8{}s can now be',
                'counted as {C:attention}6{}s, {C:attention}7{}s, {C:attention}9{}s,', 'or {C:attention}10{}s' },
                { '{C:attention,s:0.7}CTRL + Click{C:inactive,s:0.7} the 8 in hand to', '{C:inactive,s:0.7}change its representative rank!' }
            }
        },
        j_dckst_aitch_h3 = {
            name = 'Aitch',
            text = {
                { '{C:attention}8{}s can now be',
                'counted as {C:attention}6{}s, {C:attention}7{}s, {C:attention}9{}s,', '{C:attention}10{}s, {C:attention}Jacks{}, {C:attention}Queens{},', '{C:attention}Kings{}, and {C:attention}Aces{}' },
                { '{C:attention,s:0.7}CTRL + Click{C:inactive,s:0.7} the 8 in hand to', '{C:inactive,s:0.7}change its representative rank!'}
            }
        },
        j_dckst_blackboard = {
            name = 'Blackboard',
            text = {
                'This H gains {C:white,X:chips}+X#1#{} Chips',
                'if played hand has at least',
                '{C:attention}4{} unique suits and contains',
                'a {C:attention}Straight{}',
                '{C:inactive}(Currently {C:white,X:chips}X#2#{C:inactive} Chips){}'
            }
        },
        j_dckst_blackboard_h2 = {
            name = 'Blackboard',
            text = {
                'This H gains {C:white,X:chips}+X#1#{} Chips',
                'if played hand has at least',
                '{C:attention}4{} unique suits and contains',
                'a {C:attention}Straight{}',
                '{C:inactive}(Currently {C:white,X:chips}X#2#{C:inactive} Chips){}'
            }
        },
        j_dckst_blackboard_h3 = {
            name = 'Blackboard',
            text = {
                'This H gains {C:white,X:dark_edition}+^#1#{} Chips',
                'if played hand has at least',
                '{C:attention}4{} unique suits and contains',
                'a {C:attention}Straight{}',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Chips){}'
            }
        },
        j_dckst_sansserif = {
            name = 'Sans-serif',
            text = {
                'When a {C:attention}Crazy Joker{} is sold,',
                'this Joker gains {C:purple}+#1#{} Score',
                '{C:inactive}(Currently {C:purple}+#2#{C:inactive} Score){}'
            }
        },
        j_dckst_sansserif_h2 = {
            name = 'Sans-serif',
            text = {
                'When a {C:attention}Crazy Joker{} is sold,',
                'this Joker gains {C:white,X:purple}+X#1#{} Score',
                '{C:inactive}(Currently {C:white,X:purple}X#2#{C:inactive} Score){}'
            }
        },
        j_dckst_sansserif_h3 = {
            name = 'Sans-serif',
            text = {
                'When a {C:attention}Crazy Joker{} is sold,',
                'this Joker gains {C:white,X:purple}+X#1#{} Score',
                '{C:inactive}(Currently {C:white,X:purple}X#2#{C:inactive} Score){}'
            }
        },
        j_dckst_small_caps = {
            name = 'Small Caps',
            text = {
                'Earn {C:money}$#1#{} for every {C:attention}Straight{}',
                'played this round, increase',
                'payout by {C:money}+$#2#{} per',
                '{C:attention}Straight{} played'
            }
        },
        j_dckst_small_caps_h2 = {
            name = 'Small Caps',
            text = {
                'Earn {C:white,X:money}X$#1#{} for every {C:attention}Straight{}',
                'played this round, increase',
                'payout by {C:white,X:money}+X$#2#{} per',
                '{C:attention}Straight{} played'
            }
        },
        j_dckst_small_caps_h3 = {
            name = 'Small Caps',
            text = {
                'Earn {C:white,X:money}X$#1#{} for every {C:attention}Straight{}',
                'played this round, increase',
                'payout by {C:white,X:money}+X$#2#{} per',
                '{C:attention}Straight{} played'
            }
        },
        j_dckst_cursive = {
            name = 'Cursive',
            text = {
                'This H gains {C:mult}+#2#{} units if played',
                'hand contains a {C:attention}Straight{}',
                'and an {C:attention}Ace{}. If played hand',
                'contains a {C:attention}Straight{} and',
                'an {C:attention}8{}, {C:mult}+#1#{} Mult'
            }
        },
        j_dckst_cursive_h2 = {
            name = 'Cursive',
            text = {
                'This H gains {C:mult}+#2#{} units if played',
                'hand contains a {C:attention}Straight{}',
                'and an {C:attention}Ace{}. If played hand',
                'contains a {C:attention}Straight{} and',
                'an {C:attention}8/9/10{}, {C:mult}+#1#{} Mult'
            }
        },
        j_dckst_cursive_h3 = {
            name = 'Cursive',
            text = {
                'This H gains {C:mult}+#2#{} units if played',
                'hand contains a {C:attention}Straight{}',
                'and an {C:attention}Ace{}. If played hand',
                'contains a {C:attention}Straight{} and',
                'an {C:attention}8/9/10{}, or {C:attention}face cards{},',
                'or an {C:attention}Ace{}, {C:mult}+#1#{} Mult'
            }
        },
        j_dckst_strikethrough = {
            name = 'Strikethrough',
            text = {
                'If played hand contains a',
                '{C:attention}Straight{}, this H permanently',
                'gives {C:attention}+#1#{} Joker slots and',
                '{C:attention}+#1#{} Consumable slots then',
                '{E:2,C:red}self-destructs{}'
            }
        },
        j_dckst_drop_cap = {
            name = 'Drop Cap',
            text = {
                'Any {C:attention}non-Straight{} hand',
                'gives {C:white,X:purple}X#1#{} Score'
            }
        },
        j_dckst_drop_cap_h3 = {
            name = 'Drop Cap',
            text = {
                'Any {C:attention}non-Straight{} hand',
                'gives {C:white,X:dark_edition}^#1#{} Score'
            }
        },
        j_dckst_braille = {
            name = 'Braille',
            text = {
                'If played hand contains a',
                '{C:attention}Straight{}, this H gains {C:white,X:mult}+X#1#{}',
                'Mult for each unique {C:attention}suit{}',
                'present in hand',
                '{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)'
            }
        },
        j_dckst_braille_h2 = {
            name = 'Braille',
            text = {
                'If played hand contains a',
                '{C:attention}Straight{}, this H gains {C:white,X:mult}+X#1#{}',
                'Mult for each unique {C:attention}suit{}',
                'present in hand',
                '{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)'
            }
        },
        j_dckst_braille_h3 = {
            name = 'Braille',
            text = {
                'If played hand contains a',
                '{C:attention}Straight{}, this H gains {C:white,X:dark_edition}+^#1#{}',
                'Mult for each unique {C:attention}suit{}',
                'present in hand',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#2#{C:inactive} Mult)'
            }
        },
        j_dckst_hieroglyph = {
            name = 'Hieroglyph',
            text = {
                '{C:attention,E:2}Every hand{} counts as',
                'containing a {C:attention}Straight{}'
            }
        },
        j_dckst_italic = {
            name = 'Italic',
            text = {
                '{C:green}#1# in #2#{} chance to',
                'create a {C:dark_edition}Wooden{} {C:attention}Crazy',
                '{C:attention}Joker{} when a hand',
                'containing a {C:attention}Straight{}',
                'is played'
            }
        },
        j_dckst_bold = {
            name = 'Bold',
            text = {
                '{C:white,X:money}X#1#{} reward money when',
                'a {C:attention}Blind{} is beaten'
            }
        },
        j_dckst_bold_h3 = {
            name = 'Bold',
            text = {
                '{C:white,X:dark_edition}^#1#{} reward money when',
                'a {C:attention}Blind{} is beaten'
            }
        },
        j_dckst_outlined = {
            name = "Outlined",
            text = {
                'Retrigger every scored card',
                '{C:attention}#2#{} time(s) per owned',
                '{C:attention}Crazy Joker{} if hand',
                'contains a {C:attention}Straight',
            },
        },
        j_dckst_outlined_h3 = {
            name = "Outlined",
            text = {
                {  'Retrigger every scored card',
                '{C:attention}#2#{} time(s) per owned',
                '{C:attention}Crazy Joker{} if hand',
                'contains a {C:attention}Straight', },
                { '{C:inactive,s:0.8}Amount of retriggers are', '{X:inactive,C:white,s:0.8}#1#X{C:inactive,s:0.8} the number of', '{C:inactive,s:0.8}Crazy Jokers' }
            },
        },
        j_dckst_rune = {
            name = 'Rune',
            text = {
                'If played hand contains a',
                '{C:attention}Straight{}, this H gains',
                '{X:mult,C:white}+X#1#{} Mult. If a hand without',
                'a {C:attention}Straight{} is played,',
                '{C:red,E:2}reset{} {X:mult,C:white}XMult{} to {C:attention}1{}',
                '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
            }
        },
        j_dckst_rune_h3 = {
            name = 'Rune',
            text = {
                'If played hand contains a',
                '{C:attention}Straight{}, this H gains',
                '{X:dark_edition,C:white}+^#1#{} Mult. If a hand without',
                'a {C:attention}Straight{} is played,',
                '{C:red,E:2}reset{} {X:dark_edition,C:white}^Mult{} to {C:attention}1{}',
                '{C:inactive}(Currently {X:dark_edition,C:white}^#2#{C:inactive} Mult)'
            }
        },
        j_dckst_chalk = {
            name = 'Chalk',
            text = {
                'This H gains {C:white,X:mult}+X#1#{} Mult',
                'if a {C:attention}Crazy Joker{} triggers,',
                'resets to {C:white,X:mult}X1{} at the',
                'start of each {C:attention}Ante{}',
                '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
            }
        },
        j_dckst_chalk_h3 = {
            name = 'Chalk',
            text = {
                'This H gains {C:white,X:dark_edition}+^#1#{} Mult',
                'if a {C:attention}Crazy Joker{} triggers,',
                'resets to {C:white,X:dark_edition}^1{} at the',
                'start of each {C:attention}Ante{}',
                '{C:inactive}(Currently {X:dark_edition,C:white}^#2#{C:inactive} Mult)'
            }
        },
        j_dckst_monospace = {
            name = "Monospace",
            text = {
                "This H gains {C:mult}+#1#{} Mult",
                "if played hand contains a",
                "{C:attention}Straight{} but not a {C:attention}#2#{},",
                "rank changes every hand",
                "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
            },
        },
        j_dckst_monospace_h2 = {
            name = "Monospace",
            text = {
                "This H gains {C:white,X:mult}+X#1#{} Mult",
                "if played hand contains a",
                "{C:attention}Straight{} but not a {C:attention}#2#{},",
                "rank changes every hand",
                "{C:inactive}(Currently {C:white,X:mult}X#3#{C:inactive} Mult)",
            },
        },
        j_dckst_monospace_h3 = {
            name = "Monospace",
            text = {
                "This H gains {C:white,X:dark_edition}+^#1#{} Mult",
                "if played hand contains a",
                "{C:attention}Straight{} but not a {C:attention}#2#{},",
                "rank changes every hand",
                "{C:inactive}(Currently {C:white,X:dark_edition}^#3#{C:inactive} Mult)",
            },
        },
        j_dckst_hegative = {
            name = 'Hegative',
            text = {
                'Creates a {C:dark_edition}Negative{C:attention} Crazy',
                '{C:attention}Joker{} when a {C:attention}Blind',
                'is selected'
            }
        },
        j_dckst_h_building = {
            name = 'H Building',
            text = {
                'This Joker gains {C:chips}+#1#{} Chips if',
                'played hand contains a {C:attention}Straight{},',
                'chip gain increases by {C:chips}+#2#{} for',
                'every time {C:attention}Saturn{} is used',
                '{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)'
            }
        },
        j_dckst_h_building_h2 = {
            name = 'H Building',
            text = {
                'This Joker gains {C:white,X:chips}+X#1#{} Chips if',
                'played hand contains a {C:attention}Straight{},',
                'chip gain increases by {C:white,X:chips}+X#2#{} for',
                'every time {C:attention}Saturn{} is used',
                '{C:inactive}(Currently {C:white,X:chips}X#3#{C:inactive} Chips)'
            }
        },
        j_dckst_h_building_h3 = {
            name = 'H Building',
            text = {
                'This Joker gains {C:white,X:dark_edition}+^#1#{} Chips if',
                'played hand contains a {C:attention}Straight{},',
                'chip gain increases by {C:white,X:dark_edition}+^#2#{} for',
                'every time {C:attention}Saturn{} is used',
                '{C:inactive}(Currently {C:white,X:dark_edition}^#3#{C:inactive} Chips)'
            }
        },
        j_dckst_dancing_h = {
            name = 'Dancing H',
            text = {
                '{C:green}#1# in #2#{} chance{} to',
                '{C:attention,E:1}level up{} played poker',
                'hand, probability increases',
                'by {C:attention}#3#{} for every other',
                'Joker owned'
            }
        },
        j_dckst_gordon_ramsay_h = {
            name = "Gordon Ramsay H",
            text = { {
                'This Joker gains {C:mult}+#1#{}',
                'Mult when {C:attention}round starts{},',
                'mult gain increases by',
                '{C:mult}+#2#{} for every card {C:attention}eaten',
                '{C:inactive}(Currently{} {C:mult}+#3#{} {C:inactive}Mult){}', },
                { '{C:inactive,s:0.9}(eaten = destroyed){}' }
            }
        },
        j_dckst_gordon_ramsay_h_h2 = {
            name = "Gordon Ramsay H",
            text = { {
                'This Joker gains {C:white,X:mult}+X#1#{}',
                'Mult when {C:attention}round starts{},',
                'mult gain increases by',
                '{C:white,X:mult}+X#2#{} for every card {C:attention}eaten',
                '{C:inactive}(Currently{} {C:white,X:mult}X#3#{} {C:inactive}Mult){}', },
                { '{C:inactive,s:0.9}(eaten = destroyed){}' }
            }
        },
        j_dckst_gordon_ramsay_h_h3 = {
            name = "Gordon Ramsay H",
            text = { {
                'This Joker gains {C:white,X:dark_edition}+^#1#{}',
                'Mult when {C:attention}round starts{},',
                'mult gain increases by',
                '{C:white,X:dark_edition}+^#2#{} for every card {C:attention}eaten',
                '{C:inactive}(Currently{} {C:white,X:dark_edition}^#3#{} {C:inactive}Mult){}', },
                { '{C:inactive,s:0.9}(eaten = destroyed){}' }
            }
        },
        j_dckst_lava_lamp_h = {
            name = "Lava Lamp H",
            text = {
                "{C:green}#1# in #2#{} chance for {X:mult,C:white}X#3#{} Mult,",
                "{C:green}#4# in #5#{} chance for {X:mult,C:white}X#6#{} Mult,",
                "{C:green}#7# in #8#{} chance to give {C:money}$#9#{}",
                "if played hand contains a {C:attention}Straight",
            }
        },
        j_dckst_lava_lamp_h_h2 = {
            name = "Lava Lamp H",
            text = {
                "{C:green}#1# in #2#{} chance for {X:mult,C:white}X#3#{} Mult,",
                "{C:green}#4# in #5#{} chance for {X:mult,C:white}X#6#{} Mult,",
                "{C:green}#7# in #8#{} chance to give {C:money}$#9#{}",
                "if played hand contains a {C:attention}Straight",
            }
        },
        j_dckst_lava_lamp_h_h3 = {
            name = "Lava Lamp H",
            text = {
                "{C:green}#1# in #2#{} chance for {X:dark_edition,C:white}^#3#{} Mult,",
                "{C:green}#4# in #5#{} chance for {X:dark_edition,C:white}^#6#{} Mult,",
                "{C:green}#7# in #8#{} chance to give {C:money}$#9#{}",
                "if played hand contains a {C:attention}Straight",
            }
        },
        j_dckst_hoth = {
            name = 'H of the H',
            text = {
                'Creates a random {C:dckst_h_red}H Joker{}',
                'when a {C:attention}Blind{} is selected',
                '{C:inactive}(Must have room)'
            }
        },
        j_dckst_space_h = {
            name = 'Space H',
            text = {
                "When a {C:planet}Planet{} card",
                "is used, also {C:attention,E:1}level up{}",
                "{C:attention}Straight{} by {C:attention}#1#{} level(s)"
            }
        },
        j_dckst_hedge = {
            name = 'Hedge',
            text = {
                'Adds {C:attention}#1#{} random card(s) with',
                'a {C:attention}random seal{} to hand if',
                'played hand contains a {C:attention}Straight'
            }
        },
        j_dckst_encircled = {
            name = 'Encircled',
            text = {
                'Any {C:red,E:2}harmful{} effects to',
                '{C:chips}Chips{}, {C:mult}Mult{}, or {C:purple}Score{}',
                'are {C:attention,E:1}nullified'
            }
        },


        -- TIER 3 EXCLUSIVE JOKERS, DO NOT TAMPER

        j_dckst_pillaring = {
            name = "Pillaring",
            text = {
                'This Joker gains {X:dark_edition,C:white}+^#1#{} Mult',
                'for every card {C:attention}scored{}',
                '{C:inactive}(Currently {}{C:inactive}{}{X:dark_edition,C:white}^#2#{} {C:inactive}Mult){}'
            }
        },






    },
    Enhanced = {
        m_dckst_felious = {
            name = "Felious Card",
            text = {
                "{C:green}#1# in #2#{} chance",
                "to retrigger {C:attention}#3#{}",
                "additional times"
            }
        },
        m_dckst_nature = {
            name = "Nature Card",
            text = {
                '{C:red}+#1#{} Mult, {C:blue}+#2#{} extra chips,',
                '{C:money}+$#3#{}'
            }
        },
        m_dckst_starry = {
            name = "Starry Card",
            text = {
                "{C:green}#1# in #2#{} chance",
                "to {C:attention,E:1,s:1.1}level up{} played",
                "hand when scored",
            }
        },
        m_dckst_random = {
            name = "Random Card",
            text = { '{C:mult}+#1#-#2#{} Mult' }
        },
        m_dckst_consecutive = {
            name = 'Consecutive Card',
            text = {
                'Gives {X:mult,C:white}X#1#{} Mult if',
                'played hand contains a',
                '{C:attention}Straight{}',
            }
        },
        m_dckst_striped = {
            name = "Striped Card",
            text = {
                'This card either gives',
                '{C:blue}+#1#{} extra chips or',
                '{C:red}+#2#{} Mult when scored'
            }
        },
        m_dckst_lebronned = {
            name = 'LeBronned Card',
            text = {
                '{C:chips}+#1#{} extra chips', 
                '{C:mult}+#2#{} Mult'
            }
        },
        m_dckst_francaise = {
            name = "Carte Française",
            text = {
                '{C:chips}+#1#{} extra chips', 
                '{C:mult}+#2#{} Mult'
            }
        },
        m_dckst_serpentine = {
            name = "Serpentine Card",
            text = {
                "Draws {C:attention}#1#{} cards",
                "to hand if held",
                "in hand while scoring"
            }
        },
        m_dckst_giggling = {
            name = "Giggling Card",
            text = {
                'Gains {C:mult}+#1#{} Mult if',
                'hand has a scoring',
                '{C:attention}face card{}',
                '{C:inactive}(Currently{} {C:mult}+#2#{} {C:inactive}Mult){}'
            }
        },
        m_dckst_techno = {
            name = "Techno Card",
            text = {
                "Gives {C:mult}+#1#{} Mult",
                "{C:green}#2# in #3#{} chance to",
                "multiply this card's",
                "Mult by {C:attention}#4#{} when scored"
            }
        },
        m_dckst_icy = {
            name = "Icy Card",
            text = {
                "Gives {C:mult}+#1#{} Mult",
                "and {C:chips}+#2#{} extra chips",
                "Melts after {C:attention}#3#{} scores",
                "{C:inactive}(Used #4# times)"
            }
        },
        m_dckst_h = {
            name = "H Card",
            text = {
                '{C:mult}+#1#{} Mult if hand',
                'contains a {C:attention}Straight{},',
                'else {C:mult}+#2#{} Mult',
            }
        },
        m_dckst_onomatopoetic = {
            name = "Onomatopoetic Card",
            text = {
                '{C:chips}+#1#{} extra chips, or',
                '{C:mult}+#2#{} Mult, or {C:money}+$#3#{}',
            }
        },
        m_dckst_aluminum = {
            name = "Aluminum Card",
            text = {
                "Gives {C:chips}+#1#{} extra chips",
                "+{C:chips}#2#{} extra chips per Joker",
                "+{C:mult}#3#{} Mult per card in hand",
                "{C:inactive}({C:chips}+#4#{C:inactive}, {C:mult}+#5#{C:inactive}){}"
            }
        },
        m_dckst_potassium = {
            name = "Potassium Card",
            text = {
                "{C:mult}+#1#{} Mult,",
                "{C:green}#2# in #3#{} chance to",
                "{C:red}self-destruct{}",
                "when scored"
            }
        },
        m_dckst_cobalt = {
            name = "Cobalt Card",
            text = {
                '{X:mult,C:white}X#1#{} Mult,',
                'no rank, no suit,',
                'always scores'
            }
        },
        m_dckst_molybdenum = {
            name = "Molybdenum Card",
            text = {
                'This card {C:attention}cannot{} be',
                'debuffed, also gives {C:chips}+#1#{}',
                'extra chips'
            }
        },
        m_dckst_iridium  = {
            name = "Iridium Card",
            text = {
                "{X:mult,C:white}X#1#{} Mult, {C:money}+$#2#{}",
            }
        },
        m_dckst_cerium = {
            name = "Cerium Card",
            text = {
                'Gains {C:chips}+#1#{} extra chips',
                'if score {E:1,s:1.1,C:attention}catches fire{}',
            }
        },
    },
    Edition = {
        e_dckst_cosmic = {
            name = "Cosmic",
            text = {
                'All values on this card',
                'are {E:1,s:1.1,C:money}tripled{}',
                '{C:inactive}(If possible){}'
            }
        },
        e_dckst_phosphorescent = {
            name = "Phosphorescent",
            text = {
                '{C:mult}+#1#{} Mult,',
                '{X:chips,C:white}X#2#{} Chips'
            }
        },
        e_dckst_aetherescent = {
            name = 'Aetherescent',
            text = {
                '{C:blue}+#1#{} Chips,',
                '{X:red,C:white}X#2#{} Mult'
            }
        },
        e_dckst_iridescent = {
            name = 'Iridescent',
            text = {
                '{C:green}#1# in #2#{} chance to',
                'create a random',
                '{C:dark_edition}Negative{} {C:tarot}Tarot{},',
                '{V:1}Catarot{}, or {V:2}Neo-Tarot{} card'
            }
        },
        e_dckst_prismatic = {
            name = 'Prismatic',
            text = {
                '{C:chips}+#1#{} Chips,',
                '{C:mult}+#2#{} Mult'
            }
        },
        e_dckst_wooden = {
            name = 'Wooden',
            text = {
                '{C:dark_edition}+#1#{} Joker slots'
            }
        },
        e_dckst_vhs = {
            name = 'VHS',
            text = {
                'This card',
                '{C:attention,E:1}rescores{} itself'
            }
        },
    },
    Stake = {
        stake_dckst_dandy = {
            name = "Dandy Stake",
            text = {
                "Booster Packs cost {C:money}$1{}",
                "{C:attention}more{} per Ante",
                "{s:0.8}Applies Blue Stake{}"
            }
        },
        stake_dckst_feline = {
            name = "Feline Stake",
            text = {
                'Shop can have {C:attention}Zoomy{} Jokers',
                '{C:inactive,s:0.8}(Randomly switches places before scoring){}',
                 "{s:0.8}Applies Blue Stake{}"
            }
        },
        stake_dckst_chroma = {
            name = "Chroma Stake",
            text = {
                'Jokers with {C:dark_edition}Editions{}',
                'appear {X:dark_edition,C:white}X0.1{} as often',
                "{s:0.8}Applies Purple Stake and prev.{}"
            }
        },
        stake_dckst_clay = {
            name = "Clay Stake",
            text = {
                'When {C:attention}Blind{} selected, add a',
                'random unenhanced playing card to deck',
                "{s:0.8}Applies Gold Stake and prev.{}"
            }
        },
        stake_dckst_storm = {
            name = "Storm Stake",
            text = {
                'Hand will {C:red}not{} score if played hand',
                'contains only {C:attention}one{} card of each rank',
                "{s:0.8}Applies Gold Stake{}"
            }
        },
        stake_dckst_fall = {
            name = "Fall Stake",
            text = {
                'Shop can have {C:attention}Deciduous{} Jokers',
                '{C:inactive,s:0.8}(Destroyed after 8 triggers){}',
                 "{s:0.8}Applies Clay Stake and prev.{}"
            }
        },
        stake_dckst_cuprum = {
            name = "Cuprum Stake",
            text = {
                '{C:green}Rerolls{} cost {C:money}$1{} {C:attention}more{} per Ante',
                "{s:0.8}Applies Clay Stake and prev.{}"
            }
        },
        stake_dckst_silver = {
            name = "Silver Stake",
            text = {
                'Required score {C:attention}scales faster{} for each {C:attention}Ante{}',
                "{s:0.8}Applies Fall Stake and prev.{}"
            }
        },
        stake_dckst_hollow = {
            name = "Hollow Stake",
            text = {
                'Playing cards give {X:mult,C:white}X0.9{} Mult',
                'and {X:chips,C:white}X0.95{} Chips when scored',
                "{s:0.8}Applies Fall Stake and prev.{}"
            }
        },
        stake_dckst_solar = {
            name = "Solar Stake",
            text = {
                'Every {C:attention}3{} rounds, all held',
                '{C:attention}consumables{} are {C:red}destroyed{}',
                "{s:0.8}Applies Silver Stake and prev.{}"
            }
        },
        stake_dckst_lunar = {
            name = "Lunar Stake",
            text = {
                '{C:green}1 in 8{} cards are drawn face down',
                '{C:inactive}(fixed chance){}',
                "{s:0.8}Applies Silver Stake and prev.{}"
            }
        },
        stake_dckst_satellite = {
            name = "Satellite Stake",
            text = {
                'Temporarily {C:red}debuffs{} the {C:attention}leftmost{}',
                'Joker when {C:attention}Blind{} is selected',
                "{s:0.8}Applies Silver Stake and prev.{}"
            }
        },
        stake_dckst_platina = {
            name = "Platina Stake",
            text = {
                'Every Joker\'s {C:attention}sell value{}',
                'is permanently {C:money}$0{}',
                "{s:0.8}Applies Lunar Stake and prev.{}"
            }
        },
        stake_dckst_bismuth = {
            name = "Bismuth Stake",
            text = {
                'Must beat Ante {C:attention}12{} to win',
                "{s:0.8}Applies Lunar Stake and prev.{}"
            }
        },
        stake_dckst_solitaire = {
            name = "Solitaire Stake",
            text = {
                'Shop can have {C:attention}Halved{} Jokers',
                '{C:inactive,s:0.8}(All values are halved, if possible){}',
                "{s:0.8}Applies Platina Stake and prev.{}"
            }
        },
        stake_dckst_h = {
            name = "H Stake",
            text = {
                'Every {C:attention}8{} rounds, {C:attention}8{} random cards',
                'are {C:red}removed{} from deck',
                "{s:0.8}Applies Platina Stake and prev.{}"
            }
        },
        stake_dckst_atomic = {
            name = "Atomic Stake",
            text = {
                'Required score scales {C:attention}extra fast{} for each Ante',
                "{s:0.8}Applies Platina Stake and prev.{}"
            }
        },
        stake_dckst_jimbo  ={
            name = "Jimbo Stake",
            text = {
                'All Jokers in shops and booster packs have',
                'a {C:green}1 in 5{} chance to be replaced with Joker',
                '{C:inactive}(Fixed chance){}',
                "{s:0.8}Applies Platina Stake and prev.{}"
            }
        },
        stake_dckst_antimatter = {
            name = "Antimatter Stake",
            text = {
                '{C:red}-2{} Joker slots',
                "{s:0.8}Applies Solitaire Stake and prev.{}"
            }
        },
        stake_dckst_shattered = {
            name = "Shattered Stake",
            text = {
                'All playing cards and Jokers have a {C:green}1 in 3{} chance',
                'to be destroyed when triggered',
                '{C:inactive}(Fixed chance){}',
                "{s:0.8}Applies Solitaire Stake and prev.{}"
            }
        },
        stake_dckst_exalted = {
            name = "Exalted Stake",
            text = {
                'Lose {C:attention}67%{} of total {C:money}money{}',
                'at the end of even Antes {C:inactive}(Rounded down){}',
                "{s:0.8}Applies Solitaire Stake and prev.{}"
            }
        },
        stake_dckst_continual = {
            name = "Continual Stake",
            text = {
                'Must beat Ante {C:attention}16{} to win',
                "{s:0.8}Applies Solitaire Stake and prev.{}"
            }
        },
        stake_dckst_universal = {
            name = "Universal Stake",
            text = {
                'Required score scales {C:attention}much faster{} for each Ante',
                "{s:0.8}Applies Antimatter Stake and prev.{}"
            }
        },
        stake_dckst_nebular = {
            name = "Nebular Stake",
            text = {
                'Required score scales {C:attention}super fast{} for each Ante',
                "{s:0.8}Applies Antimatter Stake and prev.{}"
            }
        },
        stake_dckst_penultimate = {
            name = "Penultimate Stake",
            text = {
                '{C:red}-1{} shop slot',
                "{s:0.8}Applies Antimatter Stake and prev.{}"
            }
        },
        stake_dckst_ultimate = {
            name = "Ultimate Stake",
            text = {
                'Required score scales {C:attention}much much faster{} for each Ante',
                "{s:0.8}Applies Universal Stake and prev.{}"
            }
        }
    },
    Tag = {
        tag_dckst_dexy = {
            name = "Dexy Tag",
            text = {
                'Opens a free',
                '{C:attention}Jumbo Decksteritical Pack{}',
            }
        },
        tag_dckst_carcana = {
            name = "Carcana Tag",
            text = {
                'Opens a free',
                '{C:attention}Mega Carcana Pack{}',
            }
        },
        tag_dckst_claw = {
            name = "Claw Tag",
            text = {
                'Opens a free',
                '{C:attention}Mega Spectaclaw Pack{}',
            }
        },
        tag_dckst_neo = {
            name = "Neo Tag",
            text = {
                'Opens a free',
                '{C:attention}Mega Neo-Arcana Pack{}',
            }
        },
        tag_dckst_tramway = {
            name = "Tramway Tag",
            text = {
                'Opens a free',
                '{C:attention}Mega Tram Pack{}',
            }
        },
        tag_dckst_phosphy = {
            name = "Phosphy Tag",
            text = {
                "Next base edition shop",
                "Joker is free and",
                "becomes {C:dark_edition}Phosphorescent{}",
            }
        },
        tag_dckst_aether = {
            name = "Aether Tag",
            text = {
                "Next base edition shop",
                "Joker is free and",
                "becomes {C:dark_edition}Aetherescent{}",
            }
        },
        tag_dckst_prism = {
            name = "Prism Tag",
            text = {
                "Next base edition shop",
                "Joker is free and",
                "becomes {C:dark_edition}Prismatic{}",
            }
        },
        tag_dckst_woody = {
            name = "Woody Tag",
            text = {
                "Next base edition shop",
                "Joker is free and",
                "becomes {C:dark_edition}Wooden{}",
            }
        },
        tag_dckst_sumeable = {
            name = "Sumeable Tag",
            text = {
                "Adds {C:attention}2{} random",
                "consumables to slot",
                "{C:inactive}(Doesn\'t need room){}",
            }
        },
        tag_dckst_top_up_pro_max = {
            name = "Top-up Tag Pro Max",
            text = {
                "Creates up to {C:attention}#1#{}",
                "{C:rare}Rare{} Jokers, {X:money,C:white}X$#2#{}",
                "{C:inactive}(Must have room){}",
            }
        },
        tag_dckst_fixy = {
            name = "Fixy Tag",
            text = {
                '{C:red,E:2}Destroys{} {C:attention}#1#-#2#{} cards',
                'in deck'
            }
        },
        tag_dckst_temporahandy = {
            name = 'Temporahandy Tag',
            text = {
                "Gain {C:blue}+#1#{} temporary",
                "hand next round"
            }
        },
        tag_dckst_temporatrashy = {
            name = 'Temporatrashy Tag',
            text = {
                "Gain {C:red}+#1#{} temporary",
                "discard next round"
            }
        },
        tag_dckst_price = {
            name = "Price Tag",
            text = {
                '{C:attention,E:2}Every item{} in the next',
                'shop is {C:attention}#1#%{} off',
            }
        },
        tag_dckst_tag = {
            name = "Tag Tag",
            text = {
                'Creates a',
                'random {C:attention}Tag{}',
            }
        },
        tag_dckst_combo = {
            name = "Combo Tag",
            text = {
                'Creates a {C:attention}Dexy Tag{},',
                '{C:attention}Carcana Tag{}, {C:attention}Neo Tag{},',
                'and {C:attention}Tramway Tag{}',
            }
        },
        tag_dckst_saturn = {
            name = "Saturn Tag",
            text = {
                'Levels up {C:attention}#1#{}',
                'by {C:attention}#2#{} levels',
            }
        },
        tag_dckst_crazy = {
            name = "Crazy Tag",
            text = {
                'Spawns {C:attention}Crazy Joker{}',
                '{C:inactive}(Doesn\'t need room){}',
            }
        },
        tag_dckst_sextuple = {
			name = "Sextuple Tag",
			text = {
				"Gives {C:attention}#1#{} copies of the",
				"next selected {C:attention}Tag",
				"{s:0.8,C:attention}Copying Tags {s:0.8}excluded",
			}
		},
        tag_dckst_septuple = {
			name = "Septuple Tag",
			text = {
				"Gives {C:attention}#1#{} copies of the",
				"next selected {C:attention}Tag",
				"{s:0.8,C:attention}Copying Tags {s:0.8}excluded",
			}
		},
        tag_dckst_vault = {
            name = 'Vault Tag',
            text = {
                "{C:attention}+1{} Joker slot"
            }
        },
        tag_dckst_h = {
            name = "H Tag",
            text = {
                'Creates a random',
                '{V:1}H Joker{}',
                '{C:inactive}(Must have room){}'
            }
        },
        tag_dckst_redeeming = {
            name = 'Redeeming Tag',
            text = {
                'Redeems a',
                '{C:attention}random{} Voucher'
            }
        },
        tag_dckst_lasting = {
            name = 'Lasting Tag',
            text = {
                "Creates a random {C:attention}Joker{}",
                "with {C:attention}Evergreen{}"
            }
        },
        tag_dckst_fancy = {
            name = "Fancy Tag",
            text = {
                "{C:attention}30%{} of the deck is",
                "enhanced with a random",
                "{C:enhanced}Enhancement{}"
            }
        },
        tag_dckst_bastet = {
            name = "Bastet's Tag",
            text = {
                "Duplicates a random",
                "{C:attention}owned Joker{}",
                "{C:inactive}(Must have room){}",
                "{s:0.5}CURSE OF RA :fire:{}"
            }
        },
        tag_dckst_beckoning = {
            name = 'Beckoning Tag',
            text = {
                "{C:attention}Quadruples{}",
                "owned {C:money}money{}"
            }
        },
        tag_dckst_concierge = {
            name = "Concierge Tag",
            text = {
                "Next Joker in shop is",
                "guaranteed to be {C:dark_edition}Editioned{}",
                "{C:inactive}(All editions weighted equally){}"
            }
        },
        tag_dckst_ledger = {
            name = "Ledger Tag",
            text = {
                'Gives {C:money}$2{} for every {C:blue}Hand{}',
                'and {C:money}$1{} for every {C:red}Discard{}'
            }
        },
        tag_dckst_two = {
            name = "Two Tag",
            text = {
                '{C:attention}+#1#{} Consumable slots'
            }
        },
    },
    Catarot = {
        c_dckst_meowbo = {
            name = "Meowbo",
            text = {
                'Creates the last {V:1}Catarot{}',
                'card used',
                '{s:0.8,V:1}Meowbo{s:0.8} excluded',
                '{C:inactive}(Must have room){}',
            }
        },
        c_dckst_ragdoll = {
            name = "Ragdoll",
            text = {
                'Gives {C:chips}+#1#{} permanent',
                'bonus chips to {C:attention}1{}',
                'selected card'
            }
        },
        c_dckst_siamese = {
            name = "Siamese",
            text = {
                "Select {C:attention}#1#{} cards,",
                "the {C:attention}#2#{} rightmost cards",
                "copy the suit of",
                "the {C:attention}leftmost{} card",
                "{C:inactive}(Drag to rearrange){}"
            }
        },
        c_dckst_bengal = {
            name = "Bengal",
            text = {
                'Converts up to {C:attention}#2#{}',
                'selected cards into',
                'either {C:diamonds}Diamonds{} or',
                '{C:spades}Spades{}',
                '{C:inactive,s:0.75}(randomly selected for each card){}'
            }
        },
        c_dckst_russianblue = {
            name = "Russian Blue",
            text = {
                'Converts up to {C:attention}#2#{}',
                'selected cards into',
                'either {C:hearts}Hearts{} or',
                '{C:clubs}Clubs{}',
                '{C:inactive,s:0.75}(randomly selected for each card){}'
            }
        },
        c_dckst_abyssinian = {
            name = "Abyssinian",
            text = {
            'Sets money to the',
            'next multiple of {C:money}$#1#{}'
            }
        },
        c_dckst_chartreux = {
            name = "Chartreux",
            text = {
                'Adds a {C:attention}Chartreuse Seal{}',
                'to {C:attention}#1#{} selected card'
            }
        },
        c_dckst_devonrex = {
            name = "Devon Rex",
            text = {
                'Enhances {C:attention}#1#{} ',
                'selected card to a',
                '{C:attention}Striped Card{}'
            }
        },
        c_dckst_norwegianforest = {
            name = "Norwegian Forest Cat",
            text = {
                'Enhances {C:attention}#1#{} ',
                'selected card to a',
                '{C:attention}Random Card{}'
            }
        },
        c_dckst_mainecoon = {
            name = "Maine Coon",
            text = {
                'Enhances {C:attention}#1#{} ',
                'selected card to a',
                '{C:attention}LeBronned Card{}'
            }
        },
        c_dckst_rustyspotted = {
            name = "Rusty-spotted",
            text = {
                'Enhances up to {C:attention}#1#{} ',
                'selected cards to',
                '{C:attention}Nature Cards{}'
            }
        },
        c_dckst_americanshorthair = {
            name = {"American", "Shorthair"},
            text = {
                'Enhances {C:attention}#1#{} ',
                'selected card to a',
                '{C:attention}Starry Card{}'
            }
        },
        c_dckst_birman = {
            name = "Birman",
            text = {
                'Enhances up to {C:attention}#1#{} ',
                'selected cards to',
                '{C:attention}Cartes Françaises{}'
            }
        },
        c_dckst_grumpy = {
            name = "Grumpy Cat",
            text = {
                'Enhances {C:attention}#1#{} ',
                'selected card to a',
                '{C:attention}Techno Card{}'
            }
        },
        c_dckst_munchkins = {
            name = "Munchkins",
            text = {
                'Adds a {C:attention}Periwinkle Seal{}',
                'to {C:attention}#1#{} selected card'
            }
        },
        c_dckst_kinkalow = {
            name = "Kinkalow",
            text = {
                'Enhances up to {C:attention}#1#{} ',
                'selected cards to',
                '{C:attention}Onomatopoetic Cards{}'
            }
        },
        c_dckst_burmese = {
            name = "Burmese",
            text = {
                '{C:green}#2# in #3#{} chance to',
                'apply an {C:attention}Evergreen Sticker{}',
                'on {C:attention}#1#{} selected Joker'
            }
        },
        c_dckst_persian = {
            name = "Persian",
            text = {
                'Applies a {C:attention}Smiley Sticker{}',
                'on {C:attention}#1#{} selected Joker',
                'or playing card'
            }
        },
        c_dckst_minuet = {
            name = "Minuet",
            text = {
                'Enhances up to {C:attention}#1#{} ',
                'selected cards to',
                '{C:attention}H Cards{}'
            }
        },
        c_dckst_minuet = {
            name = "Minuet",
            text = {
                'Enhances up to {C:attention}#1#{} ',
                'selected cards to',
                '{C:attention}H Cards{}'
            }
        },
        c_dckst_europeanshorthair = {
            name = { "European", "Shorthair" },
            text = {
                'Enhances up to {C:attention}#1#{} ',
                'selected cards to',
                '{C:attention}Cobalt Cards{}'
            }
        },
        c_dckst_snowshoe = {
            name = "Snowshoe",
            text = {
                'Enhances up to {C:attention}#1#{} ',
                'selected cards to',
                '{C:attention}Molybdenum Cards{}'
            }
        },
        c_dckst_turkishangora = {
            name = { "Turkish", "Angora" },
            text = {
                'Enhances {C:attention}#1#{} ',
                'selected card to a',
                '{C:attention}Giggling Card{}'
            }
        },
    },
    neotarot = {
        c_dckst_individual = {
            name = "INDIVIDUAL.",
            text = {
                'Creates the last used',
                '{V:1}Neo-Tarot{} card',
                '{s:0.8,V:1}INDIVIDUAL.{s:0.8} excluded',
                '{C:inactive}(Must have room){}'
            }
        },
        c_dckst_childhood = {
            name = "CHILDHOOD.",
            text = {
                "Enhances {C:attention}#1#{} random",
                "cards in hand into",
                "{C:attention}Nature Cards{}"
            }
        },
        c_dckst_youth = {
            name = "YOUTH.",
            text = {
                "Increase the rank of",
                "up to {C:attention}#1#{} selected",
                "cards by {C:attention}#2#{}"
            }
        },
        c_dckst_maturity = {
            name = "MATURITY.",
            text = {
                "Creates a {C:attention}copy{} of a random",
                "{C:common}Common{} or {C:uncommon}Uncommon{} Joker",
                "{C:inactive}(Must have room)"
            }
        },
        c_dckst_old_age = {
            name = "OLD AGE.",
            text = {
                "{C:red}Destroys{} every card",
                "except the {C:attention}#1#{} leftmost",
                "cards in hand,",
                "{X:money,C:white}X$#2#{}"
            }
        },
        c_dckst_morning = {
            name = "MORNING.",
            text = {
                "Creates up to {C:attention}#1#{} random",
                "{C:common}Common{} Jokers, then",
                "{C:red}destroys{} {C:attention}#2#{} random",
                "cards in hand",
                "{C:inactive}(Must have room)"
            }
        },
        c_dckst_afternoon = {
            name = "AFTERNOON.",
            text = {
                "Creates a random {C:attention}Joker{}",
                "{C:inactive}(Doesn't need room)"
            }
        },
        c_dckst_evening = {
            name = "EVENING.",
            text = {
                "{X:money,C:white}X$#1#{},",
                "Creates {C:attention}#2#{} random",
                "unmodified cards and",
                "puts them in deck"
            }
        },
        c_dckst_night = {
            name = "NIGHT.",
            text = {
                "Select at least",
                "{C:attention}#1#{} cards, creates",
                "{C:attention}#3#{} copy each of",
                "{C:attention}#2#{} random selected",
                "cards"
            }
        },
        c_dckst_earth_and_air = {
            name = "EARTH AND AIR.",
            text = {
                "Each card in hand has a",
                "{C:green}#1# in #2#{} chance to become",
                "a {C:attention}Stone Card{} and a",
                "{C:green}#3# in #4#{} chance to receive",
                "a {C:attention}White Seal{}"
            }
        },
        c_dckst_water_and_fire = {
            name = "WATER AND FIRE.",
            text = {
                "Either applies a",
                "permanent {C:mult}+#1#{} Mult or",
                "{C:chips}+#2#{} Chips bonus",
                "on {C:attention}#3#{} selected card"
            }
        },
        c_dckst_dance = {
            name = "DANCE.",
            text = {
                "Creates {C:attention}#1#{} of the last",
                "{C:tarot}Tarot{} or {C:planet}Planet{} card",
                "used during this run",
                "{s:0.8,C:tarot}The Fool{s:0.8} excluded",
            }
        },
        c_dckst_shopping = {
            name = "SHOPPING.",
            text = {
                "Creates a random {C:attention}Tag{},",
                "{C:money}-$#1#{}"
            }
        },
        c_dckst_open_air = {
            name = "OPEN AIR.",
            text = {
                "Select at least {C:attention}#1#{} cards",
                "Apply a {C:attention}White Seal{}",
                "to {C:attention}#2#{} random selected cards"
            }
        },
        c_dckst_visual_arts = {
            name = "VISUAL ARTS.",
            text = {
                "{C:green}#1# in #2#{} chance to apply",
                "a random {C:dark_edition}Edition{} to",
                "{C:attention}#3#{} selected card",
                "{C:inactive,s:0.8}(All editions are weighted equally){}"
            }
        },
        c_dckst_spring = {
            name = "SPRING.",
            text = {
                'Enhances {C:attention}#1#{} selected',
                'card to a {C:attention}Serpentine Card{}'
            }
        },
        c_dckst_summer = {
            name = "SUMMER.",
            text = {
                'Removes the enhancements',
                'from up to {C:attention}#2#{} selected cards,',
                '{X:money,C:white}X$#1#{} for every removed',
                'enhancement',
            }
        },
        c_dckst_autumn = {
            name = "AUTUMN.",
            text = {
                'Applies a {C:attention}Perishable{}',
                'sticker to {C:attention}#2#{} random',
                'Joker, {X:money,C:white}X$#1#{}'
            }
        },
        c_dckst_winter = {
            name = "WINTER.",
            text = {
                'Enhances up to {C:attention}#1#{}',
                'selected cards to',
                '{C:attention}Icy Cards{}'
            }
        },
        c_dckst_the_game = {
            name = "THE GAME.",
            text = {
                'Applies a permanent bonus',
                'of {C:mult}+#1#{} Mult to',
                'up to {C:attention}#2#{} selected cards',
            }
        },
        c_dckst_collective = {
            name = "COLLECTIVE.",
            text = {
                'Creates up to {C:attention}#1#{}',
                'random {V:1}Neo-Tarot{} cards',
                '{C:inactive}(Must have room){}'
            }
        },
    },
    Route = {
        c_dckst_route_1 = {
            name = "Route 1",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to become',
                '{C:attention}Aluminium Cards{}',
            }
        },
        c_dckst_route_3 = {
            name = "Route 3",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{} chance',
                'to gain a bonus',
                'of {C:mult}+#3#{} Mult'
            }
        },
        c_dckst_route_5 = {
            name = "Route 5",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to gain a',
                'bonus of {C:chips}+#3#{} Chips'
            }
        },
        c_dckst_route_6 = {
            name = "Route 6",
            text = {
                '{C:attention}All{} owned Jokers have a',
                '{C:green}#1# in #2#{} chance ',
                'have an {C:attention}Evergreen{}',
                'sticker applied'
            }
        },
        c_dckst_route_11 = {
            name = "Route 11",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to have a',
                'random {C:dark_edition}edition{} applied',
            }
        },
        c_dckst_route_12 = {
            name = "Route 12",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to become',
                '{C:attention}Icy Cards{}'
            }
        },
        c_dckst_route_16 = {
            name = "Route 16",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to become',
                '{C:attention}Nature Cards{}'
            }
        },
        c_dckst_route_19 = {
            name = "Route 19",
            text = {
                'Creates a random {C:attention}consumable{}',
                '{C:inactive}(Doesn\'t need room){}'
            }
        },
        c_dckst_route_30 = {
            name = "Route 30",
            text = {
                'Creates {C:attention}#1#{} random',
                '{C:uncommon}Uncommon{} Jokers',
                '{C:inactive}(Must have room){}'
            }
        },
        c_dckst_route_35 = {
            name = "Route 35",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to receive a',
                'random {C:attention}Metallurgic{}',
                'enhancement'
            }
        },
        c_dckst_route_48 = {
            name = "Route 48",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to have a',
                'random {C:attention}seal{} applied'
            }
        },
        c_dckst_route_57 = {
            name = "Route 57",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to gain a',
                'bonus of {X:chips,C:white}+X#3#{} Chips'
            }
        },
        c_dckst_route_58 = {
            name = "Route 58",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to gain a',
                'bonus of {X:mult,C:white}+X#3#{} Mult'
            }
        },
        c_dckst_route_59 = {
            name = "Route 59",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to become',
                '{C:attention}Serpentine Cards{}'
            }
        },
        c_dckst_route_64 = {
            name = "Route 64",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to become',
                '{C:attention}Techno Cards{}'
            }
        },
        c_dckst_route_67 = {
            name = "Route 67",
            text = {
                '{C:attention}All{} owned Jokers',
                'have a {C:green}#1# in #2#{}',
                'chance to receive',
                'the {C:dark_edition}Wooden{} edition'
            }
        },
        c_dckst_route_70 = {
            name = "Route 70",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance to have a',
                '{C:attention}Smiley{} sticker',
                'applied'
            }
        },
        c_dckst_route_72 = {
            name = "Route 72",
            text = {
                'Creates a random {V:1}Catarot{}',
                'and a random {V:2}Neo-Tarot{}',
                '{C:inactive}(Must have room){}'
            }
        },
        c_dckst_route_75 = {
            name = "Route 75",
            text = {
                'Creates {C:attention}#1#{} random',
                '{C:common}Common{} Jokers',
                '{C:inactive}(Must have room){}'
            }
        },
        c_dckst_route_78 = {
            name = "Route 78",
            text = {
                'Creates the last used',
                '{V:1}Route{}',
                '{s:0.8,V:1}Route 78{s:0.8} excluded',
                '{C:inactive}(Must have room){}'
            }
        },
    },
    Spectaclaw = {
        c_dckst_bombay = {
            name = "Bombay",
            text = {
                'Enhances up to {C:attention}#1#{}',
                'selected cards to',
                '{C:attention}Glass Cards{}, {C:green}#2# in #3#{}',
                'chance enhanced card',
                'gets a {C:attention}Red{} or {C:attention}Blue Seal{},',
                '{X:money,C:white}X$#4#{}'
            }
        },
        c_dckst_britishshorthair = {
            name = "British Shorthair",
            text = {
                'Enhances up to {C:attention}#1#{}',
                'selected cards to',
                '{C:attention}Consecutive Cards{},',
                '{X:money,C:white}X$#2#{}'
            }
        },
        c_dckst_scottishfold = {
            name = "Scottish Fold",
            text = {
                'Applies a {C:attention}random{}',
                'enhancement to {C:attention}#1#{}',
                '{C:attention}random{} cards, {X:money,C:white}X$#2#{}'
            }
        },
        c_dckst_diamondeye = {
            name = "Diamond Eye",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#',
                'chance of turning',
                'into {C:diamonds}Diamonds{} or {C:clubs}Clubs{},',
                '{X:money,C:white}X$#3#{}'
            }
        },
        c_dckst_mutatedbombay = {
            name = "Mutated Bombay",
            text = {
                'Select {C:attention}#1#{} card,',
                'every card to the',
                '{C:attention}left{} gains a',
                'permanent bonus of',
                '{X:mult,C:white}+X#2#{} Mult, {X:money,C:white}X$#3#{}'
            }
        },
        c_dckst_ojosazules = {
            name = "Ojos Azules",
            text = {
                '{C:attention}All{} cards in hand',
                'have a {C:green}#1# in #2#{}',
                'chance of turning into',
                '{C:clubs}Clubs{}, {X:money,C:white}X$#3#{}'
            }
        },
        c_dckst_americanwirehair = {
            name = "American Wirehair",
            text = {
                'Creates {C:attention}#1#{} {C:dark_edition}Negative{}',
                '{V:1}Catarot{} cards, {X:money,C:white}X$#2#{}',
            }
        },
        c_dckst_sokoke = {
            name = "Sokoke",
            text = {
                'Applies {C:dark_edition}Cosmic{} on {C:attention}#1#{}',
                'selected card, {X:money,C:white}X$#2#{}'
            }
        },
        c_dckst_bastet = {
            name = "Bastet, the Goddess",
            text = {
                'Creates a {C:attention}copy{} of',
                'a random Joker, {X:money,C:white}X$#1#{}',
                '{C:inactive}(Doesn\'t need room){}',
                '{C:inactive}(Removes {C:dark_edition}Negative {C:inactive}from copy){}'
            }
        },
        c_dckst_manekineko = {
            name = {"maneki-neko!", "{s:0.6}beckoning cat!{}"},
            text = {
                'Converts {C:attention}all{} cards in',
                'hand into {C:attention}Lucky Cards{},',
                '{X:money,C:white}X$#1#{}'
            }
        },
    },
    Harmonic = {
        c_dckst_attack = {
            name = 'C:\\\\ATTACK',
            text = {
                'Applies {C:white,X:chips}X#1#{}, {C:white,X:chips}X#2#{}, {C:white,X:chips}X#3#{},',
                'then {C:white,X:chips}X#4#{} Chips to',
                'the next {C:attention}4{} hands'
            }
        },
        c_dckst_decay = {
            name = 'C:\\\\DECAY',
            text = {
                'Applies {C:white,X:mult}X#1#{}, {C:white,X:mult}X#2#{}, {C:white,X:mult}X#3#{},',
                'then {C:white,X:mult}X#4#{} Mult to',
                'the next {C:attention}4{} hands'
            }
        },
        c_dckst_sustain = {
            name = 'C:\\\\SUSTAIN',
            text = {
                'All active {C:dckst_harmonic_orange}Harmonic{} effects',
                'last {C:attention}#1#{} more hands'
            }
        },
        c_dckst_release = {
            name = 'C:\\\\RELEASE',
            text = {
                'Triggers every active {C:dckst_harmonic_orange}Harmonic{} ',
                'effect {C:attention}twice{} in the {C:attention}next',
                '{C:attention}hand{}, then {C:red,E:2}ends them{}'
            }
        },
        c_dckst_delay = {
            name = 'C:\\\\DELAY',
            text = {
                'Applies an {C:attention}Echoed{} sticker',
                'to up to {C:attention}#1#{} selected cards',
            }
        },
        c_dckst_reverb = {
            name = 'C:\\\\REVERB',
            text = {
                'Next {C:attention}4{} hands each',
                'add an echo worth',
                '{C:attention}#1#%{} of their score',
            }
        },
        c_dckst_compressor = {
            name = 'C:\\\\COMPRESSOR',
            text = {
                '{C:attention}Lowers{} next Blind\'s',
                'requirement by {C:attention}#1#%{}',
            }
        },
        c_dckst_equalizer = {
            name = 'C:\\\\EQUALIZER',
            text = {
                'Sets the {C:chips}Chips{} and',
                '{C:mult}Mult{} of the next',
                '{C:attention}4{} hands to their',
                '{C:attention}average{}, then {C:white,X:mult}X#1#{} Mult'
            }
        },
        c_dckst_piano_roll = {
            name = 'C:\\\\PIANO_ROLL',
            text = {
                'Playing a {C:attention}different{} hand',
                'type than the previous',
                'hand gives {C:white,X:mult}X#1#{} Mult',
                'for {C:attention}4{} hands'
            }
        },
        c_dckst_volume = {
            name = 'C:\\\\VOLUME',
            text = {
                '{C:white,X:chips}X#1#{} Chips and {C:white,X:mult}X#2#{} Mult',
                'for the next {C:attention}4{} hands'
            }
        },
        c_dckst_panning = {
            name = 'C:\\\\PANNING',
            text = {
                'Each scoring card in',
                'the {C:attention}left{} half gives',
                '{C:white,X:chips}X#1#{} Chips, and each',
                'in the {C:attention}right{} half',
                'gives {C:white,X:mult}X#2#{} Mult in',
                'the next {C:attention}4{} hands',
                '{C:inactive,s:0.8}(a middle card gives both)'
            }
        },
        c_dckst_tempo = {
            name = 'C:\\\\TEMPO',
            text = {
                '{C:blue}+#1#{} Hands and {C:red}+#2#{}',
                'Discard for the next {C:attention}Blind'
            }
        },
        c_dckst_time_signature = {
            name = 'C:\\\\TIME_SIGNATURE',
            text = {
                'Ranks {C:attention}2{} to {C:attention}8{} when',
                'scored give {X:mult,C:white}X#1#',
                'for the next {C:attention}4{} hands'
            }
        },
        c_dckst_waveform = {
            name = 'C:\\\\WAVEFORM',
            text = {
                '{C:attention}Alternates{} between {C:white,X:chips}X#1#{} Chips',
                'and {C:white,X:mult}X#1#{} Mult for',
                'the next {C:attention}4{} hands'
            }
        },
        c_dckst_gain = {
            name = 'C:\\\\GAIN',
            text = {
                '{C:money,E:1}Doubles{} the values of',
                'the next {C:attention}#1# {C:dckst_harmonic_orange}Harmonic{}',
                'Cards when used'
            }
        },
    },
    Felimonial = {
            c_dckst_meow = { name = 'meow', text = {
                'Next {C:attention}#1#{} shop rerolls', 'are {C:attention}free{}' } },
            c_dckst_purr = { name = 'purr', text = {
                '{C:blue}+#1#{} Hand and {C:red}+#2#{} Discard', 'this Blind' } },
            c_dckst_hiss = { name = 'hiss', text = {
                'Lowers current Blind', 'requirement by {C:attention}#1#%{},', '{C:attention}-#2#{} hand size this round' } },
            c_dckst_yowl = { name = 'yowl', text = {
                'Rerolls the upcoming', '{C:attention}Boss Blind{}, {C:white,X:money}X$#1#{}' } },
            c_dckst_chirp = { name = 'chirp', text = {
                'Adds {C:money}+$#1#{} sell value', 'to all {C:attention}Jokers{}' } },
            c_dckst_stalk = { name = 'stalk', text = {
                'If no {C:red}discards{} were', 'used this round, next', 'hand played gives {X:mult,C:white}X#1#{} Mult' } },
            c_dckst_pounce = { name = 'pounce', text = {
                'Next hand played gives', '{X:mult,C:white}X#1#{} Mult, {C:white,X:money}X$#2#{}' } },
            c_dckst_leap = { name = 'leap', text = {
                '{C:green}#1# in #2#{} chance to give selected', '{C:attention}Joker{} an {C:dark_edition}Edition{}, {C:white,X:money}X$#3#{}',
                '{C:inactive}(All editions weighted equally){}' } },
            c_dckst_slink = { name = 'slink', text = {
                'Next discard draws', '{C:attention}#1#{} extra cards' } },
            c_dckst_dash = { name = 'dash', text = {
                'Restores {C:blue}Hands{} to', '{C:attention}maximum value{}, {C:white,X:money}X$#1#{}' } },
            c_dckst_knead = { name = 'knead', text = {
                'Levels up most played', 'hand type by {C:attention}#1#{}, {C:white,X:money}X$#2#{}' } },
            c_dckst_groom = { name = 'groom', text = {
                'Removes all stickers from', '{C:attention}1{} selected Joker, {C:white,X:money}X$#1#{}' } },
            c_dckst_nap = { name = 'nap', text = {
                'Lose all remaining {C:red}Discards{},', 'gain {C:money}$#1#{} for each' } },
            c_dckst_loaf = { name = 'loaf', text = {
                '{C:attention}All{} cards held in hand', 'gain a {C:mult}+#1#{} Mult bonus' } },
            c_dckst_stretch = { name = 'stretch', text = {
                '{C:attention}+#1#{} hand size for', 'the next Blind, {C:white,X:money}X$#2#{}' } },
            c_dckst_bat = { name = 'bat', text = {
                'Swaps {C:attention}1{} selected Joker', 'with a random Joker', 'of the {C:attention}same rarity' } },
            c_dckst_sniff = { name = 'sniff', text = {
                '{C:attention}Reshuffles{} deck and', 'restores {C:attention}#1#%{} of {C:red}Discards{}', '{C:inactive}(Rounded down){}' } },
            c_dckst_scratch = { name = 'scratch', text = {
                '{C:red}Destroys{} up to {C:attention}#1#{}', 'selected cards in hand' } },
            c_dckst_burrow = { name = 'burrow', text = {
                'Raises {C:attention}interest cap{} by {C:money}$#1#{}', 'for the next {C:attention}#2#{} Antes' } },
            c_dckst_stare = { name = 'stare', text = {
                '{C:green}#1# in #2#{} chance to disable', 'the next {C:attention}Boss Blind{}' } },
        },
    Exoplanet = {
        c_dckst_awasis = {
            name = 'Awasis',
            text = {
                '{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up',
                '{C:attention}#2#',
                '{C:mult}+#3#{} Mult and',
                '{C:chips}+#4#{} chips',
            }
        },
        c_dckst_kepler_97b = {
            name = 'Kepler-97 b',
            text = {
                '{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up',
                '{C:attention}#2#',
                '{C:mult}+#3#{} Mult and',
                '{C:chips}+#4#{} chips',
            }
        },
        c_dckst_noifasui = {
            name = 'Noifasui',
            text = {
                '{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up',
                '{C:attention}#2#',
                '{C:mult}+#3#{} Mult and',
                '{C:chips}+#4#{} chips',
            }
        },
        c_dckst_sweeps_4b = {
            name = 'SWEEPS-4 b',
            text = {
                '{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up',
                '{C:attention}#2#',
                '{C:mult}+#3#{} Mult and',
                '{C:chips}+#4#{} chips',
            }
        },
        c_dckst_lhs_1140b = {
            name = 'LHS 1140 b',
            text = {
                '{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up',
                '{C:attention}#2#',
                '{C:mult}+#3#{} Mult and',
                '{C:chips}+#4#{} chips',
            }
        },
    },
    Voucher = {
        v_dckst_expansionpermit = {
            name = "Expansion Permit",
            text = {
            "{C:attention}+#1#{} booster slot",
            "available in shop"
            }
        },
        v_dckst_prestigepermit = {
            name = "Prestige Permit",
            text = {
            "{C:attention}+#1#{} booster slot",
            "available in shop"
            }
        },
        v_dckst_extra_digits = {
            name = "Extra Digits",
            text = {
                '{C:attention}+#1#{} card {C:attention}selection limit{}',
                '{C:attention}+#1#{} {C:blue}Hand{}'
            }
        },
        v_dckst_ambidextrous = {
            name = "Ambidextrous",
            text = {
                '{C:attention}+#1#{} card {C:attention}selection limit{}',
                '{C:attention}+#1#{} {C:blue}Hand{}'
            }
        },
        v_dckst_expired = {
            name = "Expired Voucher",
            text = {
                '{C:inactive}This voucher has expired.',
                '{C:inactive}Redeem a new one?',
            }
        },
        v_dckst_double_downer = {
            name = "Double Downer",
            text = {
                '{C:attention}+#1#{} Voucher slot',
                'available in shop'
            }
        },
        v_dckst_meow = {
            name = "meow!",
            text = {
                    "{V:1}Catarots{} appear {B:1,C:white}2X{} more",
                    "frequently in shop",
                },
        },
        v_dckst_feliphile = {
            name = "Feliphile",
            text = {
                    "{V:1}Catarots{} appear {B:1,C:white}4X{} more",
                    "frequently in shop",
                },
        },
        v_dckst_new_major = {
            name = "New Major",
            text = {
                    "{V:1}Neo-Tarots{} appear {B:1,C:white}2X{} more",
                    "frequently in shop",
                },
        },
        v_dckst_beyond_arcana = {
            name = "Beyond Arcana",
            text = {
                    "{V:1}Neo-Tarots{} appear {B:1,C:white}4X{} more",
                    "frequently in shop",
                },
        },
        v_dckst_double_track = {
            name = "Double Track",
            text = {
                    "{V:1}Routes{} appear {B:1,C:white}2X{} more",
                    "frequently in shop",
                },
        },
        v_dckst_quad_track = {
            name = "Quad Track",
            text = {
                    "{V:1}Routes{} appear {B:1,C:white}4X{} more",
                    "frequently in shop",
                },
        },
        v_dckst_tarot_reading = {
            name = "Tarot Reading",
            text = {
                '{C:tarot}Arcana{} Packs always contain',
                'the {C:attention}most used{} {C:tarot}Tarot{} card'
            }
        },
        v_dckst_foretold_prophecy = {
            name = "Foretold Prophecy",
            text = {
                'Every held {C:attention}consumable{}',
                'gives {X:mult,C:white}X#1#{} Mult'
            }
        },
        v_dckst_money_buddy = {
            name = "Money Buddy",
            text = {
                "In payout, earn",
                "{C:money}$#1#{} extra",
            }
        },
        v_dckst_cash_in_guru = {
            name = "Cash-in Guru",
            text = {
                "In payout, earn",
                "{C:money}$#1#{} extra",
            }
        },
        v_dckst_ahod = {
            name = "All Hands on Deck",
            text = {
                '{C:attention}+#1#{} card {C:attention}selection limit{}',
                '{C:attention}+#1#{} {C:blue}Hands{}'
            }
        },
        v_dckst_triple_troper = {
            name = "Triple Troper",
            text = {
                '{C:attention}+#1#{} Voucher slot',
                'available in shop'
            }
        },
        v_dckst_cat_astrophe = {
            name = "Cat-astrophe",
            text = {
                    "{V:1}Catarots{} appear {B:1,C:white}8X{} more",
                    "frequently in shop",
                },
        },
        v_dckst_neo_madness = {
            name = "Neo-madness",
            text = {
                    "{V:1}Neo-Tarots{} appear {B:1,C:white}8X{} more",
                    "frequently in shop",
                },
        },
        v_dckst_octo_track = {
            name = "Octo Track",
            text = {
                    "{V:1}Routes{} appear {B:1,C:white}8X{} more",
                    "frequently in shop",
                },
        },
        v_dckst_the_godfather = {
            name = "The Godfather",
            text = {
                "In payout, earn",
                "{C:money}$#1#{} extra",
            }
        },
    },
    Other = {
        dckst_chartreuse_seal = {
            name = "Chartreuse Seal",
            text = {
                '{X:chips,C:white}X#1#{} Chips,',
                '{X:mult,C:white}X#2#{} Mult',
            }
        },
        dckst_white_seal = {
            name = "White Seal",
            text = {
                "Gives {X:mult,C:white}X#1#{} Mult,",
                "{C:green}#2# in #3#{} chance",
                "for {X:mult,C:white}X#4#{} Mult instead"
            }
        },
        dckst_cutesy_seal = {
            name = "Cutesy Seal",
            text = {
                'Creates a {V:1}Catarot{}',
                'card when {C:red}discarded{}'
            }
        },
        dckst_teal_seal = {
            name = "Teal Seal",
            text = {
                'Creates a {V:1}Neo-Tarot{}',
                'card when {C:red}discarded{}'
            }
        },
        dckst_periwinkle_seal = {
            name = "Periwinkle Seal",
            text = {
                '{C:green}#1# in #2#{} chance to',
                'create a {C:dckst_spectaclaw}Spectaclaw',
                'when {C:red}discarded{}'
            }
        },
        dckst_asterisk_seal = {
            name = "Asterisk Seal",
            text = {
                'Retriggers this card',
                '{C:attention}#1#{} times'
            }
        },
        dckst_asterism_seal = {
            name = "Asterism Seal",
            text = {
                'Retriggers this card',
                '{C:attention}#1#{} times'
            }
        },
        dckst_evergreen = {
            name = "Evergreen",
            text = {
                'Cannot be {C:attention}debuffed{},',
                '{C:attention}flipped{}, or',
                '{C:attention}destroyed{}',
                '{C:inactive}(Can be sold){}'
            }
        },
        dckst_smiley = {
            name = "Smiley",
            text = {
                'Gives {C:mult}+#1#{} Mult if',
                'scored hand contains a',
                '{C:attention}face card{}',
            }
        },
        dckst_zoomy = {
            name = "Zoomy",
            text = {
                'Randomly {E:2,C:attention}switches places{}',
                'before hand scores'
            }
        },
        dckst_deciduous = {
            name = "Deciduous",
            text = {
                'Destroyed after {C:attention}#1#{}',
                'triggers'
            }
        },
        dckst_halved = {
            name = "Halved",
            text = {
                'All values are',
                '{C:red,E:2}halved{}',
                '{C:inactive}(If possible){}'
            }
        },
        dckst_echoed = {
            name = "Echoed",
            text = {
                '{C:green}#1# in #2#{} chance',
                'to {C:attention}retrigger{} itself',
                'whenever triggered'
            }
        },
        p_dckst_carcana_pack_normal = {
            name = "Carcana Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {V:1}Catarots{} to be',
                'used immediately'
            }
        },
        p_dckst_carcana_pack_jumbo = {
            name = "Jumbo Carcana Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {V:1}Catarots{} to be',
                'used immediately'
            }
        },
        p_dckst_carcana_pack_mega = {
            name = "Mega Carcana Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {V:1}Catarots{} to be',
                'used immediately'
            }
        },
        p_dckst_neoarcana_pack_normal = {
            name = "Neo-Arcana Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {V:1}Neo-Tarots{} to be',
                'used immediately'
            }
        },
        p_dckst_neoarcana_pack_jumbo = {
            name = "Jumbo Neo-Arcana Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {V:1}Neo-Tarots{} to be',
                'used immediately'
            }
        },
        p_dckst_neoarcana_pack_mega = {
            name = "Mega Neo-Arcana Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {V:1}Neo-Tarots{} to be',
                'used immediately'
            }
        },
        p_dckst_tram_pack_normal = {
            name = "Tram Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {V:1}Routes{} to be',
                'used immediately'
            }
        },
        p_dckst_tram_pack_jumbo = {
            name = "Jumbo Tram Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {V:1}Routes{} to be',
                'used immediately'
            }
        },
        p_dckst_tram_pack_mega = {
            name = "Mega Tram Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {V:1}Routes{} to be',
                'used immediately'
            }
        },
        p_dckst_spectaclaw_pack_normal = {
            name = "Spectaclaw Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {C:dckst_spectaclaw}Spectaclaws{} to be',
                'used immediately'
            }
        },
        p_dckst_spectaclaw_pack_jumbo = {
            name = "Jumbo Spectaclaw Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {C:dckst_spectaclaw}Spectaclaws{} to be',
                'used immediately'
            }
        },
        p_dckst_spectaclaw_pack_mega = {
            name = "Mega Spectaclaw Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {C:dckst_spectaclaw}Spectaclaws{} to be',
                'used immediately'
            }
        },
        p_dckst_decksteritical_pack_normal = {
            name = "Decksteritical Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {X:black,V:1}decksterity.{} Jokers',
                }
        },
        p_dckst_decksteritical_pack_jumbo = {
            name = "Jumbo Decksteritical Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {X:black,V:1}decksterity.{} Jokers',
                }
        },
        p_dckst_decksteritical_pack_mega = {
            name = "Mega Decksteritical Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {X:black,V:1}decksterity.{} Jokers',
                }
        },
        p_dckst_production_pack_normal = {
            name = "Production Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {C:dckst_harmonic_orange}Harmonic{} Cards'
            }
        },
        p_dckst_production_pack_jumbo = {
            name = "Jumbo Production Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {C:dckst_harmonic_orange}Harmonic{} Cards'
            }
        },
        p_dckst_production_pack_mega = {
            name = "Mega Production Pack",
            text = {
                'Choose {C:attention}#1#{} of up to',
                '{C:attention}#2#{} {C:dckst_harmonic_orange}Harmonic{} Cards'
            }
        },
        dckst_dandy_sticker = {
            name = "Dandy Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Dandy",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_feline_sticker = {
            name = "Feline Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Feline",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_chroma_sticker = {
            name = "Chroma Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Chroma",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_clay_sticker = {
            name = "Clay Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Clay",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_storm_sticker = {
            name = "Storm Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Storm",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_fall_sticker = {
            name = "Fall Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Fall",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_cuprum_sticker = {
            name = "Cuprum Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Cuprum",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_silver_sticker = {
            name = "Silver Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Silver",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_hollow_sticker = {
            name = "Hollow Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Hollow",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_solar_sticker = {
            name = "Solar Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Solar",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_lunar_sticker = {
            name = "Lunar Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Lunar",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_satellite_sticker = {
            name = "Satellite Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Satellite",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_platina_sticker = {
            name = "Platina Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Platina",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_bismuth_sticker = {
            name = "Bismuth Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Bismuth",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_h_sticker = {
            name = "H Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}H",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_atomic_sticker = {
            name = "Atomic Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Atomic",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_antimatter_sticker = {
            name = "Antimatter Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Antimatter",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_shattered_sticker = {
            name = "Shattered Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Shattered",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_exalted_sticker = {
            name = "Exalted Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Exalted",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_continual_sticker = {
            name = "Continual Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Continual",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_universal_sticker = {
            name = "Universal Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Universal",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_nebular_sticker = {
            name = "Nebular Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Nebular",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_penultimate_sticker = {
            name = "Penultimate Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Penultimate",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_ultimate_sticker = {
            name = "Ultimate Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Ultimate",
                "{C:attention}Stake{} difficulty",
            }
        },
        undiscovered_catarot = { 
                name = "not discovered :3",
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does",
            },
        },
        undiscovered_neotarot = { 
                name = "NOT DISCOVERED.",
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does",
            },
        },
        undiscovered_spectaclaw = {
            name = "not discovered!~",
            text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does",
            }
        },
        undiscovered_route = {
            name = "Unused Route",
            text = {
                "Purchase or use",
                "this route in an",
                "unseeded run to",
                "learn what it does",
            }
        },
        undiscovered_harmonic = {
            name = "C:\\\\NOT_DISCOVERED",
            text = {
                "Purchase or use",
                "this route in an",
                "unseeded run to",
                "learn what it does",
            }
        },
    },
},

misc = {
        dictionary = {
            b_catarot_cards = "Catarot Cards",
            b_neotarot_cards = "Neo-Tarot Cards",
            b_spectaclaw_cards = "Spectaclaw Cards",
            b_route_cards = "Routes",
            b_harmonic_cards = "Harmonic Cards",
            b_felimonial_cards = "Felimonial Cards",
            b_exoplanet_cards = "Exoplanet Cards",

            k_catarot = "Catarot",
            k_neotarot = "Neo-Tarot",
            k_spectaclaw = "Spectaclaw",
            k_route = "Route",
            k_harmonic = "Harmonic",
            k_felimonial = "Felimonial",
            k_exoplanet = "Exoplanet",

            k_dckst_carcana_pack = "Carcana Pack",
            k_dckst_carcana_pack_jumbo = "Jumbo Carcana Pack",
            k_dckst_carcana_pack_mega = "Mega Carcana Pack",
            
            k_dckst_neoarcana_pack = "Neo-Arcana Pack",
            k_dckst_neoarcana_pack_jumbo = "Jumbo Neo-Arcana Pack",
            k_dckst_neoarcana_pack_mega = "Mega Neo-Arcana Pack",

            k_dckst_spectaclaw_pack = "Spectaclaw Pack",
            k_dckst_spectaclaw_pack_jumbo = "Jumbo Spectaclaw Pack",
            k_dckst_spectaclaw_pack_mega = "Mega Spectaclaw Pack",

            k_dckst_tram_pack = "Tram Pack",
            k_dckst_tram_pack_jumbo = "Jumbo Tram Pack",
            k_dckst_tram_pack_mega = "Mega Tram Pack",

            k_dckst_decksteritical_pack = "Decksteritical Pack",
            k_dckst_decksteritical_pack_jumbo = "Jumbo Decksteritical Pack",
            k_dckst_decksteritical_pack_mega = "Mega Decksteritical Pack",

            k_dckst_production_pack = "Production Pack",
            k_dckst_production_pack_jumbo = "Jumbo Production Pack",
            k_dckst_production_pack_mega = "Mega Production Pack",

            k_dckst_exocelestial_pack = "Exocelestial Pack",
            k_dckst_exocelestial_pack_jumbo = "Jumbo Exocelestial Pack",
            k_dckst_exocelestial_pack_mega = "Mega Exocelestial Pack",


            k_dckst_loadeddice = "Knocked!",
            k_dckst_swapped = "Swapped!",
            k_dckst_extruded = "Extruded!",
            k_dckst_pencil = "Pencil!",
            k_dckst_coffee_mug = "Brewed!",
            k_dckst_superstar = "Super!",
            k_dckst_oops = "Oops.",
            k_dckst_shoreline = "Shoreline!",
            k_dckst_ding = "Ding!",
            k_dckst_altitude = "Altitude!",
            k_dckst_crash = "AAAAAAAAAAAAAAAAA",
            k_dckst_suit_changed = "Suit changed!",
            k_dckst_sacrifice = "Sacrifice!",
            k_dckst_appraisal = "Appraisal!",
            k_dckst_laugh = "BWAHAHHAHHHAHAH",
            k_dckst_son = "Son!",
            k_dckst_alchemist = "Alchemist!",
            k_dckst_airball = "Airball!",
            k_dckst_shootagain = "Shoot again!",
            k_dckst_coinjar_save = "Saved!",
            k_dckst_coinjar_dump = "Cashing out!",
            k_dckst_cupboard_reset = "Resetted!",
            k_dckst_mikal = "Mikal Bridges!",
            k_dckst_naturalized = "Naturalized!",
            k_dckst_slither = "Slither!",
            k_dckst_techno_upgrade = "UPGRADE.",
            k_dckst_melted = "Melted!",
            k_dckst_cerium = "Cerium!",
            k_dckst_meow = "meow :3",
            k_dckst_card_added = "Card Added!",
            k_dckst_storm_stake_warning = "Hand has to contain two or more of the same rank!",
            k_dckst_solar_flare = "Solar Flare!",
            k_dckst_cards_removed = "Cards Removed!",
            k_dckst_exalted = " Exalted Tithe!",
            k_dckst_consecutive_debuff = "This hand doesn\'t contain a Straight!",
            k_dckst_hot = "Hot!",
            k_dckst_cold = "Cold!",
            k_dckst_chips = "Chips",
            k_dckst_destroyed = "Destroyed!",
            k_dckst_detonated = "Detonated!",
            k_dckst_fuke = "Fuke!",
            k_dckst_benny_line1 = 'Prevents Death if chips',
            k_dckst_benny_line2 = 'scored are at least ',
            k_dckst_rescored = "Rescored!",
            k_dckst_hbar_line = 'Blind size reduced by',
            k_dckst_hbar_ex = 'Barred!',
            k_dckst_aitch = "Aitch!",
            k_dckst_strikethrough = 'change da world. my final message. goodbye.',
            k_dckst_where_is_the_lamb_sauce = 'WHERE IS THE LAMB SAUCE',
            k_dckst_idiot_sandwich = 'IDIOT SANDWICH!',
            k_dckst_nullified = 'Nullified!',
            k_dckst_whirr = 'Whirr...',
            k_dckst_ascend = 'Ascend!',
            k_dckst_boing = 'Boing!',
            k_dckst_wavgun_fire = 'FIRE!',
            k_dckst_wavgun_unusable = 'Unusable...',
            k_dckst_hop = 'Hop!',

            k_dckst_screensaver_msg_1 = { "Windows 95", "Fatal exception 0E has occurred at 0028:C0011E36 in VXD VMM(01) + 00010E36. The current application will be terminated." },
            k_dckst_screensaver_msg_2 = { "3D Maze.exe", "Error: The polyhedral gray rock has flipped the universe upside down. Resetting parameters..." },
            k_dckst_screensaver_msg_3 = { "Proximity Alert", "Warning: screensaver.sph is approaching at 35-60 walkspeed. Run." },
            k_dckst_screensaver_msg_4 = { "System Warning", "The smiling yellow sphere is multiplying. Glint reflections detected on all optical receptors." },
            k_dckst_screensaver_msg_5 = { "Outbreak Update", "Module load failed: nn_hotel map architecture unstable. Arcade mode integrity compromised." },
            k_dckst_screensaver_msg_6 = { "Windows 95", "A fatal exception has occurred. Click the smiley face to restart the endless loop." },
            k_dckst_screensaver_msg_7 = { "Audio Subsystem", "Buffer underrun: Window error meme audio loop at maximum decibels." },
            k_dckst_screensaver_msg_8 = { "Jumpscare Protocol", "Critical Power Loss: Windows XP shutdown sequence initiated prematurely." },
            k_dckst_screensaver_msg_9 = { "Memory Error", "Exception in module 'maze_rat.dll': Out of cheese, out of logic." },
            k_dckst_screensaver_msg_10 = { "Discord - #nextbots-suggestions", "Suggestion rejected by reality: kyotowave's creation has breached containment." },
            k_dckst_screensaver_msg_11 = { "Display Properties", "Screensaver timeout exceeded. Your desktop has been replaced by brick walls and rodents." },
            k_dckst_screensaver_msg_12 = { "nn_hotel.bsp", "Entity error: 'screensaver' failed to spawn in open world. Recalibrating coordinates." },
            k_dckst_screensaver_msg_13 = { "Graphics Engine", "Pixelation filter overload: Resolution dropped to 1995 standards." },
            k_dckst_screensaver_msg_14 = { "System Tray", "Blue eyes detected in the periphery. Recommend immediate evacuation of the hallway." },
            k_dckst_screensaver_msg_15 = { "Registry Editor", "Key HKEY_LOCAL_MACHINE\\SOFTWARE\\ScreensaverSmile has been corrupted by joy." },
            k_dckst_screensaver_msg_16 = { "Runtime Error", "Program illegal operation: Attempted to smile at an illegal memory address." },
            k_dckst_screensaver_msg_17 = { "Network Diagnostics", "Ping to nextbot server timed out. Proximity audio intensity increasing." },
            k_dckst_screensaver_msg_18 = { "Windows Explorer", "This program has performed an illegal operation and will be shut down. (It's right behind you.)" },
            k_dckst_screensaver_msg_19 = { "Event Log", "Blackout and bloodmoon events synchronized. screensaver is hunting." },
            k_dckst_screensaver_msg_20 = { "Task Manager", "Process 'screensaver.exe' is not responding. End task? [Y/N - Choice is an illusion]" },
            k_dckst_screensaver_msg_21 = { "Sound Card", "MIDI driver exception: Brief victory melody playing over terminal static." },
            k_dckst_screensaver_msg_22 = { "Control Panel", "Power management error: System refusing to enter sleep mode while the sphere is active." },
            k_dckst_screensaver_msg_23 = { "Miraheze Wiki", "Database exception: Page history overwritten by the 3D Maze entity." },
            k_dckst_screensaver_msg_24 = { "DirectX Error", "Hardware acceleration failure: Blue rounded mouth rendering outside safe boundaries." },
            k_dckst_screensaver_msg_25 = { "Kernel Panic", "A serious error has occurred. Press any key to accept your fate in the hotel corridor." },
            k_dckst_screensaver_msg_26 = { "Runtime Warning", "Virtual memory is fragmenting. The yellow sphere's grin is growing wider." },
            k_dckst_screensaver_msg_27 = { "Display Adapter", "Resolution unsupported by sanity. Reverting to brick-maze dimensions." },
            k_dckst_screensaver_msg_28 = { "Explorer.exe", "This task is taking longer than expected. (Spoiler: You aren't escaping the hotel.)" },
            k_dckst_screensaver_msg_29 = { "Audio Driver", "Proximity warning: The window error meme is playing at 110 decibels." },
            k_dckst_screensaver_msg_30 = { "Windows 95", "Exception 0x000000FF: Entity proximity threshold crossed. Brace for impact." },
            k_dckst_screensaver_msg_31 = { "nn_hotel_arcade.wad", "Sector fault: Arcade mode containment grid has failed completely." },
            k_dckst_screensaver_msg_32 = { "System Monitor", "CPU temperature critical. Too many floating-point smiles detected." },
            k_dckst_screensaver_msg_33 = { "Registry Shield", "Access denied: The gray rock has altered your system registry permissions." },
            k_dckst_screensaver_msg_34 = { "Task Scheduler", "Scheduled event: Jumpscare execution queued for immediate processing." },
            k_dckst_screensaver_msg_35 = { "Memory Dump", "Physical memory dump complete. Found zero traces of your survival instincts." },
            k_dckst_screensaver_msg_36 = { "Discord Protocol", "Message from kyotowave: 'Why did you let it out of the suggestions channel?'" },
            k_dckst_screensaver_msg_37 = { "Kernel Security", "Blue eyes detected in Ring 0. All safety interlocks are bypassed." },
            k_dckst_screensaver_msg_38 = { "DirectDraw Error", "Surface creation failed: The smiley face is reflecting directly into your retinas." },
            k_dckst_screensaver_msg_39 = { "Outbreak Log", "May 20th timeline convergence error: The arcade entity is loose in the open world." },
            k_dckst_screensaver_msg_40 = { "Control Panel", "Mouse cursor hijacked by nextbot pathfinding AI. Enjoy the ride." },
            k_dckst_screensaver_msg_41 = { "Windows Media", "Shutdown melody loaded: Preparing the Windows XP power-down sequence." },
            k_dckst_screensaver_msg_42 = { "Virtual Machine", "Sandbox containment breached. The maze walls are closing in." },
            k_dckst_screensaver_msg_43 = { "Network Protocol", "Packet loss at 100%. Nobody can hear your clicks over the error noise." },
            k_dckst_screensaver_msg_44 = { "System Error", "Fatal exception: Attempted to read from address 0x5MILE55." },
            k_dckst_screensaver_msg_45 = { "Miraheze Wiki", "Page locked by administrator 'screensaver': Edits are no longer permitted." },
            k_dckst_screensaver_msg_46 = { "Graphics Subsystem", "Pixelation routine recursive loop infinite. Turn back now." },
            k_dckst_screensaver_msg_47 = { "Power Management", "ACPI table corrupt. The system refuses to sleep while it hunts." },
            k_dckst_screensaver_msg_48 = { "Application Error", "The program has performed an illegal operation involving pure terror." },
            k_dckst_screensaver_msg_49 = { "Environment Variable", "PATH variable overwritten by endless hallway corridors." },
            k_dckst_screensaver_msg_50 = { "System Halt", "Fatal exception 0xDEADBEEF: Press any key to face the jumpscare." },

            k_dckst_money_buddy = "Money Buddy",
            k_dckst_cash_in_guru = "Cash-in Guru",
            k_dckst_the_godfather = "The Godfather",

            k_dckst_gameset_humble      = "Humble",
            k_dckst_gameset_humble_desc = "For amateur players just getting started.",

            k_dckst_gameset_honed       = "Honed",
            k_dckst_gameset_honed_desc  = "For experienced players. Standard experience.",

            k_dckst_gameset_hazardous   = "Hazardous",
            k_dckst_gameset_hazardous_desc = "For players who want to blow up their machine.",

            k_dckst_exquisite = 'Exquisite',
            k_dckst_mediumrare = 'Medium Rare',
            k_dckst_medium = 'Medium',
            k_dckst_mediumwell = 'Medium Well',
            k_dckst_welldone = 'Well-Done',
        },
        labels = {
            dckst_chartreuse_seal = "Chartreuse Seal",
            dckst_white_seal = "White Seal",
            dckst_cutesy_seal = "Cutesy Seal",
            dckst_teal_seal = "Teal Seal",
            dckst_periwinkle_seal = "Periwinkle Seal",
            dckst_asterisk_seal = "Asterisk Seal",
            dckst_asterism_seal = "Asterism Seal",

            dckst_evergreen = "Evergreen",
            dckst_smiley = "Smiley",
            dckst_zoomy = "Zoomy",
            dckst_deciduous = "Deciduous",
            dckst_halved = "Halved",
            dckst_echoed = "Echoed",

            dckst_cosmic = "Cosmic",
            dckst_phosphorescent = "Phosphorescent",
            dckst_aetherescent = "Aetherescent",
            dckst_iridescent = "Iridescent",
            dckst_prismatic = "Prismatic",
            dckst_wooden = "Wooden",
            dckst_vhs = "VHS",

            k_dckst_exquisite = 'Exquisite',
            k_dckst_mediumrare = 'Medium Rare',
            k_dckst_medium = 'Medium',
            k_dckst_mediumwell = 'Medium Well',
            k_dckst_welldone = 'Well-Done',
        },
        poker_hands = {
            ["dckst_two_three"] = "Double Three",
            ["dckst_triangle"] = "Triangle",
            ["dckst_umbra"] = "Umbra",
            ["dckst_antumbra"] = "Antumbra",
            ["dckst_bipolar_flush"] = "Bipolar Flush",
            ["dckst_alterostraight"] = "Altero-straight",
        },
        poker_hand_descriptions = {
            ["dckst_two_three"] = { "Three cards of the same suit", "and three cards of the same rank" },
            ["dckst_triangle"] = { '3+ cards where the sum of all card ranks', 'is a triangular number greater than 10.', '(Aces count as 1, face cards count as 10)' },
            ["dckst_umbra"] = { "Four face cards and one non-face card", },
            ["dckst_antumbra"] = { "Four non-face cards and one face card", },
            ["dckst_bipolar_flush"] = { "A 5-card hand containing exactly 3 cards", "of one color and 2 cards of the other color" },
            ["dckst_alterostraight"] = { "A 5-card Straight where the colors of the", "cards alternate strictly between Red and Black" },
        },
        ranks = {
            ["dckst_20"] = "20",
        },
        quips = {
            dckst_fiesta_1_win = {
                'Man you goated like',
                'playoffs Wemby!'
            },
            dckst_fiesta_1_loss = {
                'Kevin Hart would\'ve made',
                'it farther than you...'
            },
            dckst_fiesta_2_win = {
                'Fiesta on the block,',
                'Spurs takin\' the dub!'
            },
            dckst_fiesta_2_loss = {
                'Bro really lost wearing',
                'the cleanest jersey',
                'in the league'
            },
            dckst_fiesta_3_win = {
                'Wemby cookin\' and',
                'the fit matchin\' too!'
            },
            dckst_fiesta_3_loss = {
                'Should\'ve worn the jersey,',
                'not just bought it'
            },
            dckst_fiesta_4_win = {
                'That\'s a Fiesta',
                'W fr fr!'
            },
            dckst_fiesta_4_loss = {
                'Popovich would\'ve',
                'benched you for that'
            },
            dckst_fiesta_5_win = {
                'Y\'all seein\' this',
                'drip AND this win?'
            },
            dckst_fiesta_5_loss = {
                'Losing in the',
                'city edition is crazy work'
            },
            dckst_fiesta_6_win = {
                'Spurs takin\' names,',
                'Fiesta takin\' credit'
            },
            dckst_fiesta_6_loss = {
                'Nah the jersey',
                'was doin\' all the work'
            },
            dckst_fiesta_7_win = {
                'That fit was NOT',
                'losin\' today'
            },
            dckst_fiesta_7_loss = {
                'The fiesta\'s over,',
                'and so are you'
            },
            dckst_fiesta_8_win = {
                'Cookin\' harder than',
                'the jersey graphic'
            },
            dckst_fiesta_8_loss = {
                'Even Wemby can\'t',
                'save this one'
            },
            dckst_fiesta_9_win = {
                'Book the parade,',
                'Fiesta got the dub'
            },
            dckst_fiesta_9_loss = {
                'That\'s an L in',
                'full color too'
            },
            dckst_fiesta_10_win = {
                'Spurs city, Spurs',
                'dub, no debate'
            },
            dckst_fiesta_10_loss = {
                'Fiesta\'s poppin\',',
                'your run ain\'t'
            },
            dckst_jimmy_1_win = {
                'Did you see that?',
                'That\'s lawyerin\', baby!'
            },
            dckst_jimmy_1_loss = {
                'Objection! ...to me',
                'even bein\' here'
            },
            dckst_jimmy_2_win = {
                'S\'all good, man —',
                'better call it a win'
            },
            dckst_jimmy_2_loss = {
                'That\'s not a loss,',
                'that\'s a "settlement"'
            },
            dckst_jimmy_3_win = {
                'Ladies and gentlemen,',
                'the defense rests. Undefeated.'
            },
            dckst_jimmy_3_loss = {
                'I\'m gonna need',
                'a bigger bus bench'
            },
            dckst_jimmy_4_win = {
                'Justice! Or close',
                'enough, who\'s countin\''
            },
            dckst_jimmy_4_loss = {
                'This is why I',
                'don\'t do pro bono'
            },
            dckst_jimmy_5_win = {
                'Slippin\' Jimmy strikes',
                'again, no witnesses!'
            },
            dckst_jimmy_5_loss = {
                'I know a guy',
                'who can fix this... maybe'
            },
            dckst_prismatic_1_win = {
                'Every color hits',
                'different, doesn\'t it?'
            },
            dckst_prismatic_1_loss = {
                'No shine, no',
                'shimmer, no mult'
            },
            dckst_prismatic_2_win = {
                'Refracted that win',
                'right through the spectrum'
            },
            dckst_prismatic_2_loss = {
                'Plain cards, plain',
                'results. Shocking, really'
            },
            dckst_prismatic_3_win = {
                'Catch the light,',
                'catch the mult!'
            },
            dckst_prismatic_3_loss = {
                'Bring me an edition',
                'next time, please'
            },
            dckst_prismatic_4_win = {
                'That\'s a full',
                'prism of a win'
            },
            dckst_prismatic_4_loss = {
                'Zero shine equals',
                'zero surprise here'
            },
            dckst_prismatic_5_win = {
                'Dazzling. Absolutely',
                'dazzling performance'
            },
            dckst_prismatic_5_loss = {
                'Dull cards make',
                'for a dull loss'
            },
            dckst_swapped_1_win = {
                'Swap the suits,',
                'swap the fortune!'
            },
            dckst_swapped_1_loss = {
                'Wrong side of',
                'the swap this time'
            },
            dckst_swapped_2_win = {
                'Hearts to clubs,',
                'losses to wins!'
            },
            dckst_swapped_2_loss = {
                'Every suit flipped,',
                'the loss stayed put'
            },
            dckst_swapped_3_win = {
                'Nothing\'s what it',
                'seems, and you won!'
            },
            dckst_swapped_3_loss = {
                'Swapped the suits,',
                'not the outcome'
            },
            dckst_swapped_4_win = {
                'A diamond by any',
                'other name still wins'
            },
            dckst_swapped_4_loss = {
                'Shuffled the deck,',
                'shuffled straight to a loss'
            },
            dckst_swapped_5_win = {
                'Suits changed, spirits',
                'lifted, run\'s a win!'
            },
            dckst_swapped_5_loss = {
                'One-for-one trade,',
                'and you still lost'
            },
            dckst_stop_sign_1_win = {
                'Wait, I\'m still',
                'here? Nice win though'
            },
            dckst_stop_sign_1_loss = {
                'I sacrificed myself',
                'for THIS?'
            },
            dckst_stop_sign_2_win = {
                'Didn\'t even get',
                'to see it, congrats'
            },
            dckst_stop_sign_2_loss = {
                'I died for',
                'nothing, apparently'
            },
            dckst_stop_sign_3_win = {
                'I\'m gone but',
                'the vibes are good'
            },
            dckst_stop_sign_3_loss = {
                'Should\'ve stayed',
                'and blocked THIS instead'
            },
            dckst_stop_sign_4_win = {
                'Self-destructed and',
                'still somehow relevant'
            },
            dckst_stop_sign_4_loss = {
                'I gave my life',
                'for absolutely nothing'
            },
            dckst_stop_sign_5_win = {
                'Ghost joker reporting:',
                'good game!'
            },
            dckst_stop_sign_5_loss = {
                'Wish I could\'ve',
                'stopped THIS too'
            },
            dckst_stop_sign_6_win = {
                'I don\'t even have',
                'a slot and I\'m proud'
            },
            dckst_stop_sign_6_loss = {
                'Read the sign,',
                'clearly. A stop sign'
            },
            dckst_stop_sign_7_win = {
                'Retired undefeated,',
                'technically speaking'
            },
            dckst_stop_sign_7_loss = {
                'One job. I had',
                'one job. And I did it.',
                'Then this happened'
            },
            dckst_extruded_1_win = {
                'Sold, destroyed,',
                'and still came out ahead!'
            },
            dckst_extruded_1_loss = {
                'Not enough sacrifice',
                'in that run'
            },
            dckst_extruded_2_win = {
                'Feeds on chaos,',
                'thrives on the W'
            },
            dckst_extruded_2_loss = {
                'Should\'ve sold',
                'a few more things'
            },
            dckst_extruded_3_win = {
                'Everything destroyed',
                'made you stronger!'
            },
            dckst_extruded_3_loss = {
                'X1 mult and',
                'an L to match'
            },
            dckst_extruded_4_win = {
                'Extruded and',
                'undefeated, baby'
            },
            dckst_extruded_4_loss = {
                'Barely stretched',
                'and it shows'
            },
            dckst_extruded_5_win = {
                'Every sale was',
                'worth it, clearly'
            },
            dckst_extruded_5_loss = {
                'Not enough was',
                'sacrificed for this'
            },
            dckst_extruded_6_win = {
                'Squeeze the mult,',
                'squeeze the win!'
            },
            dckst_extruded_6_loss = {
                'That\'s a flat',
                'extrusion of a loss'
            },
            dckst_extruded_7_win = {
                'Destruction never',
                'looked this good'
            },
            dckst_extruded_7_loss = {
                'Bro kept everything',
                'and still lost'
            },
            dckst_extruded_8_win = {
                'That mult stacked',
                'harder than the losses'
            },
            dckst_extruded_8_loss = {
                'Nothing sold,',
                'nothing gained'
            },
            dckst_extruded_9_win = {
                'Break it, sell it,',
                'win with it!'
            },
            dckst_extruded_9_loss = {
                'X1 stayed X1',
                'and so did the loss'
            },
            dckst_extruded_10_win = {
                'UN4YA\'s favorite',
                'and it shows, big dub'
            },
            dckst_extruded_10_loss = {
                'Even the fan',
                'favorite chokes sometimes'
            },
            dckst_pencil_1_win = {
                'Sharpened up and',
                'wrote out a win!'
            },
            dckst_pencil_1_loss = {
                'Forgot to enhance',
                'anything, huh?'
            },
            dckst_pencil_2_win = {
                'Every enhancement',
                'chipped in for that'
            },
            dckst_pencil_2_loss = {
                'Still using the',
                'default cards I see'
            },
            dckst_pencil_3_win = {
                'Number 2 pencil,',
                'number 1 result'
            },
            dckst_pencil_3_loss = {
                'Zero chips, zero',
                'enhancements, zero surprise'
            },
            dckst_pencil_4_win = {
                'Wrote that win',
                'in permanent marker'
            },
            dckst_pencil_4_loss = {
                'Eraser got more',
                'work than I did'
            },
            dckst_pencil_5_win = {
                'Enhanced cards,',
                'enhanced results!'
            },
            dckst_pencil_5_loss = {
                'Blank page, blank',
                'chips, blank win'
            },
            dckst_coffee_mug_1_win = {
                'Ran on caffeine',
                'and vibes, still won!'
            },
            dckst_coffee_mug_1_loss = {
                'Coffee wore off',
                'and so did the win'
            },
            dckst_coffee_mug_2_win = {
                'First hand hit',
                'different, and it showed'
            },
            dckst_coffee_mug_2_loss = {
                'Decaf performance',
                'if I\'m honest'
            },
            dckst_coffee_mug_3_win = {
                'Three sips in,',
                'one big win out'
            },
            dckst_coffee_mug_3_loss = {
                'Crashed harder than',
                'the hand size did'
            },
            dckst_coffee_mug_4_win = {
                'Peaked early, stayed',
                'on top the whole way'
            },
            dckst_coffee_mug_4_loss = {
                'That\'s what happens',
                'when the buzz fades'
            },
            dckst_coffee_mug_5_win = {
                'Mug\'s empty but',
                'the run\'s still hot'
            },
            dckst_coffee_mug_5_loss = {
                'Ran cold right',
                'when it mattered'
            },
            dckst_lilmaxey_1_win = {
                'Mrrow! Mrow mrow!',
                'Mreow~!'
            },
            dckst_lilmaxey_1_loss = {
                'Mrow... mew...',
                'mrr.'
            },
            dckst_lilmaxey_2_win = {
                'MREOW! Mrrp!',
                'Mrow mrow mrow!'
            },
            dckst_lilmaxey_2_loss = {
                'Mew... mrrow?',
                'Mrr...'
            },
            dckst_lilmaxey_3_win = {
                'Mrrp mrrp!',
                'Meow!!'
            },
            dckst_lilmaxey_3_loss = {
                'Mrrrow.',
                '...mew.'
            },
            dckst_lilmaxey_4_win = {
                'MEOW MEOW',
                'MEOW!!'
            },
            dckst_lilmaxey_4_loss = {
                'Mrow...',
                'mrrrp.'
            },
            dckst_lilmaxey_5_win = {
                'Mrrow! Purrrr~',
                'Mreow!'
            },
            dckst_lilmaxey_5_loss = {
                'Mew. Mrr.',
                '...'
            },
            dckst_lilmaxey_6_win = {
                'Mrp! Mrp! Mrp!',
                'Mreow!!'
            },
            dckst_lilmaxey_6_loss = {
                'Mrrow...',
                'mew mew.'
            },
            dckst_lilmaxey_7_win = {
                'MRREOW! Mrow',
                'mrow mrow!'
            },
            dckst_lilmaxey_7_loss = {
                'Mrr. Mrow.',
                'Mew...'
            },
            dckst_lilmaxey_8_win = {
                'Mrrp mrrow!',
                'Meow meow!!'
            },
            dckst_lilmaxey_8_loss = {
                '...mrow.',
                'mrr mrr.'
            },
            dckst_lilmaxey_9_win = {
                'Mreow!! Purrr',
                'mrow mrow~'
            },
            dckst_lilmaxey_9_loss = {
                'Mew mew...',
                'mrrow.'
            },
            dckst_lilmaxey_10_win = {
                'MRP MRP MRP',
                'MREOW!!'
            },
            dckst_lilmaxey_10_loss = {
                'Mrr...',
                '...mew.'
            },
            dckst_lilmaxey_11_win = {
                'Mrow! Mrrp!',
                'Purrrow~'
            },
            dckst_lilmaxey_11_loss = {
                'Mrrow mrrow...',
                'mrr.'
            },
            dckst_lilmaxey_12_win = {
                'MREOW MROW',
                'MRP!!'
            },
            dckst_lilmaxey_12_loss = {
                'Mew...',
                'mrrrp mrr.'
            },
            dckst_lilmaxey_13_win = {
                'Mrrp! Mreow!',
                'Mrow mrow!!'
            },
            dckst_lilmaxey_13_loss = {
                '...mrow.',
                'mew.'
            },
            dckst_lilmaxey_14_win = {
                'Purrrr mrow',
                'MREOW!!'
            },
            dckst_lilmaxey_14_loss = {
                'Mrr mrr...',
                'mrrow.'
            },
            dckst_lilmaxey_15_win = {
                'Mrp mrp mrp!',
                'MRROW!'
            },
            dckst_lilmaxey_15_loss = {
                'Mew...',
                '...mrr.'
            },
            dckst_lilmaxey_16_win = {
                'MREOW! Mrrp',
                'mrrp mrrp!!'
            },
            dckst_lilmaxey_16_loss = {
                'Mrrow. Mew.',
                '...'
            },
            dckst_lilmaxey_17_win = {
                'Mrow mrow!',
                'Purrrow mreow~'
            },
            dckst_lilmaxey_17_loss = {
                'Mrr...',
                'mrow mrow.'
            },
            dckst_lilmaxey_18_win = {
                'MRP! MREOW!',
                'MRP MRP!!'
            },
            dckst_lilmaxey_18_loss = {
                '...mrrow.',
                'mew mew.'
            },
            dckst_lilmaxey_19_win = {
                'Mreow mrow',
                'mrow MREOW!!'
            },
            dckst_lilmaxey_19_loss = {
                'Mew. Mrr.',
                'mrrow...'
            },
            dckst_lilmaxey_20_win = {
                'MRROW!! Purrrr',
                'mrp mrp mrp!!'
            },
            dckst_lilmaxey_20_loss = {
                '...mrrrow.',
                '...mew.'
            },
            dckst_tamerlane_1_win = {
                'Empires are built',
                'on conquest. Well fought.'
            },
            dckst_tamerlane_1_loss = {
                'Even conquerors fall.',
                'Rise again.'
            },
            dckst_tamerlane_2_win = {
                'Every suit bent',
                'to my will. Victory.'
            },
            dckst_tamerlane_2_loss = {
                'A single defeat means',
                'nothing to an empire.'
            },
            dckst_tamerlane_3_win = {
                'None who oppose',
                'me leave unconverted.'
            },
            dckst_tamerlane_3_loss = {
                'Not enough was',
                'conquered this time.'
            },
            dckst_tamerlane_4_win = {
                'From the steppes',
                'to the scoreboard. Undefeated.'
            },
            dckst_tamerlane_4_loss = {
                'A setback, nothing',
                'more. The march continues.'
            },
            dckst_tamerlane_5_win = {
                'X0.9 at a time,',
                'an empire of Mult.'
            },
            dckst_tamerlane_5_loss = {
                'Too few suits fell.',
                'Too little was taken.'
            },
            dckst_superstar_1_win = {
                'Every blind beaten',
                'adds to the legacy'
            },
            dckst_superstar_1_loss = {
                'Even the greatest',
                'drop one sometimes'
            },
            dckst_superstar_2_win = {
                'Stacked mult, stacked',
                'rings, stacked wins'
            },
            dckst_superstar_2_loss = {
                'Not enough blinds',
                'beaten for that comeback'
            },
            dckst_superstar_3_win = {
                'That\'s a highlight-reel',
                'finish right there'
            },
            dckst_superstar_3_loss = {
                'The King still',
                'gets humbled sometimes'
            },
            dckst_superstar_4_win = {
                'Chasing greatness,',
                'catching wins'
            },
            dckst_superstar_4_loss = {
                'Off night. Even',
                'legends have those'
            },
            dckst_superstar_5_win = {
                'Every blind beaten',
                'is a banner raised'
            },
            dckst_superstar_5_loss = {
                'Not this run.',
                'Not this time'
            },
            dckst_superstar_6_win = {
                '+7 mult a blind,',
                'and it shows'
            },
            dckst_superstar_6_loss = {
                'The star dimmed',
                'a little too early'
            },
            dckst_superstar_7_win = {
                'Dunked on the',
                'whole run, no cap'
            },
            dckst_superstar_7_loss = {
                'Greatness takes',
                'losses too, apparently'
            },
            dckst_cyanotype_1_win = {
                'Made a copy, made',
                'it double the win'
            },
            dckst_cyanotype_1_loss = {
                'Five hands and',
                'still couldn\'t copy a win'
            },
            dckst_cyanotype_2_win = {
                'Blueprint complete,',
                'victory printed'
            },
            dckst_cyanotype_2_loss = {
                'The copy didn\'t',
                'help this time'
            },
            dckst_cyanotype_3_win = {
                'Developed just in',
                'time for the dub'
            },
            dckst_cyanotype_3_loss = {
                'Faded before it',
                'could save the run'
            },
            dckst_cyanotype_4_win = {
                'One joker became',
                'two, and both won'
            },
            dckst_cyanotype_4_loss = {
                'Copied the wrong',
                'energy this round'
            },
            dckst_cyanotype_5_win = {
                'Print it, self-destruct,',
                'walk away champion'
            },
            dckst_cyanotype_5_loss = {
                'Duplicated the loss',
                'too, unfortunately'
            },
            dckst_knicks_1_win = {
                'MSG is ERUPTING',
                'right now!!'
            },
            dckst_knicks_1_loss = {
                'It blew up. Of',
                'course it blew up.'
            },
            dckst_knicks_2_win = {
                'Tripled the odds,',
                'took the whole city with it'
            },
            dckst_knicks_2_loss = {
                '1 in 8 hit.',
                'Somehow it\'s always 1 in 8'
            },
            dckst_knicks_3_win = {
                'NEW YORK CITY IS',
                'NOT SLEEPING TONIGHT'
            },
            dckst_knicks_3_loss = {
                'Gambled it all',
                'and the city mourns'
            },
            dckst_knicks_4_win = {
                'Odds tripled, chaos',
                'multiplied, we won!'
            },
            dckst_knicks_4_loss = {
                'Exploded right on',
                'schedule, unfortunately'
            },
            dckst_knicks_5_win = {
                'This is what 2026',
                'felt like. Champions.'
            },
            dckst_knicks_5_loss = {
                'One bad roll and',
                'it all goes up in smoke'
            },
            dckst_typewriter_1_win = {
                'Ah, a fine tale,',
                'freshly typed and won'
            },
            dckst_typewriter_1_loss = {
                'The ribbon\'s dry',
                'and so is this run'
            },
            dckst_typewriter_2_win = {
                'Another page, another',
                'triumph, dear reader'
            },
            dckst_typewriter_2_loss = {
                'Struck the wrong',
                'key that time, old chap'
            },
            dckst_typewriter_3_win = {
                'Copied clean, printed',
                'proper, a jolly good win'
            },
            dckst_typewriter_3_loss = {
                'Jammed at the',
                'worst possible moment'
            },
            dckst_typewriter_4_win = {
                'A masterwork, if I',
                'do say so myself'
            },
            dckst_typewriter_4_loss = {
                'Not every draft',
                'makes the final cut'
            },
            dckst_typewriter_5_win = {
                'Ding! End of the',
                'line, and victorious'
            },
            dckst_typewriter_5_loss = {
                'Torn from the',
                'carriage, unfinished'
            },
            dckst_airborne_piano_1_win = {
                'Still falling, still',
                'winning, physics be damned'
            },
            dckst_airborne_piano_1_loss = {
                'Hit terminal velocity',
                'and terminal losses'
            },
            dckst_airborne_piano_2_win = {
                'X5.5 and dropping,',
                'but the run held!'
            },
            dckst_airborne_piano_2_loss = {
                'Splattered before',
                'it could matter'
            },
            dckst_airborne_piano_3_win = {
                'Every key struck',
                'on the way down. Victory.'
            },
            dckst_airborne_piano_3_loss = {
                'Gravity won this',
                'one, not you'
            },
            dckst_airborne_piano_4_win = {
                'MIT would be',
                'proud. Also, we won'
            },
            dckst_airborne_piano_5_win = {
                'Concert\'s over,',
                'the crowd\'s ecstatic'
            },
            dckst_airborne_piano_4_loss = {
                'Should\'ve done',
                'the math first'
            },
            dckst_airborne_piano_5_loss = {
                'Decayed to nothing,',
                'just like the run'
            },
            dckst_pathogen_1_win = {
                'Spread the copy,',
                'spread the chaos, spread the win'
            },
            dckst_pathogen_1_loss = {
                'Infection failed to',
                'take hold this time'
            },
            dckst_pathogen_2_win = {
                'Two became four,',
                'and you never saw it coming~'
            },
            dckst_pathogen_2_loss = {
                'The strain didn\'t',
                'quite mutate right'
            },
            dckst_pathogen_3_win = {
                'Contagious little',
                'trick, wasn\'t it?'
            },
            dckst_pathogen_3_loss = {
                'No hosts, no copies,',
                'no fun this round'
            },
            dckst_pathogen_4_win = {
                'Duplicated behind',
                'your back, hehe'
            },
            dckst_pathogen_4_loss = {
                'Missed the perfect',
                'conditions, how boring'
            },
            dckst_pathogen_5_win = {
                'Copy, copy, and',
                'the win just... happens'
            },
            dckst_pathogen_5_loss = {
                'A pathogen needs',
                'the right host, apparently'
            },
            dckst_pawprints_1_win = {
                'Left a little paw-shaped',
                'mark on that win'
            },
            dckst_pawprints_1_loss = {
                'No enhancements,',
                'no pawprints, no luck'
            },
            dckst_pawprints_2_win = {
                'Stepped right onto',
                'a card, and it stuck!'
            },
            dckst_pawprints_2_loss = {
                'Wandered off before',
                'leaving a mark'
            },
            dckst_pawprints_3_win = {
                'One in three, and',
                'it landed perfectly'
            },
            dckst_pawprints_3_loss = {
                'The odds just',
                'didn\'t pad out this time'
            },
            dckst_pawprints_4_win = {
                'Tiny paws, big',
                'enhancement, bigger win'
            },
            dckst_pawprints_4_loss = {
                'Clean cards, clean',
                'loss, no trace left'
            },
            dckst_pawprints_5_win = {
                'Left prints all',
                'over that scoreboard'
            },
            dckst_pawprints_5_loss = {
                'Missed every step',
                'that mattered'
            },
            dckst_rook_1_win = {
                'Sacrificed a piece,',
                'won the whole game'
            },
            dckst_rook_1_loss = {
                'Blundered the',
                'endgame, unfortunately'
            },
            dckst_rook_2_win = {
                'The rook takes,',
                'the rook wins'
            },
            dckst_rook_2_loss = {
                'That\'s a resign-worthy',
                'position right there'
            },
            dckst_rook_3_win = {
                'Cleared the board,',
                'claimed the victory'
            },
            dckst_rook_3_loss = {
                'Should\'ve castled',
                'away from that one'
            },
            dckst_rook_4_win = {
                'X1.75 stronger and',
                'still hungry. Checkmate.'
            },
            dckst_rook_4_loss = {
                'Traded material for',
                'nothing, big mistake'
            },
            dckst_rook_5_win = {
                'One less Joker,',
                'one more banner raised'
            },
            dckst_rook_5_loss = {
                'The rook feasted,',
                'the run still starved'
            },
            dckst_giggler_1_win = {
                'Hehehe~ every face',
                'card just made it worse for you'
            },
            dckst_giggler_1_loss = {
                'Heh... not enough',
                'faces to giggle at'
            },
            dckst_giggler_2_win = {
                'Tee hee! Stacked',
                'those unique faces real nice'
            },
            dckst_giggler_2_loss = {
                'Nothing funny about',
                'that hand, honestly'
            },
            dckst_giggler_3_win = {
                'Giggling all the',
                'way to +Mult city!'
            },
            dckst_giggler_3_loss = {
                'The joke just',
                'didn\'t land this time'
            },
            dckst_giggler_4_win = {
                'Every unique face',
                'is just funnier, hehe'
            },
            dckst_giggler_4_loss = {
                'Silence. Not even',
                'a chuckle out of this'
            },
            dckst_giggler_5_win = {
                'Kings, Queens, Jacks~',
                'all in on the bit!'
            },
            dckst_giggler_5_loss = {
                'Ran out of faces',
                'to laugh with'
            },
            dckst_perrobabli_1_win = {
                'Every chance evened',
                'out, and fortune sided with you'
            },
            dckst_perrobabli_1_loss = {
                'The coin landed',
                'wrong this time'
            },
            dckst_perrobabli_2_win = {
                'Balance restored,',
                'and you came out ahead'
            },
            dckst_perrobabli_2_loss = {
                'Fifty-fifty giveth,',
                'fifty-fifty taketh away'
            },
            dckst_perrobabli_3_win = {
                'No extremes, no',
                'mercy, just the perfect flip'
            },
            dckst_perrobabli_3_loss = {
                'Even odds still',
                'means you can lose'
            },
            dckst_perrobabli_4_win = {
                'Pulled every odd',
                'toward center, and center won'
            },
            dckst_perrobabli_4_loss = {
                'The middle ground',
                'wasn\'t enough ground'
            },
            dckst_perrobabli_5_win = {
                'A coin flip decided',
                'it, and you called it right'
            },
            dckst_perrobabli_5_loss = {
                'Called it wrong.',
                'That\'s the bell curve for you'
            },
            dckst_quadratic_equation_1_win = {
                'The curve bent',
                'right in your favor'
            },
            dckst_quadratic_equation_1_loss = {
                'Not enough cards',
                'scored to solve this one'
            },
            dckst_quadratic_equation_2_win = {
                'Mult scaling up,',
                'up, up, and away!'
            },
            dckst_quadratic_equation_2_loss = {
                'The equation just',
                'didn\'t add up today'
            },
            dckst_quadratic_equation_3_win = {
                'Every four cards',
                'made the next four scarier'
            },
            dckst_quadratic_equation_3_loss = {
                'Flat line where',
                'a parabola should\'ve been'
            },
            dckst_quadratic_equation_4_win = {
                'Exponential growth,',
                'exponential victory'
            },
            dckst_quadratic_equation_4_loss = {
                'Solved for zero',
                'wins this round'
            },
            dckst_quadratic_equation_5_win = {
                'The formula checks',
                'out. So does the dub'
            },
            dckst_quadratic_equation_5_loss = {
                'Undefined result.',
                'Try again.'
            },
            dckst_naturalist_1_win = {
                'The wild provides,',
                'and boy did it provide'
            },
            dckst_naturalist_1_loss = {
                'Nature took the',
                'day off, unfortunately'
            },
            dckst_naturalist_2_win = {
                'Every leaf, every',
                'root, every win. Beautiful.'
            },
            dckst_naturalist_2_loss = {
                'The forest stayed',
                'quiet this round'
            },
            dckst_naturalist_3_win = {
                'One in six bloomed,',
                'and the whole run flourished'
            },
            dckst_naturalist_3_loss = {
                'Not a single seed',
                'took root today'
            },
            dckst_naturalist_4_win = {
                'Mother nature herself',
                'approves of this win'
            },
            dckst_naturalist_4_loss = {
                'Even the wild',
                'has its off days'
            },
            dckst_naturalist_5_win = {
                'Grew right through',
                'the blind. Magnificent.'
            },
            dckst_naturalist_5_loss = {
                'The wilderness',
                'gave nothing back today'
            },
            dckst_sticky_note_1_win = {
                'Just a lil\' note,',
                'but it made all the difference!'
            },
            dckst_sticky_note_1_loss = {
                'Aw, the note',
                'didn\'t stick this time...'
            },
            dckst_sticky_note_2_win = {
                'Slapped some love',
                'on a friend, and it worked!'
            },
            dckst_sticky_note_2_loss = {
                'Even a cute little',
                'boost couldn\'t save this one'
            },
            dckst_sticky_note_3_win = {
                'A tiny reminder',
                'led to a big win!'
            },
            dckst_sticky_note_3_loss = {
                'Guess the note',
                'fell off, oopsie'
            },
            dckst_sticky_note_4_win = {
                'Sending good vibes',
                'and +5 Mult, yay!'
            },
            dckst_sticky_note_4_loss = {
                'Not every sticky',
                'note saves the day'
            },
            dckst_sticky_note_5_win = {
                'Small note, huge',
                'heart, even huger win'
            },
            dckst_sticky_note_5_loss = {
                'Sorry, ran out',
                'of sticky magic'
            },
            dckst_currency_exchange_1_win = {
                'Swapped the ticker,',
                'closed the market green'
            },
            dckst_currency_exchange_1_loss = {
                'The exchange rate',
                'wasn\'t in your favor'
            },
            dckst_currency_exchange_2_win = {
                'Chips to Mult, Mult',
                'to profit. Bull run.'
            },
            dckst_currency_exchange_2_loss = {
                'Market crashed right',
                'when you needed the swap'
            },
            dckst_currency_exchange_3_win = {
                'Bought low, scored',
                'high, textbook trade'
            },
            dckst_currency_exchange_3_loss = {
                'That\'s a rough close',
                'for the quarter'
            },
            dckst_currency_exchange_4_win = {
                'Flipped the numbers,',
                'flipped the outcome'
            },
            dckst_currency_exchange_4_loss = {
                'Volatility got the',
                'better of that run'
            },
            dckst_currency_exchange_5_win = {
                'NASDAQ\'s got nothing',
                'on that trade'
            },
            dckst_currency_exchange_5_loss = {
                'Sold low, lost',
                'big. Rough session.'
            },
            dckst_currency_exchange_6_win = {
                'Wall Street wishes',
                'they traded like that'
            },
            dckst_currency_exchange_6_loss = {
                'Even Wall Street',
                'has its bad days'
            },
            dckst_coin_jar_1_win = {
                'Jar\'s empty now,',
                'but the wallet\'s full!'
            },
            dckst_coin_jar_1_loss = {
                'All that saving',
                'and nothing to dump'
            },
            dckst_coin_jar_2_win = {
                'Cha-ching! Every',
                'coin paid off big time'
            },
            dckst_coin_jar_2_loss = {
                'The jar stayed',
                'shut this round'
            },
            dckst_coin_jar_3_win = {
                'Saved up, cashed',
                'out, walked away rich'
            },
            dckst_coin_jar_3_loss = {
                'Rainy day fund',
                'never got its day'
            },
            dckst_coin_jar_4_win = {
                'Patience paid off,',
                'literally, all at once'
            },
            dckst_coin_jar_4_loss = {
                'Coins just sat',
                'there, unspent, unused'
            },
            dckst_coin_jar_5_win = {
                'Dumped the jackpot',
                'right when it mattered!'
            },
            dckst_coin_jar_5_loss = {
                'Never got to',
                'break the piggy bank'
            },
            dckst_cupboard_1_win = {
                'Stashed it away,',
                'served it up perfectly'
            },
            dckst_cupboard_1_loss = {
                'The cupboard stayed',
                'bare this round'
            },
            dckst_cupboard_2_win = {
                'Half the chips,',
                'all of the payoff'
            },
            dckst_cupboard_2_loss = {
                'Nothing worth',
                'storing that hand'
            },
            dckst_cupboard_3_win = {
                'Saved it, served',
                'it, secured the win'
            },
            dckst_cupboard_3_loss = {
                'Shelves empty,',
                'run empty too'
            },
            dckst_cupboard_4_win = {
                'A little stored',
                'chips goes a long way'
            },
            dckst_cupboard_4_loss = {
                'Not much to',
                'pull out this time'
            },
            dckst_cupboard_5_win = {
                'Opened the cupboard,',
                'out came the win'
            },
            dckst_cupboard_5_loss = {
                'Ran dry before',
                'the hand even ended'
            },
            dckst_endpoints_1_win = {
                'Both ends hit',
                'twice, dead center on the win'
            },
            dckst_endpoints_1_loss = {
                'The middle got',
                'you, not the edges'
            },
            dckst_endpoints_2_win = {
                'Left and right,',
                'triggered twice, total sweep'
            },
            dckst_endpoints_2_loss = {
                'Not enough retriggers',
                'to save that hand'
            },
            dckst_endpoints_3_win = {
                'Bookended that',
                'hand perfectly'
            },
            dckst_endpoints_3_loss = {
                'The edges just',
                'didn\'t carry this time'
            },
            dckst_endpoints_4_win = {
                'From one end to',
                'the other, all wins'
            },
            dckst_endpoints_4_loss = {
                'Retriggered the',
                'loss too, unfortunately'
            },
            dckst_endpoints_5_win = {
                'Start strong, finish',
                'stronger, take the win'
            },
            dckst_endpoints_5_loss = {
                'Neither end came',
                'through this round'
            },
            dckst_the_town_1_win = {
                'Zero on the dot,',
                'and the whole town erupts'
            },
            dckst_the_town_1_loss = {
                'Money didn\'t land',
                'on zero this time'
            },
            dckst_the_town_2_win = {
                'That\'s a splash',
                'from way downtown!'
            },
            dckst_the_town_2_loss = {
                'The Town stayed',
                'quiet this round'
            },
            dckst_the_town_3_win = {
                'Rounded out perfect,',
                'rounded out a win'
            },
            dckst_the_town_3_loss = {
                'So close to that',
                'zero, so close to that bonus'
            },
            dckst_the_town_4_win = {
                'Bay Area magic,',
                'straight to the bank'
            },
            dckst_the_town_4_loss = {
                'The math just',
                'didn\'t land this round'
            },
            dckst_the_town_5_win = {
                'Hit zero, hit',
                'big, hit history'
            },
            dckst_the_town_5_loss = {
                'The dollars didn\'t',
                'cooperate this time'
            },
            dckst_cantor_set_1_win = {
                'Divided, conquered,',
                'and multiplied straight to victory'
            },
            dckst_cantor_set_1_loss = {
                'Not enough remained',
                'to carry that scaling'
            },
            dckst_cantor_set_2_win = {
                'Cut the middle,',
                'kept the win'
            },
            dckst_cantor_set_2_loss = {
                'The fractal just',
                'didn\'t favor you this round'
            },
            dckst_cantor_set_3_win = {
                'Thirds removed,',
                'chips multiplied, dub secured'
            },
            dckst_cantor_set_3_loss = {
                'Too little left',
                'to make the math work'
            },
            dckst_cantor_set_4_win = {
                'Infinite subdivisions,',
                'one very finite win'
            },
            dckst_cantor_set_4_loss = {
                'Destroyed too much,',
                'kept too little'
            },
            dckst_cantor_set_5_win = {
                'What remains hits',
                'harder. Proven, again'
            },
            dckst_cantor_set_5_loss = {
                'The set collapsed',
                'and so did the run'
            },
            dckst_blkyn_1_win = {
                'Every unscored card',
                'still showed up big'
            },
            dckst_blkyn_1_loss = {
                'Reset before it',
                'could really build up'
            },
            dckst_blkyn_2_win = {
                'Stacked that XMult',
                'quiet, then loud'
            },
            dckst_blkyn_2_loss = {
                'Not enough left',
                'on the table this round'
            },
            dckst_blkyn_3_win = {
                'The ones that',
                'didn\'t score still mattered'
            },
            dckst_blkyn_3_loss = {
                'Reset hit before',
                'the payoff landed'
            },
            dckst_blkyn_4_win = {
                'Brooklyn built that',
                'multiplier from nothing'
            },
            dckst_blkyn_4_loss = {
                'Fresh start, same',
                'result unfortunately'
            },
            dckst_blkyn_5_win = {
                'Every leftover card',
                'paid its dues, big time'
            },
            dckst_blkyn_5_loss = {
                'Cleared the slate',
                'right before it mattered'
            },
            dckst_peachtree_1_win = {
                'Straight to the Ace,',
                'straight to the win'
            },
            dckst_peachtree_1_loss = {
                'No Ace in hand,',
                'no magic this round'
            },
            dckst_peachtree_2_win = {
                'That combo hit',
                'like a game-winner'
            },
            dckst_peachtree_2_loss = {
                'The Straight showed',
                'up, the Ace didn\'t'
            },
            dckst_peachtree_3_win = {
                'Peachtree special,',
                'straight to the bank'
            },
            dckst_peachtree_3_loss = {
                'Close, but no',
                'Ace to seal it'
            },
            dckst_peachtree_4_win = {
                'ATL magic, right',
                'on cue'
            },
            dckst_peachtree_4_loss = {
                'Almost had it.',
                'Almost isn\'t X2'
            },
            dckst_peachtree_5_win = {
                'That\'s the whole',
                'combo, that\'s the win'
            },
            dckst_peachtree_5_loss = {
                'Missing a piece',
                'of the puzzle this time'
            },
        },
        dckst_misc = {
            mod_label = {
                {"decksterity."},
                {"dckstrty."},
                {"DECK THE", "FREAKING STERITY!!"},
                {"dckst."},
                {"Duck St."},
                {"mariopuff & UN4YA's", "epic Balatro mod"},
                {"DCKST"},
                {"dersteckity."},
                {"EVIL decksterity."},
                {"gregsterity."},
                {"deckstremely decksterous"},
                {"what the deck."},
                {"DECK. STER. ITY."},
                {"[[[ D E C K S T E R I T Y ]]]"},
                {"treksterity"},
                {"deckdeckdeckdeck"},
                {"dee cee kay ess tee"},
                {".ytiretskced"},
                {"dEcKsTeRiTy."},
                {"DDDDDDDDDD"},
                {"SEGA Decksterity"},
                {"dekstiritie"},
                {"deckster the jokester"},
                {"dexterity but cooler"},
                {"d3ckst3r1ty"},
                {"decksterity (2024)"},
                {"deksteritee"},
                {"THE DECKSTER"},
                {"deck and/or sterity"},
                {"decksterous activities"},
                {"some balatro mod idk"},
                {"deck... sterity?"},
                {"decksterity but worse"},
                {"DECKSTERITY ULTIMATE", "DELUXE EDITION"},
                {"decksterity™®©"},
                {"deckster's laboratory"},
                {"card game module"},
                {"DECKSTERITY", "DECKSTERITY", "DECKSTERITY"},
                {"decksterity dot lua"},
                {"a game about cards", "probably"},
                {"dck", "str", "ity"},
                {"decksterity 2: electric boogaloo"},
                {"deckSTERITY (all caps middle)"},
                {"the deckster cinematic universe"},
                {"unfuffy presents: decksterity"},
                {"decksterity but it's midnight and", "we're still coding"},
                {"d.e.c.k.s.t.e.r.i.t.y."},
                {"decksterity (colorized)"},
                {"decksterity: remastered"},
                {"deckSTERITYYYYY"},
                {"decksterity feat. the balatro discord"},
                {"UN4YA's fever dream"},
                {"mariopuff's magnum opus"},
                {"decksterity (director's cut)"},
                {"deckstiny"},
                {"decksterity but sponsored by nobody"},
                {"THE decksterity experience™"},
                {"deck-ster-i-ty (sound it out)"},
                {"decksterity", "(patch 1.0.0.0.0.1)"},
                {"decksterity:", "a balatro odyssey"},
                {"decksterity dot exe", "has stopped working"},
                {"beta decksterity (still beta forever)"},
                {"decksterity but", "everything's on fire"},
                {"decksterity", "(Extended Cut)"},
                {"decksterity in 4K"},
                {"decksterity", "(no, the OTHER one)"},
                {"H is for", "HECKIN' decksterity"},
                {"deckHsterity"},
                {"HHHHHHHHHH"},
                {"straight up", "decksterity"},
                {"decksteritH"},
                {"H: the mod, the", "myth, the legend"},
                {"the letter H", "approves this mod"},
                {"deckHterity", "(H is silent, we lied)"},
                {"straights only,", "no funny business"},
                {"H H H H H H H"},
                {"decksterity (H tier)"},
                {"a straight-up", "H of a mod"},
                {"deckHstraightHity"},
                {"H'd it and loved it"},
            },
            flavor_text = {
                {"skill issue? no.","deck issue."},
                {"deck the halls with", "boughs of holly!!"},
                {"LET'S GO LAKERS!"},
                {"\"I'll be back.\"","said a man named", "Arnold Schwarzenegger."},
                {"San Antonio should\'ve", "won the 2026 NBA", "championship smh."},
                {"LEBRON JAMES IS", "THE GOAT"},
                {"Shut up, Meg."},
                {"Brian Griffin might be", "the most intelligent dog ever"},
                {"WHO\'S MODDING THIS THING?!"},
                {"WEMVP! WEMVP! WEMVP!"},
                {"Your friendly flopper, SGA!"},
                {"This mod\'s better than", "Cryptid, trust me."},
                {"TOTALLY BALANCED MOD", "AND NOTHING WRONG", "WITH IT!"},
                {"UN4YA god of nonsense"},
                {"I don\'t think LocalThunk", "would recognize this in", "a million years"},
                {"WE\'RE NOT COPYING", "AIKOSHEN WE SWEARR"},
                {"\"ya like jazz?\""},
                {"This mod will leak", "the entire Bee Movie", "script."},
                {"shoutout to nico\'s nextbots!"},
                {"you can\'t spell DEXTER", "without decksterity!"},
                {"don\'t read this text"},
                {"Tip: If you\'re playing this mod", "for the 25th time today,", "please take a break."},
                {"Tip: Tip"},
                {"Tip: Best I can do is ten cents."},
                {"Tip: If you sold a copy", "of this mod to a", "pawn shop, you could get", "ten bajillion dollars!"},
                {"Markiplier would recommend", "this mod."},
                {"We guarantee a 30-day", "money-back guarantee!", "(isn\'t this mod free?)"},
                {"DO NOT DROP THIS MOD.", "IT IS VERY FRAGILE."},
                {"Perfect Valentine\'s gift for", "your dearly crush."},
                {"WE WISH LEBRON HIS", "FIFTH RING!"},
                {"VJ Edgecombe is a", "pretty cool dude!"},
                {"Aikoyori, if you\'re reading this,", "let us know what we", "can do to break this game."},
                {"Made for non-gamblers and gamblers alike!"},
                {"LARRY BIRDDDDD"},
                {"One-half of the devs", "is a basketball fan."},
                {"NEW YORK IS GOING", "DOWN TONIGHT!!"},
                {"Jalen Brunson. 2026 NBA Champion."},
                {"Inline suggestions in VSCode", "are pretty cool"},
                {"YOU CAN RUN DOOM", "ON THIS MOD!"},
                {"CURRY FOR THREE!!"},
                {"A technical foul on", "mariopuff."},
                {"97 97 97"},
                {"CRISTIANO RONALDO", "SIUUUUUUUUUU"},
                {"nicopatty!"},
                {"NICO HARRISON WHAT", "WAS THAT TRADE??"},
                {"we might add some more features"},
                {"SIX SEVENNNN"},
                {"WASHINGTON WIZARDS."},
                {"TOM BRADY IS THE GOAT."},
                {"The cake is a cake.", "What did you expect it to be? A lie?"},
                {"Don\'t gamble, kids!"},
                {"Please refrain from smoking", "in the aircraft."},
                {"Thank you for flying with", "Puffy Air!"},
                {"motion sickness is caused by motion"},
                {"This mod was coded on a laptop."},
                {"TYLER, THE CREATOR IS A GENIUS"},
                {"HAPPY 4TH OF JULY!"},
                {"You need to pay zero", "dollars to use this mod."},
                {"Meg Griffin\'s full name", "is Megatron!"},
                {"IN LEBRON WE TRUST"},
                {"Oops! All Sixers!"},
                {"Rest in peace Kobe."},
                {"CARMELO ANTHONY!"},
                {"Lakers over Clippers any day"},
                {"OH GOD NYC\'S ON FIRE"},
                {"Props to the \'26 Knicks tho"},
                {"This mod doesn\'t drain", "your bank account!"},
                {"If this mod played", "basketball, it\'d be the MVP."},
                {"Silent brick or loud airball?"},
                {"\"BANG!!\" - Mike Breen"},
                {"\"IT\'S GOOD!!\" - Mike Breen"},
                {"This mod does NOT brick shots!"},
                {"Dude, this car kicks ass!", "And I can watch Madagascar", "while I'm driving!"},
                {"Hahahaha! Dude, those animals are", "so fucking funny, they make", "me wanna merge without looking!"},
                {"Don\'t worry, your GPU is safe."},
                {"Hey! Vsauce, Michael here."},
                {"Your house is safe...", "Or is it?"},
                {"OO WEE OO I LOOK", "JUST LIKE BUDDY HOLLY"},
                {"son 😭"},
                {"a little bit of a tool"},
                {"I want cuddles right MEOW"},
                {"a line of vegetable products"},
                {"coming soon to a bathroom near you"},
                {"Feel the Different Taste"},
                {"a continuously revolving device for item delivery"},
                {"like an iced coffee!"},
                {"the habitat of the light is like a memory"},
                {"IT\'S ALL JUST ALUMINIUM"},
                {"this has since been resolved"},
                {"Souvaste Notebookery"},
                {"a civil ricochet"},
                {"now with at least 5 cards"},
                {"avoid understanding fresh film wrapping"},
                {"(ambidextrous edition)"},
                {"now with 30% more inconveniences"},
                {"keep sealed in a secure container"},
                {"Flammable!"},
                {"approved by absolutely nobody"},
                {"do not store in damp conditions"},
                {"avec miaulement de chat"},
                {"pour randonneurs"},
                {"TU DU DU DU", "MAX VERSTAPPEN"},
                {"MAX VERSTAPPEN FOR 5TH WDC"},
                {"\"Is that a Spurs jersey?\""},
                {"(slowed + reverb)"},
                {"(sped up)"},
                {"(ft. Kanye West)"},
                {"(ft. Clipse)"},
                {"(ft. Tyler, The Creator)"},
                {"(ft. Michael Jackson)"},
                {"the ultimate cat mod!"},
                {"THRILLER", "THRILLER NIGHTTTTT"},
                {"YOU KNOW I\'M BAD, I\'M BAD", "(REALLY REALLY BAD)"},
                {"I ALWAYS FEEL LIKE", "SOMEBODY\'S WATCHING MEEEEE"},
                {"TO INFINITY AND LEBRON"},
                {"Best enjoyed with Aikoyori\'s Shenanigans!"},
                {"NIKOLA JOKIC TRIPLE-DOUBLE", "ALERT!"},
                {"Victor Wembanyama is", "not real, change my mind"},
                {"Free Melo\'s jersey retirement!"},
                {"SGA for Finals MVP,", "we called it early"},
                {"KNICKS IN 7... OR LESS!"},
                {"Steph Curry shooting from", "the parking lot again"},
                {"\"That's a foul.\" - Every ref, ever"},
                {"Giannis dunking on the", "concept of rim protection"},
                {"REMEMBER THE ALAMO", "(and also this mod)"},
                {"AD is available? SIGN HIM"},
                {"we say \"trust the process\"", "unironically here"},
                {"Anthony Edwards top 5", "player alive, fight us"},
                {"the 3-point line is", "just a suggestion now"},
                {"Every game 7 should", "end in a buzzer beater"},
                {"Tip: This is not financial advice.", "This is a card game."},
                {"Tip: Please hydrate. Cards", "cannot do that for you."},
                {"Tip: Jokers do not", "actually tell jokes. We\'re sorry."},
                {"Tip: If confused, try", "turning your brain off and on."},
                {"Tip: There is no", "skip button for real life."},
                {"Warning: prolonged joker synergy", "may cause excessive screaming"},
                {"Achievement unlocked: read this", "entire tooltip"},
                {"the deck knows what you did"},
                {"shuffling is a form", "of self care"},
                {"we put the STER", "in deckSTERity"},
                {"an ancient card game", "ritual, probably"},
                {"in loving memory of", "every hand you\'ve lost"},
                {"error 404: strategy not found"},
                {"certified fresh deck (100% on Rotten Tomatoes)"},
                {"a card-based fever dream"},
                {"blessed by the RNG gods"},
                {"cursed by the RNG gods"},
                {"NULL POINTER EXCEPTION", "(a card, not a bug)"},
                {"stack overflow but", "it\'s your joker slots"},
                {"segmentation fault: skill issue"},
                {"\"it\'s not a bug,", "it\'s a feature\" - UN4YA"},
                {"\"it\'s not a feature,", "it\'s a bug\" - mariopuff"},
                {"tested extensively (by nobody)"},
                {"QA team consists of", "two guys and a dream"},
                {"this mod runs on", "vibes and caffeine"},
                {"lua, the language of", "champions (and pain)"},
                {"we don\'t know why it", "works either"},
                {"if it ain\'t broke,", "add more jokers"},
                {"balance patch incoming", "(narrator: it was not)"},
                {"one more feature,", "we promise (we don\'t)"},
                {"scope creep: the mod"},
                {"we said \"just one more joker\"", "47 jokers ago"},
                {"you vs. the mod your", "friends told you not", "to worry about"},
                {"WHO LET THE JOKERS OUT"},
                {"pastel red is a", "personality trait now"},
                {"#ff746c supremacy"},
                {"powered by spite and", "stack traces"},
                {"we fixed it. we broke", "something else."},
                {"Ctrl+Z is doing a lot", "of heavy lifting here"},
                {"\"just ship it\" - someone,", "unfortunately"},
                {"we test in production", "(there is no other option)"},
                {"git blame leads back", "to both of us equally"},
                {"merge conflict resolved", "via arm wrestling"},
                {"commit message: \"fixed stuff\""},
                {"commit message: \"idk why", "this works now\""},
                {"this mod has more", "jokers than sense"},
                {"decksterity: now with", "extra decksterity"},
                {"HAPPY 4TH OF JULY", "(from your mod devs)"},
                {"summer patch, summer bugs"},
                {"we coded this instead", "of touching grass"},
                {"CRISTIANO RONALDO:", "GOAT, SIMPLE AS THAT"},
                {"SIUUUUUUUUUUUUUUU"},
                {"CR7 FOREVER, CR7 ALWAYS"},
                {"Ronaldo doesn\'t age,", "he just levels up"},
                {"still scoring bicycle kicks", "at 40+, absolute machine"},
                {"\"Calma, calma, calma\"", "- Cristiano Ronaldo"},
                {"five Ballon d\'Ors and", "counting (probably)"},
                {"LEBRON JAMES: 20+ YEARS", "OF DOMINANCE"},
                {"THE KING DOES NOT REST"},
                {"LeBron passed Kareem and", "he\'s still not done"},
                {"\"You can\'t win a", "championship without ME\"", "- probably LeBron"},
                {"four rings, zero signs", "of slowing down"},
                {"LeBron\'s longevity is", "actually unfair to physics"},
                {"chosen one delivers,", "every single time"},
                {"MAX VERSTAPPEN: FASTEST", "MAN ON FOUR WHEELS"},
                {"Max doesn\'t brake,", "he just wins earlier"},
                {"Red Bull\'s secret weapon:", "just Max being Max"},
                {"lapping the field, literally"},
                {"\"P1. Obviously.\"", "- Max Verstappen, probably"},
                {"world championships stacking up", "like it\'s nothing"},
                {"the GOAT of football,", "the GOAT of basketball,", "and the GOAT of F1"},
                {"CR7, LeBron, and Max:", "the Mount Rushmore", "of sports"},
                {"greatness recognizes greatness"},
                {"some athletes chase records,", "these guys ARE the record"},
            }
        }
    }
}