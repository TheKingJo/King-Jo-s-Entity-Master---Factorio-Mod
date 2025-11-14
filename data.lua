local tables = require("tables")
local folders = {
	"ammo",
	"entities",
	"recipes",
}

require("prototypes.grids")
require("prototypes.items")
require("prototypes.categories")(tables.categories)
require("prototypes.technologies")
require("prototypes.tech_upgrades")

for modname, mod in pairs(tables.supportedMods) do
	if mods[modname] then
		log("Mod "..modname.." exists.")
		for _,folder in pairs(folders) do
			require("prototypes."..folder.."."..mod.name)
		end
	else
		log("Mod "..modname.." isnt enabled!")
	end
end

require("prototypes.entities")


--Additional Edits
if mods["kj_ray"] then
	require("prototypes.ray")
end
