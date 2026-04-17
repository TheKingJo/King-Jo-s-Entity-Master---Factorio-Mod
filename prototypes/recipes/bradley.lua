local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_bradley",
		enabled = false,
		energy_required = 420,
		ingredients = tables.recipes["kj_bradley"],
		results = {{type = "item", name = "kj_bradley", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_m242_he",
		enabled = false,
		results = {{type = "item", name = "kj_m242_he", amount = 1}},
	},
})