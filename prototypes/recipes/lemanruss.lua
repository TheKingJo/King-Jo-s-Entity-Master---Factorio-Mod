local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_40klemanruss",
		enabled = false,
		energy_required = 360,
		ingredients = tables.recipes["kj_40klemanruss"],
		results = {{type = "item", name = "kj_40klemanruss", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_lemanruss_normal",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 4},
			{type = "item", name = "plastic-bar", amount = 3},
			{type = "item", name = "explosives", amount = 12}
		},
		results = {{type = "item", name = "kj_lemanruss_normal", amount = 1}},
	},
})