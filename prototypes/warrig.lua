require("prototypes.roads")

local sounds = require("__base__/prototypes/entity/sounds.lua")
local hit_effects = require ("__base__/prototypes/entity/hit-effects.lua")

local simLoc = {
	init =
	[[
		game.simulation.camera_zoom = 1.5
		game.surfaces[1].create_entities_from_blueprint_string
		{
			string = "0eNqdld1uwjAMhd/F1xmi/7SvMqEoLVnxKAlKAgyhvvscOgk2tqmJ1Bun9nfS+MS9Qjsc5cGgctBcATutLDSvV7DYKzH4NSX2EhrYvfOzMAZ7bgQOFkYGqDbyA5pkZP/mOypQD/npuGYglUOHchK7BReujvtWGgKy30W59ah+64DBQVuq18orEjMvGFygeVllpLNBI7vpZe739gOfRuCr+fgsAl/Px+fh+CKZjy8i8Nl8fMn+8scztlhUj12VSrSD5IPu0TrsLD9vkeK9PqHqoXkTg5UMtEGSFBNnuUiJgE7uJ5/h5rtBe2Fb2oMcbu6c0ihLcVQnomhzmcruEZ2kdaLbEZtBp4/+2uTjeqTn+WOriLMM8PEqAh/g4zoCH+DjZBnOLwOMnERMkTLAyUnEGCkDuptEzJHyz/auvW91t+M04NW0/DXn/SpV+gx/A0ju/kdgcJLG3hBFmdZ5XRd5VVdFlY3jJ0OGHqo=",
			position = {0, 0}
		}
	]]
}
local simWag = {
	init =
	[[
		game.simulation.camera_position = {0, -0.5}
		game.simulation.camera_zoom = 1
		game.surfaces[1].create_entities_from_blueprint_string
		{
			string = "0eNqdlV1ugzAQhO+yz24UfgyBq1QVcohLtjF2ZJukUcTdu4RKjdqkwn5CXi/fGO0MvsJWDfJoUXuor4Ct0Q7q1ys47LRQU02LXkINh4/mLKzFrrEClYORAeqd/IQ6Gdm//WfRGX3Xn45vDKT26FHOYrfFpdFDv5WWgOyxaOM8Pbq9BwZH4+h94pIiMfOMwQXqlyojnR1a2c6b+XS2X/g0As+X47MIfLkcn0fgq+V4Ho7nyXJ8EYEPGG3JntnvL5avNnlW3g9WarFVslGmQ+exdc15j7TuzQl1B/W7UE4yMBZJVcyo9Srlk7FPVDKWSHpQ6sHBNhHfHeC5KgIf4LlkHcEPMF0SkfgiwHVJROSLANslEZkvAsabRIS+CJlvROqLp/Olv7vzpj00dJnoufx9p0xVCunUgV72JPdz+zA4SetuCF6kVV5VPC+rkpfZOH4BXTxC6A==",
			position = {0, 0}
		}
	]]
}

local wagon = {
	type = "cargo-wagon",
	name = "kj_warrig_wagon",
	icon = "__kj_warrig__/graphics/wagon.png",
	icon_size = 128,
	flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
	inventory_size = 200,
	minable = {mining_time = 1.8, result = "kj_warrig_wagon"},
	mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8},
	max_health = 3000,
	capacity = 100000,
	dying_explosion = "cargo-wagon-explosion",
	collision_box 	= {{-1.2 , -4.6}, {1.2 , 4.6}},
	selection_box 	= {{-1.44, -4.6}, {1.44, 4.6}},
	sticker_box 	= {{-1.2 , -1.6}, {1.2 , 1.6}},
	damaged_trigger_effect = hit_effects.entity(),
	vertical_selection_shift = -0.796875,
	weight = 23000,
	max_speed = 1.5,
	braking_force = 15,
	friction_force = 0.50,
	air_resistance = 0.01,
	connection_distance = 3,
	joint_distance = 8,
	energy_per_hit_point = 0.5,
	resistances = data.raw["car"]["kj_warrig"].resistances,
	factoriopedia_simulation = simWag,
	pictures =
	{
		rotated =
		{
			layers =
			{
				{
					width = 1258,
					height = 1258,
					direction_count = 128,
					line_length = 4,
					lines_per_file = 4,
					shift = {0, -0.5},
					scale = 0.5,
					filenames =
					{
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_0.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_1.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_2.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_3.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_4.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_5.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_6.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_7.png",
					},
				},
				{
					flags = {"shadow"},
					width = 1258,
					height = 1258,
					direction_count = 128,
					draw_as_shadow = true,
					line_length = 4,
					lines_per_file = 4,
					shift = {1.25, 0.5},
					scale = 0.5,
					filenames =
					{
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_0.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_1.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_2.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_3.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_4.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_5.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_6.png",
						"__kj_warrig__/graphics/entity/trailer/warrig_trailer_shadow_7.png",
					},
				},
			},
		},
	},
	minimap_representation =
	{
		filename = "__kj_warrig__/graphics/wagon_map_symbol.png",
		flags = {"icon"},
		size = {30, 50},
		scale = 0.5
	},
	selected_minimap_representation =
	{
		filename = "__kj_warrig__/graphics/wagon_map_symbol_selected.png",
		flags = {"icon"},
		size = {30, 50},
		scale = 0.5
	},
	--wheels = standard_train_wheels,
	--drive_over_tie_trigger = drive_over_tie(),
	--tie_distance = 50,
	working_sound =
	{
		sound =
		{
			filename = "__base__/sound/train-wheels.ogg",
			volume = 0.3
		},
		match_volume_to_activity = true
	},
	open_sound = sounds.cargo_wagon_open,
	close_sound = sounds.cargo_wagon_close,
	sound_minimum_speed = 1,
}

data:extend({wagon})
wagon = table.deepcopy(wagon)
wagon.type = "fluid-wagon"
wagon.name = "kj_warrig_wagon_fluid"
wagon.icon = "__kj_warrig__/graphics/wagon_fluid.png"
wagon.minable.result = "kj_warrig_wagon_fluid"
data:extend({wagon})


data:extend({
	{
		type = "locomotive",
		name = "kj_warrig_train",
		icon = "__kj_warrig__/graphics/train.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
		minable = {mining_time = 0.9, result = "kj_warrig_train"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8},
		max_health = 2000,
		deliver_category = "vehicle",
		corpse = "medium-remnants",
		dying_explosion = "oil-refinery-explosion",
		collision_box 	= {{-1.2 , -4.6}, {1.2 , 4.6}},
		selection_box 	= {{-1.44, -4.6}, {1.44, 4.6}},
		sticker_box 	= {{-1.2 , -1.6}, {1.2 , 1.6}},
		damaged_trigger_effect = hit_effects.entity(),
		weight = 13000,
		max_speed = 0.6,
		max_power = "2000kW",
		braking_force = 15,
		reversing_power_modifier = 1,
		friction_force = 0.50,
		vertical_selection_shift = -0.5,
		air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
		connection_distance = 3,
		joint_distance = 8,
		energy_per_hit_point = 1,
		resistances = data.raw["car"]["kj_warrig"].resistances,
		factoriopedia_simulation = simLoc,
		energy_source =
		{
			type = "burner",
			fuel_categories = {"kj_gas_barrel"},
			effectivity = 1.25,
			fuel_inventory_size = 3,
			smoke = data.raw["car"]["kj_warrig"].energy_source.smoke,
		},
		front_light =
		{
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-0.9, -21},
				size = 3,
				intensity = 1,
				color = {r = 1, g = 1, b = 1}
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.9, -21},
				size = 3,
				intensity = 1,
				color = {r = 1, g = 1, b = 1}
			},
		},
		pictures =
		{
			rotated =
			{
				layers =
				{
					{
						width = 962,
						height = 962,
						direction_count = 128,
						allow_low_quality_rotation = false,
						line_length = 1,
						lines_per_file = 8,
						shift = {0.0, 0.5},
						scale = 0.5,
						filenames =
						{
								"__kj_warrig__/graphics/entity/warrig/warrig_0.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_1.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_2.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_3.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_4.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_5.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_6.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_7.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_8.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_9.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_10.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_11.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_12.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_13.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_14.png",
								"__kj_warrig__/graphics/entity/warrig/warrig_15.png",
						},
					},
					{
						width = 962,
						height = 962,
						direction_count = 128,
						draw_as_shadow = true,
						allow_low_quality_rotation = false,
						line_length = 8,
						lines_per_file = 8,
						shift = {0.0, 0.5},
						scale = 0.5,
						filenames =
						{
							"__kj_warrig__/graphics/entity/warrig/warrig_shadow_0.png",
							"__kj_warrig__/graphics/entity/warrig/warrig_shadow_1.png",
						},
					},
				},
			},
		},
		front_light_pictures =
		{
			rotated =
			{
				layers =
				{
					{
						flags = {"light"},
						width = 962,
						height = 962,
						direction_count = 128,
						blend_mode = "additive",
						draw_as_glow = true,
						allow_low_quality_rotation = false,
						line_length = 8,
						lines_per_file = 8,
						shift = {0.0, 0.5},
						scale = 0.5,
						filenames =
						{
							"__kj_warrig__/graphics/entity/warrig/warrig_light_0.png",
							"__kj_warrig__/graphics/entity/warrig/warrig_light_1.png",
						},
					},
				},
			},
		},
		minimap_representation =
		{
			filename = "__kj_warrig__/graphics/map_symbol.png",
			flags = {"icon"},
			size = {128, 128},
			scale = 0.2,
		},
		selected_minimap_representation =
		{
			filename = "__kj_warrig__/graphics/map_symbol_selected.png",
			flags = {"icon"},
			size = {128, 128},
			scale = 0.2,
		},
		stop_trigger =
		{
			{
				type = "play-sound",
				sound =
				{
					{
					filename = "__kj_warrig__/sounds/brakes.ogg",
					volume = 0.6
					},
				}
			},
		},
		--drive_over_tie_trigger = drive_over_tie(),
		--tie_distance = 50,
    	impact_category = "metal-large",
		working_sound =
		{
			sound =
			{
				filename = "__kj_warrig__/sounds/engine.ogg",
				volume = 0.7
			},
			activate_sound =
			{
				filename = "__kj_warrig__/sounds/engine-start.ogg",
				volume = 0.7
			},
			deactivate_sound =
			{
				filename = "__kj_warrig__/sounds/engine-stop.ogg",
				volume = 0.5
			},
			match_speed_to_activity = true,
		},
		open_sound = data.raw["car"]["tank"].open_sound,
		close_sound = { filename = "__kj_warrig__/sounds/door-close.ogg", volume = 0.43},
	}
})
