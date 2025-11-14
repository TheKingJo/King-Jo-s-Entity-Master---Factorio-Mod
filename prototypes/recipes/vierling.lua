local tables = require("tables")
local utils = require("utils")

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
		ingredients = utils.ammoRecipe("kj_2cmfv_normal_vierling"),
		results = {{type = "item", name = "kj_2cmfv_normal_vierling", amount = 1}},
	},
})