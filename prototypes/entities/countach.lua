local utils = require("utils")
local modname = "__kj_countach__"
local main_sounds = table.deepcopy(data.raw["car"]["car"].working_sound.main_sounds)
local setting = settings.startup["kj_countach_color"].value
main_sounds[2].sound = {filename = "__kj_countach__/sounds/engine.ogg", volume = 0.55}
main_sounds[2].activity_to_volume_modifiers.multiplier = 1.3
main_sounds[2].activity_to_volume_modifiers.minimum = 0.3
main_sounds[2].fade_in_ticks = 30

data:extend({
  {
    type = "car",
    name = "kj_countach",
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.3, -3}, {1.3, 3}},
    selection_box = {{-1.3, -3}, {1.3, 3}},
    stop_trigger = utils.brakes("car"),
    is_military_target = false,
    allow_remote_driving = false,

	  energy_source =
    {
	    type = "burner",
      fuel_categories = {"kj_gas_can"},
      effectivity = 1,
      fuel_inventory_size = 2,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0.5, 2.3},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-0.5, 2.3},
          starting_frame = 0,
          starting_frame_deviation = 60,
        },
      }
    },
    light =
    {
      utils.lights(3,  2, {x = -1, y =-2.5}),
      utils.lights(3,  2, {x =  1, y =-2.5}),
      utils.lights(3,1.5, {x = -1, y = 0.5}, 0.3, 0.5, {r = 1, g = 0, b = 0}),
      utils.lights(3,1.5, {x =  1, y = 0.5}, 0.3, 0.5, {r = 1, g = 0, b = 0}),
    },
    light_animation = {
      layers = {
        utils.layerMaker(modname, "", "countach", 600, {1, 2}, {8, 8}, 2, 3), --light
        --util.empty_animation(2)
      }
    },
    animation = {
      layers = {
        utils.layerMaker(modname, "", "countach", 600, {1, 2}, {8, 8}, 2, 1), --normal
        utils.layerMaker(modname, "", "countach", 600, {1, 2}, {8, 8}, 2, 2), --shadow
        utils.layerMaker(modname, "", "countach_wheel", 600, {2, 1}, {2, 8}, 16, 1), --wheel
        --util.empty_animation(2)
        --utils.layerMaker(modname, "", "countach_ground_mask", 1000, {1, 2}, {8, 8}, 2, 3,nil,nil,nil,nil,nil,true)
      }
    },
    working_sound =
    {
      main_sounds = main_sounds,
      activate_sound = {filename = "__kj_countach__/sounds/engine-start.ogg", volume = 0.4},
      deactivate_sound = {filename = "__kj_countach__/sounds/engine-stop.ogg", volume = 0.4},
    },
  },
})

if setting == true then
  table.insert(data.raw["car"]["kj_countach"].light_animation.layers,
    utils.layerMaker(modname, "", "countach_ground_mask", 1000, {1, 2}, {8, 8}, 2, 3,nil,nil,nil,nil,nil,true))

  table.insert(data.raw["car"]["kj_countach"].animation.layers,
    utils.layerMaker(modname, "", "countach_mask", 600, {1, 2}, {8, 8}, 2, 1,nil,nil,nil,nil,nil,true,true))
else
  table.insert(data.raw["car"]["kj_countach"].light_animation.layers,
    utils.layerMaker(modname, "", "countach_ground", 1000, {1, 2}, {8, 8}, 2, 3))
end

log(serpent.block(data.raw["car"]["kj_countach"].light_animation.layers))