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
                    'get a {C:attention,T:dckst_smiley,T_vars:9}Smiley{} sticker',
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
                name = "lil' maxey!",
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


        -- H JOKERS
        j_dckst_majuscule = {
            name = "Majuscule",
            text = {
                '{X:mult,C:white}X#1#{} Mult if played',
                'hand contains a {C:attention}Striaght{}'
            }
        },
        j_dckst_miniscule = {
            name = "Miniscule",
            text = {
                '{X:chips,C:white}X#1#{} Chips if played',
                'hand contains a {C:attention}Striaght{}'
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
                'Choose {C:attention}1{} of up to',
                '{C:attention}2{} {X:black,V:1}decksterity.{} Jokers',
                }
        },
        p_dckst_decksteritical_pack_jumbo = {
            name = "Jumbo Decksteritical Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}4{} {X:black,V:1}decksterity.{} Jokers',
                }
        },
        p_dckst_decksteritical_pack_mega = {
            name = "Mega Decksteritical Pack",
            text = {
                'Choose {C:attention}2{} of up to',
                '{C:attention}4{} {X:black,V:1}decksterity.{} Jokers',
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
        dckst_exalted_continual = {
            name = "Continual Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Continual",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_exalted_universal = {
            name = "Universal Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Universal",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_exalted_nebular = {
            name = "Nebular Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Nebular",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_exalted_penultimate = {
            name = "Penultimate Sticker",
            text = {
                "Used this Joker",
                "to win on {C:attention}Penultimate",
                "{C:attention}Stake{} difficulty",
            }
        },
        dckst_exalted_ultimate = {
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
        }
    },
},

misc = {
        dictionary = {
            b_catarot_cards = "Catarot Cards",
            b_neotarot_cards = "Neo-Tarot Cards",
            b_spectaclaw_cards = "Spectaclaw Cards",
            b_route_cards = "Routes",

            k_catarot = "Catarot",
            k_neotarot = "Neo-Tarot",
            k_spectaclaw = "Spectaclaw",
            k_route = "Route",

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

            k_dckst_money_buddy = "Money Buddy",
            k_dckst_cash_in_guru = "Cash-in Guru",
            k_dckst_the_godfather = "The Godfather",

            k_dckst_gameset_humble      = "Humble",
            k_dckst_gameset_humble_desc = "For amateur players just getting started.",

            k_dckst_gameset_honed       = "Honed",
            k_dckst_gameset_honed_desc  = "For experienced players. Standard experience.",

            k_dckst_gameset_hazardous   = "Hazardous",
            k_dckst_gameset_hazardous_desc = "For players who want to blow up their machine.",
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

            dckst_cosmic = "Cosmic",
            dckst_phosphorescent = "Phosphorescent",
            dckst_aetherescent = "Aetherescent",
            dckst_iridescent = "Iridescent",
            dckst_prismatic = "Prismatic",
            dckst_wooden = "Wooden",
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