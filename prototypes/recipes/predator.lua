local tables = require("tables")
local utils = require("utils")

data:extend({
	{
		type = "recipe",
		name = "kj_40kpredator",
		enabled = false,
		energy_required = 360,
		ingredients = tables.recipes["kj_40kpredator"],
		results = {{type = "item", name = "kj_40kpredator", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_predator_normal",
		enabled = false,
		energy_required = 15,
		ingredients = utils.ammoRecipe("kj_predator_normal"),
		results = {{type = "item", name = "kj_predator_normal", amount = 1}}
	},
})