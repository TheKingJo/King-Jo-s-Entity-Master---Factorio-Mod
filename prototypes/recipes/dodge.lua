local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_dodge",
		enabled = false,
		energy_required = 15,
		ingredients = tables.recipes["kj_dodge"],
		results = {{type = "item", name = "kj_dodge", amount = 1}},
	},
})