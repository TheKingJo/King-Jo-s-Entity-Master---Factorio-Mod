local item_sounds = require("__base__.prototypes.item_sounds")
--local tables = require("tables")

local items = {
	{modname = "kj_2a6"									  , order = "2[military]-p5"},
	{modname = "kj_40kbaneblade"	                      , order = "2[military]-40k-3"},
	{modname = "kj_40klemanruss"	                      , order = "2[military]-40k-2"},
	{modname = "kj_40kpredator"                           , order = "2[military]-40k-1"},
	{modname = "kj_maustank"		                      , order = "2[military]-p4"},
	{modname = "kj_pak"				                      , order = "2[military]-p1a"},
	{modname = "kj_pak", 			name = "kj_pak_turret", order = "2[military]-p1b"},
	{modname = "kj_panzer4"			                      , order = "2[military]-p2"},
	{modname = "kj_rex"				                      , order = "2[military]-r"},
	{modname = "kj_rattetank"		                      , order = "2[military]-p6"},
	{modname = "kj_ray"				                      , order = "2[military]-r-n[normal]"},
	{modname = "kj_ray", 			name = "kj_ray_small" , order = "2[military]-r-s[small]",	icon = "icon_small"},
	{modname = "kj_swspeeder"		                      , order = "2[military]-s"},
	{modname = "kj_wirbelwind"		                      , order = "2[military]-p3"},
	
	{modname = "kj_aventador"		                      , order = "1[civil]-d"},
	{modname = "kj_bulldozer"		                      , order = "1[civil]-f"},
	{modname = "kj_cybertruck"		                      , order = "1[civil]-c0"},
	{modname = "kj_delorean"		                      , order = "1[civil]-a"},
	{modname = "kj_firetruck"		                      , order = "1[civil]-g"},
	{modname = "kj_fordmustang"                           , order = "1[civil]-b"},
	{modname = "kj_gigahorse"		                      , order = "1[civil]-e"},
	{modname = "kj_utilitarian"		                      , order = "1[civil]-h"},
}

for _, item in pairs(items) do
    if mods[item.modname] then
        local name = item.name or item.modname

        data:extend({
            {
                type = "item-with-entity-data",
                name = name,
                icon = "__"..item.modname.."__/graphics/"..(item.icon or "icon")..".png",
                icon_size = 128,
                subgroup = item.subgroup or "transport",
                order = item.order,
                inventory_move_sound = item_sounds.vehicle_inventory_move,
                pick_sound = item_sounds.vehicle_inventory_pickup,
                drop_sound = item_sounds.vehicle_inventory_move,
                place_result = name,
                stack_size = 1,
            },
        })
    end
end

local sg = "transport"
local order = "1[civil]-c"
if data.raw["item-subgroup"]["kj_fuels"] ~= nil then
    sg = "kj_fuels"
    order = "q"
end

local function bolterSounds(modname)
    return {
        {
            filename = "__"..modname.."__/sounds/bolter1.ogg",
            volume = 0.57
        },
        {
            filename = "__"..modname.."__/sounds/bolter2.ogg",
            volume = 0.57
        },
        {
            filename = "__"..modname.."__/sounds/bolter3.ogg",
            volume = 0.57
        },
        {
            filename = "__"..modname.."__/sounds/bolter4.ogg",
            volume = 0.57
        },
        {
            filename = "__"..modname.."__/sounds//bolter5.ogg",
            volume = 0.57
        }
    }
end

if mods["kj_2a6"] then
    local mg3 = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
    mg3.name = "kj_mg3"
    mg3.icon = "__kj_2a6__/graphics/equipment/mg42.png"
    mg3.icon_size = 128
    mg3.attack_parameters.projectile_creation_distance = 1
    mg3.attack_parameters.projectile_center = {0,0}
    mg3.attack_parameters.cooldown = 3
    mg3.attack_parameters.range = 35
    mg3.order = "[basic-clips]-d[mg3]"
    mg3.flags = {}
    mg3.attack_parameters.sound = {
        {
            filename = "__kj_2a6__/sounds/mg42_1.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_2.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_3.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_4.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_5.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_6.ogg",
            volume = 0.4,
        },
    }
    data:extend({mg3})

    mg3 = table.deepcopy(data.raw["gun"]["submachine-gun"])
    mg3.name = "kj_mg3_hand"
    mg3.icon = "__kj_2a6__/graphics/equipment/mg42.png"
    mg3.icon_size = 128
    mg3.attack_parameters.movement_slow_down_factor = 0.9
    mg3.attack_parameters.cooldown = 3
    mg3.attack_parameters.range = 25
    mg3.order = "a[basic-clips]-e[mg3]"
    mg3.flags = {}
    mg3.attack_parameters.sound = {
        {
            filename = "__kj_2a6__/sounds/mg42_1.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_2.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_3.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_4.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_5.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_2a6__/sounds/mg42_6.ogg",
            volume = 0.4,
        },
    }
    data:extend({mg3})

    data:extend({
        {
            type = "gun",
            name = "kj_rh120",
            icon = "__kj_2a6__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[leopard]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_rh120",
                cooldown = 150,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 5.5,
                projectile_center = {0, 0},
                range = 50,
                sound =
                {
                    {
                        filename = "__kj_2a6__/sounds/tank-shot.ogg",
                        volume = 0.9
                    }
                },
            },
            stack_size = 5
        }
    })
end

if mods["kj_40kbaneblade"] then
    local tank_gunshot = 
    {
        {
            filename = "__kj_40kbaneblade__/sounds/cannon_shot1.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_40kbaneblade__/sounds/cannon_shot2.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_40kbaneblade__/sounds/cannon_shot3.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_40kbaneblade__/sounds/cannon_shot4.ogg",
            volume = 0.7
        },
    }

    data:extend({
        {
            type = "sound",
            name = "kj_40kbaneblade_s_1",
            filename = "__kj_40kbaneblade__/sounds/artillery1.ogg",
            category = "environment",
            volume = 0.5
        },
        {
            type = "sound",
            name = "kj_40kbaneblade_s_2",
            filename = "__kj_40kbaneblade__/sounds/artillery2.ogg",
            category = "environment",
            volume = 0.5
        },
        {
            type = "custom-input",
            name = "kj_40kbaneblade_fire",
            key_sequence = "V",
            consuming = "game-only"
        },

        {
            type = "gun",
            name = "kj_baneblade_bolter",
            icon = "__kj_40kbaneblade__/graphics/equipment/bolter.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "l[lemanruss]-b[bolter]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_bolter",
                cooldown = 15,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 1.4,
                projectile_center = {0, -0.1},
                --projectile_creation_parameters = shoot_shiftings_bolter(),
                range = 25,
                sound = bolterSounds("kj_40kbaneblade"),
            },
            stack_size = 5
        },
        {
            type = "gun",
            name = "kj_baneblade",
            icon = "__kj_40kbaneblade__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters = 
            {
                type = "projectile",
                ammo_category = "kj_baneblade",
                cooldown = 120,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 4.7,
                projectile_center = {0, -1.7},
                range = 35,
                sound = tank_gunshot,
            },
            stack_size = 5
        },
    })
end

if mods["kj_40klemanruss"] then
    local tank_gunshot = {
        {
            filename = "__base__/sound/fight/tank-cannon-1.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-2.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-3.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-4.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-5.ogg",
            volume = 0.57
        }
    }

    data:extend({
        {
            type = "gun",
            name = "kj_lemanruss_bolter",
            icon = "__kj_40klemanruss__/graphics/equipment/bolter.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "l[lemanruss]-b[bolter]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_bolter",
                cooldown = 15,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 1.4,
                projectile_center = {0, -0.6},
                --projectile_creation_parameters = shoot_shiftings_bolter(),
                range = 25,
                sound = bolterSounds("kj_40klemanruss"),
            },
            stack_size = 5
        },

        {
            type = "gun",
            name = "kj_lemanruss",
            icon = "__kj_40klemanruss__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_lemanruss",
                cooldown = 240,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 4.7,
                projectile_center = {0, -1.8},
                range = 45,
                sound =
                {
                    {
                        filename = "__kj_40klemanruss__/sounds/cannon_shot1.ogg",
                        volume = 0.6
                    },
                    {
                        filename = "__kj_40klemanruss__/sounds/cannon_shot2.ogg",
                        volume = 0.6
                    },
                    {
                        filename = "__kj_40klemanruss__/sounds/cannon_shot3.ogg",
                        volume = 0.6
                    },
                    {
                        filename = "__kj_40klemanruss__/sounds/cannon_shot4.ogg",
                        volume = 0.6
                    },
                },
            },
            stack_size = 5
        },
    })
end

if mods["kj_40kpredator"] then
    local tank_gunshot =
    {
        {
            filename = "__base__/sound/fight/tank-cannon-1.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-2.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-3.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-4.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-5.ogg",
            volume = 0.57
        }
    }

    data:extend({
        {
            type = "gun",
            name = "kj_predator_bolter",
            icon = "__kj_40kpredator__/graphics/equipment/bolter.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "l[lemanruss]-b[bolter]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_bolter",
                cooldown = 15,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 1.4,
                projectile_center = {0, -0.1},
                --projectile_creation_parameters = shoot_shiftings_bolter(),
                range = 25,
                sound = bolterSounds("kj_40kpredator"),
            },
            stack_size = 5
        },
        {
            type = "gun",
            name = "kj_predator",
            icon = "__kj_40kpredator__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_predator",
                cooldown = 60,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 3.5,
                projectile_center = {0, -1.4},
                range = 35,
                sound =
                {
                    {
                        filename = "__kj_40kpredator__/sounds/tank-shot.ogg",
                        volume = 0.6
                    }
                },
            },
            stack_size = 5
        },
   })
end

if mods["kj_maustank"] then
    local mg42 = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
    mg42.name = "kj_mg42"
    mg42.icon = "__kj_maustank__/graphics/equipment/mg42.png"
    mg42.icon_size = 128
    mg42.attack_parameters.projectile_creation_distance = 3
    mg42.attack_parameters.projectile_center = {0,0}
    mg42.attack_parameters.cooldown = 3
    mg42.attack_parameters.range = 35
    mg42.order = "[basic-clips]-d[mg42]"
    mg42.flags = {}
    mg42.attack_parameters.sound = {
        {
            filename = "__kj_maustank__/sounds/mg42_1.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_2.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_3.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_4.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_5.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_6.ogg",
            volume = 0.4,
        },
    }
    data:extend({mg42})

    mg42 = table.deepcopy(data.raw["gun"]["submachine-gun"])
    mg42.name = "kj_mg42_hand"
    mg42.icon = "__kj_maustank__/graphics/equipment/mg42.png"
    mg42.icon_size = 128
    mg42.attack_parameters.movement_slow_down_factor = 0.9
    mg42.attack_parameters.cooldown = 3
    mg42.attack_parameters.range = 25
    mg42.order = "a[basic-clips]-d[mg42]"
    mg42.flags = {}
    mg42.attack_parameters.sound = {
        {
            filename = "__kj_maustank__/sounds/mg42_1.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_2.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_3.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_4.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_5.ogg",
            volume = 0.4,
        },
        {
            filename = "__kj_maustank__/sounds/mg42_6.ogg",
            volume = 0.4,
        },
    }
    data:extend({mg42})

    data:extend({
        {
            type = "gun",
            name = "kj_128kwk",
            icon = "__kj_maustank__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_128kwk",
                cooldown = 300,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 7.2,
                projectile_center = {0, -0.8},
                range = 50,
                sound =
                {
                    {
                        filename = "__kj_maustank__/sounds/tank-shot.ogg",
                        volume = 0.9
                    }
                },
            },
            stack_size = 5
        },
    })
end

if mods["kj_pak"] then
    local tank_gunshot =
    {
        {
            filename = "__kj_pak__/sounds/cannon1.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_pak__/sounds/cannon2.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_pak__/sounds/cannon3.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_pak__/sounds/cannon4.ogg",
            volume = 0.7
        },
        {
            filename = "__kj_pak__/sounds/cannon5.ogg",
            volume = 0.7
        },
    }

    data:extend({
        {
            type = "gun",
            name = "kj_pak_gun",
            icon = "__kj_pak__/graphics/icon.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_pak",
                cooldown = 180,
                health_penalty = -50,
                rotate_penalty = 50,
                fire_penalty = 50,
                --warmup = 20,
                cooldown_deviation = 0.5,
                projectile_creation_distance = 4.4,
                projectile_center = {0, -0.8},
                range = 150,
                sound = tank_gunshot,
            },
            stack_size = 5
        },
    })
end

if mods["kj_panzer4"] then
	local mg34 = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
	mg34.name = "kj_mg34"
	mg34.icon = "__kj_panzer4__/graphics/equipment/mg34.png"
	mg34.icon_size = 128
	mg34.attack_parameters.cooldown = 3.5
	mg34.order = "[basic-clips]-e[mg34]"
	mg34.flags = {}
	mg34.attack_parameters.range = 30
	mg34.attack_parameters.sound = {
		{
			filename = "__kj_panzer4__/sounds/mg34_1.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_2.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_3.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_4.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_5.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_6.ogg",
			volume = 0.4,
		},
	}
	data:extend({mg34})

    mg34 = table.deepcopy(data.raw["gun"]["submachine-gun"])
    mg34.name = "kj_mg34_hand"
    mg34.icon = "__kj_panzer4__/graphics/equipment/mg34.png"
    mg34.icon_size = 128
    mg34.attack_parameters.movement_slow_down_factor = 0.6
    mg34.attack_parameters.cooldown = 3.5
    mg34.attack_parameters.range = 25
    mg34.order = "a[basic-clips]-e[mg34]"
    mg34.flags = {}
    mg34.attack_parameters.sound = {
        {
            filename = "__kj_panzer4__/sounds/mg34_1.ogg",
            volume = 0.6,
        },
        {
            filename = "__kj_panzer4__/sounds/mg34_2.ogg",
            volume = 0.6,
        },
        {
            filename = "__kj_panzer4__/sounds/mg34_3.ogg",
            volume = 0.6,
        },
        {
            filename = "__kj_panzer4__/sounds/mg34_4.ogg",
            volume = 0.6,
        },
        {
            filename = "__kj_panzer4__/sounds/mg34_5.ogg",
            volume = 0.6,
        },
        {
            filename = "__kj_panzer4__/sounds/mg34_6.ogg",
            volume = 0.6,
        },
    }
    data:extend({mg34})

    local tank_gunshot =  {
        {
            filename = "__base__/sound/fight/tank-cannon-1.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-2.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-3.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-4.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-5.ogg",
            volume = 0.57
        }
    }
    data:extend({
        {
            type = "gun",
            name = "kj_75kwk40",
            icon = "__kj_panzer4__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[panzer4]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_75kwk40",
                cooldown = 180,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 4.2,
                projectile_center = {0, 0},
                range = 40,
                sound = tank_gunshot,
            },
            stack_size = 5
        },
    })
end

if mods["kj_rex"] then
    local boltersounds =
    {
        {
            filename = "__kj_rex__/sounds/bolter1.ogg",
            volume = 0.57
        },
        {
            filename = "__kj_rex__/sounds/bolter2.ogg",
            volume = 0.57
        },
        {
            filename = "__kj_rex__/sounds/bolter3.ogg",
            volume = 0.57
        },
        {
            filename = "__kj_rex__/sounds/bolter4.ogg",
            volume = 0.57
        },
        {
            filename = "__kj_rex__/sounds//bolter5.ogg",
            volume = 0.57
        }
    }

    local shoot_shiftings_cannon = {
        {0.0000, util.by_pixel(251.0 ,-644.0)},
        {0.0078, util.by_pixel(270.0 ,-640.0)},
        {0.0156, util.by_pixel(289.0 ,-630.0)},
        {0.0234, util.by_pixel(304.0 ,-620.0)},
        {0.0313, util.by_pixel(320.0 ,-606.0)},
        {0.0391, util.by_pixel(335.0 ,-594.0)},
        {0.0469, util.by_pixel(350.0 ,-579.0)},
        {0.0547, util.by_pixel(366.0 ,-566.0)},
        {0.0625, util.by_pixel(380.0 ,-552.0)},
        {0.0703, util.by_pixel(391.0 ,-537.0)},
        {0.0781, util.by_pixel(401.0 ,-523.0)},
        {0.0859, util.by_pixel(411.0 ,-507.0)},
        {0.0938, util.by_pixel(418.0 ,-493.0)},
        {0.1016, util.by_pixel(425.0 ,-478.0)},
        {0.1094, util.by_pixel(432.0 ,-464.0)},
        {0.1172, util.by_pixel(438.0 ,-449.0)},
        {0.1250, util.by_pixel(443.0 ,-435.0)},
        {0.1328, util.by_pixel(447.0 ,-419.0)},
        {0.1406, util.by_pixel(451.0 ,-403.0)},
        {0.1484, util.by_pixel(452.0 ,-385.0)},
        {0.1563, util.by_pixel(453.0 ,-371.0)},
        {0.1641, util.by_pixel(452.0 ,-356.0)},
        {0.1719, util.by_pixel(451.0 ,-338.0)},
        {0.1797, util.by_pixel(444.0 ,-326.0)},
        {0.1875, util.by_pixel(437.0 ,-311.0)},
        {0.1953, util.by_pixel(433.0 ,-294.0)},
        {0.2031, util.by_pixel(430.0 ,-276.0)},
        {0.2109, util.by_pixel(424.0 ,-260.0)},
        {0.2188, util.by_pixel(416.0 ,-245.0)},
        {0.2266, util.by_pixel(408.0 ,-230.0)},
        {0.2344, util.by_pixel(397.0 ,-214.0)},
        {0.2422, util.by_pixel(387.0 ,-200.0)},
        {0.2500, util.by_pixel(376.0 ,-187.0)},
        {0.2578, util.by_pixel(361.0 ,-174.0)},
        {0.2656, util.by_pixel(348.0 ,-162.0)},
        {0.2734, util.by_pixel(333.0 ,-147.0)},
        {0.2813, util.by_pixel(319.0 ,-135.0)},
        {0.2891, util.by_pixel(305.0 ,-129.0)},
        {0.2969, util.by_pixel(292.0 ,-118.0)},
        {0.3047, util.by_pixel(273.0 ,-106.0)},
        {0.3125, util.by_pixel(255.0 ,-102.0)},
        {0.3203, util.by_pixel(235.0 ,-89.0 )},
        {0.3281, util.by_pixel(215.0 ,-84.0 )},
        {0.3359, util.by_pixel(196.0 ,-76.0 )},
        {0.3438, util.by_pixel(175.0 ,-69.0 )},
        {0.3516, util.by_pixel(157.0 ,-68.0 )},
        {0.3594, util.by_pixel(131.0 ,-60.0 )},
        {0.3672, util.by_pixel(104.0 ,-58.0 )},
        {0.3750, util.by_pixel(88.0	 ,-52.0 )},
        {0.3828, util.by_pixel(41.0	 ,-49.0 )},
        {0.3906, util.by_pixel(18.0	 ,-48.0 )},
        {0.3984, util.by_pixel(66.0	 ,-48.0 )},
        {0.4063, util.by_pixel(-5.0	 ,-49.0 )},
        {0.4141, util.by_pixel(-24.0 ,-49.0 )},
        {0.4219, util.by_pixel(-69.0 ,-49.0 )},
        {0.4297, util.by_pixel(-49.0 ,-51.0 )},
        {0.4375, util.by_pixel(-93.0 ,-54.0 )},
        {0.4453, util.by_pixel(-113.0,-55.0 )},
        {0.4531, util.by_pixel(-136.0,-61.0 )},
        {0.4609, util.by_pixel(-156.0,-67.0 )},
        {0.4688, util.by_pixel(-177.0,-73.0 )},
        {0.4766, util.by_pixel(-195.0,-80.0 )},
        {0.4844, util.by_pixel(-215.0,-90.0 )},
        {0.4922, util.by_pixel(-234.0,-98.0 )},
        {0.5000, util.by_pixel(-251.0,-107.0)},
        {0.5078, util.by_pixel(-269.0,-115.0)},
        {0.5156, util.by_pixel(-287.0,-126.0)},
        {0.5234, util.by_pixel(-302.0,-137.0)},
        {0.5313, util.by_pixel(-317.0,-149.0)},
        {0.5391, util.by_pixel(-333.0,-161.0)},
        {0.5469, util.by_pixel(-348.0,-170.0)},
        {0.5547, util.by_pixel(-360.0,-181.0)},
        {0.5625, util.by_pixel(-372.0,-194.0)},
        {0.5703, util.by_pixel(-382.0,-210.0)},
        {0.5781, util.by_pixel(-392.0,-224.0)},
        {0.5859, util.by_pixel(-403.0,-236.0)},
        {0.5938, util.by_pixel(-411.0,-251.0)},
        {0.6016, util.by_pixel(-417.0,-262.0)},
        {0.6094, util.by_pixel(-422.0,-277.0)},
        {0.6172, util.by_pixel(-428.0,-293.0)},
        {0.6250, util.by_pixel(-431.0,-308.0)},
        {0.6328, util.by_pixel(-437.0,-325.0)},
        {0.6406, util.by_pixel(-439.0,-337.0)},
        {0.6484, util.by_pixel(-442.0,-355.0)},
        {0.6563, util.by_pixel(-440.0,-370.0)},
        {0.6641, util.by_pixel(-441.0,-387.0)},
        {0.6719, util.by_pixel(-442.0,-405.0)},
        {0.6797, util.by_pixel(-440.0,-420.0)},
        {0.6875, util.by_pixel(-438.0,-441.0)},
        {0.6953, util.by_pixel(-434.0,-456.0)},
        {0.7031, util.by_pixel(-428.0,-468.0)},
        {0.7109, util.by_pixel(-424.0,-483.0)},
        {0.7188, util.by_pixel(-418.0,-492.0)},
        {0.7266, util.by_pixel(-410.0,-507.0)},
        {0.7344, util.by_pixel(-399.0,-524.0)},
        {0.7422, util.by_pixel(-393.0,-537.0)},
        {0.7500, util.by_pixel(-378.0,-550.0)},
        {0.7578, util.by_pixel(-370.0,-562.0)},
        {0.7656, util.by_pixel(-353.0,-577.0)},
        {0.7734, util.by_pixel(-337.0,-585.0)},
        {0.7813, util.by_pixel(-325.0,-599.0)},
        {0.7891, util.by_pixel(-310.0,-610.0)},
        {0.7969, util.by_pixel(-294.0,-620.0)},
        {0.8047, util.by_pixel(-281.0,-630.0)},
        {0.8125, util.by_pixel(-258.0,-638.0)},
        {0.8203, util.by_pixel(-239.0,-648.0)},
        {0.8281, util.by_pixel(-221.0,-657.0)},
        {0.8359, util.by_pixel(-201.0,-663.0)},
        {0.8438, util.by_pixel(-180.0,-670.0)},
        {0.8516, util.by_pixel(-158.0,-675.0)},
        {0.8594, util.by_pixel(-140.0,-681.0)},
        {0.8672, util.by_pixel(-126.0,-687.0)},
        {0.8750, util.by_pixel(-101.0,-693.0)},
        {0.8828, util.by_pixel(-81.0 ,-696.0)},
        {0.8906, util.by_pixel(-46.0 ,-697.0)},
        {0.8984, util.by_pixel(-30.0 ,-698.0)},
        {0.9063, util.by_pixel(-11.0 ,-699.0)},
        {0.9141, util.by_pixel(17.0	 ,-696.0)},
        {0.9219, util.by_pixel(36.0	 ,-696.0)},
        {0.9297, util.by_pixel(89.0	 ,-690.0)},
        {0.9375, util.by_pixel(66.0	 ,-688.0)},
        {0.9453, util.by_pixel(108.0 ,-684.0)},
        {0.9531, util.by_pixel(129.0 ,-681.0)},
        {0.9609, util.by_pixel(148.0 ,-679.0)},
        {0.9688, util.by_pixel(174.0 ,-672.0)},
        {0.9766, util.by_pixel(192.0 ,-667.0)},
        {0.9844, util.by_pixel(215.0 ,-660.0)},
        {0.9922, util.by_pixel(235.0 ,-655.0)},
    }

    local rexmg = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
    rexmg.name = "kj_rex_mg"
    rexmg.order = "[basic-clips]-e[rexmg]"
    rexmg.flags = {}
    rexmg.attack_parameters.range = 70
    rexmg.attack_parameters.cooldown = 3.5
    rexmg.attack_parameters.damage_modifier = 3
    rexmg.attack_parameters.projectile_center = {}
    rexmg.attack_parameters.projectile_center = nil
    rexmg.attack_parameters.projectile_creation_distance = nil
    rexmg.attack_parameters.projectile_creation_parameters = shoot_shiftings_cannon
    for iterator,value in ipairs(rexmg.attack_parameters.sound) do
        value.volume = 0.8
    end
    data:extend({rexmg})

    local rexrocket = table.deepcopy(data.raw["gun"]["rocket-launcher"])
    rexrocket.name = "kj_rex_rocket"
    rexrocket.order = "[basic-clips]-e[rexrocket]"
    rexrocket.flags = {}
    rexrocket.attack_parameters.range = 70
    rexrocket.attack_parameters.cooldown = 45
    rexrocket.attack_parameters.damage_modifier = 3
    rexrocket.attack_parameters.projectile_center = {}
    rexrocket.attack_parameters.projectile_center = nil
    rexrocket.attack_parameters.projectile_creation_distance = nil
    rexrocket.attack_parameters.projectile_creation_parameters = shoot_shiftings_cannon
    for iterator,value in ipairs(rexrocket.attack_parameters.sound) do
        value.volume = 0.8
    end
    data:extend({rexrocket})

    data:extend({
        {
            type = "sound",
            name = "kj_rex_walking_1",
            filename = "__kj_rex__/sounds/dreadnought_walking1.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_2",
            filename = "__kj_rex__/sounds/dreadnought_walking2.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_3",
            filename = "__kj_rex__/sounds/dreadnought_walking3.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_4",
            filename = "__kj_rex__/sounds/dreadnought_walking4.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_5",
            filename = "__kj_rex__/sounds/dreadnought_walking5.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_6",
            filename = "__kj_rex__/sounds/dreadnought_walking6.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_rex_walking_7",
            filename = "__kj_rex__/sounds/dreadnought_walking7.ogg",
            category = "environment",
            volume = settings.startup["kj_rex_walking_volume"].value / 100
        },

        {
            type = "gun",
            name = "kj_rex_cannon",
            icon = "__kj_rex__/graphics/equipment/railgun.png",
            icon_size = 32,
            hidden = true,
            subgroup = "gun",
            order = "z[rex]-a[railgun]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_rex_cannon",
                cooldown = 300,
                health_penalty = -5,
                rotate_penalty = 5,
                damage_modifier = 1,
                --projectile_creation_distance = 3.5,
                --projectile_center = {0, -3.8},
                projectile_creation_parameters = shoot_shiftings_cannon,
                range = 60,
                sound =
                {
                    {
                        filename = "__kj_rex__/sounds/railgun.ogg",
                        volume = 1
                    }
                },
            },
            stack_size = 5
        },
    })
end

if mods["kj_rattetank"] then
    data:extend({
        {
            type = "gun",
            name = "kj_280SKC34",
            icon = "__kj_rattetank__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[maustank]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_280SKC34",
                cooldown = 900,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 19.2,
                projectile_center = {0, -5},
                range = 80,
                sound = {
                    {
                        filename = "__kj_rattetank__/sounds/ratte_shot.ogg",
                        volume = 1
                    }
                },
            },
            stack_size = 5
        },
    })
end

if mods["kj_ray"] then
    local raymg = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
    raymg.name = "kj_ray_mg"
    raymg.order = "[basic-clips]-e[raymg]"
    raymg.localised_name = {"", {"item-name.kj_ray_mg"}}
    raymg.localised_description = {"", {"item-description.kj_ray_mg"}}
    raymg.flags = {}
    raymg.attack_parameters.range = 70
    raymg.attack_parameters.cooldown = 3.5
    raymg.attack_parameters.damage_modifier = 3
    raymg.attack_parameters.projectile_center = {0, -6}
    raymg.attack_parameters.projectile_creation_distance = 0
    for iterator,value in ipairs(raymg.attack_parameters.sound) do 
        value.volume = 0.8
    end
    data:extend({raymg})

    local rayrocket = table.deepcopy(data.raw["gun"]["rocket-launcher"])
    rayrocket.name = "kj_ray_rocket"
    rayrocket.hidden = true
    rayrocket.order = "[basic-clips]-e[rayrocket]"
    rayrocket.localised_name = {"", {"item-name.kj_ray_rocket"}}
    rayrocket.localised_description = {"", {"item-description.kj_ray_rocket"}}
    rayrocket.flags = {}
    rayrocket.attack_parameters.range = 70
    rayrocket.attack_parameters.cooldown = 45
    rayrocket.attack_parameters.damage_modifier = 3
    rayrocket.attack_parameters.projectile_center = {0, -6}
    rayrocket.attack_parameters.projectile_creation_distance = 0
    for iterator,value in ipairs(rayrocket.attack_parameters.sound) do 
        value.volume = 0.8
    end
    data:extend({rayrocket})

    data:extend({
        {
            type = "sound",
            name = "kj_watersplash_big",
            filename = "__kj_ray__/sounds/waterSplash.ogg",
            category = "environment",
            volume = 1
        },

        {
            type = "sound",
            name = "kj_ray_walking_1",
            filename = "__kj_ray__/sounds/ray_walking1.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_2",
            filename = "__kj_ray__/sounds/ray_walking2.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_3",
            filename = "__kj_ray__/sounds/ray_walking3.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_4",
            filename = "__kj_ray__/sounds/ray_walking4.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_5",
            filename = "__kj_ray__/sounds/ray_walking5.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_6",
            filename = "__kj_ray__/sounds/ray_walking6.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },
        {
            type = "sound",
            name = "kj_ray_walking_7",
            filename = "__kj_ray__/sounds/ray_walking7.ogg",
            category = "environment",
            volume = settings.startup["kj_ray_walking_volume"].value / 100
        },

        {
            type = "gun",
            name = "kj_ray_cannon",
            icon = "__kj_ray__/graphics/equipment/railgun.png",
            icon_size = 32,
            hidden = true,
            subgroup = "gun",
            order = "y[ray]-a[railgun]",
            localised_name = {"", {"item-name.kj_ray_cannon"}},
            localised_description = {"", {"item-description.kj_ray_cannon"}},
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_ray_cannon",
                cooldown = 300,
                health_penalty = -5,
                rotate_penalty = 5,
                damage_modifier = 1,
                projectile_creation_distance = 8,
                projectile_center = {0, -4},
                --projectile_creation_parameters = shoot_shiftings_cannon(),
                range = 60,
                sound =
                {
                    {
                    filename = "__kj_ray__/sounds/railgun.ogg",
                    volume = 1
                    }
                },
            },
            stack_size = 5
        },

        {
            type = "trivial-smoke",
            name = "kj_ray_splash",
            duration = 60,
            fade_in_duration = 10,
            fade_away_duration = 10,
            spread_duration = 600,
            start_scale = 0.50,
            end_scale = 1.5,
            color = { r = 1, g = 1, b = 1, a = 1},
            cyclic = false,
            affected_by_wind = false,
            render_layer = "ground-layer-1",
            movement_slow_down_factor = 0,
            show_when_smoke_off = true,
            animation =
            {
                filename = "__kj_ray__/graphics/water-splash.png",
                width = 460/5,
                height = 198/3,
                line_length = 5,
                frame_count = 5*3,
                --shift = util.by_pixel(0,-16),
                priority = "high",
                scale = 2,
                animation_speed = 0.05,
            }
        },
    })

    local highestNumber = "0"
    for _,layer in pairs(data.raw["collision-layer"]) do
        if layer.order ~= nil then
            highestNumber = math.max(highestNumber, layer.order)
        end
    end
    data:extend({
        {type = "collision-layer", order = string.format("%02d", highestNumber + 1), name = "out_of_map"},
    })
    data.raw["tile"]["out-of-map"].collision_mask.layers.out_of_map = true
end

if mods["kj_swspeeder"] then
    local sounds = require("__base__/prototypes/entity/sounds.lua")
    local hit_effects = require ("__base__/prototypes/entity/hit-effects.lua")
    local blasterStrength = settings.startup["kj_swspeeder_blaster_strength"].value

    data:extend({
        {
            type = "sound",
            name = "kj_swspeeder_s_1",
            filename = "__kj_swspeeder__/sounds/blaster1.ogg",
            category = "environment",
            volume = 0.5
        },
        {
            type = "sound",
            name = "kj_swspeeder_s_2",
            filename = "__kj_swspeeder__/sounds/blaster2.ogg",
            category = "environment",
            volume = 0.5
        },
        {
            type = "sound",
            name = "kj_swspeeder_s_3",
            filename = "__kj_swspeeder__/sounds/blaster3.ogg",
            category = "environment",
            volume = 0.5
        },
        {
            type = "custom-input",
            name = "kj_speeder_fire",
            key_sequence = "",
            linked_game_control = "shoot-enemy"
        },
        {
            type = "projectile",
            name = "kj_speeder_projectile",
            flags = {"not-on-map"},
            hidden = true,
            collision_box = {{-0.2, -0.5}, {0.2, 0.5}},
            acceleration = 0,
            height = 0,
            direction_only = true,
            piercing_damage = 300,
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
                            damage = {amount = 100 * blasterStrength, type = "fire"}
                        },
                        {
                            type = "damage",
                            damage = {amount = 200 * blasterStrength, type = "physical"}
                        },
                        {
                            type = "damage",
                            damage = {amount = 50 * blasterStrength, type = "electric"}
                        },
                        {
                            type = "damage",
                            damage = {amount = 400 * blasterStrength, type = "laser"}
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
                filename = "__kj_swspeeder__/graphics/bullet.png",
                draw_as_glow = true,
                frame_count = 1,
                width = 6,
                height = 100,
                scale = 0.5,
                priority = "high"
            }
        },
        {
            type = "gun",
            name = "kj_speeder_gun",
            icon = "__kj_swspeeder__/graphics/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[speeder]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_swspeeder",
                --ammo_category = "cannon-shell",
                cooldown = 1,
                --movement_slow_down_factor = 0,
                --projectile_creation_distance = 2,
                --projectile_center = {0,0},
                range = 50,
                --sound = sounds.tank_gunshot,
                --turn_range = 0.5,
                --rotate_penalty = 1000,
            },
            stack_size = 1
        },
    })
end

if mods["kj_wirbelwind"] then
    local tank_gunshot =
    {
        {
            filename = "__base__/sound/fight/tank-cannon-1.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-2.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-3.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-4.ogg",
            volume = 0.57
        },
        {
            filename = "__base__/sound/fight/tank-cannon-5.ogg",
            volume = 0.57
        }
    }

    data:extend({
        {
            type = "damage-type",
            name = "flak"
        },
        {
            type = "gun",
            name = "kj_2cmfv",
            icon = "__kj_wirbelwind__/graphics/equipment/tower.png",
            icon_size = 128,
            hidden = true,
            subgroup = "gun",
            order = "z[wirbelwind]-a[cannon]",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "kj_2cmfv",
                cooldown = 10,
                health_penalty = -5,
                rotate_penalty = 5,
                projectile_creation_distance = 2.5,
                projectile_center = {0, -1},
                range = 45,
                sound = tank_gunshot,
            },
            stack_size = 5
        },
    })
end


if mods["kj_bulldozer"] then
    data:extend({
        {
            type = "custom-input",
            name = "kj_bulldozer_speed",
            key_sequence = "",
            linked_game_control = "shoot-enemy"
        },

        {
            type = "gun",
            name = "kj_bulldozer_gun",
            icon = "__base__/graphics/icons/engine-unit.png",
            hidden = true,
            subgroup = "gun",
            order = "z[bulldozer]-a[cannon]",
            attack_parameters =
            {
                ammo_category = "kj_bulldozer",
                type = "projectile",
                cooldown = 1,
                range = 1,
            },
            stack_size = 1
        },
    })
end

if mods["kj_cybertruck"] then
    table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "assembling-machine-one")
    table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "assembling-machine-two")
    table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "assembling-machine-three")

    data:extend({
        {
            type = "recipe-category",
            name = "assembling-machine-one"
        },
        {
            type = "recipe-category",
            name = "assembling-machine-two"
        },
        {
            type = "recipe-category",
            name = "assembling-machine-three"
        },

        {
            type = "item",
            name = "kj_el_charge",
            icon = "__kj_cybertruck__/graphics/battery.png",
            icon_size = 128,
            subgroup = sg,
            order = order.."1",
            stack_size = 1,

            burnt_result = "kj_el_charge_used",
            fuel_value = "100MJ",
            fuel_acceleration_multiplier = 1.9,
            fuel_category = "kj_el_car_fuel",
        },
        {
            type = "item",
            name = "kj_el_charge_used",
            icon = "__kj_cybertruck__/graphics/battery.png",
            icon_size = 128,
            subgroup = sg,
            order = order.."2",
            stack_size = 1,
        },
    })
end

if mods["kj_gigahorse"] then
    local trivial_smoke = require("__base__/prototypes/entity/smoke-animations.lua").trivial_smoke

    data:extend({
        trivial_smoke {
            name = "kj_gigahorse_smoke",
            color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
            duration = 180,
            spread_duration = 180,
            fade_away_duration = 180,
            start_scale = 0.1,
            end_scale = 1.0,
        },
    })
end

