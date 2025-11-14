local tables = require("tables")
local aaiTanks = {}
local categoryTrigger = 20

local modsCount = 0
for modname, mod in pairs(tables.supportedMods) do
	if mods[modname] then
		modsCount = modsCount + mod.weight
	end
end
log("KJ Mod Count: "..modsCount)

if modsCount > categoryTrigger or settings.startup["kj_modCategory"].value == true then
	data:extend({
		{
			type = "item-group",
			name = "kj_vehicles",
			icon = "__kj_vehicles__/graphics/categories.png",
			icon_size = 560,
			inventory_order = "x",
			order = "kj_vehicles"
		},
	})

	require("prototypes.categories")(tables.categoriesUpdates)
	if data.raw["ammo"]["kj_bolt"] ~= nil then
		data.raw["ammo"]["kj_bolt"].subgroup = tables.categoriesUpdates["kj_40kbaneblade"].name
	end

	if mods["kj_2a6"] then
		data.raw["item-subgroup"]["kj_tanks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_2a6"].subgroup = tables.categoriesUpdates["kj_2a6"].name
		data.raw["ammo"]["kj_rh120_penetration"].subgroup = tables.categoriesUpdates["kj_2a6"].name
		data.raw["ammo"]["kj_rh120_highexplosive"].subgroup = tables.categoriesUpdates["kj_2a6"].name
		data.raw["ammo"]["kj_rh120_penetration_highexplosive"].subgroup = tables.categoriesUpdates["kj_2a6"].name
		data.raw["ammo"]["kj_rh120_canister"].subgroup = tables.categoriesUpdates["kj_2a6"].name
	end

	if mods["kj_40kbaneblade"] then
		data.raw["item-subgroup"]["kj_wh40k"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_40kbaneblade"].subgroup = tables.categoriesUpdates["kj_40kbaneblade"].name
		data.raw["ammo"]["kj_baneblade_normal"].subgroup = tables.categoriesUpdates["kj_40kbaneblade"].name
		data.raw["ammo"]["kj_baneblade_artillery"].subgroup = tables.categoriesUpdates["kj_40kbaneblade"].name
	end

	if mods["kj_40kdreadnought"] then
		data.raw["item-subgroup"]["kj_wh40k"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_40kdreadnought"].subgroup = tables.categoriesUpdates["kj_40kdreadnought"].name
		data.raw["ammo"]["kj_40kdreadnought_normal"].subgroup = tables.categoriesUpdates["kj_40kdreadnought"].name
	end

	if mods["kj_40klemanruss"] then
		data.raw["item-subgroup"]["kj_wh40k"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_40klemanruss"].subgroup = tables.categoriesUpdates["kj_40klemanruss"].name
		data.raw["ammo"]["kj_lemanruss_normal"].subgroup = tables.categoriesUpdates["kj_40klemanruss"].name
	end

	if mods["kj_40kpredator"] then
		data.raw["item-subgroup"]["kj_wh40k"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_40kpredator"].subgroup = tables.categoriesUpdates["kj_40kpredator"].name
		data.raw["ammo"]["kj_predator_normal"].subgroup = tables.categoriesUpdates["kj_40kpredator"].name
	end

	if mods["kj_maustank"] then
		data.raw["item-subgroup"]["kj_tanks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_maustank"].subgroup = tables.categoriesUpdates["kj_maustank"].name
		data.raw["ammo"]["kj_120kwk_penetration"].subgroup = tables.categoriesUpdates["kj_maustank"].name
		data.raw["ammo"]["kj_120kwk_highexplosive"].subgroup = tables.categoriesUpdates["kj_maustank"].name
		data.raw["ammo"]["kj_120kwk_penetration_highexplosive"].subgroup = tables.categoriesUpdates["kj_maustank"].name
	end

	if mods["kj_pak"] then
		data.raw["item-subgroup"]["kj_tanks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_pak"].subgroup = tables.categoriesUpdates["kj_pak"].name
		data.raw["item-with-entity-data"]["kj_pak_turret"].subgroup = tables.categoriesUpdates["kj_pak"].name

		data.raw["ammo"]["kj_pak_penetration"].subgroup = tables.categoriesUpdates["kj_pak"].name
		data.raw["ammo"]["kj_pak_highexplosive"].subgroup = tables.categoriesUpdates["kj_pak"].name
		data.raw["ammo"]["kj_pak_incendiary"].subgroup = tables.categoriesUpdates["kj_pak"].name
	end

	if mods["kj_panzer4"] then
		data.raw["item-subgroup"]["kj_tanks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_panzer4"].subgroup = tables.categoriesUpdates["kj_panzer4"].name
		data.raw["ammo"]["kj_75kwk40_penetration"].subgroup = tables.categoriesUpdates["kj_panzer4"].name
		data.raw["ammo"]["kj_75kwk40_highexplosive"].subgroup = tables.categoriesUpdates["kj_panzer4"].name
		data.raw["ammo"]["kj_75kwk40_penetration_highexplosive"].subgroup = tables.categoriesUpdates["kj_panzer4"].name
	end

	if mods["kj_rattetank"] then
		data.raw["item-subgroup"]["kj_tanks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_rattetank"].subgroup = tables.categoriesUpdates["kj_rattetank"].name
		data.raw["ammo"]["kj_280SKC34_incendiary"].subgroup = tables.categoriesUpdates["kj_rattetank"].name
		data.raw["ammo"]["kj_280SKC34_penetration"].subgroup = tables.categoriesUpdates["kj_rattetank"].name
		data.raw["ammo"]["kj_280SKC34_highexplosive"].subgroup = tables.categoriesUpdates["kj_rattetank"].name
	end

	if mods["kj_ray"] then
		data.raw["item-subgroup"]["kj_fantasy"].group = "kj_vehicles"
		data.raw["ammo"]["kj_ray_normal"].subgroup = tables.categoriesUpdates["kj_ray"].name
		data.raw["ammo"]["kj_ray_ammo_small"].subgroup = tables.categoriesUpdates["kj_ray"].name
		data.raw["item-with-entity-data"]["kj_ray"].subgroup = tables.categoriesUpdates["kj_ray"].name
		data.raw["item-with-entity-data"]["kj_ray_small"].subgroup = tables.categoriesUpdates["kj_ray"].name
	end

	if mods["kj_rex"] then
		data.raw["item-subgroup"]["kj_fantasy"].group = "kj_vehicles"
		data.raw["ammo"]["kj_rex_normal"].subgroup = tables.categoriesUpdates["kj_rex"].name
		data.raw["item-with-entity-data"]["kj_rex"].subgroup = tables.categoriesUpdates["kj_rex"].name
	end

	if mods["kj_swspeeder"] then
		data.raw["item-subgroup"]["kj_star_wars"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_swspeeder"].subgroup = "kj_star_wars"
	end

	if mods["kj_wirbelwind"] then
		data.raw["item-subgroup"]["kj_tanks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_wirbelwind"].subgroup = tables.categoriesUpdates["kj_wirbelwind"].name
		data.raw["ammo"]["kj_2cmfv_normal"].subgroup = tables.categoriesUpdates["kj_wirbelwind"].name
	end

	if mods["kj_aventador"] then
		data.raw["item-subgroup"]["kj_civils"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_aventador"].subgroup = "kj_civils"
	end

	if mods["kj_bulldozer"] then
		data.raw["item-subgroup"]["kj_trucks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_bulldozer"].subgroup = "kj_trucks"
	end

	if mods["kj_cybertruck"] then
		data.raw["item-subgroup"]["kj_civils"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_cybertruck"].subgroup = "kj_civils"
		data.raw["item"]["kj_el_charge"].subgroup = "kj_civils"
		data.raw["item"]["kj_el_charge_used"].subgroup = "kj_civils"

		data.raw["recipe"]["kj_el_charge"].subgroup = "kj_civils"
		data.raw["recipe"]["kj_el_charge_recycle_1"].subgroup = "kj_civils"
		data.raw["recipe"]["kj_el_charge_recycle_2"].subgroup = "kj_civils"
		data.raw["recipe"]["kj_el_charge_recycle_3"].subgroup = "kj_civils"
	end

	if mods["kj_delorean"] then
		data.raw["item-subgroup"]["kj_civils"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_delorean"].subgroup = "kj_civils"
	end

	if mods["kj_firetruck"] then
		data.raw["item-subgroup"]["kj_trucks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_firetruck"].subgroup = "kj_trucks"
	end

	if mods["kj_fordmustang"] then
		data.raw["item-subgroup"]["kj_civils"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_fordmustang"].subgroup = "kj_civils"
	end

	if mods["kj_gigahorse"] then
		data.raw["item-subgroup"]["kj_trucks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_gigahorse"].subgroup = "kj_trucks"
	end

	if mods["kj_utilitarian"] then
		data.raw["item-subgroup"]["kj_trucks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_utilitarian"].subgroup = "kj_trucks"
	end

	if mods["kj_warrig"] then
		data.raw["item-subgroup"]["kj_trucks"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_warrig"].subgroup = "kj_trucks"
		data.raw["item-with-entity-data"]["kj_warrig_train"].subgroup = "kj_trucks"
		data.raw["item-with-entity-data"]["kj_warrig_wagon"].subgroup = "kj_trucks"
		data.raw["item-with-entity-data"]["kj_warrig_wagon_fluid"].subgroup = "kj_trucks"
		data.raw["rail-planner"]["kj_warrig_rails"].subgroup = "kj_trucks"
	end

	if mods["kj_40kbunker"] then
		data.raw["item-subgroup"]["kj_turrets"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_40kbunker"].subgroup = tables.categoriesUpdates["kj_40kbunker"].name
		data.raw["item-with-entity-data"]["kj_40kbunker_turret"].subgroup = tables.categoriesUpdates["kj_40kbunker"].name
	end

	if mods["kj_phalanx"] then
		data.raw["item-subgroup"]["kj_turrets"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_phalanx"].subgroup = tables.categoriesUpdates["kj_phalanx"].name
		data.raw["ammo"]["kj_apds_normal"].subgroup = tables.categoriesUpdates["kj_phalanx"].name

		if data.raw["item-with-entity-data"]["kj_phalanx_nonAA"] ~= nil then
			data.raw["item-with-entity-data"]["kj_phalanx_nonAA"].subgroup = tables.categoriesUpdates["kj_phalanx"].name
		end
	end

	if mods["kj_tower"] then
		data.raw["item-subgroup"]["kj_turrets"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_tower"].subgroup = tables.categoriesUpdates["kj_tower"].name

		data.raw["item-with-entity-data"]["kj_tower"].pick_sound = data.raw["item"]["gun-turret"].pick_sound
		data.raw["item-with-entity-data"]["kj_tower"].drop_sound = data.raw["item"]["gun-turret"].drop_sound
	end

	if mods["kj_vierling"] then
		data.raw["item-subgroup"]["kj_turrets"].group = "kj_vehicles"
		data.raw["item-with-entity-data"]["kj_vierling"].subgroup = tables.categoriesUpdates["kj_vierling"].name
		data.raw["ammo"]["kj_2cmfv_normal_vierling"].subgroup = tables.categoriesUpdates["kj_vierling"].name

		if data.raw["item-with-entity-data"]["kj_vierling_nonAA"] ~= nil then
			data.raw["item-with-entity-data"]["kj_vierling_nonAA"].subgroup = tables.categoriesUpdates["kj_vierling"].name
		end
	end
end

local function establishAA()
	--Assigning Planes trigger_target_mask
	for _, mod in ipairs(tables.airborneMods) do
		if mods[mod] then
			if data.raw["car"][mod] ~= nil then		--If plane exists
				if data.raw["car"][mod].trigger_target_mask ~= nil then		--If masks not empty
					table.insert(data.raw["car"][mod.."-airborne"].trigger_target_mask, "air-unit")
					log("Added trigger_target_mask to plane "..mod.."-airborne.")

				else
					data.raw["car"][mod.."-airborne"].trigger_target_mask = {"air-unit"}
					log("Assigned trigger_target_mask to plane "..mod.."-airborne.")
				end
			else
				log("Trying to assign trigger_target_mask to plane "..mod.." failed.")
			end
		end
	end
end

if mods["kj_2a6"] then
	if mods["space-exploration"] then
		data.raw["technology"]["kj_2a6"].unit =
		{
			count = 1000,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"military-science-pack", 1},
			},
			time = 30
		}

		data.raw["technology"]["kj_2a6_ammo"].unit =
		{
			count = 1000,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"military-science-pack", 1},
			},
			time = 30
		}
	end
end

if mods["kj_40kbaneblade"] then
	if mods["space-exploration"] then
		data.raw["technology"]["kj_40kbaneblade"].unit =
		{
			count = 1000,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"military-science-pack", 1},
				{"utility-science-pack", 1},
			},
			time = 40
		}
		data.raw["technology"]["kj_40kbaneblade"].prerequisites = {"military-4"}

		if mods["kj_40klemanruss"] then
			table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "kj_40klemanruss")
		else
			if mods["kj_40kpredator"] then
				table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "kj_40kpredator")
			else
				table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "tank")
				table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "kj_gasoline")
			end
		end
	end

	aaiTanks.baneblade = {
		entities = {"kj_40kbaneblade".."-"},
		guns = {"kj_baneblade", "kj_baneblade_bolter"},
		multiplier = 0.75,
	}
end

if mods["kj_40kdreadnought"] then
	if mods["space-exploration"] then
		data.raw["technology"]["kj_40kdreadnought"].unit =
		{
			count = 750,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"military-science-pack", 1},
				{"utility-science-pack", 1},
				{"se-rocket-science-pack", 1},
			},
			time = 40
		}
		data.raw["technology"]["kj_40kdreadnought"].prerequisites = {"military-4", "se-rocket-science-pack", "kj_gasoline"}
		
		if mods["kj_40kpredator"] then
			table.insert(data.raw["technology"]["kj_40kdreadnought"].prerequisites, "kj_40kpredator")
		else
			table.insert(data.raw["technology"]["kj_40kdreadnought"].prerequisites, "tank")
		end
	end
end

if mods["kj_40klemanruss"] then
	if mods["space-exploration"] then
		data.raw["technology"]["kj_40klemanruss"].unit =
		{
			count = 750,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"military-science-pack", 1},
			},
			time = 30
		}
		data.raw["technology"]["kj_40klemanruss"].prerequisites = {}

		if mods["kj_40kpredator"] then
			table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "kj_40kpredator")
		else
			table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "tank")
			table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "kj_gasoline")
		end
	end
end

if mods["kj_40kpredator"] then
	if mods["space-exploration"] then
		data.raw["technology"]["kj_40kpredator"].unit =
		{
			count = 750,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"military-science-pack", 1},
			},
			time = 30
		}
		data.raw["technology"]["kj_40kpredator"].prerequisites = {"tank", "kj_gasoline"}	
	end
end

if mods["kj_cybertruck"] then
	data.raw["car"]["kj_cybertruck"].energy_source.fuel_categories = {"kj_el_car_fuel"}
end

if mods["kj_pak"] then
	data.raw["ammo"]["kj_pak_highexplosive"].ammo_type.action.action_delivery.max_range = settings.startup["kj_pak_range"].value
	data.raw["ammo"]["kj_pak_penetration"].ammo_type.action.action_delivery.max_range = settings.startup["kj_pak_range"].value
	data.raw["ammo"]["kj_pak_incendiary"].ammo_type.action.action_delivery.max_range = settings.startup["kj_pak_range"].value

	data.raw["gun"]["kj_pak_gun"].attack_parameters.range = settings.startup["kj_pak_range"].value
	data.raw["ammo-turret"]["kj_pak_turret"].attack_parameters.range = settings.startup["kj_pak_range"].value
end

if mods["kj_ray"] then
	if mods["space-exploration"] then
		data.raw["technology"]["kj_ray"].unit =
		{
			count = 50,
			ingredients =
			{
				{"automation-science-pack", 10},
				{"logistic-science-pack", 10},
				{"chemical-science-pack", 10},
				{"military-science-pack", 10},
				{"production-science-pack", 10},
				{"utility-science-pack", 10},
				{"se-rocket-science-pack", 1},
			},
			time = 40
		}
		data.raw["technology"]["kj_ray"].prerequisites = {"military-4", "se-rocket-science-pack", "kj_gasoline"}
	end
end

if mods["kj_rex"] then
	if mods["space-exploration"] then
		data.raw["technology"]["kj_rex"].unit = 
		{
			count = 50,
			ingredients =
			{
				{"automation-science-pack", 10},
				{"logistic-science-pack", 10},
				{"chemical-science-pack", 10},
				{"military-science-pack", 10},
				{"production-science-pack", 10},
				{"utility-science-pack", 10},
				{"se-rocket-science-pack", 1},
			},
			time = 40
		}
		data.raw["technology"]["kj_rex"].prerequisites = {"military-4", "se-rocket-science-pack", "kj_gasoline"}
	end
end

if mods["kj_warrig"] then
	if  data.raw["straight-rail"]["straight-rail"].fast_replaceable_group == nil then
		data.raw["straight-rail"]["straight-rail"].fast_replaceable_group = "straight-rail"
		data.raw["half-diagonal-rail"]["half-diagonal-rail"].fast_replaceable_group = "half-diagonal-rail"
		data.raw["curved-rail-a"]["curved-rail-a"].fast_replaceable_group = "curved-rail-a"
		data.raw["curved-rail-b"]["curved-rail-b"].fast_replaceable_group = "curved-rail-b"

		data.raw["straight-rail"]["kj_warrig_rail_straight"].fast_replaceable_group = "straight-rail"
		data.raw["half-diagonal-rail"]["kj_warrig_rail_half_diagonal"].fast_replaceable_group = "half-diagonal-rail"
		data.raw["curved-rail-a"]["kj_warrig_rail_curved_rail_a"].fast_replaceable_group = "curved-rail-a"
		data.raw["curved-rail-b"]["kj_warrig_rail_curved_rail_b"].fast_replaceable_group = "curved-rail-b"
	else
		data.raw["straight-rail"]["kj_warrig_rail_straight"].fast_replaceable_group = data.raw["straight-rail"]["straight-rail"].fast_replaceable_group
		data.raw["curved-rail"]["kj_warrig_rail_curved"].fast_replaceable_group = data.raw["curved-rail"]["curved-rail"].fast_replaceable_group

		data.raw["straight-rail"]["kj_warrig_rail_straight"].fast_replaceable_group 			= data.raw["straight-rail"]["straight-rail"].fast_replaceable_group
		data.raw["half-diagonal-rail"]["kj_warrig_rail_half_diagonal"].fast_replaceable_group 	= data.raw["half-diagonal-rail"]["half-diagonal-rail"].fast_replaceable_group
		data.raw["curved-rail-a"]["kj_warrig_rail_curved_rail_a"].fast_replaceable_group 		= data.raw["curved-rail-a"]["curved-rail-a"].fast_replaceable_group
		data.raw["curved-rail-b"]["kj_warrig_rail_curved_rail_b"].fast_replaceable_group 		= data.raw["curved-rail-a"]["curved-rail-b"].fast_replaceable_group
	end
end

if mods["kj_40kbunker"] then
	data.raw["car"]["kj_40kbunker"].sound_no_fuel = nil

	if mods["space-exploration"] then
		data.raw["technology"][modName].unit = 
		{
			count = 600,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"military-science-pack", 1},
			},
			time = 40
		}
		data.raw["technology"][modName].prerequisites = {"military-3"}
	end


	if mods["aai-programmable-vehicles"] then
		log("AAI-P-V Mod found. Correcting the recipes.")
	
		data.raw["recipe"][modName.."-kj_40kbunker_gun"].hidden = true
		
		for i,effect in ipairs(data.raw["technology"][modName].effects) do
			if effect.type == "unlock-recipe" then
				if effect.recipe == "kj_40kbunker-kj_40kbunker_gun" --[[or effect.recipe == modName.."-kj_40kbunker_gun-reverse"]] then
					log("Recipe "..effect.recipe.." found. Deleting.")
					data.raw["technology"][modName].effects[i] = nil
				end
			end
		end
	end
end

if mods["kj_vierling"] then
	establishAA()

	data.raw["item-with-entity-data"]["kj_vierling"].pick_sound = data.raw["item"]["gun-turret"].pick_sound
	data.raw["item-with-entity-data"]["kj_vierling"].drop_sound = data.raw["item"]["gun-turret"].drop_sound
	data.raw["item-with-entity-data"]["kj_vierling"].inventory_move_sound = data.raw["item"]["gun-turret"].inventory_move_sound

	if data.raw["item-with-entity-data"]["kj_vierling_nonAA"] ~= nil then
		data.raw["item-with-entity-data"]["kj_vierling_nonAA"].pick_sound = data.raw["item"]["gun-turret"].pick_sound
		data.raw["item-with-entity-data"]["kj_vierling_nonAA"].drop_sound = data.raw["item"]["gun-turret"].drop_sound
		data.raw["item-with-entity-data"]["kj_vierling_nonAA"].inventory_move_sound = data.raw["item"]["gun-turret"].inventory_move_sound
	end
end

if mods["kj_phalanx"] then
	establishAA()

	if mods["kj_vierling"] then
		table.insert(data.raw["technology"]["kj_phalanx"].prerequisites, "kj_vierling")
	end

	data.raw["item-with-entity-data"]["kj_phalanx"].pick_sound = data.raw["item"]["gun-turret"].pick_sound
	data.raw["item-with-entity-data"]["kj_phalanx"].drop_sound = data.raw["item"]["gun-turret"].drop_sound
	data.raw["item-with-entity-data"]["kj_phalanx"].inventory_move_sound = data.raw["item"]["gun-turret"].inventory_move_sound

	if data.raw["item-with-entity-data"]["kj_phalanx_nonAA"] ~= nil then
		data.raw["item-with-entity-data"]["kj_phalanx_nonAA"].pick_sound = data.raw["item"]["gun-turret"].pick_sound
		data.raw["item-with-entity-data"]["kj_phalanx_nonAA"].drop_sound = data.raw["item"]["gun-turret"].drop_sound
		data.raw["item-with-entity-data"]["kj_phalanx_nonAA"].inventory_move_sound = data.raw["item"]["gun-turret"].inventory_move_sound
	end
end


local function healthChanger(entityName, type, setting)
	local entity = data.raw[type][entityName]
	if entity ~= nil then
		entity.max_health = entity.max_health * (settings.startup[setting.."-hp_modifier"].value / 100)

		--log("max_health of "..entityName.." changed.")
	end
end

local function resistanceChanger(entityName, type, setting)
	local entity = data.raw[type][entityName]
	if entity ~= nil then
		if entity.resistances ~= nil then
			for _, res in pairs(entity.resistances) do
				if res.decrease ~= nil then
					res.decrease = res.decrease * (settings.startup[setting.."-resistance_modifier"].value / 100)
				end
				if res.percent ~= nil then
					res.percent = res.percent * (settings.startup[setting.."-resistance_modifier"].value / 100)
				end
			end
			--log("Resistances of "..entityName.." changed.")
		end
	end
end

local function propertyChanger(basename, name, type)
	if data.raw["car"][name] ~= nil then
		healthChanger(name, "car", basename)
		resistanceChanger(name, "car", basename)
	else
		log("Problem occured when trying to assign correct max_health and resistance to "..name..". Car not found")
	end

	if data.raw["ammo-turret"][name] ~= nil then
		healthChanger(name, "ammo-turret", basename)
		resistanceChanger(name, "ammo-turret", basename)
	else
		log("Problem occured when trying to assign correct max_health and resistance to "..name..". Turret not found")
	end

	if type ~= nil then
		if data.raw[type][name] ~= nil then
			healthChanger(name, type, basename)
			resistanceChanger(name, type, basename)
		else
			log("Problem occured when trying to assign correct max_health and resistance to "..name..". "..type.." not found")
		end
	end
end

for name, mod in pairs(tables.balancedMods) do
	if mods[name] then
		--log(name.." exists")

		if mod == true then
			propertyChanger(name, name)
		else
			for _, entity in pairs(mod) do
				if entity.type == nil then
					propertyChanger(name, entity.name, entity.type)
				end
			end
		end
	end
end


local tanks = {}
for _, tank in pairs(aaiTanks) do
	for _, entity in pairs(tank.entities) do
		for _, gun in pairs(tank.guns) do
			table.insert(tanks, {name = entity..gun.."-_-ghost", multiplier = tank.multiplier})
			table.insert(tanks, {name = entity..gun.."-_-solid", multiplier = tank.multiplier})
			table.insert(tanks, {name = entity..gun, multiplier = tank.multiplier})
		end
	end
end

if mods["aai-programmable-vehicles"] then
	for _, tank in pairs(tanks) do
		local entity = data.raw["car"][tank.name]
		if entity ~= nil then
			entity.weight = entity.weight * tank.multiplier
			entity.max_health = entity.max_health * tank.multiplier
			log('AAI Tank "'..tank.name..'" adjusted')
		end	
	end
end