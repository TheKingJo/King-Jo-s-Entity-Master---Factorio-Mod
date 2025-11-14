local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_maustank",
		enabled = false,
		energy_required = 600,
		ingredients = tables.recipes["kj_maustank"],
		results = {{type = "item", name = "kj_maustank", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_120kwk_ap",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 4},
			{type = "item", name = "plastic-bar", amount = 3},
			{type = "item", name = "explosives", amount = 8}
		},
		results = {{type = "item", name = "kj_120kwk_ap", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_120kwk_he",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 3},
			{type = "item", name = "plastic-bar", amount = 3},
			{type = "item", name = "explosives", amount = 10}
		},
		results = {{type = "item", name = "kj_120kwk_he", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_120kwk_aphe",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 4},
			{type = "item", name = "plastic-bar", amount = 3},
			{type = "item", name = "explosives", amount = 10}
		},
		results = {{type = "item", name = "kj_120kwk_aphe", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_mg42_hand",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
			{type = "item", name = "iron-gear-wheel", amount = 5},
			{type = "item", name = "iron-plate", amount = 5},
			{type = "item", name = "copper-plate", amount = 5},
			{type = "item", name = "iron-stick", amount = 10}
		},
		results = {{type = "item", name = "kj_mg42_hand", amount = 1}}
	},
})