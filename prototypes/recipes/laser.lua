local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_laser",
		enabled = false,
		energy_required = 30,
		ingredients = tables.recipes["kj_phalanx"],
		results = {{type = "item", name = "kj_laser", amount = 1}},
	},
})