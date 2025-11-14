local tables = require("tables")
local utils = require("utils")

data:extend({
	{
		type = "recipe",
		name = "kj_40klemanruss",
		enabled = false,
		energy_required = 360,
		ingredients = tables.recipes["kj_40klemanruss"],
		results = {{type = "item", name = "kj_40klemanruss", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_lemanruss_normal",
		enabled = false,
		energy_required = 15,
		ingredients = utils.ammoRecipe("kj_lemanruss_normal"),
		results = {{type = "item", name = "kj_lemanruss_normal", amount = 1}},
	},
})