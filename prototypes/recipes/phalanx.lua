local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_phalanx",
		enabled = false,
		energy_required = 45,
		ingredients = tables.recipes["kj_phalanx"],
		results = {{type = "item", name = "kj_phalanx", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_apds_normal",
		enabled = false,
		energy_required = 1140,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 2325},
			{type = "item", name = "copper-plate", amount = 775},
			{type = "item", name = "explosives", amount = 775},
		},
		results = {{type = "item", name = "kj_apds_normal", amount = 1}},
	},
})