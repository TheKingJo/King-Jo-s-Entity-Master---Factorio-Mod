local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_rattetank",
		enabled = false,
		energy_required = 3000,
		ingredients = tables.recipes["kj_rattetank"],
		results = {{type = "item", name = "kj_rattetank", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_280SKC34_ap",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 14},
			{type = "item", name = "plastic-bar", amount = 10},
			{type = "item", name = "explosives", amount = 15},
		},
		results = {{type = "item", name = "kj_280SKC34_ap", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_280SKC34_he",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 10},
			{type = "item", name = "plastic-bar", amount = 10},
			{type = "item", name = "explosives", amount = 20},
		},
		results = {{type = "item", name = "kj_280SKC34_he", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_280SKC34_inc",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 10},
			{type = "item", name = "plastic-bar", amount = 10},
			{type = "item", name = "explosives", amount = 12},
			{type = "item", name = "sulfur", amount = 8},
		},
		results = {{type = "item", name = "kj_280SKC34_inc", amount = 1}},
	},
})