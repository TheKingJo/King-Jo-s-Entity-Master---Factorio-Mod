local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_plymouth",
		enabled = false,
		energy_required = 15,
		ingredients = tables.recipes["kj_plymouth"],
		results = {{type = "item", name = "kj_plymouth", amount = 1}},
	},
})