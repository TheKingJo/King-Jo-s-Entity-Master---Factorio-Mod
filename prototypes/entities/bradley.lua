local utils = require("utils")
local modname = "__kj_bradley__"
local main_sounds = table.deepcopy(utils.tank_main_sounds)
main_sounds[2].activity_to_volume_modifiers.multiplier = 6

data:extend({
  {
    type = "car",
    name = "kj_bradley",
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
	  equipment_grid = "kj_bradley",
    collision_box = {{-1.5, -2.5}, {1.5, 2.5}},
    selection_box = {{-1.5, -2}, {1.5, 2}},
    sticker_box = {{-1, -1}, {1, 1}},
    stop_trigger = utils.brakes("tank"),
    tank_driving = true,
    turret_return_timeout = 300,
	  has_belt_immunity = true,
    guns = {"kj_m242", "kj_m240", "kj_tow"},
    is_military_target = true,
    allow_remote_driving = true,

	  energy_source =
    {
      type = "burner",
      fuel_categories = {"kj_gas_can"},
      effectivity = 2,
      fuel_inventory_size = 3,
    },
    light =
    {
      utils.lights(3, 2, {x = -0.9, y =-3}),
      utils.lights(3, 2, {x =  0.9, y =-3}),
      utils.lights(3, 2, {x =  1.2, y = 3}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3, 2, {x = -1.2, y = 3}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
    },
    light_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "bradley", 512, {1, 2}, {8, 8}, 2, 3, nil),
	    },
	  },
    animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "bradley", 512, {2, 1}, {2, 8}, 16, 1, nil),
        utils.layerMaker(modname, "", "bradley", 544, {1, 2}, {8, 8},  2, 2, {0.5, 0.5}),
        utils.layerMaker(modname, "", "bradley_mask", 512, {1,2},{8,8},2, 1,nil,nil,nil,nil,nil,true,true),
      }
    },
	  turret_animation =
    {
      layers =
      {
        utils.layerMaker(modname, "", "bradley", 512, {1, 1}, {8, 8}, 2, 4, nil),
        utils.layerMaker(modname, "", "bradley", 544, {1, 1}, {8, 8}, 2, 5, {0.5, 0.5}),
      }
    },
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
        volume = 0.4
      }
    },
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__base__/sound/fight/tank-engine-start.ogg", volume = 0.37},
      deactivate_sound = {filename = "__base__/sound/fight/tank-engine-stop.ogg", volume = 0.37},
    },
    open_sound = {filename = "__base__/sound/fight/tank-door-open.ogg", volume = 0.48},
    close_sound = {filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43},
  },
})