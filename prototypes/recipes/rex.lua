local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_rex",
		enabled = false,
		energy_required = 2000,
		ingredients = tables.recipes["kj_ray"],
		results = {{type = "item", name = "kj_rex", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_rex_normal",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 3},
			{type = "item", name = "plastic-bar", amount = 3},
			{type = "item", name = "explosives", amount = 8}
		},
		results = {{type = "item", name = "kj_rex_normal", amount = 1}}
	},
})