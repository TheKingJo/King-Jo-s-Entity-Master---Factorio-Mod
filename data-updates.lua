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
