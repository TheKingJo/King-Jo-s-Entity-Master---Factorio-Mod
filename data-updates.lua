local tables = require("tables")
local prerequisites_mod = ""


if mods["kj_2a6"] then
	local multiplier = 1
	if mods["kj_maustank"] then
		prerequisites_mod = "kj_maustank"
		multiplier = 0.5
	elseif mods["kj_panzer4"] then
		prerequisites_mod = "kj_panzer4"
		multiplier = 0.75
	else
		prerequisites_mod = "tank"
	end

	data.raw["technology"]["kj_2a6"].unit.count = multiplier * data.raw["technology"]["kj_2a6"].unit.count
	data.raw["technology"]["kj_2a6_ammo"].unit.count = multiplier * data.raw["technology"]["kj_2a6_ammo"].unit.count

	table.insert(data.raw["technology"]["kj_2a6"].prerequisites, prerequisites_mod)
end

if mods["kj_40kbaneblade"] then
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

	if mods["Wh40k_Armoury_fork"] or mods["Wh40k_Armoury"] then
		data.raw["gun"]["kj_baneblade_bolter"].attack_parameters["ammo_category"] = "bolt100"
		table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "basic-bolter")
	else
		table.insert(data.raw["technology"]["kj_40kbaneblade"].effects, {type = "unlock-recipe", recipe = "kj_bolt"})
	end
end

if mods["kj_40kdreadnought"] then
	if mods["kj_40kpredator"] then
		table.insert(data.raw["technology"]["kj_40kdreadnought"].prerequisites, "kj_40kpredator")
	else
		table.insert(data.raw["technology"]["kj_40kdreadnought"].prerequisites, "tank")
	end

	if mods["Wh40k_Armoury_fork"] or mods["Wh40k_Armoury"] then
		data.raw["gun"]["kj_bolter"].attack_parameters["ammo_category"] = "bolt100"
		table.insert(data.raw["technology"]["kj_40kdreadnought"].prerequisites, "basic-bolter")

	else
		table.insert(data.raw["technology"]["kj_40kdreadnought"].effects, {type = "unlock-recipe", recipe = "kj_bolt"})
	end
end

if mods["kj_40klemanruss"] then
	if mods["kj_40kpredator"] then
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "kj_40kpredator")
	else
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "tank")
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "kj_gasoline")
	end


	if mods["Wh40k_Armoury_fork"] or mods["Wh40k_Armoury"] then
		data.raw["gun"]["kj_lemanruss_bolter"].attack_parameters["ammo_category"] = "bolt100"
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "basic-bolter")
	else
		table.insert(data.raw["technology"]["kj_40klemanruss"].effects, {type = "unlock-recipe", recipe = "kj_bolt"})
	end
end

if mods["kj_40kpredator"] then
	if mods["Wh40k_Armoury_fork"] or mods["Wh40k_Armoury"] then
		data.raw["gun"]["kj_predator_bolter"].attack_parameters["ammo_category"] = "bolt100"
		table.insert(data.raw["technology"]["kj_40kpredator"].prerequisites, "basic-bolter")
	else
		table.insert(data.raw["technology"]["kj_40kpredator"].effects, {type = "unlock-recipe", recipe = "kj_bolt"})
	end
end

if mods["kj_maustank"] then
	if mods["kj_panzer4"] then
		table.insert(data.raw["car"]["kj_maustank"].guns, "kj_75kwk40")
		table.insert(data.raw["technology"]["kj_maustank_ammo"].prerequisites, "kj_panzer4_ammo")
		prerequisites_mod = "kj_panzer4"
	else
		prerequisites_mod = "tank"
	end

	table.insert(data.raw["technology"]["kj_maustank"].prerequisites, prerequisites_mod)
end

if mods["kj_rattetank"] then
	if mods["kj_maustank"] then
		prerequisites_mod = "kj_maustank"

		table.insert(data.raw["technology"]["kj_rattetank_ammo"].prerequisites, "kj_maustank_ammo")
	else
		prerequisites_mod = "tank"
	end
	table.insert(data.raw["technology"]["kj_rattetank"].prerequisites, prerequisites_mod)
end

if mods["kj_utilitarian"] then
	if mods["aai-vehicles-ironclad"] then
		data.raw["car"]["kj_utilitarian"].guns = {"ironclad-mortar"}
	end
end

if mods["kj_vierling"] then
	local settingTM = settings.startup["kj_vierling_target_mask"].value
	local settingERM = settings.startup["kj_vierling_ermAA"].value

	if settings.startup["kj_vierling_nonAA"].value == true then
		require("prototypes.vierling")
	end


	data:extend({
		{
			type = "trigger-target-type",
			name = "air-unit",
		},
		{
			type = "trigger-target-type",
			name = "flying",
		},
	})

	data.raw["ammo-turret"]["kj_vierling"].attack_target_mask = {"air-unit", "flying"}

	if settingTM == true then
		types = {}
		for name, _ in pairs(data.raw["trigger-target-type"]) do
			if name ~= "air-unit" and name ~= "flying" then
				table.insert(types, name)
				--log("Adding type: "..name)
			end
		end
		table.insert(types, "common")

		--Assigning Turrets attack_target_mask
		turretTypes = {"ammo", "electric", "fluid"}
		for _, turretType in pairs (turretTypes) do
			for name, turret in pairs(data.raw[turretType.."-turret"]) do
				log("Name: "..name)
				if string.sub(name,1,3) ~= "kj_" then
					log("Mod foreign turret found.")
					
					if turret.attack_target_mask ~= nil then
						if turret.attack_target_mask["air-unit"] ~= nil then
							data.raw[turretType.."-turret"][name].attack_target_mask["air-unit"] = false
						end
						
						if turret.attack_target_mask["flying"] ~= nil then
							data.raw[turretType.."-turret"][name].attack_target_mask["flying"] = false
						end
						
						log("Found a "..turretType.."-turret with air-unit/flying as attack_target_mask. Set to false.")
					else
						data.raw[turretType.."-turret"][name].attack_target_mask = types
						log("Standard masks applied")
					end
				end
			end
		end
	end


	if mods["kj_wirbelwind"] then
		if data.raw["ammo-turret"]["kj_vierling"] then
			table.insert(data.raw["ammo-turret"]["kj_vierling"].attack_parameters.ammo_categories, "kj_2cmfv")
		end
		if data.raw["gun"]["kj_2cmfv"] then
			if data.raw["gun"]["kj_2cmfv"].attack_parameters.ammo_categories then
				table.insert(data.raw["gun"]["kj_2cmfv"].attack_parameters.ammo_categories, "kj_2cmfv_vierling")
			else
				local category = data.raw["gun"]["kj_2cmfv"].attack_parameters.ammo_category
				data.raw["gun"]["kj_2cmfv"].attack_parameters.ammo_categories = {category, "kj_2cmfv_vierling"}
			end
		end
	end

	for name, character in pairs(data.raw["character"]) do
		if character.trigger_target_mask ~= nil then
			table.insert(data.raw["character"][name].trigger_target_mask, "air-unit")
		else
			data.raw["character"][name].trigger_target_mask = {"air-unit", "ground-unit", "common"}
		end
	end


	--[[
	"erm_terran_exp/aerial_scout/",
	"erm_vanilla/construction-rob",
	"erm_terran_exp/science_vesse",
	"erm_marspeople/daimanji-thun",
	"erm_marspeople/daimanji-drop",
	"erm_marspeople/daimanji-purp",
	"erm_marspeople/eye-ufo-a/",
	"erm_marspeople/eye-ufo-b/",
	"erm_marspeople/aerial_scout/",
	"erm_marspeople/ufo/",
	]]

	local subStringList = {
		"erm_terran_exp/aeri",
		"erm_terran_exp/scie",
		"erm_vanilla/constru"
	}

	if mods["erm_marspeople"] then
		table.insert(subStringList, "erm_marspeople/daim")
		table.insert(subStringList, "erm_marspeople/eye-")
		table.insert(subStringList, "erm_marspeople/aeri")
		table.insert(subStringList, "erm_marspeople/ufo/")
	end

	for name, unit in pairs(data.raw["unit"]) do
		local subgroup = unit.subgroup
		local doIt = false

		if subgroup == "erm-dropship-enemies" or subgroup == "erm-flying-enemies" then
			doIt = true
		end

		if doIt == false then
			local subString = string.sub(name,1,19)

			for _, entry in ipairs(subStringList) do
				if subString == entry then
					doIt = true
					break
				end
			end
		end

		if doIt == true then
			if settingERM == true then
				unit.trigger_target_mask = {"air-unit"}
				--log('"air-unit" trigger_target_mask set on unit "'..name..'"')
			else
				if unit.trigger_target_mask ~= nil then
					table.insert(unit.trigger_target_mask, "air-unit")
				else
					unit.trigger_target_mask = {"air-unit", "ground-unit", "common"}
				end
				--log('"air-unit" trigger_target_mask assigned to unit "'..name..'"')
			end
		end
	end
end

if mods["kj_phalanx"] then
	local settingTM = settings.startup["kj_phalanx_target_mask"].value
	local settingERM = settings.startup["kj_phalanx_ermAA"].value

	if settings.startup["kj_phalanx_nonAA"].value == true then
		require("prototypes.phalanx")
	end

	data:extend({
		{
			type = "trigger-target-type",
			name = "air-unit",
		},
		{
			type = "trigger-target-type",
			name = "flying",
		},
	})

	data.raw["ammo-turret"]["kj_phalanx"].attack_target_mask = {"air-unit", "flying"}


	if settingTM == true then
		types = {}
		for name, _ in pairs(data.raw["trigger-target-type"]) do
			if name ~= "air-unit" and name ~= "flying" then
				table.insert(types, name)
				--log("Adding type: "..name)
			end
		end
		table.insert(types, "common")

		--Assigning Turrets attack_target_mask
		turretTypes = {"ammo", "electric", "fluid"}
		for _, turretType in pairs (turretTypes) do 
			for name, turret in pairs(data.raw[turretType.."-turret"]) do
				log("Name: "..name)
				if string.sub(name,1,3) ~= "kj_" then
					log("Mod foreign turret found")

					if turret.attack_target_mask ~= nil then
						if turret.attack_target_mask["air-unit"] ~= nil then
							data.raw[turretType.."-turret"][name].attack_target_mask["air-unit"] = false
						end

						if turret.attack_target_mask["flying"] ~= nil then
							data.raw[turretType.."-turret"][name].attack_target_mask["flying"] = false
						end

						log("Found a "..turretType.."-turret with air-unit/flying as attack_target_mask. Set to false.")
					else
						data.raw[turretType.."-turret"][name].attack_target_mask = types
						log("Standard masks applied")
					end
				end
			end
		end
	end

	for name, character in pairs(data.raw["character"]) do
		if character.trigger_target_mask ~= nil then
			table.insert(data.raw["character"][name].trigger_target_mask, "air-unit")
		else
			data.raw["character"][name].trigger_target_mask = {"air-unit", "ground-unit", "common"}
		end
	end


	--[[
	"erm_terran_exp/aerial_scout/",
	"erm_vanilla/construction-rob",
	"erm_terran_exp/science_vesse",
	"erm_marspeople/daimanji-thun",
	"erm_marspeople/daimanji-drop",
	"erm_marspeople/daimanji-purp",
	"erm_marspeople/eye-ufo-a/",
	"erm_marspeople/eye-ufo-b/",
	"erm_marspeople/aerial_scout/",
	"erm_marspeople/ufo/",
	]]

	local subStringList = {
		"erm_terran_exp/aeri",
		"erm_terran_exp/scie",
		"erm_vanilla/constru"
	}

	if mods["erm_marspeople"] then
		table.insert(subStringList, "erm_marspeople/daim")
		table.insert(subStringList, "erm_marspeople/eye-")
		table.insert(subStringList, "erm_marspeople/aeri")
		table.insert(subStringList, "erm_marspeople/ufo/")
	end

	for name, unit in pairs(data.raw["unit"]) do
		local subgroup = unit.subgroup
		local doIt = false
		--[[if subgroup ~= nil and subgroup == "erm-builder-enemies" then
			log("Builder: "..name)
		end]]

		if subgroup == "erm-dropship-enemies" or subgroup == "erm-flying-enemies" then
			doIt = true
		end

		if doIt == false then
			local subString = string.sub(name,1,19)

			for _, entry in ipairs(subStringList) do
				if subString == entry then
					doIt = true
					break
				end
			end
		end

		if doIt == true then
			if settingERM == true then
				unit.trigger_target_mask = {"air-unit"}
				--log('"air-unit" trigger_target_mask set on unit "'..name..'"')
			else
				if unit.trigger_target_mask ~= nil then
					table.insert(unit.trigger_target_mask, "air-unit")
				else
					unit.trigger_target_mask = {"air-unit", "ground-unit", "common"}
				end
				--log('"air-unit" trigger_target_mask assigned to unit "'..name..'"')
			end
		end
	end
end


local function changeRecipe(recipe, setting)
	if data.raw["recipe"][recipe] ~= nil then
		for _, ingredient in ipairs(data.raw["recipe"][recipe].ingredients) do
			if ingredient ~= nil and ingredient.amount ~= nil then
				ingredient.amount = ingredient.amount * settings.startup[setting].value
			end
		end
	else
		error('Recipe "'..recipe..'" not found! Pls notify the mod author!')
	end
end

for _, change in pairs(tables.recipeChanges) do
	if mods[change.modname] then
		if change.entries ~= nil then
			for _, entry in pairs(change.entries) do
				changeRecipe(entry.recipe, entry.setting)
			end
		else
			changeRecipe(change.recipe, change.setting)
		end
	end
end
