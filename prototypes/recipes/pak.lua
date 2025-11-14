local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_pak",
		enabled = false,
		energy_required = 60,
		ingredients = tables.recipes["kj_pak"],
		results = {{type = "item", name = "kj_pak", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_pak_turret",
		enabled = false,
		energy_required = 60,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 25},
			{type = "item", name = "iron-gear-wheel", amount = 5},
			{type = "item", name = "engine-unit", amount = 3},
		},
		results = {{type = "item", name = "kj_pak_turret", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_pak_penetration",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 4},
			{type = "item", name = "plastic-bar", amount = 3},
			{type = "item", name = "explosives", amount = 8}
		},
		results = {{type = "item", name = "kj_pak_penetration", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_pak_highexplosive",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 3},
			{type = "item", name = "plastic-bar", amount = 3},
			{type = "item", name = "explosives", amount = 10}
		},
		results = {{type = "item", name = "kj_pak_highexplosive", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_pak_incendiary",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 4},
			{type = "item", name = "plastic-bar", amount = 4},
			{type = "item", name = "explosives", amount = 6},
			{type = "item", name = "sulfur", amount = 5}
		},
		results = {{type = "item", name = "kj_pak_incendiary", amount = 1}}
	},
})