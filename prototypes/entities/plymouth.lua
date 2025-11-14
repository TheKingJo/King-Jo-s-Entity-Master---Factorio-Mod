local utils = require("utils")
local modname = "__kj_plymouth__"
local main_sounds = table.deepcopy(data.raw["car"]["car"].working_sound.main_sounds)
local setting = settings.startup["kj_plymouth_color"].value
main_sounds[2].sound = {filename = "__kj_plymouth__/sounds/engine.ogg", volume = 0.4}
main_sounds[2].activity_to_volume_modifiers.multiplier = 1
main_sounds[2].activity_to_volume_modifiers.offset = 2

data:extend({
  {
    type = "car",
    name = "kj_plymouth",
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.1, -3}, {1.1, 3}},
    selection_box = {{-0.9, -2}, {0.9, 2}},
    stop_trigger = utils.brakes("car"),
    is_military_target = false,
    allow_remote_driving = false,

	  energy_source =
    {
	    type = "burner",
      fuel_categories = {"kj_gas_can"},
      effectivity = 1,
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0.6, 2.5},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-0.6, 2.5},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
      }
    },
    light =
    {
      utils.lights(3,   2, {x =-0.9, y =-2}, nil, nil, {r = 1, g = 211/255, b = 165/255}),
      utils.lights(3,   2, {x = 0.9, y =-2}, nil, nil, {r = 1, g = 211/255, b = 165/255}),
      utils.lights(3, 1.5, {x =-0.9, y = 2}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3, 1.5, {x = 0.9, y = 2}, 0.2, 0.5, {r = 1, g = 0, b = 0}),
    },
    light_animation = {
      layers = {
        utils.layerMaker(modname, "", "plymouth", 624, {1, 2}, {8, 8}, 2, 3), --light
      },
    },
    animation =  {
      layers = {
        utils.layerMaker(modname, "", "plymouth", 624, {1, 2}, {8, 8}, 2, 1), --normal
        utils.layerMaker(modname, "", "plymouth", 624, {1, 2}, {8, 8}, 2, 2), --shadow
        utils.layerMaker(modname, "", "plymouth_wheel", 624, {2, 1}, {2, 8}, 16, 1), --wheel
      }
    },
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__kj_plymouth__/sounds/engine-start.ogg", volume = 0.4},
      deactivate_sound = {filename = "__kj_plymouth__/sounds/engine-stop.ogg", volume = 0.4},
    },
  },
})

if setting == true then
    table.insert(data.raw["car"]["kj_plymouth"].animation.layers,
      utils.layerMaker(modname, "", "plymouth_mask", 624, {1, 2}, {8, 8}, 2, 1,nil,nil,nil,nil,nil,true,true))
end
