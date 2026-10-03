for i = 1, 10 do
    SMODS.JimboQuip({
        key = 'fiesta_'..i,
        extra = {
            center = 'j_dckst_fiesta',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_fiesta')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'jimmy_'..i,
        extra = {
            center = 'j_dckst_slippin_jimmy',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_slippin_jimmy')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'prismatic_'..i,
        extra = {
            center = 'j_dckst_prismatic',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_prismatic')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'swapped_'..i,
        extra = {
            center = 'j_dckst_swapped',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_swapped')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 7 do
    SMODS.JimboQuip({
        key = 'stop_sign_'..i,
        extra = {
            center = 'j_dckst_stopsign',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 3 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 3 }
                end
        end
    })
end

for i = 1, 10 do
    SMODS.JimboQuip({
        key = 'extruded_'..i,
        extra = {
            center = 'j_dckst_extruded',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_extruded')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 50 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 50 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'pencil_'..i,
        extra = {
            center = 'j_dckst_pencil',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_pencil')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'coffee_mug_'..i,
        extra = {
            center = 'j_dckst_coffee_mug',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 3 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 3 }
                end
            end
    })
end

for i = 1, 20 do
    SMODS.JimboQuip({
        key = 'lil_maxey_'..i,
        extra = {
            center = 'j_dckst_lilmaxey',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_lilmaxey')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'tamerlane_'..i,
        extra = {
            center = 'j_dckst_tamerlane',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_tamerlane')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 7 do
    SMODS.JimboQuip({
        key = 'superstar_'..i,
        extra = {
            center = 'j_dckst_superstar',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_superstar')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'cyanotype_'..i,
        extra = {
            center = 'j_dckst_cyanotype',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_cyanotype')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'knicks_'..i,
        extra = {
            center = 'j_dckst_theknicks',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_theknicks')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'typewriter_'..i,
        extra = {
            center = 'j_dckst_typewriter',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_typewriter')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'airborne_piano_'..i,
        extra = {
            center = 'j_dckst_airbornepiano',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_airbornepiano')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'pathogen_'..i,
        extra = {
            center = 'j_dckst_pathogen',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_pathogen')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'pawprints_'..i,
        extra = {
            center = 'j_dckst_pawprints',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_pawprints')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'rook_'..i,
        extra = {
            center = 'j_dckst_therook',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_therook')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'giggler_'..i,
        extra = {
            center = 'j_dckst_giggler',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_giggler')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'perrobabli_'..i,
        extra = {
            center = 'j_dckst_perrobabli',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_perrobabli')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'quadratic_equation_'..i,
        extra = {
            center = 'j_dckst_quadratic_equation',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_quadratic_equation')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'naturalist_'..i,
        extra = {
            center = 'j_dckst_naturalist',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_naturalist')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'sticky_note_'..i,
        extra = {
            center = 'j_dckst_stickynote',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_stickynote')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 6 do
    SMODS.JimboQuip({
        key = 'currency_exchange_'..i,
        extra = {
            center = 'j_dckst_currency_exchange',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_currency_exchange')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'coin_jar_'..i,
        extra = {
            center = 'j_dckst_coinjar',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_coinjar')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'cupboard_'..i,
        extra = {
            center = 'j_dckst_cupboard',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_cupboard')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'endpoints_'..i,
        extra = {
            center = 'j_dckst_endpoints',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_endpoints')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'the_town_'..i,
        extra = {
            center = 'j_dckst_thetown',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_thetown')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'cantor_set_'..i,
        extra = {
            center = 'j_dckst_cantor_set',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_cantor_set')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'blkyn_'..i,
        extra = {
            center = 'j_dckst_blkyn',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_blkyn')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end

for i = 1, 5 do
    SMODS.JimboQuip({
        key = 'peachtree_'..i,
        extra = {
            center = 'j_dckst_peachtree',
            particle_colours = {
                G.ARGS.LOC_COLOURS.dckst_red,
                darken(G.ARGS.LOC_COLOURS.dckst_red, 0.5),
                lighten(G.ARGS.LOC_COLOURS.dckst_red, 0.5)
            }
        },
        filter = function(self, type)
            if next(SMODS.find_card('j_dckst_peachtree')) then
                if type == 'win' then
                    self.extra.text_key = self.key..'_win'
                    return true, { weight = 10 }
                elseif type == 'loss' then
                    self.extra.text_key = self.key..'_loss'
                    return true, { weight = 10 }
                end
            end
        end
    })
end