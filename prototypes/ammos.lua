local item_sounds = require("__base__.prototypes.item_sounds")
local ammos = require("tables").ammos

for name, _ in pairs(ammos.stackSize) do
    local ammo = data.raw["ammo"][name]
    if ammo ~= nil then
        ammo.subgroup = "ammo"
        ammo.stack_size = ammos.stackSize[name]
        ammo.weight = ammos.weight[name] * 1000
        ammo.icon_size = ammos.iconSize[name] or 256
        ammo.magazine_size = ammos.magSize[name] or 1

        local category = ammos.category[name]
        if category ~= nil then
            if  category == "bullet" then
                ammo.inventory_move_sound = item_sounds.ammo_small_inventory_move
                ammo.pick_sound = item_sounds.ammo_small_inventory_pickup
                ammo.drop_sound = item_sounds.ammo_small_inventory_move
            else
                ammo.inventory_move_sound = item_sounds.artillery_large_inventory_move
                ammo.pick_sound = item_sounds.artillery_large_inventory_pickup
                ammo.drop_sound = item_sounds.artillery_large_inventory_move
            end
        else
            ammo.inventory_move_sound = item_sounds.ammo_large_inventory_move
            ammo.pick_sound = item_sounds.ammo_large_inventory_pickup
            ammo.drop_sound = item_sounds.ammo_large_inventory_move
        end
    end
end
