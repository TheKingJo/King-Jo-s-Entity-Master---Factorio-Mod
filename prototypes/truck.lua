require("prototypes.roads")

local modname = "__kj_truck__"
local entData = require("tables").entityData
local sounds = require("__base__/prototypes/entity/sounds.lua")
local hit_effects = require ("__base__/prototypes/entity/hit-effects.lua")
local empty_animation = util.empty_animation(1)

local resistancesCar = {
	{
		type = "fire",
		decrease = entData.resistances.kj_truck[1][1],
		percent  = entData.resistances.kj_truck[1][2]
	},
	{
		type = "physical",
		decrease = entData.resistances.kj_truck[2][1],
		percent  = entData.resistances.kj_truck[2][2]
	},
	{
		type = "impact",
		decrease = entData.resistances.kj_truck[3][1],
		percent  = entData.resistances.kj_truck[3][2]
	},
	{
		type = "explosion",
		decrease = entData.resistances.kj_truck[4][1],
		percent  = entData.resistances.kj_truck[4][2]
	},
	{
		type = "acid",
		decrease = entData.resistances.kj_truck[5][1],
		percent  = entData.resistances.kj_truck[5][2]
	},
	{
		type = "electric",
		decrease = entData.resistances.kj_truck[6][1],
		percent  = entData.resistances.kj_truck[6][2]
	},
	{
		type = "laser",
		decrease = entData.resistances.kj_truck[7][1],
		percent  = entData.resistances.kj_truck[7][2]
	},
	{
		type = "poison",
		decrease = entData.resistances.kj_truck[8][1],
		percent  = entData.resistances.kj_truck[8][2]
	},
}
local simLoc = {
	init =
	[[
		game.simulation.camera_position = {0, -0.2}
		game.simulation.camera_zoom = 1.5
		game.surfaces[1].create_entities_from_blueprint_string
		{
			string = "0eNqdlN1uwyAMhd/F16xqUsjfq0xTRFKWek2gAtKuivLuc5pJnaZUQtwg2ZjvGHHwBE0/qotF7aGaAFujHVTvEzjstOyXnJaDggrOX/VNWotdbSX2DmYGqI/qG6pkZtv13o7tmVaJ+k95On8wUNqjR7VqPYJ7rcehUZZ4bFuzdguqO3lgcDGOzhu9CBLzLTswuBObeoEjWtWum3xp7R8+jcEnwfhDBF6UwXgeg8+D8YK9eL8NKt/lRZKKJ1tp2fSq7k2HzmPr6tsJKR7MFXUH1afsnWJgLJKoXFH7XSo22shibimCb5nH4MMdVsTgwx1WRuB5uMOSfQw/3GJJzP/mrx6XZonzhmxKk0uv6d8BtmTJ0EsFejWQ3HPUMbgq6x4IkaUlL0uR5zzLinKefwAkr7l3",
			position = {0, 0}
		}
	]]
}
local simWag = {
	init =
	[[
		game.simulation.camera_position = {0, -0.5}
		game.simulation.camera_zoom = 1.1
		game.surfaces[1].create_entities_from_blueprint_string
		{
			string = "0eNqdlNFugzAMRf/Fz1nV0ACFX5kmlNKMeg1JlQS6quLfZ8qkVROVojyhOM65Rr72HQ56UBeHJkB9B2yt8VC/38FjZ6SeY0b2Cmo4fzVX6Rx2jZOoPUwM0BzVN9R8Yuv5wQ3tmV511jylZ9MHA2UCBlSL1uNwa8zQH5QjHlvXbHygT3cKwOBiPb0nLgkS863IGdyITbXAEZ1ql0sxl/YPn6Xgd9H4XQqeR+NFAj6vovF5Cr6MxhfshT1WqGKT8X351Fdl5EGrRtsOfcDWN9cT0rm3I5oO6k+pvWJgHZKoXFDbTZbPxhspZB2BzKD1Sl1lym/HW26fgo+3XJWCj7cc3ybwRbzneMrAi3jT8ZSJF/Hd5SkjL161l5ajD5YGg1axWcK/G3mO0gjNGRhUT3J/u5vBqJx/IPIiq0RV5WUpimJfTdMPEgwAsQ==",
			position = {0, 0}
		}
	]]
}

local function filenameGen(type, name, count)
	local names = {}
	for i = 0, count - 1, 1 do
		table.insert(names, modname.."/graphics/entity/"..type.."/"..type.."_"..name..i..".png")
	end
	return names
end

local wagon = {
	type = "cargo-wagon",
	name = "kj_truck_wagon",
	icon = "__kj_truck__/graphics/wagon.png",
	icon_size = 128,
	flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
	inventory_size = 250,
	minable = {mining_time = 1.8, result = "kj_truck_wagon"},
	mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8},
	max_health = 1500,
	capacity = 100000,
	dying_explosion = "cargo-wagon-explosion",
	collision_box 	= {{-1.2 , -4.6}, {1.2 , 4.6}},
	selection_box 	= {{-1.44, -7.6}, {1.44, 7.6}},
	sticker_box 	= {{-1.2 , -1.6}, {1.2 , 1.6}},
	damaged_trigger_effect = hit_effects.entity(),
	vertical_selection_shift = -0.796875,
	weight = 10000,
	max_speed = 1,
	braking_force = 15,
	friction_force = 0.50,
	air_resistance = 0.01,
	connection_distance = 3,
	joint_distance = 8,
	energy_per_hit_point = 0.5,
	resistances = resistancesCar,
	factoriopedia_simulation = simWag,
	pictures =
	{
		rotated =
		{
			layers =
			{
				{
					allow_low_quality_rotation = true,
					direction_count = 256,
					line_length = 4,
					lines_per_file = 4,
					width = 1204,
					height = 1204,
					shift = {0, -1.5},
					scale = 0.5,
					apply_runtime_tint = false,
					filenames = filenameGen("trailer", "", 16),
				},
				{
					allow_low_quality_rotation = true,
					direction_count = 256,
					line_length = 4,
					lines_per_file = 4,
					draw_as_shadow = true,
					width = 1333,
					height = 1333,
					shift = {2, 0.4},
					scale = 0.5,
					apply_runtime_tint = false,
					filenames = filenameGen("trailer", "shadow_", 16),
				},
				{
					allow_low_quality_rotation = true,
					direction_count = 256,
					line_length = 4,
					lines_per_file = 4,
					width = 1204,
					height = 1204,
					shift = {0, -1.5},
					scale = 0.5,
					apply_runtime_tint = true,
					filenames = filenameGen("trailer", "mask_", 16),
				},
				{
					allow_low_quality_rotation = true,
					direction_count = 256,
					line_length = 4,
					lines_per_file = 4,
					draw_as_glow = true,
					width = 1204,
					height = 1204,
					blend_mode = "additive",
					shift = {0, -1.5},
					scale = 0.5,
					apply_runtime_tint = false,
					filenames = filenameGen("trailer", "light_", 16),
				},
			},
		},
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


data:extend({
	{
		type = "animation",
		name = "kj_trailer_rotation",
		layers =
		{
			{
				allow_low_quality_rotation = true,
				frame_count = 255,
				line_length = 4,
				lines_per_file = 4,
				width = 1204,
				height = 1204,
				shift = {0, -1.5},
				scale = 0.5,
				apply_runtime_tint = false,
				filenames = filenameGen("trailer", "", 16),
			},
			{
				allow_low_quality_rotation = true,
				frame_count = 255,
				line_length = 4,
				lines_per_file = 4,
				draw_as_shadow = true,
				width = 1333,
				height = 1333,
				shift = {1.5, 0.5},
				scale = 0.5,
				apply_runtime_tint = false,
				filenames = filenameGen("trailer", "shadow_", 16),
			},
			{
				allow_low_quality_rotation = true,
				frame_count = 255,
				line_length = 4,
				lines_per_file = 4,
				width = 1204,
				height = 1204,
				shift = {0, -1.5},
				scale = 0.5,
				apply_runtime_tint = true,
				filenames = filenameGen("trailer", "mask_", 16),
			},
			{
				allow_low_quality_rotation = true,
				frame_count = 255,
				line_length = 4,
				lines_per_file = 4,
				draw_as_glow = true,
				width = 1204,
				height = 1204,
				blend_mode = "additive",
				shift = {0, -1.5},
				scale = 0.5,
				apply_runtime_tint = false,
				filenames = filenameGen("trailer", "light_", 16),
			},
		},
	},
	{
		type = "locomotive",
		name = "kj_truck_train",
		icon = "__kj_truck__/graphics/train.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
		minable = {mining_time = 0.9, result = "kj_truck_train"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8},
		max_health = entData.max_health.kj_truck,
		deliver_category = "vehicle",
		corpse = "medium-remnants",
		dying_explosion = "oil-refinery-explosion",
		collision_box 	= {{-1.2 , -4.6}, {1.2 , 4.6}},
		selection_box 	= {{-1.44, -5.6}, {1.44, 5.6}},
		sticker_box 	= {{-1.2 , -1.6}, {1.2 , 1.6}},
		damaged_trigger_effect = hit_effects.entity(),
		weight = entData.weight.kj_truck,
		max_power = entData.consumption.kj_truck,
		max_speed = 0.8,
		reversing_power_modifier = 0.2,
		braking_force = 15,
		friction_force = 0.50,
		vertical_selection_shift = -0.5,
		air_resistance = 0.006, -- this is a percentage of current speed that will be subtracted
		connection_distance = 3,
		joint_distance = 8,
		energy_per_hit_point = entData.impactInfos.kj_truck[3],
		resistances = resistancesCar,
		factoriopedia_simulation = simLoc,
		color = {r = 0.92, g = 0.07, b = 0, a = 1},
		energy_source =
		{
			type = "burner",
			fuel_categories = {"kj_gas_barrel"},
			effectivity = 1,
			fuel_inventory_size = 3,
			smoke =
			{
				{
					name = "kj_truck_smoke",
					deviation = {0.25, 0.25},
					frequency = 100,
					height = 2.75,
					position = {-1.25, -2},
					starting_frame = 0,
					starting_frame_deviation = 60,
				},
				{
					name = "kj_truck_smoke",
					deviation = {0.25, 0.25},
					frequency = 100,
					height = 2.75,
					position = {1.25, -2},
					starting_frame = 0,
					starting_frame_deviation = 60,
				},
			},
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
						allow_low_quality_rotation = true,
						direction_count = 256,
						line_length = 4,
						lines_per_file = 4,
						width = 1032,
						height = 1032,
						shift = {0, 0.5},
						scale = 0.5,
						apply_runtime_tint = false,
						filenames = filenameGen("truck", "", 16),
					},
					{
						allow_low_quality_rotation = true,
						direction_count = 256,
						line_length = 4,
						lines_per_file = 4,
						draw_as_shadow = true,
						width = 1032,
						height = 1032,
						shift = {0, 0.5},
						scale = 0.5,
						apply_runtime_tint = false,
						filenames = filenameGen("truck", "shadow_", 16),
					},
					{
						allow_low_quality_rotation = true,
						direction_count = 256,
						line_length = 4,
						lines_per_file = 4,
						width = 1032,
						height = 1032,
						shift = {0, 0.5},
						scale = 0.5,
						apply_runtime_tint = true,
						filenames = filenameGen("truck", "mask_", 16),
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
						allow_low_quality_rotation = true,
						direction_count = 256,
						line_length = 4,
						lines_per_file = 4,
						draw_as_glow = true,
						width = 1032,
						height = 1032,
						blend_mode = "additive",
						shift = {0, 0.5},
						scale = 0.5,
						apply_runtime_tint = false,
						filenames = filenameGen("truck", "light_", 16),
					},
				},
			},
		},
		stop_trigger =
		{
			{
				type = "play-sound",
				sound =
				{
					{
					filename = "__kj_truck__/sounds/brakes.ogg",
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
				filename = "__kj_truck__/sounds/engine.ogg",
				volume = 0.7
			},
			activate_sound =
			{
				filename = "__kj_truck__/sounds/engine-start.ogg",
				volume = 0.7
			},
			deactivate_sound =
			{
				filename = "__kj_truck__/sounds/engine-stop.ogg",
				volume = 0.5
			},
			match_speed_to_activity = true,
		},
		open_sound = data.raw["car"]["tank"].open_sound,
		close_sound = { filename = "__kj_truck__/sounds/door-close.ogg", volume = 0.43},
	}
})
