local ammoDmg = require("tables").ammoDmg.kj_wirbelwind
local items = require("tables").items
local modname = "kj_wirbelwind"
local flak_impact =
{
	{
		filename = "__base__/sound/fight/poison-capsule-explosion-1.ogg",
		volume = 0.6
	},
	{
		filename = "__base__/sound/fight/poison-capsule-explosion-2.ogg",
		volume = 0.6
	},
	{
		filename = "__base__/sound/fight/poison-capsule-explosion-3.ogg",
		volume = 0.6
	},
	{
		filename = "__base__/sound/fight/poison-capsule-explosion-4.ogg",
		volume = 0.6
	},
	{
		filename = "__base__/sound/fight/poison-capsule-explosion-5.ogg",
		volume = 0.6
	},
}

data:extend({

	{
		type = "ammo",
		name = "kj_2cmfv_normal",
		icon = "__kj_wirbelwind__/graphics/equipment/flak_muni.png",
		icon_size = 80,
		ammo_category = "kj_2cmfv",
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
									offset_deviation = {{-0.3, -0.1}, {0.3, 0.1}}
								}
							},
							target_effects =
							{
								{
									type = "create-entity",
									entity_name = "explosion-hit",
									offsets = {{0, 1}},
									offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
								},
								{
									type = "play-sound",
									sound = flak_impact,
									play_on_target_position = false,
								},

								{
									type = "damage",
									damage = { amount = ammoDmg.NF , type = "flak"}
								},
								{
									type = "damage",
									damage = { amount = ammoDmg.NE , type = "explosion"}
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
		magazine_size = 5,
		subgroup = "ammo",
		order = items[modname].order.."-a[normal]",
		stack_size = 200
	},
})