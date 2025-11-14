local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_40kdreadnought",
		enabled = false,
		energy_required = 360,
		ingredients = tables.recipes["kj_40kdreadnought"],
		results = {{type = "item", name = "kj_40kdreadnought", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_40kdreadnought_normal",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 3},
			{type = "item", name = "plastic-bar", amount = 3},
			{type = "item", name = "explosives", amount = 8}
		},
		results = {{type = "item", name = "kj_40kdreadnought_normal", amount = 1}},
	},
})