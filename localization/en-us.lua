return {
    descriptions = {
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
                    '{C:attention}leftmost{} owned Joker',
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
                    '{C:attention}Triples{} every {C:green,E:1,S:1.1}probability{}',
                    '{C:green,E:1,S:1.1}numerator{} but has a',
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
                'as {C:mult}Mult{} after hand,',
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
            'cards add {C:chips,E:1,S:1.1}1/base value{}',
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
                '{E:1,S:1.1}Trae{} gives {X:mult,C:white}X#1#{} Mult',
            }
        },
        j_dckst_perrobabli = {
            name = "Perrobabli",
            text = {
                'All {C:green,S:1.1,E:1}probabilities{}',
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
    },
    Enhanced = {
        m_dckst_nature = {
            name = "Nature Card",
            text = {
                '{C:red}+#1#{} Mult, {C:blue}+#2#{} bonus chips,',
                '{C:money}+$#3#{}'
            }
        },
    },
},

misc = {
        dictionary = {
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
                {"\"Is that a Spurs jersey?\""},
                {"(slowed + reverb)"},
                {"(sped up)"},
                {"(ft. Kanye West)"},
                {"(ft. Clipse)"},
                {"(ft. Tyler, The Creator)"},
            }
        },
    }
}