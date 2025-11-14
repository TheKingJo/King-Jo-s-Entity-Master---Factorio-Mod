local tables = require("tables")

data:extend({
	{
		type = "recipe",
		name = "kj_truck_train",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_truck"],
		results = {{type = "item", name = "kj_truck_train", amount = 1}},
	},
	{
		type = "recipe",
		name = "kj_truck_wagon",
		enabled = false,
		energy_required = 25,
		ingredients = tables.recipes["kj_truck_wagon"],
		results = {{type = "item", name = "kj_truck_wagon", amount = 1}},
	},
})
