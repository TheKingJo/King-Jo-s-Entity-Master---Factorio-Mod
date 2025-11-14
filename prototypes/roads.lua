if data.raw["straight-rail"]["kj_road_rail_straight"] ~= nil then
	return
end

local sounds = require("__base__/prototypes/entity/sounds.lua")
local hit_effects = require ("__base__/prototypes/entity/hit-effects.lua")
local emptySpriteRail = util.empty_sprite()
local resistances = {
	{
		type = "fire",
		decrease = 100,
		percent = 100,
	},
	{
		type = "acid",
		decrease = 100,
		percent = 100,
	},
}


local rail_8shifts_vector = function(dx, dy)
	return {
		{  dx,  dy },
		{ -dx,  dy },
		{ -dy,  dx },
		{ -dy, -dx },
		{ -dx, -dy },
		{  dx, -dy },
		{  dy, -dx },
		{  dy,  dx }
	}
end

local function make_new_rail_pictures(keys, elems)
	local function make_sprite_definition(filename, elem, key, variation_count)
		return
		{
			filename = filename,
			priority = elem.priority or "extra-high",
			flags = elem.mipmap and { "trilinear-filtering" } or { "low-object" },
			draw_as_shadow = elem.draw_as_shadow,
			allow_forced_downscale = elem.allow_forced_downscale,
			width = key[3][1],
			height = key[3][2],
			x = key[2][1],
			y = key[2][2],
			scale = 0.5;
			shift = util.by_pixel(key[4][1], key[4][2]),
			variation_count = variation_count,
			usage = "rail"
		}
	end

	local res = {}
	for _, key in ipairs(keys) do
		local part = {}
		local variation_count = key[5] or 1

		for _, elem in ipairs(elems) do
			local layers = nil
			local variations = variation_count;
			layers = make_sprite_definition(elem[2], elem, key, variations)

			if (elem[1] ~= nil) then
				part[elem[1]] = layers
			else
				part = layers
			end
		end

	 	res[key[1]] = part
	end
	return res
end

local function rail_pictures(rail_type)
	local keys
	local NOT_USED_POSITION = {0, 0}
	local NOT_USED_SIZE = {1, 1}
	local NOT_USED_SHIFT = {0, 0}
	if rail_type == "straight" then
		keys =
		{
			{"north",     {      0, 1 * 384}, {384, 384}, {0,0}, 1},
			{"northeast", {4 * 384, 1 * 384}, {384, 384}, {0,0}, 1},
			{"east",      {      0,       0}, {384, 384}, {0,0}, 1},
			{"southeast", {4 * 384,       0}, {384, 384}, {0,0}, 1},
			{"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
		}
	elseif rail_type == "half-diagonal" then
		keys =
		{
			{"north",     {6 * 384,       0}, {384, 384}, {0,0}, 1},
			{"northeast", {2 * 384, 1 * 384}, {384, 384}, {0,0}, 1},
			{"east",      {6 * 384, 1 * 384}, {384, 384}, {0,0}, 1},
			{"southeast", {2 * 384,       0}, {384, 384}, {0,0}, 1},
			{"south",     NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"southwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"west",      NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0},
			{"northwest", NOT_USED_POSITION, NOT_USED_SIZE, NOT_USED_SHIFT, 0}
		}
	elseif rail_type == "curved-a" then
		keys =
		{
			{"north",     {7 * 384,       0}, {384, 384}, {  0,-16}, 1},
			{"northeast", {1 * 384, 3 * 384}, {384, 384}, {  0,-16}, 1},
			{"east",      {7 * 384, 1 * 384}, {384, 384}, { 16,  0}, 1},
			{"southeast", {1 * 384,       0}, {384, 384}, { 16,  0}, 1},
			{"south",     {7 * 384, 2 * 384}, {384, 384}, {  0, 16}, 1},
			{"southwest", {1 * 384, 1 * 384}, {384, 384}, {  0, 16}, 1},
			{"west",      {7 * 384, 3 * 384}, {384, 384}, {-16,  0}, 1},
			{"northwest", {1 * 384, 2 * 384}, {384, 384}, {-16,  0}, 1},
		}
	elseif rail_type == "curved-b" then
		keys =
		{
			{"north",     {5 * 384,       0}, {384, 384}, {-16,  0}, 1},
			{"northeast", {3 * 384, 3 * 384}, {384, 384}, { 16,  0}, 1},
			{"east",      {5 * 384, 1 * 384}, {384, 384}, {  0,-16}, 1},
			{"southeast", {3 * 384,       0}, {384, 384}, {  0, 16}, 1},
			{"south",     {5 * 384, 2 * 384}, {384, 384}, { 16,  0}, 1},
			{"southwest", {3 * 384, 1 * 384}, {384, 384}, {-16,  0}, 1},
			{"west",      {5 * 384, 3 * 384}, {384, 384}, {  0, 16}, 1},
			{"northwest", {3 * 384, 2 * 384}, {384, 384}, {  0,-16}, 1},
		}
	end
	local elems = {{"metals", "__kj_vehicles__/graphics/entity/roads.png"}}

	local res = make_new_rail_pictures(keys, elems)
	res["rail_endings"] =
	{
		north = emptySpriteRail,
		north_east = emptySpriteRail,
		north_north_east = emptySpriteRail,
		north_north_west = emptySpriteRail,
		north_west = emptySpriteRail,

		east = emptySpriteRail,
		east_north_east = emptySpriteRail,
		east_south_east = emptySpriteRail,

		south = emptySpriteRail,
		south_east = emptySpriteRail,
		south_south_east = emptySpriteRail,
		south_south_west = emptySpriteRail,
		south_west = emptySpriteRail,

		west = emptySpriteRail,
		west_north_west = emptySpriteRail,
		west_south_west = emptySpriteRail,
	}
	res["render_layers"] = {
		metal = "rail-stone-path-lower",
		screw = "rail-screw",
		stone_path = "rail-stone-path",
		stone_path_lower = "rail-stone-path-lower",
		tie = "rail-tie"
	}
	return res
end


data:extend({
	{
		type = "recipe",
		name = "kj_road_rails",
		enabled = false,
		energy_required = 0.5,
		ingredients =
		{
			{type = "item", name = "stone-brick", amount = 5},
			{type = "item", name = "concrete", amount = 3},
			{type = "fluid", name = "water", amount = 100}
		},
		category = "crafting-with-fluid",
		results = {{type = "item", name = "kj_road_rails", amount = 1}},
	},
	{
		type = "rail-planner",
		name = "kj_road_rails",
		icon = "__kj_vehicles__/graphics/road.png",
		icon_size = 128,
		subgroup = "transport",
		order = "1[civil]-y4",
		place_result = "kj_road_rail_straight",
		stack_size = 100,
		weight = 10*1000,
		rails =
		{
			"kj_road_rail_straight",
			"kj_road_rail_half_diagonal",
			"kj_road_rail_curved_rail_a",
			"kj_road_rail_curved_rail_b",
		},
		--rails = {"kj_road_rail_straight", "kj_road_rail_curved"},
	},

	{
		type = "straight-rail",
		name = "kj_road_rail_straight",
		order = "1[civil]-i5",
		icon = "__kj_vehicles__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-1, -1}, {1, 1}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_road_rails", count = 1},
		max_health = 200,
		corpse = "medium-remnants",
		dying_explosion = {name = "rail-explosion"},
		resistances = resistances,
		damaged_trigger_effect = hit_effects.wall(),
		pictures = rail_pictures("straight"),
		placeable_by = {item = "kj_road_rails", count = 1},
		walking_sound = sounds.rails,
		extra_planner_goal_penalty = -4,
		factoriopedia_alternative = "kj_road_rail_straight"
	},
	{
		type = "half-diagonal-rail",
		name = "kj_road_rail_half_diagonal",
		order = "1[civil]-i6",
		deconstruction_alternative = "kj_road_rail_straight",
		icon = "__kj_vehicles__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-0.75, -2.236}, {0.75, 2.236}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
		tile_height = 2,
		extra_planner_goal_penalty = -4,
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_road_rails", count = 2},
		max_health = 200,
		corpse = "medium-remnants",
		dying_explosion =
		{
			{name = "rail-explosion", offset = {0.9, 2.2}},
			{name = "rail-explosion"},
			{name = "rail-explosion", offset = {-1.2, -2}}
		},
		resistances = resistances,
		-- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
		damaged_trigger_effect = hit_effects.wall(),
		pictures = rail_pictures("half-diagonal"),
		placeable_by = {item = "kj_road_rails", count = 2},
		walking_sound = sounds.rails,
		extra_planner_penalty = 0,
		factoriopedia_alternative = "kj_road_rail_straight"
	},
	{
		type = "curved-rail-a",
		name = "kj_road_rail_curved_rail_a",
		order = "1[civil]-i7",
		deconstruction_alternative = "kj_road_rail_straight",
		icon = "__kj_vehicles__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-0.75, -2.516}, {0.75, 2.516}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_road_rails", count = 3},
		max_health = 200,
		corpse = "medium-remnants",
		dying_explosion =
		{
			{name = "rail-explosion", offset = {0.9, 2.2}},
			{name = "rail-explosion"},
			{name = "rail-explosion", offset = {-1.2, -2}}
		},
		resistances = resistances,
		-- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
		damaged_trigger_effect = hit_effects.wall(),
		pictures = rail_pictures("curved-a"),
		placeable_by = {item = "kj_road_rails", count = 3},
		walking_sound = sounds.rails,
		extra_planner_penalty = 0.5,
		deconstruction_marker_positions = rail_8shifts_vector(-0.248, -0.533),
		factoriopedia_alternative = "kj_road_rail_straight"
	},
	{
		type = "curved-rail-b",
		name = "kj_road_rail_curved_rail_b",
		order = "1[civil]-i8",
		deconstruction_alternative = "kj_road_rail_straight",
		icon = "__kj_vehicles__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-0.75, -2.441}, {0.75, 2.441}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_road_rails", count = 3},
		max_health = 200,
		corpse = "medium-remnants",
		dying_explosion =
		{
			{name = "rail-explosion", offset = {0.9, 2.2}},
			{name = "rail-explosion"},
			{name = "rail-explosion", offset = {-1.2, -2}}
		},
		resistances = resistances,
		-- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
		damaged_trigger_effect = hit_effects.wall(),
		pictures = rail_pictures("curved-b"),
		placeable_by = {item = "kj_road_rails", count = 3},
		walking_sound = sounds.rails,
		extra_planner_penalty = 0.5,
		deconstruction_marker_positions = rail_8shifts_vector(-0.309, -0.155),
		factoriopedia_alternative = "kj_road_rail_straight"
	},
})


data:extend({
	{
		type = "legacy-straight-rail",
		name = "kj_road_rail_straight_legacy",
		icon = "__kj_vehicles__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-1, -1}, {1, 1}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_road_rails"},
		max_health = 100,
		corpse = "medium-remnants",
		dying_explosion = "rail-explosion",
		resistances =
		{
		  {
			type = "fire",
			decrease = 100,
			percent = 100,
		  },
		  {
			type = "acid",
			decrease = 100,
			percent = 100,
		  },
		},
		map_color = {r = 1, g = 1, b = 1, a = 1},
		-- collision box is hardcoded for rails as they need to be different for different orientations (diagonal or straight) and to
		-- avoid unexpected changes in the way rail blocks are merged
		selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
		damaged_trigger_effect = hit_effects.wall(),
		pictures = {
			north = {
				metals = {
					width = 128,
					height = 128,
					filename = "__kj_vehicles__/graphics/entity/straight-rail/north.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			northeast = {
				metals = {
					width = 192,
					height = 192,
					filename = "__kj_vehicles__/graphics/entity/straight-rail/northeast.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			northwest = {
				metals = {
					width = 192,
					height = 192,
					filename = "__kj_vehicles__/graphics/entity/straight-rail/northwest.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			east = {
				metals = {
					width = 128,
					height = 128,
					filename = "__kj_vehicles__/graphics/entity/straight-rail/east.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			south = {
				metals = {
					width = 128,
					height = 128,
					filename = "__kj_vehicles__/graphics/entity/straight-rail/north.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			southeast = {
				metals = {
					width = 192,
					height = 192,
					filename = "__kj_vehicles__/graphics/entity/straight-rail/southeast.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			southwest = {
				metals = {
					width = 192,
					height = 192,
					filename = "__kj_vehicles__/graphics/entity/straight-rail/southwest.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			west = {
				metals = {
					width = 128,
					height = 128,
					filename = "__kj_vehicles__/graphics/entity/straight-rail/east.png",
					scale = 0.5,
					shift = {0, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			rail_endings = {
				north = emptySpriteRail,
				north_east = emptySpriteRail,
				north_north_east = emptySpriteRail,
				north_north_west = emptySpriteRail,
				north_west = emptySpriteRail,

				east = emptySpriteRail,
				east_north_east = emptySpriteRail,
				east_south_east = emptySpriteRail,

				south = emptySpriteRail,
				south_east = emptySpriteRail,
				south_south_east = emptySpriteRail,
				south_south_west = emptySpriteRail,
				south_west = emptySpriteRail,

				west = emptySpriteRail,
				west_north_west = emptySpriteRail,
				west_south_west = emptySpriteRail,
			},
			render_layers = {
				metal = "rail-metal",
				screw = "rail-screw",
				stone_path = "rail-stone-path",
				stone_path_lower = "rail-stone-path-lower",
				tie = "rail-tie"
			},
		},
		placeable_by = {item = "kj_road_rails", count = 1},
		walking_sound = sounds.rails,
	},
	{
		type = "legacy-curved-rail",
		name = "kj_road_rail_curved_legacy",
		icon = "__kj_vehicles__/graphics/road.png",
		icon_size = 128,
		hidden = true,
		collision_box = {{-2, -2}, {2, 2}}, -- has custommly generated box, but the prototype needs something that is used to generate building smokes
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 0.2, result = "kj_road_rails", count = 4},
		max_health = 200,
		corpse = "medium-remnants",
		dying_explosion =
		{
			{
				name = "rail-explosion",
				offset = {0.9, 2.2}
			},
			{
				name = "rail-explosion"
			},
			{
				name = "rail-explosion",
				offset = {-1.2, -2}
			}
		},
		resistances =
		{
			{
				type = "fire",
				decrease = 100,
				percent = 100,
			},
			{
				type = "acid",
				decrease = 100,
				percent = 100,
			},
		},
		map_color = {r = 0.84, g = 0.84, b = 0.84, a = 1},
		-- collision box is hardcoded for rails as to avoid unexpected changes in the way rail blocks are merged
		selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
		damaged_trigger_effect = hit_effects.wall(),
		pictures = {
			north = {
				metals = {
					width = 320,
					height = 512,
					filename = "__kj_vehicles__/graphics/entity/curved-rail/north.png",
					scale = 0.5,
					shift = {0.5, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			northeast = {
				metals = {
					width = 320,
					height = 512,
					filename = "__kj_vehicles__/graphics/entity/curved-rail/northeast.png",
					scale = 0.5,
					shift = {-0.5, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			northwest = {
				metals = {
					width = 512,
					height = 320,
					filename = "__kj_vehicles__/graphics/entity/curved-rail/northwest.png",
					scale = 0.5,
					shift = {0, 0.5},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			east = {
				metals = {
					width = 512,
					height = 320,
					filename = "__kj_vehicles__/graphics/entity/curved-rail/east.png",
					scale = 0.5,
					shift = {0, 0.5},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			south = {
				metals = {
					width = 320,
					height = 512,
					filename = "__kj_vehicles__/graphics/entity/curved-rail/south.png",
					scale = 0.5,
					shift = {-0.5, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			southeast = {
				metals = {
					width = 512,
					height = 320,
					filename = "__kj_vehicles__/graphics/entity/curved-rail/southeast.png",
					scale = 0.5,
					shift = {0, -0.5},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			southwest = {
				metals = {
					width = 320,
					height = 512,
					filename = "__kj_vehicles__/graphics/entity/curved-rail/southwest.png",
					scale = 0.5,
					shift = {0.5, 0},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			west = {
				metals = {
					width = 512,
					height = 320,
					filename = "__kj_vehicles__/graphics/entity/curved-rail/west.png",
					scale = 0.5,
					shift = {0, -0.5},
				},
				backplates 	= emptySpriteRail,
				ties 		= emptySpriteRail,
				stone_path  = emptySpriteRail,
			},
			rail_endings = {
				north = emptySpriteRail,
				north_east = emptySpriteRail,
				north_north_east = emptySpriteRail,
				north_north_west = emptySpriteRail,
				north_west = emptySpriteRail,

				east = emptySpriteRail,
				east_north_east = emptySpriteRail,
				east_south_east = emptySpriteRail,

				south = emptySpriteRail,
				south_east = emptySpriteRail,
				south_south_east = emptySpriteRail,
				south_south_west = emptySpriteRail,
				south_west = emptySpriteRail,

				west = emptySpriteRail,
				west_north_west = emptySpriteRail,
				west_south_west = emptySpriteRail,
			},
			render_layers = {
				metal = "rail-metal",
				screw = "rail-screw",
				stone_path = "rail-stone-path",
				stone_path_lower = "rail-stone-path-lower",
				tie = "rail-tie"
			},
		},
		placeable_by = {item = "kj_road_rails", count = 4},
		walking_sound = sounds.rails
	},
})

