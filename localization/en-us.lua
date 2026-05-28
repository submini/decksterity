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
                }
            },
        }
    },
    misc = {
        dictionary = {
            k_dckst_loadeddice = "Knocked!",
            k_dckst_swapped = "Swapped!",
            k_dckst_extruded = "Extruded!",
            k_dckst_pencil = "Pencil!",
            k_dckst_coffee_mug = "Brewed!",
            k_dckst_eraser = "Erased!",
        }
    }
}