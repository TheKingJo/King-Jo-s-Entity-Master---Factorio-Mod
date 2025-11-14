local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_2a6",
		enabled = false,
		energy_required = 720,
		ingredients = tables.recipes["kj_2a6"],
		results = {{type = "item", name = "kj_2a6", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_rh120_ap",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 6},
			{type = "item", name = "plastic-bar", amount = 4},
			{type = "item", name = "explosives", amount = 12}
		},
		results = {{type = "item", name = "kj_rh120_ap", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_rh120_he",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 4},
			{type = "item", name = "plastic-bar", amount = 4},
			{type = "item", name = "explosives", amount = 15}
		},
		results = {{type = "item", name = "kj_rh120_he", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_rh120_aphe",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 7},
			{type = "item", name = "plastic-bar", amount = 5},
			{type = "item", name = "explosives", amount = 18}
		},
		results = {{type = "item", name = "kj_rh120_aphe", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_rh120_can",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 10},
			{type = "item", name = "plastic-bar", amount = 3},
			{type = "item", name = "explosives", amount = 5}
		},
		results = {{type = "item", name = "kj_rh120_can", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_mg3_hand",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
			{type = "item", name = "iron-gear-wheel", amount = 5},
			{type = "item", name = "iron-plate", amount = 5},
			{type = "item", name = "copper-plate", amount = 5},
			{type = "item", name = "iron-stick", amount = 10}
		},
		results = {{type = "item", name = "kj_mg3_hand", amount = 1}},
	},
})