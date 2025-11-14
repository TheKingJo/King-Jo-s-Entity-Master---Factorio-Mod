local tables = require("tables")
local utils = require("utils")

data:extend({
	{
		type = "recipe",
		name = "kj_40kbaneblade",
		enabled = false,
		energy_required = 1000,
		ingredients = tables.recipes["kj_40kbaneblade"],
		results = {{type = "item", name = "kj_40kbaneblade", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_baneblade_normal",
		enabled = false,
		energy_required = 15,
		ingredients = utils.ammoRecipe("kj_baneblade_normal"),
		results = {{type = "item", name = "kj_baneblade_normal", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_baneblade_artillery",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
			{type = "item", name = "explosive-cannon-shell", amount = 4},
			{type = "item", name = "explosives", amount = 8}
		},
		results = {{type = "item", name = "kj_baneblade_artillery", amount = 1}}
	},
})