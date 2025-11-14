local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_wirbelwind",
		enabled = false,
		energy_required = 180,
		ingredients = tables.recipes["kj_wirbelwind"],
		results = {{type = "item", name = "kj_wirbelwind", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_2cmfv_normal",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 2},
			{type = "item", name = "plastic-bar", amount = 2},
			{type = "item", name = "explosives", amount = 1}
		},
		results = {{type = "item", name = "kj_2cmfv_normal", amount = 1}}
	},
})