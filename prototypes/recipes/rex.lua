local tables = require("tables")
local utils = require("utils")

data:extend({
	{
		type = "recipe",
		name = "kj_rex",
		enabled = false,
		energy_required = 2000,
		ingredients = tables.recipes["kj_ray"],
		results = {{type = "item", name = "kj_rex", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_rex_normal",
		enabled = false,
		energy_required = 15,
		ingredients = utils.ammoRecipe("kj_rex_normal"),
		results = {{type = "item", name = "kj_rex_normal", amount = 1}}
	},
})