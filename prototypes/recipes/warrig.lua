local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_warrig",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_warrig"],
		results = {{type = "item", name = "kj_warrig", amount = 1}},
	},
	{
		type = "recipe",
		name = "kj_warrig_train",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_warrig"],
		results = {{type = "item", name = "kj_warrig_train", amount = 1}},
	},
	{
		type = "recipe",
		name = "kj_warrig_wagon",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_warrig_wagon"],
		results = {{type = "item", name = "kj_warrig_wagon", amount = 1}},
	},
	{
		type = "recipe",
		name = "kj_warrig_wagon_fluid",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_warrig_wagon"],
		results = {{type = "item", name = "kj_warrig_wagon_fluid", amount = 1}},
	},
})