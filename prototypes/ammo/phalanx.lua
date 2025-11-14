local ammoDmg = require("tables").ammoDmg.kj_phalanx
local items = require("tables").items
local modname = "kj_phalanx"

local sounds = require ("__base__/prototypes/entity/sounds.lua")

data:extend({

	{
		type = "ammo",
		name = "kj_apds_normal",
		icon = "__kj_phalanx__/graphics/ammo.png",
		icon_size = 128,
		ammo_category = "kj_apds_phalanx",
		ammo_type =
		{
			action =
			{
				{
					type = "direct",
					action_delivery =
					{
						{
							type = "instant",
							source_effects =
							{
								{
								type = "create-explosion",
								entity_name = "explosion-gunshot",
								}
							},
							target_effects =
							{
								{
									type = "create-entity",
									entity_name = "explosion-hit",
									offsets = {{0, 1}},
									offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
								},
								{
									type = "play-sound",
									sound = sounds.small_explosion,
									play_on_target_position = true,
								},

								{
									type = "damage",
									damage = { amount = ammoDmg.NF , type = "flak"}
								},
								{
									type = "damage",
									damage = { amount = ammoDmg.NP , type = "physical"}
								},
							}
						}
					}
				}
			}
		},
		magazine_size = 1550,
		subgroup = "ammo",
		order = items[modname].order.."-a[normal]",
		stack_size = 1,
	},
})