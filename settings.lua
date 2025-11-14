local modTable = require("tables").balancedMods

data:extend({
	{
		type = "bool-setting",
		name = "kj_modCategory",
		setting_type = "startup",
        default_value = false,
		order = "0-a",
	},
})

if mods["kj_phalanx"] or mods["kj_vierling"] then
	data:extend({
		{
			type = "bool-setting",
			name = "kj_AA_target_mask",
			setting_type = "startup",
			default_value = true,
			order = "0-kj_AA_target_mask",
		},
		{
			type = "bool-setting",
			name = "kj_AA_ermAA",
			setting_type = "startup",
			default_value = false,
			order = "0-kj_AA_ermAA",
		},
	})
end

if mods["kj_phalanx"] then
	data:extend({
		{
			type = "int-setting",
			name = "kj_phalanx_cost_setting_multiplicator",
			setting_type = "startup",
			default_value = 1,
			order = "kj_phalanx_cost_setting_multiplicator",
		},
		{
			type = "int-setting",
			name = "kj_phalanx_volume",
			setting_type = "startup",
			default_value = 100,
			minimum_value = 0,
			maximum_value = 100,
			order = "kj_phalanx_volume",
		},
		{
			type = "bool-setting",
			name = "kj_phalanx_nonAA",
			setting_type = "startup",
			default_value = false,
			order = "kj_phalanx_nonAA",
		},
	})
end

if mods["kj_vierling"] then
	data:extend({
		{
			type = "int-setting",
			name = "kj_vierling_cost_setting_multiplicator",
			setting_type = "startup",
			default_value = 1,
			order = "kj_vierling_cost_setting_multiplicator",
		},
		{
			type = "bool-setting",
			name = "kj_vierling_nonAA",
			setting_type = "startup",
			default_value = false,
			order = "kj_vierling_nonAA",
		},
	})
end

local function settingMaker(name)
	data:extend({
		{
			type = "int-setting",
			name = name.."-hp_modifier",
			setting_type = "startup",
			default_value = 100,
			minimum_value = 1,
			maximum_value = 100,
			localised_name = {"", {"entity-name."..name}, {"mod-setting-name.hp_modifier"}},
			localised_description = {"", {"mod-setting-description.hp_modifier"}},
			order = name.."_hp_modifier",
		}
	})
	--log("HP modifier for "..name.." added.")

	data:extend({
		{
			type = "int-setting",
			name = name.."-resistance_modifier",
			setting_type = "startup",
			default_value = 100,
			minimum_value = 0,
			maximum_value = 100,
			localised_name = {"", {"entity-name."..name}, {"mod-setting-name.resistance_modifier"}},
			localised_description = {"", {"mod-setting-description.resistance_modifier"}},
			order = name.."_resistance_modifier",
		}
	})
	--log("Resistance modifier for "..name.." added.")
end


for name, mod in pairs(modTable) do
	if mods[name] then
		log(name.." exists")
		--log("mod: "..serpent.block(mod))

		if mod ~= nil then
			settingMaker(name)
		end
	end
end
