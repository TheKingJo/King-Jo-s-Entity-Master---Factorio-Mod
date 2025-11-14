local tables = require("tables")
local utils = require("utils")

data:extend({
	{
		type = "recipe",
		name = "kj_ray",
		enabled = false,
		energy_required = 2000,
		ingredients = tables.recipes["kj_ray"],
		results = {{type = "item", name = "kj_ray", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_ray_small",
		enabled = false,
		energy_required = 600,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 500},
			{type = "item", name = "iron-gear-wheel", amount = 70},
			{type = "item", name = "advanced-circuit", amount = 50},
			{type = "item", name = "processing-unit", amount = 30},
			{type = "item", name = "engine-unit", amount = 50},
			{type = "item", name = "low-density-structure", amount = 100},
		},
		results = {{type = "item", name = "kj_ray_small", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_ray_normal",
		enabled = false,
		energy_required = 15,
		ingredients = utils.ammoRecipe("kj_ray_normal"),
		results = {{type = "item", name = "kj_ray_normal", amount = 1}}
	},

	{
		type = "recipe",
		name = "kj_ray_normal_small",
		enabled = false,
		energy_required = 5,
		ingredients = utils.ammoRecipe("kj_ray_normal_small"),
		results = {{type = "item", name = "kj_ray_ammo_small", amount = 1}}
	},
})