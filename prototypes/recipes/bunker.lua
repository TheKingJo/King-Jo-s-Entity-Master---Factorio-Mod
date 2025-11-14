local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_40kbunker",
		enabled = false,
		energy_required = 300,
		ingredients = tables.recipes["kj_40kbunker"],
		results = {{type = "item", name = "kj_40kbunker", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_40kbunker_turret",
		enabled = false,
		energy_required = 300,
		ingredients = tables.recipes["kj_40kbunker"],
		results = {{type = "item", name = "kj_40kbunker_turret", amount = 1}},
	},
})