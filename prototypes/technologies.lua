local tables = require("tables")
local technologies = {
	{
		modname = "kj_2a6",
		recipes = {"kj_2a6", "kj_rh120_penetration", "kj_mg3_hand"},
		prerequisites = {"kj_gasoline"},
		unit = {1000,30,1,1,1,1,0,0,0}
	},
	{
		modname = "kj_2a6",
		name = "kj_2a6_ammo",
		recipes = {"kj_rh120_highexplosive", "kj_rh120_penetration_highexplosive", "kj_rh120_canister"},
		prerequisites = {"kj_2a6"},
		unit = {1000,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_40kbaneblade",
		recipes = {"kj_40kbaneblade", "kj_baneblade_normal", "kj_baneblade_artillery"},
		prerequisites = {"military-4"},
		unit = {1000,40,1,1,1,1,1,0,0}
	},

	{
		modname = "kj_40kdreadnought",
		recipes = {"kj_40kdreadnought", "kj_40kdreadnought_normal"},
		prerequisites = {"military-4", "kj_gasoline"},
		unit = {750,40,1,1,1,1,0,1,0}
	},

	{
		modname = "kj_40klemanruss",
		recipes = {"kj_40klemanruss", "kj_lemanruss_normal"},
		prerequisites = {},
		unit = {750,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_40kpredator",
		recipes = {"kj_40kpredator", "kj_predator_normal"},
		prerequisites = {"tank", "kj_gasoline"},
		unit = {750,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_maustank",
		recipes = {"kj_maustank", "kj_120kwk_penetration", "kj_mg42_hand"},
		prerequisites = {"kj_gasoline"},
		unit = {1000,30,1,1,1,1,0,0,0}
	},
	{
		modname = "kj_maustank",
		name = "kj_maustank_ammo",
		recipes = {"kj_maustank", "kj_120kwk_highexplosive", "kj_120kwk_penetration_highexplosive"},
		prerequisites = {"kj_maustank"},
		unit = {1000,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_pak",
		recipes = {"kj_pak", "kj_pak_turret", "kj_pak_penetration", "kj_pak_highexplosive", "kj_pak_incendiary"},
		prerequisites = {"military-3"},
		unit = {600,40,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_panzer4",
		recipes = {"kj_panzer4", "kj_75kwk40_penetration", "kj_mg34_hand"},
		prerequisites = {"tank", "kj_gasoline"},
		unit = {500,30,1,1,1,1,0,0,0}
	},
	{
		modname = "kj_panzer4",
		name = "kj_panzer4_ammo",
		recipes = {"kj_75kwk40_highexplosive", "kj_75kwk40_penetration_highexplosive"},
		prerequisites = {"kj_panzer4"},
		unit = {200,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_rattetank",
		recipes = {"kj_rattetank", "kj_280SKC34_penetration"},
		prerequisites = {"kj_gasoline"},
		unit = {500,30,10,10,10,10,10,10,1}
	},
	{
		modname = "kj_rattetank",
		name = "kj_rattetank_ammo",
		recipes = {"kj_280SKC34_highexplosive", "kj_280SKC34_incendiary"},
		prerequisites = {"kj_rattetank"},
		unit = {500,30,10,10,10,10,10,10,1}
	},

	{
		modname = "kj_ray",
		recipes = {"kj_ray", "kj_ray_small", "kj_ray_normal", "kj_ray_normal_small"},
		prerequisites = {"military-4", "kj_gasoline"},
		unit = {50,40,10,10,10,10,10,10,1}
	},
	{
		modname = "kj_rex",
		recipes = {"kj_rex", "kj_rex_normal"},
		prerequisites = {"military-4", "kj_gasoline"},
		unit = {50,40,10,10,10,10,10,10,1}
	},
	{
		modname = "kj_swspeeder",
		recipes = {"kj_swspeeder"},
		prerequisites = {"military-4", "kj_energy_cell"},
		unit = {200,30,1,1,1,1,1,0,0}
	},
	{
		modname = "kj_wirbelwind",
		recipes = {"kj_wirbelwind", "kj_2cmfv_normal"},
		prerequisites = {"kj_panzer4"},
		unit = {500,30,1,1,1,1,0,0,0}
	},

	{
		modname = "kj_aventador",
		recipes = {"kj_aventador"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {120,20,1,1,0,1,0,0,0}
	},
	{
		modname = "kj_bulldozer",
		size = 256,
		recipes = {"kj_bulldozer"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {200,20,1,1,0,1,0,0,0}
	},
	{
		modname = "kj_cybertruck",
		recipes = {"kj_cybertruck", "kj_el_charge", "kj_el_charge_recycle_1", "kj_el_charge_recycle_2", "kj_el_charge_recycle_3"},
		prerequisites = {"automobilism", "battery"},
		unit = {200,20,1,1,0,0,0,0,0}
	},
	{
		modname = "kj_delorean",
		recipes = {"kj_delorean"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {75,20,2,2,0,1,0,0,0}
	},
	{
		modname = "kj_firetruck",
		recipes = {"kj_firetruck"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {200,20,1,1,0,1,0,0,0}
	},
	{
		modname = "kj_fordmustang",
		recipes = {"kj_fordmustang"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {90,20,2,2,0,1,0,0,0}
	},
	{
		modname = "kj_gigahorse",
		recipes = {"kj_gigahorse"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {150,20,1,1,0,1,0,0,0}
	},
	{
		modname = "kj_utilitarian",
		recipes = {"kj_utilitarian"},
		prerequisites = {"automobilism", "kj_gasoline"},
		unit = {200,20,1,1,0,1,0,0,0}
	},
	{
		modname = "kj_warrig",
		recipes = {"kj_warrig", "kj_warrig_train", "kj_warrig_wagon", "kj_warrig_wagon_fluid", "kj_warrig_rails"},
		prerequisites = {"automobilism", "kj_gasoline", "railway"},
		unit = {250,20,1,1,0,1,0,0,0}
	},

	{
		modname = "kj_40kbunker",
		recipes = {"kj_40kbunker", "kj_40kbunker_turret"},
		prerequisites = {"military-3"},
		unit = {600,40,1,1,0,1,0,0,0}
	},

	{
		modname = "kj_phalanx",
		size = 256,
		recipes = {"kj_phalanx", "kj_apds_normal"},
		prerequisites = {"military-4"},
		unit = {200,30,1,1,1,1,0,1,0}
	},

	{
		modname = "kj_tower",
		recipes = {"kj_tower"},
		prerequisites = {"military-3"},
		unit = {150,30,1,1,1,0,0,0,0}
	},

	{
		modname = "kj_vierling",
		recipes = {"kj_vierling", "kj_2cmfv_normal_vierling"},
		prerequisites = {"military-3"},
		unit = {200,30,1,1,1,1,0,0,0}
	},

}

local sciencePacks = {
	"automation-science-pack",
	"logistic-science-pack",
	"military-science-pack",
	"chemical-science-pack",
	"production-science-pack",
	"utility-science-pack",
	"space-science-pack"
}

local function techIngred(unit)
	local ingredients = {}
    for i = 3, 9, 1 do
		if unit[i] > 0 then
			table.insert(ingredients, {sciencePacks[i-2], unit[i]})
		end
	end

	return ingredients
end

for _, tech in pairs(technologies) do
    if mods[tech.modname] then
        local name = tech.name or tech.modname
		local effects = {}

		local unit = {
			count = tech.unit[1],
			time = tech.unit[2],
			ingredients = techIngred(tech.unit)
		}

		for _, recipe in pairs(tech.recipes) do
			table.insert(effects,{type = "unlock-recipe", recipe = recipe})
		end

        data:extend({
            {
                type = "technology",
                name = name,
                icon = "__"..tech.modname.."__/graphics/technology.png",
                icon_size = tech.size or 128,
                effects = effects,
                prerequisites = tech.prerequisites,
                unit = unit,
                order = tables.supportedMods[tech.modname].order,
            },
        })
    end
end