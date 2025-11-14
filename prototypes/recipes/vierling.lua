local tables = require("tables")
data:extend({
	{
		type = "recipe",
		name = "kj_vierling",
		enabled = false,
		energy_required = 30,
		ingredients = tables.recipes["kj_vierling"],
		results = {{type = "item", name = "kj_vierling", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_2cmfv_normal_vierling",
		enabled = false,
		energy_required = 3,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 2},
			{type = "item", name = "plastic-bar", amount = 2},
			{type = "item", name = "explosives", amount = 1}
		},
		results = {{type = "item", name = "kj_2cmfv_normal_vierling", amount = 1}},
	},
})