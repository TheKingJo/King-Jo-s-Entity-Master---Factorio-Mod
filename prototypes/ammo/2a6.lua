local ammoDmg = require("tables").ammoDmg.kj_2a6
local items = require("tables").items
local modname = "kj_2a6"

data:extend({
	{
		type = "ammo",
		name = "kj_rh120_penetration",
		icon = "__kj_2a6__/graphics/equipment/ap_cannon_shell.png",
		icon_size = 256,
		ammo_category = "kj_rh120",
		ammo_type =
		{
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_rh120_penetration_projectile",
					starting_speed = 1.5,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 50,
					min_range = 10,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				}
			}
		},
		subgroup = "ammo",
		order = items[modname].order.."-a[AP]",
		stack_size = 50
	},
	{
		type = "ammo",
		name = "kj_rh120_highexplosive",
		icon = "__kj_2a6__/graphics/equipment/he_cannon_shell.png",
		icon_size = 256,
		ammo_category = "kj_rh120",
		ammo_type =
		{
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_rh120_highexplosive_projectile",
					starting_speed = 1.5,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 50,
					min_range = 10,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				}
			}
		},
		subgroup = "ammo",
		order = items[modname].order.."-b[HE]",
		stack_size = 50
	},
	{
		type = "ammo",
		name = "kj_rh120_penetration_highexplosive",
		icon = "__kj_2a6__/graphics/equipment/aphe_cannon_shell.png",
		icon_size = 256,
		ammo_category = "kj_rh120",
		ammo_type =
		{
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "kj_rh120_penetration_highexplosive_projectile",
					starting_speed = 1.5,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 50,
					min_range = 10,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				}
			}
		},
		subgroup = "ammo",
		order = items[modname].order.."-c[APHE]",
		stack_size = 50
	},
	{
		type = "ammo",
		name = "kj_rh120_canister",
		icon = "__kj_2a6__/graphics/equipment/can_cannon_shell.png",
		icon_size = 256,
		ammo_category = "kj_rh120",
		ammo_type =
		{
			target_type = "direction",
			clamp_position = true,
			action =
			{
				{
					type = "direct",
					action_delivery =
					{
						type = "instant",
						source_effects =
						{
							{
								type = "create-explosion",
								entity_name = "explosion-gunshot"
							}
						}
					}
				},
				{
					type = "direct",
					repeat_count = 24,
					action_delivery =
					{
						type = "projectile",
						projectile = "kj_canister_projectile",
						starting_speed = 1,
						starting_speed_deviation = 0.1,
						direction_deviation = 0.2,
						range_deviation = 0.2,
						max_range = 25
					}
				}
			}
		},
		subgroup = "ammo",
		order = items[modname].order.."-d[canister]",
		stack_size = 50
	},

	{
		type = "projectile",
		name = "kj_rh120_penetration_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		direction_only = true,
		piercing_damage = ammoDmg.APDW,
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
						damage = {amount = ammoDmg.APAP , type = "physical"}
					},
					{
						type = "damage",
						damage = {amount = ammoDmg.APHE , type = "explosion"}
					},
					{
						type = "create-entity",
						entity_name = "explosion"
					}
				}
			}
		},
		final_action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "small-scorchmark-tintable",
						check_buildability = true
					}
				}
			}
		},
		animation =
		{
			filename = "__base__/graphics/entity/bullet/bullet.png",
			frame_count = 1,
			width = 3,
			height = 50,
			priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_rh120_highexplosive_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = ammoDmg.HEDW,
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
						damage = {amount = ammoDmg.APHE , type = "physical"}
					},
					{
						type = "create-entity",
						entity_name = "explosion"
					},
				}
			}
		},
		final_action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "destroy-cliffs",
						radius = 6,
						explosion = "explosion"
					},
					{
						type = "create-entity",
						entity_name = "massive-explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = 6,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = ammoDmg.HEHE, type = "explosion"}
									},
									{
										type = "create-entity",
										entity_name = "explosion"
									}
								}
							}
						}
					},
					{
						type = "create-entity",
						entity_name = "medium-scorchmark-tintable",
						check_buildability = true
					},
					{
						type = "invoke-tile-trigger",
						repeat_count = 1,
					},
					{
						type = "destroy-decoratives",
						from_render_layer = "decorative",
						to_render_layer = "object",
						include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
						include_decals = false,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
						radius = 3.25
					}
				}
			}
		},
		animation =
		{
			filename = "__base__/graphics/entity/bullet/bullet.png",
			frame_count = 1,
			width = 3,
			height = 50,
			priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_rh120_penetration_highexplosive_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = ammoDmg.APHEDW,
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
						damage = {amount = ammoDmg.APHEAP , type = "physical"}
					},
					{
						type = "create-entity",
						entity_name = "explosion"
					},
				}
			}
		},
		final_action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "destroy-cliffs",
						radius = 6,
						explosion = "explosion"
					},
					{
						type = "create-entity",
						entity_name = "massive-explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							radius = 6,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = ammoDmg.APHEHE, type = "explosion"}
									},
									{
										type = "create-entity",
										entity_name = "explosion"
									}
								}
							}
						}
					},
					{
						type = "create-entity",
						entity_name = "medium-scorchmark-tintable",
						check_buildability = true
					},
					{
						type = "invoke-tile-trigger",
						repeat_count = 1,
					},
					{
						type = "destroy-decoratives",
						from_render_layer = "decorative",
						to_render_layer = "object",
						include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
						include_decals = false,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
						radius = 3.25
					}
				}
			}
		},
		animation =
		{
			filename = "__base__/graphics/entity/bullet/bullet.png",
			frame_count = 1,
			width = 3,
			height = 50,
			priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_canister_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same",
		hidden = true,
		height = 0,
		collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
		acceleration = 0,
		direction_only = true,
		piercing_damage = ammoDmg.CANDW,
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					type = "damage",
					damage = {amount = ammoDmg.APCAN, type = "physical"}
				}
			}
		},
		animation =
		{
			filename = "__base__/graphics/entity/piercing-bullet/piercing-bullet.png",
			draw_as_glow = true,
			frame_count = 1,
			width = 3,
			height = 50,
			priority = "high"
		}
	},
})