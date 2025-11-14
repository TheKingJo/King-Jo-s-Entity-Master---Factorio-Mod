local tables = require("tables")
local utils = require("utils")

data:extend({
	{
		type = "recipe",
		name = "kj_40kdreadnought",
		enabled = false,
		energy_required = 360,
		ingredients = tables.recipes["kj_40kdreadnought"],
		results = {{type = "item", name = "kj_40kdreadnought", amount = 1}},
	},

	{
		type = "recipe",
		name = "kj_40kdreadnought_normal",
		enabled = false,
		energy_required = 15,
		ingredients = utils.ammoRecipe("kj_40kdreadnought_normal"),
		results = {{type = "item", name = "kj_40kdreadnought_normal", amount = 1}},
	},
})