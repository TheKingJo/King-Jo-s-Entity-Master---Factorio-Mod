local tables = {}
tables.supportedMods = {
	kj_2a6 = 			{name = "2a6", 			weight = 5,		order = "2[military]-p5"},
	kj_40kbaneblade = 	{name = "baneblade", 	weight = 3,		order = "2[military]-40k-3"},
	kj_40klemanruss = 	{name = "lemanruss", 	weight = 2,		order = "2[military]-40k-2"},
	kj_40kpredator = 	{name = "predator", 	weight = 2,		order = "2[military]-40k-1"},
	kj_maustank = 		{name = "maustank", 	weight = 4,		order = "2[military]-p4"},
	kj_pak = 			{name = "pak", 			weight = 5,		order = "2[military]-p1"},
	kj_panzer4 = 		{name = "panzer4", 		weight = 4,		order = "2[military]-p2"},
	kj_rex = 			{name = "rex", 			weight = 2,		order = "2[military]-ra"},
	kj_rattetank = 		{name = "ratte", 		weight = 4,		order = "2[military]-p6"},
	kj_ray = 			{name = "ray", 			weight = 4,		order = "2[military]-re"},
	kj_swspeeder = 		{name = "swspeeder", 	weight = 1,		order = "2[military]-s"},
	kj_wirbelwind = 	{name = "wirbelwind", 	weight = 2,		order = "2[military]-p3"},

	kj_aventador = 		{name = "aventador", 	weight = 1,		order = "1[civil]-d"},
	kj_bulldozer = 		{name = "bulldozer", 	weight = 1,		order = "1[civil]-f"},
	kj_cybertruck = 	{name = "cybertruck", 	weight = 5,		order = "1[civil]-c0"},
	kj_delorean = 		{name = "delorean", 	weight = 1,		order = "1[civil]-a"},
	kj_firetruck = 		{name = "firetruck", 	weight = 1,		order = "1[civil]-g"},
	kj_fordmustang = 	{name = "mustang", 		weight = 1,		order = "1[civil]-b"},
	kj_gigahorse = 		{name = "gigahorse", 	weight = 1,		order = "1[civil]-e"},
	kj_utilitarian = 	{name = "utilitarian", 	weight = 1,		order = "1[civil]-h"},
}

tables.recipeChanges = {
	{modname = "modname", entries = {
			{recipe = "test", setting = "test"},
		}
	},
	
	{modname = "kj_2a6", entries = {
			{recipe = "kj_2a6", setting = "kj_2a6_cost_setting_multiplicator"},
			{recipe = "kj_rh120_penetration", setting = "kj_2a6ammo_cost_setting_multiplicator"},
			{recipe = "kj_rh120_highexplosive", setting = "kj_2a6ammo_cost_setting_multiplicator"},
			{recipe = "kj_rh120_penetration_highexplosive", setting = "kj_2a6ammo_cost_setting_multiplicator"},
			{recipe = "kj_rh120_canister", setting = "kj_2a6ammo_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_40kbaneblade", entries = {
			{recipe = "kj_40kbaneblade", setting = "kj_40kbaneblade_cost_setting_multiplicator"},
			{recipe = "kj_baneblade_normal", setting = "kj_40kbanebladeammo_cost_setting_multiplicator"},
			{recipe = "kj_baneblade_artillery", setting = "kj_40kbanebladeammo_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_40klemanruss", entries = {
			{recipe = "kj_40klemanruss", setting = "kj_40klemanruss_cost_setting_multiplicator"},
			{recipe = "kj_lemanruss_normal", setting = "kj_40klemanrussammo_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_40kpredator", entries = {
			{recipe = "kj_40kpredator", setting = "kj_40kpredator_cost_setting_multiplicator"},
			{recipe = "kj_predator_normal", setting = "kj_40kpredatorammo_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_maustank", entries = {
			{recipe = "kj_maustank", setting = "kj_maustank_cost_setting_multiplicator"},
			{recipe = "kj_120kwk_penetration", setting = "kj_maustankammo_cost_setting_multiplicator"},
			{recipe = "kj_120kwk_highexplosive", setting = "kj_maustankammo_cost_setting_multiplicator"},
			{recipe = "kj_120kwk_penetration_highexplosive", setting = "kj_maustankammo_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_pak", entries = {
			{recipe = "kj_pak", setting = "kj_pak_cost_setting_multiplicator"},
			{recipe = "kj_pak_turret", setting = "kj_pak_cost_setting_multiplicator"},
			{recipe = "kj_pak_penetration", setting = "kj_pakammo_cost_setting_multiplicator"},
			{recipe = "kj_pak_highexplosive", setting = "kj_pakammo_cost_setting_multiplicator"},
			{recipe = "kj_pak_incendiary", setting = "kj_pakammo_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_panzer4", entries = {
			{recipe = "kj_panzer4", setting = "kj_panzer4_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_penetration", setting = "kj_panzer4ammo_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_highexplosive", setting = "kj_panzer4ammo_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_penetration_highexplosive", setting = "kj_panzer4ammo_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_rex", entries = {
			{recipe = "kj_rex", setting = "kj_rex_cost_setting_multiplicator"},
			{recipe = "kj_rex_normal", setting = "kj_rexammo_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_rattetank", entries = {
			{recipe = "kj_rattetank", setting = "kj_rattetank_cost_setting_multiplicator"},
			{recipe = "kj_280SKC34_penetration", setting = "kj_rattetankammunition_cost_setting_multiplicator"},
			{recipe = "kj_280SKC34_highexplosive", setting = "kj_rattetankammunition_cost_setting_multiplicator"},
			{recipe = "kj_280SKC34_incendiary", setting = "kj_rattetankammunition_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_ray", entries = {
			{recipe = "kj_ray", setting = "kj_ray_cost_setting_multiplicator"},
			{recipe = "kj_ray_small", setting = "kj_ray_cost_setting_multiplicator"},
			{recipe = "kj_ray_normal", setting = "kj_rayammo_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_swspeeder", recipe = "kj_swspeeder", setting = "kj_swspeeder_cost_setting_multiplicator"},
	
	{modname = "kj_wirbelwind", entries = {
			{recipe = "kj_wirbelwind", setting = "kj_wirbelwind_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_penetration", setting = "kj_wirbelwindammo_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_highexplosive", setting = "kj_wirbelwindammo_cost_setting_multiplicator"},
			{recipe = "kj_75kwk40_penetration_highexplosive", setting = "kj_wirbelwindammo_cost_setting_multiplicator"},
		}
	},
	
	{modname = "kj_aventador", recipe = "kj_aventador", setting = "kj_aventador_cost_setting_multiplicator"},
	{modname = "kj_bulldozer", recipe = "kj_bulldozer", setting = "kj_bulldozer_cost_setting_multiplicator"},
	{modname = "kj_cybertruck", recipe = "kj_cybertruck", setting = "kj_cybertruck_cost_setting_multiplicator"},
	{modname = "kj_delorean", recipe = "kj_delorean", setting = "kj_delorean_cost_setting_multiplicator"},
	{modname = "kj_firetruck", recipe = "kj_firetruck", setting = "kj_firetruck_cost_setting_multiplicator"},
	{modname = "kj_fordmustang", recipe = "kj_fordmustang", setting = "kj_fordmustang_cost_setting_multiplicator"},
	{modname = "kj_gigahorse", recipe = "kj_gigahorse", setting = "kj_gigahorse_cost_setting_multiplicator"},
	{modname = "kj_utilitarian", recipe = "kj_utilitarian", setting = "kj_utilitarian_cost_setting_multiplicator"},
}

tables.categories = {
	{modname = "kj_cybertruck",		name = "kj_el_car_fuel",                                type = "fuel-category"},

	{modname = "kj_2a6",            name = "kj_rh120",               order = "kj-p7",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_40kbaneblade",   name = "kj_baneblade",           order = "kj-40k-3a",   type = "ammo-category", icon = "cannon"},
	{modname = "kj_40kbaneblade",   name = "kj_baneblade_artillery", order = "kj-40k-3b",   type = "ammo-category", icon = "artillery"},
	{modname = "kj_40klemanruss",   name = "kj_lemanruss",           order = "kj-40k-2",    type = "ammo-category", icon = "cannon"},
	{modname = "kj_40kpredator",    name = "kj_predator",            order = "kj-40k-1",    type = "ammo-category", icon = "cannon"},
	{modname = "kj_maustank",       name = "kj_128kwk",              order = "kj-p6",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_pak",                                             order = "kj-p1",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_panzer4",        name = "kj_75kwk40",             order = "kj-p2",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_rattetank",      name = "kj_280SKC34",            order = "kj-p6",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_ray",            name = "kj_ray_cannon",          order = "kj-ra",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_ray",            name = "kj_ray_cannon_small",    order = "kj-rb",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_rex",            name = "kj_rex_cannon",          order = "kj-rc",       type = "ammo-category", icon = "cannon"},
	{modname = "kj_rex",            name = "kj_rex_laser",           order = "kj-rd",       type = "ammo-category", icon = "laser",  hidden = true},
	{modname = "kj_swspeeder",                                       order = "kj-s",        type = "ammo-category", icon = "cannon", hidden = true},
	{modname = "kj_wirbelwind",     name = "kj_2cmfv",               order = "kj-p3",       type = "ammo-category", icon = "bullet"},

	{modname = "kj_bulldozer",                                       order = "kj-a",   type = "ammo-category", hidden = true},
}

tables.categoriesUpdates = {
	kj_2a6 = 			{modname = "kj_2a6",			name = "kj_tanks",			order = "d", group = "logistics", type = "item-subgroup"},
	kj_40kbaneblade = 	{modname = "kj_40kbaneblade",   name = "kj_wh40k",			order = "e", group = "logistics", type = "item-subgroup"},
	kj_40klemanruss = 	{modname = "kj_40klemanruss",   name = "kj_wh40k",			order = "e", group = "logistics", type = "item-subgroup"},
	kj_40kpredator = 	{modname = "kj_40kpredator",    name = "kj_wh40k",			order = "e", group = "logistics", type = "item-subgroup"},
	kj_maustank = 		{modname = "kj_maustank",       name = "kj_tanks",			order = "d", group = "logistics", type = "item-subgroup"},
	kj_pak = 			{modname = "kj_pak",            name = "kj_tanks",			order = "d", group = "logistics", type = "item-subgroup"},
	kj_panzer4 = 		{modname = "kj_panzer4",        name = "kj_tanks",			order = "d", group = "logistics", type = "item-subgroup"},
	kj_rex = 			{modname = "kj_rattetank",      name = "kj_fantasy",		order = "d", group = "logistics", type = "item-subgroup"},
	kj_rattetank = 		{modname = "kj_ray",            name = "kj_tanks",			order = "f", group = "logistics", type = "item-subgroup"},
	kj_ray = 			{modname = "kj_rex",            name = "kj_fantasy",		order = "f", group = "logistics", type = "item-subgroup"},
	kj_swspeeder = 		{modname = "kj_swspeeder",      name = "kj_star_wars",  	order = "c", group = "logistics", type = "item-subgroup"},
	kj_wirbelwind = 	{modname = "kj_wirbelwind",     name = "kj_tanks",			order = "d", group = "logistics", type = "item-subgroup"},

	kj_aventador = 		{modname = "kj_aventador",		name = "kj_civils",         order = "a", group = "logistics", type = "item-subgroup"},
	kj_bulldozer = 		{modname = "kj_bulldozer",		name = "kj_trucks",         order = "b", group = "logistics", type = "item-subgroup"},
	kj_cybertruck = 	{modname = "kj_cybertruck",		name = "kj_civils",  		order = "a", group = "logistics", type = "item-subgroup"},
	kj_delorean = 		{modname = "kj_delorean",		name = "kj_civils",   		order = "a", group = "logistics", type = "item-subgroup"},
	kj_firetruck = 		{modname = "kj_firetruck",		name = "kj_trucks",     	order = "b", group = "logistics", type = "item-subgroup"},
	kj_fordmustang = 	{modname = "kj_gigahorse",		name = "kj_trucks",     	order = "b", group = "logistics", type = "item-subgroup"},
	kj_gigahorse = 		{modname = "kj_fordmustang",	name = "kj_civils",         order = "a", group = "logistics", type = "item-subgroup"},
	kj_utilitarian = 	{modname = "kj_utilitarian",	name = "kj_trucks",     	order = "b", group = "logistics", type = "item-subgroup"},
}

tables.items = {
	kj_2a6 = 			{modname = "kj_2a6",								    order = "2[military]-p5"},
	kj_40kbaneblade = 	{modname = "kj_40kbaneblade",	                        order = "2[military]-40k-3"},
	kj_40klemanruss = 	{modname = "kj_40klemanruss",	                        order = "2[military]-40k-2"},
	kj_40kpredator = 	{modname = "kj_40kpredator",                            order = "2[military]-40k-1"},
	kj_maustank = 		{modname = "kj_maustank",		                        order = "2[military]-p4"},
	kj_pak = 			{modname = "kj_pak",				                    order = "2[military]-p1a"},
	kj_pak2 = 			{modname = "kj_pak", 			name = "kj_pak_turret", order = "2[military]-p1b"},
	kj_panzer4 = 		{modname = "kj_panzer4",			                    order = "2[military]-p2"},
	kj_rex = 			{modname = "kj_rex",				                    order = "2[military]-r"},
	kj_rattetank = 		{modname = "kj_rattetank",		                        order = "2[military]-p6"},
	kj_ray = 			{modname = "kj_ray",				                    order = "2[military]-r-n[normal]"},
	kj_ray2 = 			{modname = "kj_ray", 			name = "kj_ray_small",  order = "2[military]-r-s[small]",	icon = "icon_small"},
	kj_swspeeder = 		{modname = "kj_swspeeder",		                        order = "2[military]-s"},
	kj_wirbelwind = 	{modname = "kj_wirbelwind",		                        order = "2[military]-p3"},

	kj_aventador = 		{modname = "kj_aventador",		                        order = "1[civil]-d"},
	kj_bulldozer = 		{modname = "kj_bulldozer",		                        order = "1[civil]-f"},
	kj_cybertruck = 	{modname = "kj_cybertruck",		                        order = "1[civil]-c0"},
	kj_delorean = 		{modname = "kj_delorean",		                        order = "1[civil]-a"},
	kj_firetruck = 		{modname = "kj_firetruck",		                        order = "1[civil]-g"},
	kj_fordmustang = 	{modname = "kj_fordmustang",                            order = "1[civil]-b"},
	kj_gigahorse = 		{modname = "kj_gigahorse",		                        order = "1[civil]-e"},
	kj_utilitarian = 	{modname = "kj_utilitarian",		                    order = "1[civil]-h"},
}

tables.recipes = {
	kj_2a6 = {
		{type = "item", name = "advanced-circuit", 		amount = 70},
		{type = "item", name = "engine-unit", 			amount = 135},
		{type = "item", name = "iron-gear-wheel", 		amount = 135},
		{type = "item", name = "low-density-structure", amount = 200},
		{type = "item", name = "processing-unit",		amount = 50},
		{type = "item", name = "steel-plate",			amount = 450},
	},
	kj_40kbaneblade = {
		{type = "item", name = "advanced-circuit", 		amount = 100},
		{type = "item", name = "engine-unit", 			amount = 200},
		{type = "item", name = "iron-gear-wheel", 		amount = 300},
		{type = "item", name = "low-density-structure", amount = 100},
		{type = "item", name = "processing-unit", 		amount = 50},
		{type = "item", name = "steel-plate", 			amount = 1000},
	},
	kj_40klemanruss = {
		{type = "item", name = "advanced-circuit", 		amount = 30},
		{type = "item", name = "engine-unit", 			amount = 100},
		{type = "item", name = "iron-gear-wheel", 		amount = 100},
		{type = "item", name = "steel-plate", 			amount = 225},
	},
	kj_40kpredator = {
		{type = "item", name = "advanced-circuit", 		amount = 30},
		{type = "item", name = "engine-unit", 			amount = 100},
		{type = "item", name = "iron-gear-wheel", 		amount = 100},
		{type = "item", name = "steel-plate", 			amount = 225},
	},
	kj_maustank = {
		{type = "item", name = "advanced-circuit", 		amount = 50},
		{type = "item", name = "engine-unit", 			amount = 150},
		{type = "item", name = "iron-gear-wheel", 		amount = 150},
		{type = "item", name = "steel-plate", 			amount = 500},
	},
	kj_pak = {
		{type = "item", name = "engine-unit", 			amount = 3},
		{type = "item", name = "iron-gear-wheel", 		amount = 5},
		{type = "item", name = "steel-plate", 			amount = 25},
	},
	kj_panzer4 = {
		{type = "item", name = "advanced-circuit", 		amount = 20},
		{type = "item", name = "engine-unit", 			amount = 75},
		{type = "item", name = "iron-gear-wheel", 		amount = 75},
		{type = "item", name = "steel-plate", 			amount = 150},
	},
	kj_rex = {
		{type = "item", name = "advanced-circuit", 		amount = 200},
		{type = "item", name = "engine-unit", 			amount = 200},
		{type = "item", name = "iron-gear-wheel", 		amount = 200},
		{type = "item", name = "low-density-structure", amount = 500},
		{type = "item", name = "processing-unit", 		amount = 100},
		{type = "item", name = "steel-plate", 			amount = 2000},
	},
	kj_rattetank = {
		{type = "item", name = "advanced-circuit", 		amount = 200},
		{type = "item", name = "engine-unit", 			amount = 500},
		{type = "item", name = "iron-gear-wheel", 		amount = 500},
		{type = "item", name = "steel-plate", 			amount = 5000},
	},
	kj_ray = {
		{type = "item", name = "advanced-circuit", 		amount = 200},
		{type = "item", name = "engine-unit", 			amount = 200},
		{type = "item", name = "iron-gear-wheel", 		amount = 200},
		{type = "item", name = "low-density-structure", amount = 500},
		{type = "item", name = "processing-unit", 		amount = 100},
		{type = "item", name = "steel-plate", 			amount = 2000},
	},
	kj_swspeeder = {
		{type = "item", name = "electric-engine-unit", 	amount = 20},
		{type = "item", name = "low-density-structure", amount = 20},
		{type = "item", name = "processing-unit", 		amount = 20},
		{type = "item", name = "steel-plate", 			amount = 5},
	},
	kj_wirbelwind = {
		{type = "item", name = "advanced-circuit", 		amount = 20},
		{type = "item", name = "engine-unit", 			amount = 75},
		{type = "item", name = "iron-gear-wheel", 		amount = 75},
		{type = "item", name = "steel-plate", 			amount = 120},
	},

	kj_aventador = {
		{type = "item", name = "advanced-circuit", 		amount = 15},
		{type = "item", name = "engine-unit", 			amount = 30},
		{type = "item", name = "iron-gear-wheel", 		amount = 30},
		{type = "item", name = "plastic-bar", 			amount = 20},
		{type = "item", name = "steel-plate", 			amount = 10},
	},
	kj_bulldozer = {
		{type = "item", name = "engine-unit", 			amount = 60},
		{type = "item", name = "iron-gear-wheel", 		amount = 60},
		{type = "item", name = "iron-plate", 			amount = 10},
		{type = "item", name = "steel-plate", 			amount = 40},
	},
	kj_cybertruck = {
		{type = "item", name = "advanced-circuit", 		amount = 10},
		{type = "item", name = "electric-engine-unit", 	amount = 15},
		{type = "item", name = "iron-gear-wheel", 		amount = 15},
		{type = "item", name = "steel-plate", 			amount = 25},
	},
	kj_delorean = {
		{type = "item", name = "electronic-circuit", 	amount = 5},
		{type = "item", name = "engine-unit", 			amount = 10},
		{type = "item", name = "iron-plate", 			amount = 20},
		{type = "item", name = "steel-plate", 			amount = 5},
	},
	kj_firetruck = {
		{type = "item", name = "advanced-circuit", 		amount = 10},
		{type = "item", name = "engine-unit", 			amount = 30},
		{type = "item", name = "iron-gear-wheel", 		amount = 30},
		{type = "item", name = "steel-plate", 			amount = 40},
	},
	kj_fordmustang = {
		{type = "item", name = "engine-unit", 			amount = 20},
		{type = "item", name = "iron-gear-wheel", 		amount = 15},
		{type = "item", name = "iron-plate", 			amount = 10},
		{type = "item", name = "steel-plate", 			amount = 20},
	},
	kj_gigahorse = {
		{type = "item", name = "engine-unit", 			amount = 20},
		{type = "item", name = "iron-gear-wheel", 		amount = 15},
		{type = "item", name = "iron-plate", 			amount = 20},
		{type = "item", name = "iron-stick", 			amount = 5},
		{type = "item", name = "steel-plate", 			amount = 15},
	},
	kj_utilitarian = {
		{type = "item", name = "advanced-circuit", 		amount = 10},
		{type = "item", name = "engine-unit", 			amount = 30},
		{type = "item", name = "iron-gear-wheel", 		amount = 30},
		{type = "item", name = "steel-plate", 			amount = 40},
	},
}

tables.ammoDmg = {
	kj_2a6 = {
		APAP = 1100,
		APHE = 550,
		APDW = 2000,

		HEAP = 825,
		HEHE = 743,
		HEDW = 500,

		APHEAP = 660,
		APHEHE = 594,
		APHEDW = 1250,

		APCAN = 200,
		CANDW = 300,
	},
	kj_40kbaneblade = {
		APHE = 900,
		HEHE = 810,
		HEDW = 375,

		APHEAP = 100,
		APHEHE = 100,
		APHEDW = 600,
	},
	kj_40klemanruss = {
		HEAP = 600,
		HEHE = 540,
		HEDW = 325,
	},
	kj_40kpredator = {
		HEAP = 375,
		HEHE = 338,
		HEDW = 200,
	},
	kj_maustank = {
		APAP = 750,
		APHE = 375,
		APDW = 1100,

		HEAP = 563,
		HEHE = 506,
		HEDW = 275,

		APHEAP = 450,
		APHEHE = 405,
		APHEDW = 688,
	},
	kj_pak = {
		APAP = 900,
		APHE = 450,
		APDW = 1300,

		HEAP = 675,
		HEHE = 300,
		HEDW = 325,

		APHEAP = 480,
		APHEHE = 432,
		APHEDW = 400,
	},
	kj_panzer4 = {
		APAP = 480,
		APHE = 240,
		APDW = 700,

		HEAP = 360,
		HEHE = 324,
		HEDW = 175,

		APHEAP = 288,
		APHEHE = 259,
		APHEDW = 438,
	},
	kj_ray = {
		APAP = 2000,
		APHE = 500,
	},
	kj_rattetank = {
		APAP = 2000,
		APHE = 1000,
		APDW = 3000,

		HEAP = 1500,
		HEHE = 1350,
		HEDW = 1500,

		APHEAP = 1200,
		APHEHE = 1080,
		APHEDW = 1125,
	},
	kj_rex = {
		APAP = 2000,
		APHE = 500,
		APDW = 4000,
	},
	kj_wirbelwind = {
		NF = 35,
		NP = 24,
		NE = 30,
	},

}

tables.entityData = {
	max_health = {
		kj_2a6 = 		    8000,
		kj_40kbaneblade =  13000,
		kj_40klemanruss =   8000,
		kj_40kpredator =    9000,
		kj_maustank = 	   10000,
		kj_pak = 		    1000,
		kj_panzer4 = 	    5000,
		kj_rex = 		  100000,
		kj_rattetank = 	  100000,
		kj_ray = 		  100000,
		kj_swspeeder = 	     500,
		kj_wirbelwind =     4000,

		kj_aventador = 	  1200,
		kj_bulldozer = 	  2000,
		kj_cybertruck =   1200,
		kj_delorean = 	   800,
		kj_firetruck = 	  1000,
		kj_fordmustang =  1000,
		kj_gigahorse = 	  2000,
		kj_utilitarian =  2000,
	},
	impactInfos = {
		kj_2a6 = 		 	{true, true, 0.1},
		kj_40kbaneblade =	{true, true, 0.04},
		kj_40klemanruss =	{true, true, 0.2},
		kj_40kpredator = 	{true, true, 0.2},
		kj_maustank = 		{true, true, 0.2},
		kj_pak = 			{true, false, 0.04},
		kj_panzer4 = 		{true, true, 0.1},
		kj_rex = 			{true, true, 0.05},
		kj_rattetank = 		{true, true, 0.05},
		kj_ray = 			{true, true, 0.05},
		kj_swspeeder = 		{true, false, 10},
		kj_wirbelwind = 	{true, true, 0.1},

		kj_aventador = 		{false, false, 8},
		kj_bulldozer = 		{true, true, 0.08},
		kj_cybertruck = 	{true, false, 5},
		kj_delorean = 		{false, false, 5},
		kj_firetruck = 		{true, false, 5},
		kj_fordmustang =	{false, false, 5},
		kj_gigahorse = 		{true, false, 1},
		kj_utilitarian =	{true, true, 3},
	},
	braking_power = {
		kj_2a6 = 		  "3000kW",
		kj_40kbaneblade = "1400kW",
		kj_40klemanruss =  "400kW",
		kj_40kpredator =  "1000kW",
		kj_maustank = 	  "1200kW",
		kj_pak = 		   "600kW",
		kj_panzer4 = 	   "500kW",
		kj_rex = 		  "8000kW",
		kj_rattetank = 	  "6000kW",
		kj_ray = 		  "8000kW",
		kj_swspeeder = 	  "1500kW",
		kj_wirbelwind =    "500kW",

		kj_aventador = 	  "2000kW",
		kj_bulldozer = 	  "3000kW",
		kj_cybertruck =   "1200kW",
		kj_delorean = 	   "500kW",
		kj_firetruck = 	  "1000kW",
		kj_fordmustang =   "650kW",
		kj_gigahorse = 	  "1000kW",
		kj_utilitarian =   "600kW",
	},
	consumption = {
		kj_2a6 = 		  "1600kW",
		kj_40kbaneblade = "1400kW",
		kj_40klemanruss =  "800kW",
		kj_40kpredator =  "2000kW",
		kj_maustank = 	  "1200kW",
		kj_pak = 		   "250kW",
		kj_panzer4 = 	   "500kW",
		kj_rex = 		   "150kW",
		kj_rattetank = 	  "6000kW",
		kj_ray = 		   "150kW",
		kj_swspeeder = 	   "555kW",
		kj_wirbelwind =    "500kW",

		kj_aventador = 	   "800kW",
		kj_bulldozer = 	  "1600kW",
		kj_cybertruck =    "600kW",
		kj_delorean = 	   "295kW",
		kj_firetruck = 	  "1000kW",
		kj_fordmustang =   "390kW",
		kj_gigahorse = 	   "700kW",
		kj_utilitarian =   "600kW",
	},
	weight = {
		kj_2a6 = 		    62000,
		kj_40kbaneblade =  200000,
		kj_40klemanruss =   60000,
		kj_40kpredator =    44000,
		kj_maustank = 	   100000,
		kj_pak = 		     3000,
		kj_panzer4 = 	    25000,
		kj_rex = 		   100000,
		kj_rattetank = 	  1000000,
		kj_ray = 		   100000,
		kj_swspeeder = 	      300,
		kj_wirbelwind =     25000,

		kj_aventador = 	     1600,
		kj_bulldozer = 	    50000,
		kj_cybertruck =      3000,
		kj_delorean = 	     1233,
		kj_firetruck = 	    20000,
		kj_fordmustang =     1500,
		kj_gigahorse = 	     5000,
		kj_utilitarian =    10000,
	},
	invRotTur = {
		kj_2a6 = 		 	{20, 0.004 , 0.11 / 60},
		kj_40kbaneblade =	{30, 0.0028, 0.09 / 60},
		kj_40klemanruss =	{30, 0.0035, 0.12 / 60},
		kj_40kpredator = 	{30, 0.0035, 0.12 / 60},
		kj_maustank = 		{30, 0.0035, 0.09 / 60},
		kj_pak = 			{ 5, 0.0025, 0.08 / 60},
		kj_panzer4 = 		{80, 0.0035, 0.17 / 60},
		kj_rex = 			{50, 0.002 , 0.2  / 60},
		kj_rattetank = 		{30, 0.0005, 0.05 / 60},
		kj_ray = 			{50, 0.002 , 0.2  / 60},
		kj_swspeeder = 		{ 5, 0.01  , 1},
		kj_wirbelwind = 	{80, 0.0035, 0.17 / 60},

		kj_aventador = 		{ 20, 0.015, 1},
		kj_bulldozer = 		{ 20, 0.004, 1},
		kj_cybertruck = 	{ 50, 0.01 , 1},
		kj_delorean = 		{ 30, 0.015, 1},
		kj_firetruck = 		{100, 0.01 , 1},
		kj_fordmustang =	{ 40, 0.013, 5},
		kj_gigahorse = 		{ 40, 0.008, 1},
		kj_utilitarian =	{150, 0.01 , 1},
	},
	resistances = {         --  fire     physical    impact   explosion     acid     electric    laser      poison
		kj_2a6 = 		 	{{ 60, 65}, { 40, 70}, { 30, 70}, { 50, 65}, { 20, 60}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_40kbaneblade =	{{ 60, 65}, { 30, 75}, { 20, 70}, { 15, 70}, { 25, 50}, { 15, 50}, { 15, 50}, { 15, 50}},
		kj_40klemanruss =	{{ 20, 80}, { 30, 75}, { 20, 70}, { 15, 70}, { 15, 50}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_40kpredator = 	{{ 20, 80}, { 30, 75}, { 20, 70}, { 15, 70}, { 15, 50}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_maustank = 		{{ 20, 80}, { 30, 75}, { 20, 70}, { 15, 70}, {  8, 30}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_pak = 			{{ 20, 90}, { 30, 75}, { 20, 60}, { 20, 50}, { 15, 50}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_panzer4 = 		{{ 25, 70}, { 20, 60}, { 50, 80}, { 30, 70}, { 10, 40}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_rex = 			{{ 50,100}, { 20, 75}, { 70, 70}, { 50, 70}, { 50, 70}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_rattetank = 		{{ 30, 80}, { 50, 80}, { 50, 80}, { 50, 70}, { 25, 70}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_ray = 			{{ 50,100}, { 20, 75}, { 70, 70}, { 50, 70}, { 50, 70}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_swspeeder = 		{{ 15, 50}, {  5, 10}, { 10, 40}, {  5, 10}, {  5, 10}, {  5, 40}, {  5, 40}, {  5, 95}},
		kj_wirbelwind = 	{{ 20, 70}, { 20, 60}, { 50, 70}, { 20, 70}, { 10, 40}, {  0,  0}, {  0,  0}, {  0,  0}},

		kj_aventador = 		{{ 15, 80}, { 15, 40}, { 15, 70}, { 15, 30}, { 10, 30}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_bulldozer = 		{{ 15, 60}, { 15, 35}, { 50, 70}, { 15, 30}, { 10, 30}, {  5, 40}, {  5, 40}, {  5, 95}},
		kj_cybertruck = 	{{ 15, 60}, { 15, 40}, { 50, 70}, { 15, 30}, {  5, 20}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_delorean = 		{{ 15, 50}, { 15, 20}, { 40, 60}, { 15, 15}, { 10, 20}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_firetruck = 		{{ 15, 80}, { 15, 40}, { 50, 78}, { 15, 30}, { 10, 30}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_fordmustang =	{{ 15, 60}, { 15, 40}, { 50, 50}, { 15, 15}, {  5, 20}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_gigahorse = 		{{ 15, 55}, { 20, 40}, { 35, 35}, { 15, 25}, { 20, 25}, {  0,  0}, {  0,  0}, {  0,  0}},
		kj_utilitarian =	{{ 15, 80}, { 15, 40}, { 50, 70}, { 15, 30}, { 10, 30}, {  0,  0}, {  0,  0}, {  0,  0}},
	},
	friTerSpdEff = {
		kj_2a6 = 		 	{0.002, 0.2, 0.1, 1},
		kj_40kbaneblade =	{0.002, 0.2, 0.1, 1},
		kj_40klemanruss =	{0.002, 0.2, 0.07, 1},
		kj_40kpredator = 	{0.002, 0.2, 0.1, 1},
		kj_maustank = 		{0.002, 0.2, 0.1, 1},
		kj_pak = 			{0.4  ,   1, 0.1, 1},
		kj_panzer4 = 		{0.002, 0.2, 0.1, 0.9},
		kj_rex = 			{0.001, 0.1, 0.1, 1},
		kj_rattetank = 		{0.002, 0.2, 0.1, 1},
		kj_ray = 			{0.001, 0.1, 0.1, 1},
		kj_swspeeder = 		{0.002, 0.1, 0.1, 0.5},
		kj_wirbelwind = 	{0.002, 0.2, 0.1, 0.9},

		kj_aventador = 		{0.002,   1, 0.2, 1},
		kj_bulldozer = 		{0.002, 0.2, 0.2, 1},
		kj_cybertruck = 	{0.002,   1, 0.2, 1},
		kj_delorean = 		{0.002,   1, 0.2, 1},
		kj_firetruck = 		{0.002,   1, 0.1, 1},
		kj_fordmustang =	{0.002,   1, 0.1, 1},
		kj_gigahorse = 		{0.002,   1, 0.2, 1},
		kj_utilitarian =	{0.002,   1, 0.1, 1},
	},
}
return tables

--[[

    type
    name
    corpse
    mined_sound
    dying_explosion
	equipment_grid
    collision_box
    selection_box
    sticker_box
	drawing_box_vertical_extension
	darkness_to_render_light_animation
	stop_trigger
	tank_driving
	turret_return_timeout
	has_belt_immunity
	guns

	energy_source
	light
	animation
	turret_animation
	working_sound
	sound_no_fuel
	open_sound
	close_sound

]]