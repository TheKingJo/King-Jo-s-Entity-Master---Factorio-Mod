local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local modname = "__kj_laser__"
local name = "kj_laser"
local tables = require("tables")
local imgSize = 448

local function turret_raising(inputs)
	return
	{
		layers =
		{
			{
				filename = modname.."/graphics/entity/laser_raising.png",
				width = imgSize,
				height = imgSize,
				direction_count = 4,
				frame_count = 32,
				line_length = 8,
				run_mode = inputs.run_mode or "forward",
				axially_symmetrical = false,
				scale = 0.5,
			},
			{
				filename = modname.."/graphics/entity/laser_raising_shadow.png",
				width = imgSize,
				height = imgSize,
				direction_count = 4,
				draw_as_shadow = true,
				frame_count = 32,
				line_length = 8,
				run_mode = inputs.run_mode or "forward",
				axially_symmetrical = false,
				scale = 0.5,
			}
		}
	}
end

local function turret_attacking(inputs)
	local layers = {
		layers =
		{
			{
				width = imgSize,
				height = imgSize,
				frame_count = 1,
				axially_symmetrical = false,
				direction_count = 128,
				animation_speed = 1,
				scale = 0.5,
				stripes =
				{
					{
						filename = modname.."/graphics/entity/laser_shooting_0.png",
						width_in_frames = 8,
						height_in_frames = 8
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_1.png",
						width_in_frames = 8,
						height_in_frames = 8
					},
				},
			},
			{
				width = imgSize,
				height = imgSize,
				frame_count = 1,
				axially_symmetrical = false,
				draw_as_shadow = true,
				direction_count = 128,
				animation_speed = 1,
				scale = 0.5,
				stripes =
				{
					{
						filename = modname.."/graphics/entity/laser_shooting_shadow_0.png",
						width_in_frames = 8,
						height_in_frames = 8
					},
					{
						filename = modname.."/graphics/entity/laser_shooting_shadow_1.png",
						width_in_frames = 8,
						height_in_frames = 8
					},
				},
			},
		}
	}
	if inputs.light == true then
		table.insert(layers.layers, {
			width = imgSize,
			height = imgSize,
			frame_count = 1,
			axially_symmetrical = false,
			draw_as_glow = true,
			blend_mode = "additive",
			direction_count = 128,
			animation_speed = 1,
			scale = 0.5,
			stripes =
			{
				{
					filename = modname.."/graphics/entity/laser_shooting_light_0.png",
					width_in_frames = 8,
					height_in_frames = 8
				},
				{
					filename = modname.."/graphics/entity/laser_shooting_light_1.png",
					width_in_frames = 8,
					height_in_frames = 8
				},
			},
		})
	end
	return layers
end


data:extend({
	{
		type = "beam",
		name = "kj_laser_beam",
		flags = {"not-on-map"},
		hidden = true,
		width = 3,
		damage_interval = 20,
		random_target_offset = true,
		action_triggered_automatically = false,
		working_sound =
		{
			sound =
			{
				category = "weapon",
				filename = "__base__/sound/fight/laser-beam.ogg",
				volume = 0.75,
				modifiers = volume_multiplier("main-menu", 2.5)
			},
			max_sounds_per_type = 1
		},
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "damage",
						damage = { amount = 1000, type = "laser"}
					}
				}
			}
		},
		graphics_set =
		{
			beam =
			{
				head =
				{
					layers =
					{
						{
							filename = "__base__/graphics/entity/laser-turret/laser-body.png",
							flags = beam_non_light_flags,
							line_length = 8,
							width = 64,
							height = 12,
							frame_count = 8,
							scale = 0.5,
							animation_speed = 0.5,
							blend_mode = laser_beam_blend_mode
						},
						{
							filename = "__base__/graphics/entity/laser-turret/laser-body-light.png",
							draw_as_light = true,
							flags = {"light"},
							line_length = 8,
							width = 64,
							height = 12,
							frame_count = 8,
							scale = 0.5,
							animation_speed = 0.5
						}
					}
				},
				tail =
				{
					layers =
					{
						{
							filename = "__base__/graphics/entity/laser-turret/laser-end.png",
							flags = beam_non_light_flags,
							width = 110,
							height = 62,
							frame_count = 8,
							shift = util.by_pixel(11.5, 1),
							scale = 0.5,
							animation_speed = 0.5,
							blend_mode = laser_beam_blend_mode
						},
						{
							filename = "__base__/graphics/entity/laser-turret/laser-end-light.png",
							draw_as_light = true,
							flags = {"light"},
							width = 110,
							height = 62,
							frame_count = 8,
							shift = util.by_pixel(11.5, 1),
							scale = 0.5,
							animation_speed = 0.5
						}
					}
				},
				body =
				{
					{
						layers =
						{
							{
								filename = "__base__/graphics/entity/laser-turret/laser-body.png",
								flags = beam_non_light_flags,
								line_length = 8,
								width = 64,
								height = 12,
								frame_count = 8,
								scale = 0.5,
								animation_speed = 0.5,
								blend_mode = laser_beam_blend_mode
							},
							{
								filename = "__base__/graphics/entity/laser-turret/laser-body-light.png",
								draw_as_light = true,
								flags = {"light"},
								line_length = 8,
								width = 64,
								height = 12,
								frame_count = 8,
								scale = 0.5,
								animation_speed = 0.5
							}
						}
					}
				},
			},
			ground =
			{
				head =
				{
					filename = "__base__/graphics/entity/laser-turret/laser-ground-light-head.png",
					draw_as_light = true,
					flags = {"light"},
					line_length = 1,
					width = 256,
					height = 256,
					repeat_count = 8,
					scale = 0.5,
					shift = util.by_pixel(-32, 0),
					animation_speed = 0.5,
					tint = {0.5, 0.05, 0.05}
				},
				tail =
				{
					filename = "__base__/graphics/entity/laser-turret/laser-ground-light-tail.png",
					draw_as_light = true,
					flags = {"light"},
					line_length = 1,
					width = 256,
					height = 256,
					repeat_count = 8,
					scale = 0.5,
					shift = util.by_pixel(32, 0),
					animation_speed = 0.5,
					tint = {0.5, 0.05, 0.05}
				},
				body =
				{
					filename = "__base__/graphics/entity/laser-turret/laser-ground-light-body.png",
					draw_as_light = true,
					flags = {"light"},
					line_length = 1,
					width = 64,
					height = 256,
					repeat_count = 8,
					scale = 0.5,
					animation_speed = 0.5,
					tint = {0.5, 0.05, 0.05}
				}
			}
		},
	},
	{
		type = "electric-turret",
		name = "kj_laser",
		icon = modname.."/graphics/icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "not-flammable"},
		minable = {mining_time = 1, result = "kj_laser"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8},
		max_health = tables.entityData.max_health[name],
		corpse = "big-remnants",
		dying_explosion = "big-explosion",
		collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		sticker_box   = {{-1.5, -1.5}, {1.5, 1.5}},
		drawing_box_vertical_extension = 0,
		damaged_trigger_effect = hit_effects.entity(),

		resistances =
		{
			{
				type = "fire",
				decrease = tables.entityData.resistances[name][1][1],
				percent  = tables.entityData.resistances[name][1][2]
			},
			{
				type = "physical",
				decrease = tables.entityData.resistances[name][2][1],
				percent  = tables.entityData.resistances[name][2][2]
			},
			{
				type = "impact",
				decrease = tables.entityData.resistances[name][3][1],
				percent  = tables.entityData.resistances[name][3][2]
			},
			{
				type = "explosion",
				decrease = tables.entityData.resistances[name][4][1],
				percent  = tables.entityData.resistances[name][4][2]
			},
			{
				type = "acid",
				decrease = tables.entityData.resistances[name][5][1],
				percent  = tables.entityData.resistances[name][5][2]
			},
			{
				type = "electric",
				decrease = tables.entityData.resistances[name][6][1],
				percent  = tables.entityData.resistances[name][6][2]
			},
			{
				type = "laser",
				decrease = tables.entityData.resistances[name][7][1],
				percent  = tables.entityData.resistances[name][7][2]
			},
			{
				type = "poison",
				decrease = tables.entityData.resistances[name][8][1],
				percent  = tables.entityData.resistances[name][8][2]
			},
		},

		energy_source =
		{
			type = "electric",
			buffer_capacity = "3001kJ",
			input_flow_limit = "9600kW",
			drain = "50kW",
			usage_priority = "primary-input"
		},

		rotation_speed = 0.005,
		preparing_speed = 0.03,
		folding_speed = 0.03,
		prepared_speed = 0.2,
		attacking_speed = 0.2,

		alert_when_attacking = true,
		call_for_help_radius = 75,
		prepare_range = 100,

		open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7},
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7},
		preparing_sound = {filename = modname.."/sounds/turn.ogg", volume = 0.5, speed = 1},
		folding_sound = {filename = modname.."/sounds/turn.ogg", volume = 0.5, speed = 1},
		prepared_sound = {filename = modname.."/sounds/spinning_1.ogg", volume = 1},

		--energy_glow_animation = laser_turret_shooting_glow(),
		glow_light_intensity = 0.5,

		folded_animation = {
			layers =
			{
				{
					filename = modname.."/graphics/entity/laser_folded.png",
					width = imgSize,
					height = imgSize,
					frame_count = 1,
					direction_count = 4,
					axially_symmetrical = false,
					scale = 0.5,
				},
				{
					filename = modname.."/graphics/entity/laser_folded_shadow.png",
					width = imgSize,
					height = imgSize,
					frame_count = 1,
					direction_count = 4,
					draw_as_shadow = true,
					axially_symmetrical = false,
					scale = 0.5,
				}
			}
		},
		preparing_animation = turret_raising{},
		folding_animation   = turret_raising{run_mode = "backward"},
		prepared_animation  = turret_attacking{},
		attacking_animation = turret_attacking{light = true},
		graphics_set =
		{
			base_visualisation =
			{
				animation =
				{
					layers =
					{
						{
							filename = modname.."/graphics/entity/laser_base.png",
							width = imgSize,
							height = imgSize,
							axially_symmetrical = false,
							direction_count = 1,
							frame_count = 1,
							scale = 0.5,
						},
					},
				},
			},
		},
		--[[
		integration =
		{
			filename = modname.."/graphics/entity/laser_base_shadow.png",
			width = imgSize,
			height = imgSize,
			draw_as_shadow = true,
			scale = 0.5,
		},]]
		attack_parameters =
		{
			type = "beam",
			cooldown = 180,
			range = 60,
			range_mode = "center-to-bounding-box",
			turn_range = 1 / 4,
			min_range = 5,
			--sound = {},
			rotate_penalty = 10,
			health_penalty = 10,
			ammo_categories = {"kj_laser"},
			ammo_type =
			{
				energy_consumption = "3000kJ",
				action =
				{
					type = "direct",
					action_delivery =
					{
						type = "beam",
						beam = "laser-beam",
						max_length = 60,
						duration = 60,
						--source_offset = {0, -1.31439 }
					}
				}
			}
		},
	},
})

