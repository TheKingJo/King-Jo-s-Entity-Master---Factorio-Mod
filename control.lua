if script.active_mods["gvv"] then require("__gvv__.gvv")() end
--[[
local lookUpTable = {
    0,
    1,
    2,
    3,
    4,
    5,
    5,
    6,
    7,
    8,
    9,
    9,
    10,
    11,
    12,
    13,
    13,
    14,
    15,
    16,
    16,
    17,
    18,
    19,
    19,
    20,
    21,
    22,
    22,
    23,
    24,
    25,
    25,
    27,
    28,
    29,
    30,
    32,
    33,
    34,
    35,
    37,
    38,
    39,
    40,
    42,
    43,
    44,
    45,
    47,
    48,
    49,
    50,
    51,
    53,
    54,
    55,
    56,
    57,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    71,
    72,
    73,
    74,
    75,
    77,
    78,
    79,
    80,
    81,
    83,
    84,
    85,
    86,
    88,
    89,
    90,
    91,
    93,
    94,
    95,
    96,
    98,
    99,
    100,
    101,
    103,
    103,
    104,
    105,
    106,
    106,
    107,
    108,
    109,
    109,
    110,
    111,
    112,
    112,
    113,
    114,
    115,
    115,
    116,
    117,
    118,
    119,
    119,
    120,
    121,
    122,
    123,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    133,
    134,
    135,
    136,
    137,
    137,
    138,
    139,
    140,
    141,
    141,
    142,
    143,
    144,
    144,
    145,
    146,
    147,
    147,
    148,
    149,
    150,
    150,
    151,
    152,
    153,
    153,
    155,
    156,
    157,
    158,
    160,
    161,
    162,
    163,
    165,
    166,
    167,
    168,
    170,
    171,
    172,
    173,
    175,
    176,
    177,
    178,
    179,
    181,
    182,
    183,
    184,
    185,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    199,
    200,
    201,
    202,
    203,
    205,
    206,
    207,
    208,
    209,
    211,
    212,
    213,
    214,
    216,
    217,
    218,
    219,
    221,
    222,
    223,
    224,
    226,
    227,
    228,
    229,
    231,
    231,
    232,
    233,
    234,
    234,
    235,
    236,
    237,
    237,
    238,
    239,
    240,
    240,
    241,
    242,
    243,
    243,
    244,
    245,
    246,
    247,
    247,
    248,
    249,
    250,
    251,
    251,
    252,
    253,
    254,
    255,
    255,
}

function on_configuration_changed(e)
    game.print("Runtime settings changed")

    if e.setting == "kj_truck_luaRendering" then
        if settings.global["kj_truck_luaRendering"].value == true then
            if storage.trailers then
                for i, anim in pairs(storage.trailers) do
                    if anim.entity.valid and anim.anim.valid then
                        anim.anim.visible = true
                    else
                        storage.trailers[i] = nil
                    end
                end
            end
        end
    end
end

function entityRemoved(e)
    local ent = e.entity

	if ent.name == "kj_truck_wagon" then
        if storage.trailers and storage.trailers[ent.unit_number] then
            storage.trailers[ent.unit_number] = nil
        end
    end
end

function entityBuilt(e)
	local ent = e.created_entity or e.entity
    --game.print("Entity built: "..ent.name)

	if ent.name == "kj_truck_wagon" then
		game.print("Trailer built. unit_number= "..ent.unit_number)
        local frame = math.floor(256 * ent.orientation + 0.4999)
        game.print("Frame 1: "..frame)
        local animation = rendering.draw_animation{
            animation = "kj_trailer_rotation",
            target = ent,
            render_layer = "explosion",
            surface = ent.surface,
            animation_speed = 0,
            animation_offset = frame--lookUpTable[frame+1],
        }

        if not storage.trailers then
            storage.trailers = {}
        end
        storage.trailers[ent.unit_number] = {entity = ent, anim = animation, frame = frame}
	end
end

function onTick(e)
    --if setting
    if storage.trailers then
        if settings.global["kj_truck_luaRendering"].value == true then
            for i, anim in pairs(storage.trailers) do
                if anim.entity.valid and anim.anim.valid then
                    local frame = math.floor(256 * anim.entity.orientation + 0.4999)
                    if anim.frame ~= frame then
                        game.print("Frame "..frame.." updated on tick "..e.tick)
                        anim.anim.animation_offset = frame--lookUpTable[frame+1]
                        anim.frame = frame
                    end
                else
                    storage.trailers[i] = nil
                end
            end
        else
            for i, anim in pairs(storage.trailers) do
                if anim.entity.valid and anim.anim.valid then
                    anim.anim.visible = false
                else
                    storage.trailers[i] = nil
                end
            end
        end
    end
end
]]

--random atom explosion when atomic bomber crashes with atom bomb
function OnDied(e)
	local entity = e.entity

	if entity ~= nil and entity.name ~= nil then
        local name = string.gsub(entity.name, "-airborne", "")
        if settings.global[name.."_crash_boom"] and settings.global[name.."_crash_boom"].value == true then
            local surface = entity.surface
            local position = entity.position

            inventory = entity.get_inventory(defines.inventory.car_ammo)
            if inventory and inventory.is_empty() == false then
                for i = 1, #inventory do
                    if inventory[i].count > 0 then
                        if inventory[i].name == "kj_plane_atom" then
                            local randomNumber = math.random(1, 100)

                            if randomNumber > 65 then
                                surface.create_entity {
                                    name = "atomic-rocket",
                                    position = position,
                                    force = "enemy",
                                    target = entity,
                                    speed = 1,
                                }
                            end
                        end
                    end
                end
            end
        end
	end
end
--[[
script.on_event(defines.events.on_tick, onTick)
script.on_event(defines.events.on_runtime_mod_setting_changed, on_configuration_changed)

script.on_event(defines.events.on_entity_died, entityRemoved)
script.on_event(defines.events.on_player_mined_entity, entityRemoved)
script.on_event(defines.events.on_robot_mined_entity, entityRemoved)
script.on_event(defines.events.script_raised_destroy, entityRemoved)

script.on_event(defines.events.on_robot_built_entity, entityBuilt)
script.on_event(defines.events.on_built_entity, entityBuilt)
]]
script.on_event(defines.events.on_entity_died, OnDied)

--[[
draw animation on entity creation -> save it in table
(check if valid here n there)
update animation on tick, if rotation is not fitting anymore UND in einem bestimmten radiusbereich
]]