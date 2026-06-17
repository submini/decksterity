SMODS.Rarity {
    key = "exquisite",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.005,
    badge_colour = SMODS.Gradients["dckst_exquisite"],
    loc_txt = {
        name = "Exquisite"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "mediumrare",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.025,
    badge_colour = HEX('f4a261'),
    loc_txt = {
        name = "Medium Rare"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "medium",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.015,
    badge_colour = HEX('e8a857'),
    loc_txt = {
        name = "Medium"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}


SMODS.Rarity {
    key = "mediumwell",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.012,
    badge_colour = HEX('c86b3b'),
    loc_txt = {
        name = "Medium Well"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "welldone",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.008,
    badge_colour = HEX('9f2f2f'),
    loc_txt = {
        name = "Well-Done"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}