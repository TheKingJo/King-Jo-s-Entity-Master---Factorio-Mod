local tables = require("tables")

for mod, _ in pairs(tables.supportedMods) do
	if mods[mod] then
		log("mod "..mod.." found")
		if data.raw["equipment-grid"][mod] ~= nil then
			local categories = data.raw["equipment-grid"][mod].equipment_categories

			table.insert(categories, "kr-vehicle")
			table.insert(categories, "kr-vehicle-motor")
			table.insert(categories, "kr-vehicle-roboport")

			for i, name in ipairs(categories) do
				if name == "armor" then
					table.remove(categories, i)
					goto continue
				end
			end
			::continue::
		end
	end
end
