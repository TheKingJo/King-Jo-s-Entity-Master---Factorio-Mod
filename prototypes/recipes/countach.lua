local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_countach",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_countach"],
		results = {{type = "item", name = "kj_countach", amount = 1}}
	},
})