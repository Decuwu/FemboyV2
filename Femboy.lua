---@diagnostic disable: undefined-global, lowercase-global, undefined-field

local version = "2.5.1" 
local feats, feat_vals, feat_tv = {}, {}, {}
local appdata = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
local INI = IniParser(appdata .. "\\scripts\\FemboyLuaFolder\\Femboy.ini")

local function SaveSettings()
    for k, v in pairs(feats) do
        INI:set_b("Toggles", k, v.on)
    end
    for k, v in pairs(feat_vals) do
        INI:set_f("Values", k, v.value)
    end
    for k, v in pairs(feat_tv) do
        INI:set_b("Toggles", k, v.on)
        INI:set_f("Values", k, v.value)
    end
    INI:write()
    menu.notify("Settings Saved", "Femboy Menu", 7, 0xFF00FF00)
end

local function LoadSettings()
    if INI:read() then
        for k, v in pairs(feats) do
            local exists, val = INI:get_b("Toggles", k)
            if exists then
                v.on = val
            end
        end

        for k, v in pairs(feat_vals) do
            local exists, val = INI:get_f("Values", k)
            if exists then
                v.value = val
            end
        end

        for k, v in pairs(feat_tv) do
            local exists, val = INI:get_b("Toggles", k)
            if exists then
                v.on = val
            end
            local exists, val = INI:get_f("Values", k)
            if exists then
                v.value = val
            end
        end
    end
end

local femboy_native = native.call
local femboy_local = {}

femboy_local.main = menu.add_feature("Femboy Lua", "parent", 0).id 

femboy_local.player_feature = menu.add_feature("Player", "parent", femboy_local.main).id 
femboy_local.walkstyles = menu.add_feature("Walkstyles", "parent", femboy_local.player_feature).id
femboy_local.player_proof = menu.add_feature("Player Proofs", "parent", femboy_local.player_feature).id 
femboy_local.rgb_player_feature = menu.add_feature("RGB Player", "parent", femboy_local.player_feature).id 

femboy_local.weapon_feature = menu.add_feature("Weapon", "parent", femboy_local.main).id

femboy_local.vehicle_feature = menu.add_feature("Vehicle", "parent", femboy_local.main).id
femboy_local.door_control = menu.add_feature("Door Controls", "parent", femboy_local.vehicle_feature).id 
femboy_local.vehicle_customisation = menu.add_feature("Vehicle Customisation", "parent", femboy_local.vehicle_feature).id
femboy_local.light_control = menu.add_feature("Light Controls", "parent", femboy_local.vehicle_feature).id
femboy_local.license_plate = menu.add_feature("License Plates", "parent", femboy_local.vehicle_feature).id 

femboy_local.online_feature = menu.add_feature("Online", "parent", femboy_local.main).id 
femboy_local.lobby_options = menu.add_feature("Lobby Options", "parent", femboy_local.online_feature).id
femboy_local.network_chat_options = menu.add_feature("Network Chat Options", "parent", femboy_local.online_feature).id
femboy_local.network_chat_spam_options = menu.add_feature("Custom Chat Spam Messages", "parent", femboy_local.network_chat_options).id

femboy_local.moderation_options = menu.add_feature("Moderation Options", "parent", femboy_local.online_feature).id 
femboy_local.auto_moderation = menu.add_feature("Auto Moderation", "parent", femboy_local.moderation_options).id 
femboy_local.country_kick = menu.add_feature("Country Kick", "parent", femboy_local.moderation_options).id 
femboy_local.chat_moderation_options = menu.add_feature("Chat Moderation Options", "parent", femboy_local.moderation_options).id 

femboy_local.ip_lookup = menu.add_feature("IP Lookup", "parent", femboy_local.online_feature).id

femboy_local.recovery_feature = menu.add_feature("Recovery", "parent", femboy_local.main).id
femboy_local.money_loops = menu.add_feature("Money Loops", "parent", femboy_local.recovery_feature).id
femboy_local.collectibles = menu.add_feature("Collectibles", "parent", femboy_local.recovery_feature).id
femboy_local.remote_business = menu.add_feature("Remote Business", "parent", femboy_local.recovery_feature).id

femboy_local.special_cargo = menu.add_feature("Special Cargo Options", "parent", femboy_local.recovery_feature).id 
femboy_local.normal_crate = menu.add_feature("Choose Normal Crate To Buy", "parent", femboy_local.special_cargo).id 
femboy_local.special_crate = menu.add_feature("Choose Special Crate To Buy", "parent", femboy_local.special_cargo).id 

femboy_local.air_cargo = menu.add_feature("Air Freight Cargo Options", "parent", femboy_local.recovery_feature).id
femboy_local.steal_missions_air = menu.add_feature("Steal Missions", "parent", femboy_local.air_cargo).id 
femboy_local.sell_missions_air = menu.add_feature("Sell Missions", "parent", femboy_local.air_cargo).id

femboy_local.night_club = menu.add_feature("Nightclub Options", "parent", femboy_local.recovery_feature).id

femboy_local.vehicle_cargo = menu.add_feature("Vehicle Cargo Options", "parent", femboy_local.recovery_feature).id 
femboy_local.source_vehicle = menu.add_feature("Source Vehicle Options", "parent", femboy_local.vehicle_cargo).id 
femboy_local.top_range_vehicle = menu.add_feature("Top Range Vehicles", "parent", femboy_local.source_vehicle).id 
femboy_local.mid_range_vehicles = menu.add_feature("Mid Range Vehicles", "parent", femboy_local.source_vehicle).id 
femboy_local.standard_range_vehicles = menu.add_feature("Standard Range Vehicles", "parent", femboy_local.source_vehicle).id 
femboy_local.unknown_range_vehicles  = menu.add_feature("Unknown Range Vehicles", "parent", femboy_local.source_vehicle).id 

femboy_local.recovery_tool = menu.add_feature("Tools/Services", "parent", femboy_local.recovery_feature).id 
femboy_local.bad_sport_manager = menu.add_feature("Bad Sport Manager", "parent", femboy_local.recovery_tool).id
femboy_local.disable_tools = menu.add_feature("Disable Options", "parent", femboy_local.recovery_tool).id

femboy_local.world_feature = menu.add_feature("World", "parent", femboy_local.main).id

femboy_local.misc_feature = menu.add_feature("Misc", "parent", femboy_local.main).id
femboy_local.alert_screen = menu.add_feature("Custom/Preset Alert screens", "parent", femboy_local.misc_feature).id

femboy_local.settings = menu.add_feature("Settings", "parent", femboy_local.main).id 
femboy_local.logging_feature = menu.add_feature("Logging", "parent", femboy_local.settings).id 
femboy_local.hud_options = menu.add_feature("HUD Options", "parent", femboy_local.settings).id

femboy_local.credits = menu.add_feature("Credits", "parent", femboy_local.main).id

femboy_local.main_online = menu.add_player_feature("Femboy Lua Exclusive Version", "parent", 0).id
--local ip_online_lookup = menu.add_player_feature("IP Lookup", "parent", main_online).id
femboy_local.griefing_options = menu.add_player_feature("Griefing", "parent", femboy_local.main_online).id 

femboy_local.friendly_options = menu.add_player_feature("Friendly", "parent", femboy_local.main_online).id 
femboy_local.rp_drop = menu.add_player_feature("RP Drops", "parent", femboy_local.friendly_options).id
femboy_local.weapon_options = menu.add_player_feature("Weapon", "parent", femboy_local.main_online).id

-- functions
function RGBRainbow(timer, frequency )
    local result = {}
    local curtime = timer / 1000 
 
    result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
    result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
    result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
    
    return result
end

function get_future_date()
    local current_time = os.time()
    local future_time = current_time + (30 * 24 * 60 * 60)
    local future_date = os.date("%d/%m/%Y", future_time)
    return future_date
end

function requestptfx(name)
    graphics.request_named_ptfx_asset(name)
    while (not graphics.has_named_ptfx_asset_loaded(name)) do
        system.wait(0)
    end
    return graphics.has_named_ptfx_asset_loaded(name)
end

local function dec_to_ipv4(ip)
    if ip then
        return string.format("%i.%i.%i.%i", ip >> 24 & 255, ip >> 16 & 255, ip >> 8 & 255, ip & 255)
    end
end

local function capitalise_first_letter(str)
    return str:sub(1, 1):upper() .. str:sub(2, #str)
end

local function request_model(hash, timeout)
    streaming.request_model(hash)
    local timer = utils.time_ms() + (timeout or 10)
    while timer > utils.time_ms() and not streaming.has_model_loaded(hash) do
        system.wait(0)
    end
    return streaming.has_model_loaded(hash)
end

local function spawn_obect(feat, hash)
    request_model(hash)
    while feat.on do
        local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player.player_ped())
        if bool_rtn then 
            local heading = entity.get_entity_heading(player.player_ped())
            local obj = object.create_object(hash, v3_coord, true, false)
            entity.set_entity_heading(obj, heading)
        end
        system.wait()
    end
end

local function kickPlayersForFlag(flag)
    if not feats.auto_moderation.on then return end
    for pid = 0, 31 do
        if player.is_player_modder(pid, flag) then
            network.force_remove_player(pid)
            menu.notify(
            string.format("Player %s (ID: %d) has been kicked for having the %s modder flag",
            player.get_player_name(pid), pid, player.get_modder_flag_text(flag)), "Kick Player")
        end
    end
end

local function check_vpn(pid)
    if not enable_vpn_check then return end
    system.wait(1000)
    local paramType = type(pid)
    if paramType == "table" or paramType == "userdata" then
        pid = pid.player
    end
    local player_parent = menu.get_feature_by_hierarchy_key("online.online_players.player_" .. pid)
    local ip = player.get_player_ip(pid)
    local response, my_info = web.get("http://ip-api.com/json/" .. dec_to_ipv4(ip) .. "?fields=131072")
    if response == 200 then
        if string.find(my_info, "true") then
            menu.notify(player.get_player_name(pid) .. " was flagged for using a VPN", "Femboy Lua VPN Checker")
            if not player_parent.name:find("VPN") then
                player_parent.name = player_parent.name .. " #DEFAULT#[#FFC0CBFF#VPN#DEFAULT#]"
                flagged_players[pid] = true
            end
        end
    else
        print("Error.")
    end
end

local function NotifyMap(title, subtitle, msg, iconname, intcolor)
    native.call(0x92F0DA1E27DB96DC, intcolor) --_THEFEED_SET_NEXT_POST_BACKGROUND_COLOR
    native.call(0x202709F4C58A0424, "STRING") --BEGIN_TEXT_COMMAND_THEFEED_POST
    native.call(0x6C188BE134E074AA, msg) --ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME
    native.call(0x1CCD9A37359072CF, iconname, iconname, false, 0, title, subtitle) --END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT
    native.call(0x2ED7843F8F801023, true, true) --END_TEXT_COMMAND_THEFEED_POST_TICKER
end

local function AlertMessage(body)
    local scaleForm = graphics.request_scaleform_movie("POPUP_WARNING")
    if(graphics.has_scaleform_movie_loaded(scaleForm)) then
        ui.draw_rect(.5, .5, 1, 1, 0, 0, 0, 255)
        graphics.begin_scaleform_movie_method(scaleForm, "SHOW_POPUP_WARNING")
        graphics.draw_scaleform_movie_fullscreen(scaleForm, 255, 255, 255, 255, 0)
        graphics.scaleform_movie_method_add_param_float(500.0)
        graphics.scaleform_movie_method_add_param_texture_name_string("Alert")
        graphics.scaleform_movie_method_add_param_texture_name_string(body)
        graphics.end_scaleform_movie_method(scaleForm)
    end
end

-- 
local name = player.get_player_name(player.player_id())
NotifyMap("Femboy Lua ", version .. " ~h~~r~Femboy Lua Script", "Script Loaded, head to Script Features\n\nCongratulations ~r~"..name.." ~w~you are now a femboy.", "CHAR_MP_STRIPCLUB_PR", 140)

femboy_local.stats_trusted = menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_STATS)
femboy_local.globals_locals_trusted = menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS)
femboy_local.natives_trusted = menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES)
femboy_local.https_trusted = menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_HTTP)

if not femboy_local.stats_trusted and not femboy_local.globals_locals_trusted and not femboy_local.natives_trusted and not femboy_local.https_trusted then
    menu.notify("Femboy Lua loaded\nHowever, if you wish to use the full lua you will need to enable the following:\n\n-Stats (for some recovery options)\n-Globals/Locals (for some recovery options)\n-Natives (for most features)\n-HTTP (for vpn check, auto updater and ip lookup)", "Femboy Menu", 7, 0xFF00FFFF)
end
-- player_feature 
menu.add_feature("Reset Walkstyle", "action", femboy_local.walkstyles, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        femboy_native(0xAA74EC0CB0AAEA2C, player.player_ped(), 1.0)
    end
end)

local walkstyles = {
    {name = "ANIM_GROUP_MOVE_BALLISTIC"},
    {name = "ANIM_GROUP_MOVE_LEMAR_ALLEY"},
    {name = "clipset@move@trash_fast_turn"},
    {name = "FEMALE_FAST_RUNNER"},
    {name = "missfbi4prepp1_garbageman"},
    {name = "move_characters@franklin@fire"},
    {name = "move_characters@Jimmy@slow@"},
    {name = "move_characters@michael@fire"},
    {name = "move_f@flee@a"},
    {name = "move_f@scared"},
    {name = "move_f@sexy@a"},
    {name = "move_heist_lester"},
    {name = "move_injured_generic"},
    {name = "move_lester_CaneUp"},
    {name = "move_m@bag"},
    {name = "MOVE_M@BAIL_BOND_NOT_TAZERED"},
    {name = "MOVE_M@BAIL_BOND_TAZERED"},
    {name = "move_m@brave"},
    {name = "move_m@casual@d"},
    {name = "move_m@drunk@moderatedrunk"},
    {name = "MOVE_M@DRUNK@MODERATEDRUNK"},
    {name = "MOVE_M@DRUNK@MODERATEDRUNK_HEAD_U}"},
    {name = "MOVE_M@DRUNK@SLIGHTLYDRUNK"},
    {name = "MOVE_M@DRUNK@VERYDRUNK"},
    {name = "move_m@fire"},
    {name = "move_m@gangster@var_e"},
    {name = "move_m@gangster@var_f"},
    {name = "move_m@gangster@var_i"},
    {name = "move_m@JOG@"},
    {name = "MOVE_M@PRISON_GAURD"},
    {name = "MOVE_P_M_ONE"},
    {name = "MOVE_P_M_ONE_BRIEFCASE"},
    {name = "move_p_m_zero_janitor"},
    {name = "move_p_m_zero_slow"},
    {name = "move_ped_bucket"},
    {name = "move_ped_crouched"},
    {name = "move_ped_mop"},
    {name = "MOVE_M@FEMME@"},
    {name = "MOVE_F@FEMME@"},
    {name = "MOVE_M@GANGSTER@NG"},
    {name = "MOVE_F@GANGSTER@NG"},
    {name = "MOVE_M@POSH@"},
    {name = "MOVE_F@POSH@"},
    {name = "MOVE_M@TOUGH_GUY@"},
    {name = "MOVE_F@TOUGH_GUY@"}
}
for _,v in pairs(walkstyles) do
    menu.add_feature(v.name, "action", femboy_local.walkstyles, function(f)
        if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
            menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
            f.on = false
        else
            femboy_native(0xD2A71E1A77418A49, v.name)
            if femboy_native(0x318234F4F3738AF3, v.name):__tointeger() == 1 then
                femboy_native(0xAF8A94EDE7712BEF, player.player_ped(), v.name, 1.0)
            end
        end
    end)
end

local bullet_proof, fire_proof, explosion_proof, collision_proof, melee_proof, steam_proof, water_proof
local native_call = femboy_native

menu.add_feature("Set All Entity Proofs", "toggle", femboy_local.player_proof, function(f)
	while f.on do
		system.wait()
		bullet_proof.on=f.on
		fire_proof.on=f.on
		explosion_proof.on=f.on
		collision_proof.on=f.on
		melee_proof.on=f.on 
		steam_proof.on=f.on 
		water_proof.on=f.on
	end
end)

bullet_proof = menu.add_feature("Set Bulletproof", "toggle", femboy_local.player_proof, function(f)
	while f.on do
		native_call(0xFAEE099C6F890BB8, player.get_player_ped(player.player_id()), true, 0, 0, 0, 0, 0, 1, 0)
		system.wait()
	end
end) 

fire_proof = menu.add_feature("Set Fireproof", "toggle", femboy_local.player_proof, function(f)
	while f.on do
		native_call(0xFAEE099C6F890BB8, player.get_player_ped(player.player_id()), 0, true, 0, 0, 0, 0, 1, 0)
		system.wait()
	end
end) 

explosion_proof = menu.add_feature("Set Explosion Proof", "toggle", femboy_local.player_proof, function(f)
	while f.on do
		native_call(0xFAEE099C6F890BB8, player.get_player_ped(player.player_id()), 0, 0, true, 0, 0, 0, 1, 0)
		system.wait()
	end
end) 

collision_proof = menu.add_feature("Set Collision Proof", "toggle", femboy_local.player_proof, function(f)
	while f.on do
		native_call(0xFAEE099C6F890BB8, player.get_player_ped(player.player_id()), 0, 0, 0, true, 0, 0, 1, 0)
		system.wait()
	end
end) 

melee_proof = menu.add_feature("Set Melee Proof", "toggle", femboy_local.player_proof, function(f)
	while f.on do
		native_call(0xFAEE099C6F890BB8, player.get_player_ped(player.player_id()), 0, 0, 0, 0, true, 0, 1, 0)
		system.wait()
	end
end) 

steam_proof = menu.add_feature("Set Steam Proof", "toggle", femboy_local.player_proof, function(f)
	while f.on do
		native_call(0xFAEE099C6F890BB8, player.get_player_ped(player.player_id()), 0, 0, 0, 0, 0, true, 1, 0)
		system.wait()
	end
end) 

water_proof = menu.add_feature("Set Water Proof", "toggle", femboy_local.player_proof, function(f)
	while f.on do
		native_call(0xFAEE099C6F890BB8, player.get_player_ped(player.player_id()), 0, 0, 0, 0, 0, 0, 1, true)
		system.wait()
	end
end) 

feat_tv.AllRGBHair = menu.add_feature("Loop All Hair Colours", "value_i", femboy_local.rgb_player_feature, function(f)
    while f.on do
        local playerped = player.get_player_ped(player.player_id())
        for i = 0, 63 do
            ped.set_ped_hair_colors(playerped, i, i)
            if not f.on then
                break
            end
            system.wait(f.value)
        end
    end
end)
feat_tv.AllRGBHair.min = 0
feat_tv.AllRGBHair.max = 10000
feat_tv.AllRGBHair.mod = 50

feat_tv.RGBHair = menu.add_feature("Rainbow Hair (better)", "value_i", femboy_local.rgb_player_feature, function(f)
    while f.on do
        local playerped = player.get_player_ped(player.player_id())
        for i = 33, 53 do
            ped.set_ped_hair_colors(playerped, i, i)
            if not f.on then
                break
            end
            system.wait(f.value)
        end
    end
end)
feat_tv.RGBHair.min = 0
feat_tv.RGBHair.max = 10000
feat_tv.RGBHair.mod = 50

menu.add_feature("Self Money Drop", "toggle", femboy_local.player_feature, function(f)
    while f.on do
        request_model(0x749B5065)
        local coords = player.get_player_coords(player.player_id())
        local peds = native.call(0xD49F9B0955C367DE, 6, 0x749B5065, coords.x, coords.y, coords.z, 0.0, false, false):__tointeger() -- spawn ped
        entity.set_entity_visible(peds, false)
        native.call(0xA9C8960E8684C1B5, peds, 2000) -- give money
        native.call(0x1913FE4CBF41C463, peds, 392, true) -- remove snacks
        ped.set_ped_health(peds, 0.0)
        system.wait(200)
        entity.delete_entity(peds)
    end
end)

feats.mobileradio = menu.add_feature("Mobile Radio", "toggle", femboy_local.player_feature, function(f)
    gameplay.set_mobile_radio(f.on)
end)

femboy_local.notified = false
menu.add_feature("Ragdoll On Q", "value_str", femboy_local.player_feature, function(f)
    if not femboy_local.notified then
        menu.notify("Normal Ragdoll is recommended. Press Q to enable ragdoll, Press Q again to stand back up",
            "Femboy Menu")
        femboy_local.notified = true
    end
    while f.on do
        if (controls.is_control_just_pressed(0, 44) or controls.is_control_just_pressed(2, 44)) then
            local pid = player.player_ped()
            if ped.is_ped_ragdoll(pid) then
                ped.clear_ped_tasks_immediately(player.player_ped())
            else
                ped.set_ped_to_ragdoll(pid, 10000, 20000, f.value + 2)
            end
        end
        system.wait()
    end
end):set_str_data({"Narrow Leg Stumble", "Wide Leg Stumble", "Normal Ragdoll"})

feats.clumsy = menu.add_feature("Clumsy Player", "toggle", femboy_local.player_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        while f.on do
            femboy_native(0xF0A4F1BBF4FA7497, player.player_ped(), true)
            system.wait()
        end
    end
end)

-- weapon_feature
menu.add_feature("Give All Weapons", "action", femboy_local.weapon_feature, function(f)
    local weapon_hashes = weapon.get_all_weapon_hashes()
    for _, hash in ipairs(weapon_hashes) do
        weapon.give_delayed_weapon_to_ped(player.player_ped(), hash, 1000, false)
    end
end)

menu.add_feature("Remove All Weapons", "action", femboy_local.weapon_feature, function(f)
    weapon.remove_all_ped_weapons(player.player_ped())
end)

menu.add_feature("TP Gun", "toggle", femboy_local.weapon_feature, function(f)
    while f.on do
        local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player.player_ped())
        local v2_coord = v2(v3_coord.x, v3_coord.y)

        if v2_coord.x ~= 0 or v2_coord.y ~= 0 then
            ui.set_new_waypoint(v2_coord)
            menu.get_feature_by_hierarchy_key("local.teleport.waypoint"):toggle()
        end
        
        system.wait()
    end 
end)

menu.add_feature("Delete Gun", "toggle", femboy_local.weapon_feature, function(f)
    while f.on do
        local entity_to_delete = player.get_entity_player_is_aiming_at(player.player_id())
        local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player.player_ped())
        local is_entity_an_object = entity.is_an_entity(entity_to_delete)
        network.request_control_of_entity(entity_to_delete)
        if bool_rtn and is_entity_an_object then 
            entity.delete_entity(entity_to_delete)
        end
        system.wait()
    end
end)

menu.add_feature("Kick Gun", "toggle", femboy_local.weapon_feature, function(f)
    while f.on do
        for pid = 0, 31 do
            if player.is_player_valid(pid) then 
                local player_ped = player.get_player_ped(pid)
                local entity_to_kick = player.get_entity_player_is_aiming_at(player.player_id())
                local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player.player_ped())
                local player_coords = player.get_player_coords(pid)
                if entity_to_kick == player_ped and bool_rtn then 
                    network.force_remove_player(pid)
                end
            end
        end
        system.wait()
    end
end)

menu.add_feature("RP Gun", "toggle", femboy_local.weapon_feature, function(f)
    while f.on do 
        request_model(437412629)
        local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player.player_ped())
        if bool_rtn then
            femboy_native(0x673966A0C0FD7171, 738282662, v3_coord, 0, 1, 437412629, 0, 1)
        end
    system.wait()
    end
end)
menu.add_feature("Card Gun", "toggle", femboy_local.weapon_feature, function(f)
    while f.on do 
        request_model(3030532197)
        local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player.player_ped())
        if bool_rtn then
            femboy_native(0x673966A0C0FD7171, -1009939663, v3_coord, 0, 1, 3030532197, 0, 1)
        end
    system.wait()
    end
end)
menu.add_feature("Wall Gun", "toggle", femboy_local.weapon_feature, spawn_obect).data = 0xA4D194D1
menu.add_feature("Wellie Gun", "toggle", femboy_local.weapon_feature, spawn_obect).data = 0x9CAFCB2
menu.add_feature("Dildo Gun", "toggle", femboy_local.weapon_feature, spawn_obect).data = 0x4F7B518F

menu.add_feature("Orbital Gun", "toggle", femboy_local.weapon_feature, function(f)
    while f.on do
        local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player.player_ped())
        if bool_rtn then 
            fire.add_explosion(v3_coord, 59, false, false, 1, player.player_ped())
            graphics.set_next_ptfx_asset("scr_xm_orbital")
            while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
                graphics.request_named_ptfx_asset("scr_xm_orbital")
                system.yield(0)
            end
            graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", v3_coord, v3(0, 180, 0), 1.0, true, true, true)
        end
        system.wait()
    end
end)

-- vehicle_feature 
menu.add_feature("Open All Doors", "action", femboy_local.door_control, function(f)
    local veh = player.get_player_vehicle(player.player_id())
    for i = 0, 5 do
        vehicle.set_vehicle_door_open(veh, i, false, false)
    end
end)

femboy_local.opendor = menu.add_feature("Open Door", "action_value_i", femboy_local.door_control, function(f)
    local veh = player.get_player_vehicle(player.player_id())
    vehicle.set_vehicle_door_open(veh, f.value, false, false)
end)
femboy_local.opendor.min = 0
femboy_local.opendor.max = 5
femboy_local.opendor.mod = 1

menu.add_feature("Close All Doors", "action", femboy_local.door_control, function(f)
    local veh = player.get_player_vehicle(player.player_id())
    vehicle.set_vehicle_doors_shut(veh, false)
end)

menu.add_feature("Remove All Doors", "action", femboy_local.door_control, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        local veh = player.get_player_vehicle(player.player_id())
        for i = 0, 5 do
            femboy_native(0xD4D4F6A4AB575A33, veh, i, true) -- SET_VEHICLE_DOOR_BROKEN
        end
    end
end)

femboy_local.brkdor = menu.add_feature("Remove Specific Door", "action_value_i", femboy_local.door_control, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        local veh = player.get_player_vehicle(player.player_id())
        femboy_native(0xD4D4F6A4AB575A33, veh, f.value, true) -- SET_VEHICLE_DOOR_BROKEN, true = delete, false = break
    end
end)
femboy_local.brkdor.min = 0
femboy_local.brkdor.max = 5
femboy_local.brkdor.mod = 1

femboy_local.wndwcol = menu.add_feature("Window Tint", "action_value_i", femboy_local.door_control, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        local veh = player.get_player_vehicle(player.player_id())
        while feat.on do
            femboy_native(0x57C51E6BAD752696, veh, feat.value)
            system.wait(0)
        end
    end
end)
femboy_local.wndwcol.min = 0
femboy_local.wndwcol.max = 5
femboy_local.wndwcol.mod = 1

menu.add_feature("Windows Open/Close", "toggle", femboy_local.door_control, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        local veh = player.get_player_vehicle(player.player_id())
        if f.on then
            femboy_native(0x85796B0549DDE156, veh) -- ROLL_DOWN_WINDOWS
        else
            for i = 0, 3 do
                femboy_native(0x602E548F46E24D59, veh, i) -- ROLL_UP_WINDOW
            end
        end
    end
end)

menu.add_feature("Change Engine Noise", "action", femboy_local.vehicle_customisation, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        local veh = player.get_player_vehicle(player.player_id())
        local rtn, noise 
        repeat 
            rtn, noise = input.get("Enter Vehicle Hash", "", 20, eInputType.IT_ASCII)
            if rtn == 2 then return end
            system.wait()
        until rtn == 0
        femboy_native(0x4F0C413926060B38, veh, noise)
    end
end) 

menu.add_feature("Set Primary Hex Colour", "action", femboy_local.vehicle_customisation, function(f)
    local veh = player.get_player_vehicle(player.player_id())

    if player.is_player_in_any_vehicle(player.player_id()) then
        repeat
            rtn, colour = input.get("Enter custom colour hex or rgb value (e.g. FF0000)", "", 6,eInputType.IT_ASCII)
            if rtn == 2 then return end
            system.wait(0)
        until rtn == 0

        local hex_colour = tonumber(colour, 16)
        vehicle.set_vehicle_custom_primary_colour(veh, hex_colour)
        menu.notify("Custom primary colour set to " .. colour, "Custom Colour")
    else
        menu.notify("You are not in a vehicle!", "Femboy Menu")
    end
end)

menu.add_feature("Set Secondary Hex Colour", "action", femboy_local.vehicle_customisation, function(f)
    local veh = player.get_player_vehicle(player.player_id())

    if player.is_player_in_any_vehicle(player.player_id()) then
        repeat
            rtn, colour = input.get("Enter custom colour hex or rgb value (e.g. FF0000)", "", 6,
                eInputType.IT_ASCII)
            if rtn == 2 then return end
            system.wait(0)
        until rtn == 0

        local hex_colour = tonumber(colour, 16)
        vehicle.set_vehicle_custom_secondary_colour(veh, hex_colour)
        menu.notify("Custom secondary colour set to " .. colour, "Custom Colour")
    else
        menu.notify("You are not in a vehicle!", "Femboy Menu")
    end
end)

menu.add_feature("Set Pearlescent Hex Colour", "action", femboy_local.vehicle_customisation, function(f)
    local veh = player.get_player_vehicle(player.player_id())

    if player.is_player_in_any_vehicle(player.player_id()) then
        repeat
            rtn, colour = input.get("Enter custom colour hex or rgb value (e.g. FF0000)", "", 6,
                eInputType.IT_ASCII)
            if rtn == 2 then return end
            system.wait(0)
        until rtn == 0

        local hex_colour = tonumber(colour, 16)
        vehicle.set_vehicle_custom_pearlescent_colour(veh, hex_colour)
        menu.notify("Custom pearlescent colour set to " .. colour, "Custom Colour")
    else
        menu.notify("You are not in a vehicle!", "Femboy Menu")
    end
end)

menu.add_feature("Set Wheel Hex Colour", "action", femboy_local.vehicle_customisation, function(f)
    local veh = player.get_player_vehicle(player.player_id())

    if player.is_player_in_any_vehicle(player.player_id()) then
        repeat
            rtn, colour = input.get("Enter custom colour hex or rgb value (e.g. FF0000)", "", 6,
                eInputType.IT_ASCII)
            if rtn == 2 then return end
            system.wait(0)
        until rtn == 0

        local hex_colour = tonumber(colour, 16)
        vehicle.set_vehicle_custom_wheel_colour(veh, hex_colour)
        menu.notify("Custom primary colour set to " .. colour, "Custom Colour")
    else
        menu.notify("You are not in a vehicle!", "Femboy Menu")
    end
end)

--menu.add_feature("RGB Vehicle Colour", "toggle", femboy_local.vehicle_customisation, function(f)
--    while f.on do
--        local get_game_timer = femboy_native(0x9CD27B0045628463):__tointeger()
--        local rgb = RGBRainbow(get_game_timer, 2)
--        local veh = player.get_player_vehicle(player.player_id())
--       vehicle.set_vehicle_custom_primary_colour(veh, rgb.r, rgb.b, rgb.g)
--        vehicle.set_vehicle_custom_secondary_colour(veh, rgb.r, rgb.b, rgb.g)
--        vehicle.set_vehicle_custom_pearlescent_colour(veh, rgb.r, rgb.b, rgb.g)
--        vehicle.set_vehicle_custom_wheel_colour(veh, rgb.r, rgb.b, rgb.g)
--        system.wait()
--    end
--end)

menu.add_feature("RGB Tyre Smoke", "toggle", femboy_local.vehicle_customisation, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        while f.on do 
            local get_game_timer = femboy_native(0x9CD27B0045628463):__tointeger()
            local rgb = RGBRainbow(get_game_timer, 2)
            local veh = player.get_player_vehicle(player.player_id())
            vehicle.set_vehicle_tire_smoke_color(veh, rgb.r, rgb.g, rgb.b)
            system.wait()
        end
    end
end)

menu.add_feature("Set Patriot Tyre Smoke", "action", femboy_local.vehicle_customisation, function()
    veh = player.get_player_vehicle(player.player_id())
    vehicle.set_vehicle_tire_smoke_color(veh, 0, 0, 0)
end)

feats.rgb_neons = menu.add_feature("RGB Neons", "toggle", femboy_local.light_control, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        while f.on do
            local get_game_timer = femboy_native(0x9CD27B0045628463):__tointeger()
            local rgb = RGBRainbow(get_game_timer, 2)
            local veh = player.get_player_vehicle(player.player_id())
            for i = 0,3 do
                vehicle.set_vehicle_neon_light_enabled(veh, i, true) 
                femboy_native(0x8E0A582209A62695, veh, rgb.r, rgb.g, rgb.b)
            end
            system.wait()
        end
    end
end)

feats.brake_lights = menu.add_feature("Brake Lights When Stationary", "toggle", femboy_local.light_control, function(feat)
    while feat.on do
        local veh = player.get_player_vehicle(player.player_id())
        local speed = entity.get_entity_speed(veh)
        if speed < 0.5 then
            vehicle.set_vehicle_brake_lights(veh, true)
        end
        system.wait()
    end
end)

feat_tv.rgbX = menu.add_feature("RGB Xenon", "value_i", femboy_local.light_control, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        menu.notify("Xenon Lights Added, BEGIN THE RAVE")
        femboy_native(0x2A1F4F37F95BAD08, veh, 22, f.on) -- TOGGLE_VEHICLE_MOD
        while f.on do
            local veh = player.get_player_vehicle(player.player_id())
            for i = 1, 12 do
                femboy_native(0xE41033B25D003A07, veh, i) -- SET_VEHICLE_XENON_LIGHTS_COLOR
                system.wait(f.value)
            end
            system.wait(0)
        end
    end
end)
feat_tv.rgbX.min = 0
feat_tv.rgbX.max = 2500
feat_tv.rgbX.mod = 100

feat_tv.headlight_brightness = menu.add_feature("Headlight Brightness", "autoaction_value_f", femboy_local.light_control, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        while f.on do
            local veh = player.get_player_vehicle(player.player_id())
            femboy_native(0xB385454F8791F57C, veh, f.value)
            system.wait()
        end
    end
end)
feat_tv.headlight_brightness.min = 0.0
feat_tv.headlight_brightness.max = 100.0
feat_tv.headlight_brightness.mod = 1.0

feats.match_plate_to_speed = menu.add_feature("Match Plate To Speed", "value_str", femboy_local.license_plate, function(f)
    while f.on do
        local veh = player.get_player_vehicle(player.player_id())
        local speed = entity.get_entity_speed(player.get_player_vehicle(player.player_id()))
        
        if f.value == 0 then
            vehicle.set_vehicle_number_plate_text(veh, math.floor(speed * 2.236936) .. " MPH")
        elseif f.value == 1 then
            vehicle.set_vehicle_number_plate_text(veh, math.floor(speed * 3.6) .. " KPH")
        elseif f.value == 2 then
            vehicle.set_vehicle_number_plate_text(veh, math.floor(speed) .. " MPS")
        end
        system.wait()
    end
end):set_str_data({ "Mph", "Kph", "Metres per second" })

menu.add_feature("Set Custom License Plate", "action", femboy_local.license_plate, function(f)
    local veh = player.get_player_vehicle(player.player_id())

    if player.is_player_in_any_vehicle(player.player_id()) then
        repeat
            rtn, plate = input.get("Command box", "", 8, eInputType.IT_ASCII)
            if rtn == 2 then rtn = 0 end
            system.wait(0)
        until rtn == 0

        vehicle.set_vehicle_number_plate_text(veh, plate)
    else
        menu.notify("You are not in a vehicle!", "Femboy Menu")
    end
end)

menu.add_feature("Keep Custom License Plate", "toggle", femboy_local.license_plate, function(f)
    local veh = player.get_player_vehicle(player.player_id())
    if player.is_player_in_any_vehicle(player.player_id()) then
        repeat
            rtn, plate = input.get("Input Custom Plate", "", 8, eInputType.IT_ASCII)
            if rtn == 2 then rtn = 0 end
            system.wait(0)
        until rtn == 0
        vehicle.set_vehicle_number_plate_text(veh, plate)
        while f.on do
            local new_veh = player.get_player_vehicle(player.player_id())
            if new_veh ~= veh then -- if the player has changed vehicles
                veh = new_veh
                local current_plate = vehicle.get_vehicle_number_plate_text(veh)
                if current_plate ~= plate then
                    vehicle.set_vehicle_number_plate_text(veh, plate)
                end
            end
            system.wait()
        end
    else
        menu.notify("You are not in a vehicle!", "Femboy Menu")
    end
end)

local plate_type = menu.add_feature("Change Plate Type", "autoaction_value_i", femboy_local.license_plate, function(f)
    local veh = player.get_player_vehicle(player.player_id())
    vehicle.set_vehicle_number_plate_index(veh, f.value)
end)
plate_type.min = 0
plate_type.max = 5
plate_type.mod = 1

--[[menu.add_feature("Give Car Parachute", "toggle", vehicle_feature, function(f)
    while f.on do
        local veh = player.get_player_vehicle(player.player_id())
        local vehicle_model = vehicle.get_vehicle_model(veh)
        local vehicle_hash = gameplay.get_hash_key(vehicle_model)
        streaming.set_vehicle_model_has_parachute(vehicle_hash, true)
        vehicle.set_vehicle_parachute_model(veh, 1298918533)
        vehicle.set_vehicle_parachute_active(veh, true)
        system.wait()
    end
end).on=true
]]

local vehicleop = {
    "Annihilator Stealth",
    "B-11 Strikeforce",
    "Akula",
    "Pyro",
    "Scramjet",
    "FH-1 Hunter",
    "Vigilante",
    "APC",
    "Chernobog",
    "Deluxo",
    "Ruiner 2000",
    "P-996 LAZER",
    "LF-22 Starling",
    "Hydra",
    "Thruster",
    "Stromberg",
    "P-45 Nokota",
    "Oppressor",
    "Oppressor Mk II",
    "Toreador",
    "Savage",
    "Sea Sparrow",
    "Sparrow",
    "V-65 Molotok",
    "Buzzard Attack Chopper",
    "Anti-Aircraft Trailer",
    "Rogue"
}
menu.add_feature("Homing Lockon To Players", "toggle", femboy_local.vehicle_feature, function(f)
    local pedTable = {}
    streaming.request_model(gameplay.get_hash_key("cs_jimmydisanto"))
    local timer = utils.time_ms() + 1000
    while not streaming.has_model_loaded(gameplay.get_hash_key("cs_jimmydisanto")) and timer > utils.time_ms() do
        system.wait(0)
    end
    if timer < utils.time_ms() + 900 and not streaming.has_model_loaded(gameplay.get_hash_key("cs_jimmydisanto")) then
        f.on = false
    end
    while f.on do
        system.wait(100)
        local player_vehicle = vehicle.get_vehicle_model(ped.get_vehicle_ped_is_using(player.get_player_ped(player
        .player_id())))
        local is_vehicle_in_table = false
        for i, v in ipairs(vehicleop) do
            if v == player_vehicle then
                is_vehicle_in_table = true
                break
            end
        end
        if is_vehicle_in_table then
            if not pedTable then
                pedTable = {}
            end
            for pid = 0, 31 do
                if player.is_player_valid(pid) and pid ~= player.player_id() and not pedTable[pid] and not entity.is_entity_dead(player.get_player_ped(pid)) then
                    pedTable[pid] = ped.create_ped(4, gameplay.get_hash_key("cs_jimmydisanto"),
                        player.get_player_coords(pid), 0, false, true)
                    entity.set_entity_as_mission_entity(pedTable[pid], true, true)
                    entity.attach_entity_to_entity(pedTable[pid], player.get_player_ped(pid), 0, v3(0, 0, 0), v3(0, 0, 0),
                        true, false, false, 0, false)
                elseif not player.is_player_valid(pid) or entity.is_entity_dead(player.get_player_ped(pid)) or entity.is_entity_dead(pedTable[pid] or 0) then -- ez skid
                    pedTable[pid] = nil
                end
            end
        elseif pedTable then
            for k, v in pairs(pedTable) do
                entity.detach_entity(v)
                entity.set_entity_as_no_longer_needed(v)
                entity.set_entity_coords_no_offset(v, v3(16000, 16000, -2000))
            end
            pedTable = nil
        end
        system.wait(0)
    end
    streaming.set_model_as_no_longer_needed(gameplay.get_hash_key("cs_jimmydisanto"))
    if pedTable then
        for k, v in pairs(pedTable) do
            entity.detach_entity(v)
            entity.set_entity_as_no_longer_needed(v)
            entity.set_entity_coords_no_offset(v, v3(16000, 16000, -2000))
        end
        pedTable = nil
    end
end)

menu.add_feature("Fix Vehicle", "action", femboy_local.vehicle_feature, function()
    vehicle.set_vehicle_fixed(player.get_player_vehicle(player.player_id()))
end)

feats.autorepair = menu.add_feature("Auto Repair", "toggle", femboy_local.vehicle_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        while f.on do
            local veh = player.player_vehicle()
            if player.is_player_in_any_vehicle(player.player_id()) then
                local speed = entity.get_entity_speed(veh)

            if femboy_native(0x11D862A3E977A9EF, veh):__tointeger() == 0 then -- ARE_ALL_VEHICLE_WINDOWS_INTACT
                for i = 0, 7 do 
                    femboy_native(0x772282EBEB95E682, veh, i) -- FIX_VEHICLE_WINDOW
                end 
            end

            if speed <= 75 and vehicle.is_vehicle_damaged(veh) then
                vehicle.set_vehicle_fixed(veh, true)
            elseif speed >= 81 then 
                repeat
                    local speed = entity.get_entity_speed(veh)
                    system.wait()
                until speed  <= 75 

                if speed <= 75 then
                    vehicle.set_vehicle_fixed(player.get_player_vehicle(player.player_id()), true)
                end
            end   

            end
            system.wait(5)
        end
    end
end)

if feats.autorepair.on then
    feats.autorepair.on = false
    feats.autorepair.on = true
end

femboy_local.rattle = menu.add_feature("Engine Rattle", "value_f", femboy_local.vehicle_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        local veh = player.player_vehicle()
        femboy_native(0x01BB4D577D38BD9E, veh, f.value, f.on)
    end
end)
femboy_local.rattle.min = 0.0
femboy_local.rattle.max = 1.0
femboy_local.rattle.mod = 0.1
femboy_local.rattle.value = 0.0

femboy_local.dirtLevel = menu.add_feature("Dirt Level", "autoaction_value_f", femboy_local.vehicle_feature, function(feat)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        feat.on = false
    else
        local veh = player.get_player_vehicle(player.player_id())
        while feat.value do
            femboy_native(0x79D3B596FE44EE8B, veh, feat.value)
            system.wait(0)
        end
    end
end)
femboy_local.dirtLevel.min = 0.0
femboy_local.dirtLevel.max = 15.0
femboy_local.dirtLevel.mod = 1.0

feats.stayclean = menu.add_feature("Stay Clean", "toggle", femboy_local.vehicle_feature, function(feat)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        feat.on = false
    else
        while feat.on do
            femboy_native(0x79D3B596FE44EE8B, player.get_player_vehicle(player.player_id()), 0)
            system.wait(0)
        end
    end
end)

femboy_local.grvty = menu.add_feature("Gravity", "value_f", femboy_local.vehicle_feature, function(f)
    while f.on do
        vehicle.set_vehicle_gravity_amount(player.get_player_vehicle(player.player_id()), f.value)
        system.wait()
    end
    vehicle.set_vehicle_gravity_amount(player.get_player_vehicle(player.player_id()), 9.8)
end)
femboy_local.grvty.min = -5.0
femboy_local.grvty.max = 20.0
femboy_local.grvty.mod = 1.0

feats.airsuspension = menu.add_feature("Air Suspension", "toggle", femboy_local.vehicle_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        while f.on do
            system.wait()
            local veh = player.get_player_vehicle(player.player_id())
            local speed = entity.get_entity_speed(veh)
            if speed > 0.5 then
                femboy_native(0x3A375167F5782A65, veh, false)
            else
                femboy_native(0x3A375167F5782A65, veh, true)
            end
            system.wait()
        end
    end
    local speed = entity.get_entity_speed(player.get_player_vehicle(player.player_id()))
    femboy_native(0x3A375167F5782A65, veh, false)
end)

feats.driftsuspension = menu.add_feature("Drift Suspension", "toggle", femboy_local.vehicle_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        menu.notify("only works on vehicles released in the Tuners Update", "Femboy Menu")
        while f.on do
            local veh = player.get_player_vehicle(player.player_id())
            femboy_native(0x3A375167F5782A65, veh, f.on) -- SET_REDUCE_DRIFT_VEHICLE_SUSPENSION(veh, bool)
            system.wait()
        end
        local veh = player.get_player_vehicle(player.player_id())
        femboy_native(0x3A375167F5782A65, veh, f.off)
    end
end)

feats.drifttyres = menu.add_feature("Drift Tyres", "toggle", femboy_local.vehicle_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        while f.on do
            local veh = player.get_player_vehicle(player.player_id())
            femboy_native(0x5AC79C98C5C17F05, veh, f.on) -- SET_DRIFT_TYRES_ENABLED(veh, bool)
            system.wait()
        end
        local veh = player.get_player_vehicle(player.player_id())
        femboy_native(0x5AC79C98C5C17F05, veh, f.off)
    end
end)

menu.add_feature("Exhaust Backfire", "value_str", femboy_local.vehicle_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        if player.is_player_in_any_vehicle(player.player_id()) then
            while f.on do
                local veh = player.player_vehicle()
                femboy_native(0x2BE4BC731D039D5A, veh, f.value)
                system.wait()
            end
        end
    end
end):set_str_data({ "Disable", "Enable" })

menu.add_feature("Nitrous Backfire", "toggle", femboy_local.vehicle_feature, function(f)
    if f.on then
        requestptfx("veh_xs_vehicle_mods")
        local veh = player.get_player_vehicle(player.player_id())
        femboy_native(0xC8E9B6B71B8E660D, veh, true, 50.0, 50.0, 1.0, false)
    else
        local veh = player.player_vehicle()
        femboy_native(0xC8E9B6B71B8E660D, veh, false, f.value, f.value, 1.0, false)
        graphics.remove_named_ptfx_asset("veh_xs_vehicle_mods")
        graphics.remove_ptfx_from_entity(veh)
    end
end)

feat_tv.pwr = menu.add_feature("Power Increasinator", "value_i", femboy_local.vehicle_feature, function(f)
    while f.on do
        local veh = player.get_player_vehicle(player.player_id())
        vehicle.modify_vehicle_top_speed(veh, f.value)
        system.wait()
    end
    local veh = player.get_player_vehicle(player.player_id())
    vehicle.modify_vehicle_top_speed(veh, 1)
end)
feat_tv.pwr.min = 0
feat_tv.pwr.max = 100000
feat_tv.pwr.mod = 10

feat_tv.veh_max_speed = menu.add_feature("Speed Limiter (Mph)", "value_f", femboy_local.vehicle_feature, function(f)
    while f.on do
        local veh = player.get_player_vehicle(player.player_id())
        if veh then
            entity.set_entity_max_speed(veh, (f.value / 2.236936))
        end
        system.wait(0)
    end
    local veh = player.get_player_vehicle(player.player_id())
    entity.set_entity_max_speed(veh, 155)
end)
feat_tv.veh_max_speed.min = 1.0
feat_tv.veh_max_speed.max = 10000.0
feat_tv.veh_max_speed.mod = 5.0
feat_tv.veh_max_speed.value = 155.0

menu.add_feature("Speedometer", "value_str", femboy_local.vehicle_feature, function(f)
    while f.on do
        local speed = entity.get_entity_speed(player.get_player_vehicle(player.player_id()))

        ui.set_text_scale(0.35)
        ui.set_text_font(0)
        ui.set_text_centre(0)
        ui.set_text_color(255, 255, 255, 255)
        ui.set_text_outline(true)

        if f.value == 0 then
            ui.draw_text(math.floor(speed * 2.236936) .. " Mph", v2(0.5, 0.95))
        end
        if f.value == 1 then
            ui.draw_text(math.floor(speed * 3.6) .. " Kph", v2(0.5, 0.95))
        end
        if f.value == 2 then
            ui.draw_text(math.floor(speed * 1.943844) .. " kt", v2(0.5, 0.95))
        end
        if f.value == 3 then
            ui.draw_text(string.format("%.2f", speed * 0.00291545) .. " Mach", v2(0.5, 0.95))
        end
        if f.value == 4 then
            ui.draw_text(math.floor(speed) .. " mps", v2(0.5, 0.95))
        end
        system.wait(0)
    end
end):set_str_data({ "Mph", "Kph", "Knots", "Mach", "Metres per second" })

femboy_local.fwdlaunch = menu.add_feature("Launch Forward", "action_slider", femboy_local.vehicle_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        local veh = player.get_player_vehicle(player.player_id())
        femboy_native(0xAB54A438726D25D5, veh, f.value)
    end
end)
femboy_local.fwdlaunch.min = 0.0
femboy_local.fwdlaunch.max = 10000.0
femboy_local.fwdlaunch.mod = 50.0

menu.add_feature("Turn Engine Off", "action", femboy_local.vehicle_feature, function()
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        local veh = player.get_player_vehicle(player.player_id())
        femboy_native(0x2497C4717C8B881E, veh, 0, 0, true)
    end
end)

menu.add_feature("Kill engine", "action", femboy_local.vehicle_feature, function()
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        menu.notify("next bit of damage will kill the car, gl", "Femboy Menu")
        local veh = player.get_player_vehicle(player.player_id())
        femboy_native(0x45F6D8EEF34ABEF1, veh, 0)
    end
end)

menu.add_feature("Notify Engine Health", "action", femboy_local.vehicle_feature, function(feat)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        local veh = player.get_player_vehicle(player.player_id())
        local enginehealth = femboy_native(0xC45D23BAF168AAB8, veh):__tonumber() --GET_VEHICLE_ENGINE_HEALTH
        menu.notify("Engine health is " .. enginehealth .. ".", "Femboy Menu")
    end
end)

-- online_feature
menu.add_feature("Script Hostaholic", "toggle", femboy_local.online_feature, function(f)
    while f.on do
        menu.get_feature_by_hierarchy_key("online.lobby.force_script_host"):toggle()
        system.wait(2000)
    end
end)

menu.add_feature("Force Host", "toggle", femboy_local.online_feature, function(f)
    while f.on do
        local ped = player.player_id() -- get the player's ID
        if player.is_player_host(ped) then
            menu.notify("You Are Host", "Femboy Menu")
            f.on = false
        else
            for pid = 0, 31 do
                local host = player.get_host()
                if host ~= ped then
                    network.force_remove_player(host)
                    menu.notify("Getting Host", "Femboy Menu")
                end
            end
        end
        system.wait()
    end
end)

menu.add_feature("Bail from session", "action", femboy_local.online_feature, function(f)
    network.force_remove_player(player.player_id())
end)

menu.add_feature("Bail To SP", "action", femboy_local.online_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        if femboy_native(0x580CE4438479CC61) then
            femboy_native(0x95914459A87EBA28, 0, 0, 0)
        end
    end
end)

--lobby_options
menu.add_feature("Give RP Gun To All Players", "toggle", femboy_local.lobby_options, function(f)
    while f.on do
        request_model(437412629)
        for i = 0, 31 do 
            if player.is_player_valid(i) then 
                local player_ped = player.get_player_ped(i)
                local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player_ped)
                if bool_rtn then
                    femboy_native(0x673966A0C0FD7171, 738282662, v3_coord, 0, 1, 437412629, 0, 1)
                end
            end
        end
        system.wait()
    end
end)

menu.add_feature("Give Card Gun To All Players", "toggle", femboy_local.lobby_options, function(f)
    while f.on do
        request_model(3030532197)
        for i = 0, 31 do 
            if player.is_player_valid(i) then 
                local player_ped = player.get_player_ped(i)
                local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player_ped)
                if bool_rtn then
                    femboy_native(0x673966A0C0FD7171, -1009939663, v3_coord, 0, 1, 3030532197, 0, 1)
                end
            end
        end
        system.wait()
    end
end)

menu.add_feature("Orbital Lobby", "action", femboy_local.lobby_options, function(f)
    for pid = 0,31 do
        local v3_coord = player.get_player_coords(pid)
        fire.add_explosion(v3_coord, 59, false, false, 1, pid)
        graphics.set_next_ptfx_asset("scr_xm_orbital")
        while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
            graphics.request_named_ptfx_asset("scr_xm_orbital")
            system.yield(0)
        end
        graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", v3_coord, v3(0, 180, 0), 1.0, true, true, true)
    end
end)

menu.add_feature("Orbital Lobby (loop)", "toggle", femboy_local.lobby_options, function(f)
    while f.on do
        for pid = 0,31 do
            local v3_coord = player.get_player_coords(pid)
            fire.add_explosion(v3_coord, 59, false, false, 1, pid)
            graphics.set_next_ptfx_asset("scr_xm_orbital")
            while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
                graphics.request_named_ptfx_asset("scr_xm_orbital")
                system.yield(0)
            end
            graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", v3_coord, v3(0, 180, 0), 1.0, true, true, true)
        end
        system.wait()
    end
end)

menu.add_feature("Give All Weapons To All Players", "action", femboy_local.lobby_options, function(f)
    menu.get_feature_by_hierarchy_key("online.all_players.give_all_weapons"):toggle()
end)

menu.add_feature("Remove All Weapons From All Players", "action", femboy_local.lobby_options, function(f)
    menu.get_feature_by_hierarchy_key("online.all_players.remove_all_weapons"):toggle()
end)

femboy_local.aim_karma = menu.add_feature("Aim Karma", "parent", femboy_local.online_feature).id
local aim_karma_table
local function APv2(f)
    while f.on do
        local PlayerPed = player.get_player_ped(player.player_id())
        if aim_karma_table then -- checking if APv2 exists isnt needed
            for pid = 0, 31 do -- for every player in the lobby
                if player.is_player_valid(pid) == true then -- if the player matches an ID then
                    local AimingAt = player.get_entity_player_is_aiming_at(pid) -- gets the entity a player is aiming at
                    local EnemyPos = player.get_player_coords(pid) -- gets the coords of the player above
                    if AimingAt == PlayerPed then --- if ped being aimed at is the same as player ped, then do the following
                        if aim_karma_table["notifykarma"].on then
                            menu.notify(player.get_player_name(pid) .. " aimed at you", "Femboy Menu")
                        end

                        if aim_karma_table["removeheldweaponkarma"].on then 
                            local player_ped = player.get_player_ped(pid)
                            local held_weapon = ped.get_current_ped_weapon(player_ped)
                            weapon.remove_weapon_from_ped(player_ped, held_weapon)
                        end

                        if aim_karma_table["removeweaponkarma"].on then
                            menu.get_feature_by_hierarchy_key("online.online_players.player_"..pid..".weapons.remove_all_weapons"):toggle()
                        end

                        if aim_karma_table["kickkarma"].on then
                            network.force_remove_player(pid)
                            menu.notify(player.get_player_name(pid) .. " was kicked for aiming at you", "Femboy Menu")
                        end

                        if aim_karma_table["tazekarma"].on then
                            local playerstart = player.get_player_coords(pid) + 1
                            local playerloc = player.get_player_coords(pid)
                            request_model(911657153)
                            gameplay.shoot_single_bullet_between_coords(playerstart, playerloc, 1000, 911657153, player.player_ped(), true, false, 100)
                        end

                        if aim_karma_table["killkarma"].on then
                            local playerstart = player.get_player_coords(pid) + 1
                            local playerloc = player.get_player_coords(pid)
                            request_model(3219281620)
                            gameplay.shoot_single_bullet_between_coords(playerstart, playerloc, 10000, 3219281620, player.player_ped(), true, false, 100)
                        end

                        if aim_karma_table["explokarma"].on then
                            local playerstart = player.get_player_coords(pid) + 1
                            local playerloc = player.get_player_coords(pid)
                            request_model(1672152130)
                            gameplay.shoot_single_bullet_between_coords(playerstart, playerloc, 1000, 1672152130, player.player_ped(), true, false, 100)
                        end

                        if aim_karma_table["orbkarma"].on then
                            local v3_coord = player.get_player_coords(pid)
                            fire.add_explosion(v3_coord, 59, false, false, 1, player.player_id())
                            graphics.set_next_ptfx_asset("scr_xm_orbital")
                            while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
                                graphics.request_named_ptfx_asset("scr_xm_orbital")
                                system.yield(0)
                            end
                            graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", v3_coord, v3(0, 180, 0), 1.0, true, true, true)
                        end

                        if aim_karma_table["firewrkkarma"].on then
                            local playerstart = player.get_player_coords(pid) + 1
                            local playerloc = player.get_player_coords(pid)
                            request_model(2138347493)
                            gameplay.shoot_single_bullet_between_coords(playerstart, playerloc, 1000, 2138347493, player.player_ped(), true, false, 100)
                        end

                        if aim_karma_table["atomkarma"].on then
                            local playerstart = player.get_player_coords(pid) + 1
                            local playerloc = player.get_player_coords(pid)
                            request_model(2939590305)
                            gameplay.shoot_single_bullet_between_coords(playerstart, playerloc, 1000, 2939590305, player.player_ped(), true, false, 100)
                        end

                        if aim_karma_table["tankkarma"].on then
                            local playerloc = player.get_player_coords(pid)
                            playerloc.z = playerloc.z + 2.7
							request_model(2859440138)
                            local veh = vehicle.create_vehicle(2859440138, playerloc, 0, true, false)
                            local network_control = network.request_control_of_entity(veh)
                            entity.set_entity_visible(veh, false)
                            system.wait(1000)
                            entity.delete_entity(veh)
                        end



                    end
                end
            end
        end
        system.wait()
    end
end


feats.enableaimkarma = menu.add_feature("Enable Aim Karma", "toggle", femboy_local.aim_karma, APv2) -- no need to make a function, just pass APv2

menu.add_feature("--------------------", "action", femboy_local.aim_karma)

aim_karma_table = {
    ["notifykarma"] = {name = "Notify If Aimed At", on = false},
    ["removeheldweaponkarma"] = {name = "Remove Held Weapon", on = false, id = 1},
    ["removeweaponkarma"] = {name = "Remove All Weapons", on = false, id = 2},
    ["kickkarma"] = {name = "Kick Player", on = false, id = 3},
    ["tazekarma"] = {name = "Taze Player", on = false, id = 4},
    ["killkarma"] = {name = "Kill Player", on = false, id = 5},
    ["explokarma"] = {name = "Explode Player", on = false, id = 6},
    ["orbkarma"] = {name = "Orbital Cannon Player", on = false, id =10},
    ["firewrkkarma"] = {name = "Firework Player", on = false, id = 7},
    ["atomkarma"] = {name = "Atomize Player (with damage)", on = false, id = 8},
    ["tankkarma"] = {name = "Crush Player", on = false, id = 9}
}

do
    local sorted_aim_karma_table = {}
    for k, v in pairs(aim_karma_table) do
        sorted_aim_karma_table[#sorted_aim_karma_table+1] = v
    end
    table.sort(sorted_aim_karma_table, function(a, b)
        return a.name < b.name
    end)
    
    for k, v in ipairs(sorted_aim_karma_table) do
        feats[k] = menu.add_feature(v.name, "toggle", femboy_local.aim_karma,function(f)
            v.on = f.on -- the while loop isnt needed, it held the function running till it turned off which wouldnt set v.on (previously 'feat') to off
        end)
    end
end

--network_chat_options
local custom_spam_messages = {}

local function save_custom_spam_messages()
    local file = io.open("scripts/femboyluafolder/custom_spam_messages.lua", "w")
    if file then
        local safe_str_table = {}
        for k, v in pairs(custom_spam_messages) do
           safe_str_table[k] = string.format("%q", v):gsub("[\r\n]", "n")
        end
        local str = 'return {' .. table.concat(safe_str_table, ', ') .. '}'
        file:write(str)
        file:flush()
        file:close()
    end
end

femboy_local.custom_spam_chat = menu.add_feature("Custom Chat Spam", "value_i", femboy_local.network_chat_options, function(f)

    local rtn, message
    if f.on then
        repeat
            rtn, message = input.get("Input Message", "", 100, eInputType.IT_ASCII)
            if rtn == 2 then return end
            system.wait()
        until rtn == 0 
    end

    if f.on then
        table.insert(custom_spam_messages, message)
        local feature = menu.add_feature(message, "value_i", femboy_local.network_chat_spam_options, function(f)
            while f.on do
                network.send_chat_message(message, false)
                system.wait(f.value)
            end
        end)
        feature.max = 10000
        feature.min = 0
        feature.mod = 50
        feature.value = 200
    end

    save_custom_spam_messages()

    while f.on do
        network.send_chat_message(message, false)
        system.wait(f.value)
    end
end)
femboy_local.custom_spam_chat.max = 10000
femboy_local.custom_spam_chat.min = 0
femboy_local.custom_spam_chat.mod = 50
femboy_local.custom_spam_chat.value = 200

local file = io.open("scripts/femboyluafolder/custom_spam_messages.lua", "r")
if file then
    custom_spam_messages = dofile("scripts/femboyluafolder/custom_spam_messages.lua")
    file:close()

    for _, message in ipairs(custom_spam_messages) do
        local feature = menu.add_feature(message, "value_i", femboy_local.network_chat_spam_options, function(f)
            while f.on do
                network.send_chat_message(message, false)
                system.wait(f.value)
            end
        end)
        feature.max = 10000
        feature.min = 0
        feature.mod = 50
        feature.value = 200
    end
end

local chat_icons = {
    {name = "R*", icon = "∑"},
    {name = "Lock", icon = "Ω"},
    {name = "R* verified", icon = "¦"},
}
for _,v in pairs(chat_icons) do
    menu.add_feature("Send "..v.name.." icon in chat", "action", femboy_local.network_chat_options, function(f)

        local rtn, message
        repeat
            rtn, message = input.get("Type Message", "", 100, eInputType.IT_ASCII)
            if rtn == 2 then return end
            system.wait()
        until rtn == 0  
        network.send_chat_message(v.icon .. message, false)
    end)
end

menu.add_feature("Clear Chat", "toggle", femboy_local.network_chat_options, function(f)
    while f.on do
        network.send_chat_message(" ", false)
        system.wait()
    end
end)

local ip_feats = {}
menu.add_feature("Press here to enter IP", "action", femboy_local.ip_lookup, function(f)
    repeat
        rtn, ip = input.get("Enter IP", "", 20, eInputType.IT_ASCII)
        if rtn == 2 then return end
        system.wait(0)
    until rtn == 0
    local response, my_info = web.get("http://ip-api.com/json/" .. ip .. "?fields=66846719")
    if response == 200 then
        for name, value in my_info:gmatch('",*"*(.-)":"*([^,"]*)"*,*') do -- goes through every line that matches `"smth": "value",`
            if not ip_feats[name] then -- checks if the feature already exists or not, if it doesnt exist then it creates one and stores it into ip_feats table
                ip_feats[name] = menu.add_feature(capitalise_first_letter(name), "action_value_str", ip_lookup)
            end
            ip_feats[name].hidden = false
            ip_feats[name]:set_str_data({ value }) -- updates str_data to have the value
        end
    else
        print("Error.")
    end
end)
menu.add_feature("                                    -- IP Info --                                        ", "action", femboy_local.ip_lookup)
ip_feats["query"] = menu.add_feature("Query", "action_value_str", femboy_local.ip_lookup)
ip_feats["query"].hidden = true

feats.auto_moderation = menu.add_feature("Enable Auto Moderation", "toggle", femboy_local.auto_moderation)
menu.add_feature("--------------------", "action", femboy_local.auto_moderation)
local modder_flags = {
    {name = "Manual", detection = "MDF_MANUAL"},
    {name = "Player Model", detection = "MDF_PLAYER_MODEL"},
    {name = "SCID Spoof", detection = "MDF_SCID_SPOOF"},
    {name = "Invalid Object", detection = "MDF_INVALID_OBJECT"},
    {name = "Invalid Ped Crash", detection = "MDF_INVALID_PED_CRASH"},
    {name = "Model Change Crash", detection = "MDF_MODEL_CHANGE_CRASH"},
    {name = "Player Model Change", detection = "MDF_PLAYER_MODEL_CHANGE"},
    {name = "RAC", detection = "MDF_RAC"},
    {name = "Money Drop", detection = "MDF_MONEY_DROP"},
    {name = "SEP", detection = "MDF_SEP"},
    {name = "Attach Object", detection = "MDF_ATTACH_OBJECT"},
    {name = "Attach Ped", detection = "MDF_ATTACH_PED"},
    {name = "Array Crash", detection = "MDF_ARRAY_CRASH"},
    {name = "Sync Crash", detection = "MDF_SYNC_CRASH"},
    {name = "Net Event Crash", detection = "MDF_NET_EVENT_CRASH"},
    {name = "Host Token", detection = "MDF_HOST_TOKEN"},
    {name = "SE Spam", detection = "MDF_SE_SPAM"},
    {name = "Frame Flags", detection = "MDF_FRAME_FLAGS"},
    {name = "IP Spoof", detection = "MDF_IP_SPOOF"},
    {name = "Karen", detection = "MDF_KAREN"},
    {name = "Session Mismatch", detection = "MDF_SESSION_MISMATCH"},
    {name = "Sound Spam", detection = "MDF_SOUND_SPAM"},
    {name = "Sep Int", detection = "MDF_SEP_INT"},
    {name = "Suspsicious Activity", detection = "MDF_SUSPICIOUS_ACTIVITY"},
    {name = "Chat Spoof", detection = "MDF_CHAT_SPOOF"}
}
for _,v in ipairs(modder_flags) do 
    feats[v.detection] = menu.add_feature(v.name .. " flag", "toggle", femboy_local.auto_moderation, function(f)
        while f.on do
            kickPlayersForFlag(eModderDetectionFlags[v.detection])
            system.wait()
        end
    end)
end

local cheese = {
    { name = "Afghanistan",                                          code = "AF" },
    { name = "Albania",                                              code = "AL" },
    { name = "Algeria",                                              code = "DZ" },
    { name = "American Samoa",                                       code = "AS" },
    { name = "Andorra",                                              code = "AD" },
    { name = "Angola",                                               code = "AO" },
    { name = "Anguilla",                                             code = "AI" },
    { name = "Antarctica",                                           code = "AQ" },
    { name = "Antigua and Barbuda",                                  code = "AG" },
    { name = "Argentina",                                            code = "AR" },
    { name = "Armenia",                                              code = "AM" },
    { name = "Aruba",                                                code = "AW" },
    { name = "Australia",                                            code = "AU" },
    { name = "Austria",                                              code = "AT" },
    { name = "Azerbaijan",                                           code = "AZ" },
    { name = "Bahamas",                                              code = "BS" },
    { name = "Bahrain",                                              code = "BH" },
    { name = "Bangladesh",                                           code = "BD" },
    { name = "Barbados",                                             code = "BB" },
    { name = "Belarus",                                              code = "BY" },
    { name = "Belgium",                                              code = "BE" },
    { name = "Belize",                                               code = "BZ" },
    { name = "Benin",                                                code = "BJ" },
    { name = "Bermuda",                                              code = "BM" },
    { name = "Bhutan",                                               code = "BT" },
    { name = "Bolivia",                                              code = "BO" },
    { name = "Bonaire, Sint Eustatius and Saba",                     code = "BQ" },
    { name = "Bosnia and Herzegovina",                               code = "BA" },
    { name = "Botswana",                                             code = "BW" },
    { name = "Bouvet Island",                                        code = "BV" },
    { name = "Brazil",                                               code = "BR" },
    { name = "British Indian Ocean Territory",                       code = "IO" },
    { name = "Brunei Darussalam",                                    code = "BN" },
    { name = "Bulgaria",                                             code = "BG" },
    { name = "Burkina Faso",                                         code = "BF" },
    { name = "Burundi",                                              code = "BI" },
    { name = "Cabo Verde",                                           code = "CV" },
    { name = "Cambodia",                                             code = "KH" },
    { name = "Cameroon",                                             code = "CM" },
    { name = "Canada",                                               code = "CA" },
    { name = "Cayman Islands",                                       code = "KY" },
    { name = "Central African Republic",                             code = "CF" },
    { name = "Chad",                                                 code = "TD" },
    { name = "Chile",                                                code = "CL" },
    { name = "China",                                                code = "CN" },
    { name = "Christmas Island",                                     code = "CX" },
    { name = "Cocos (Keeling) Islands",                              code = "CC" },
    { name = "Colombia",                                             code = "CO" },
    { name = "Comoros",                                              code = "KM" },
    { name = "Congo CD",                                             code = "CD" },
    { name = "Congo CG",                                             code = "CG" },
    { name = "Cook Islands",                                         code = "CK" },
    { name = "Costa Rica",                                           code = "CR" },
    { name = "Croatia",                                              code = "HR" },
    { name = "Cuba",                                                 code = "CU" },
    { name = "Curaçao",                                             code = "CW" },
    { name = "Cyprus",                                               code = "CY" },
    { name = "Czechia",                                              code = "CZ" },
    { name = "Côte d'Ivoire",                                       code = "CI" },
    { name = "Denmark",                                              code = "DK" },
    { name = "Djibouti",                                             code = "DJ" },
    { name = "Dominica",                                             code = "DM" },
    { name = "Dominican Republic",                                   code = "DO" },
    { name = "Ecuador",                                              code = "EC" },
    { name = "Egypt",                                                code = "EG" },
    { name = "El Salvador",                                          code = "SV" },
    { name = "Equatorial Guinea",                                    code = "GQ" },
    { name = "Eritrea",                                              code = "ER" },
    { name = "Estonia",                                              code = "EE" },
    { name = "Eswatini",                                             code = "SZ" },
    { name = "Ethiopia",                                             code = "ET" },
    { name = "Falkland Islands [Malvinas]",                          code = "FK" },
    { name = "Faroe Islands",                                        code = "FO" },
    { name = "Fiji",                                                 code = "FJ" },
    { name = "Finland",                                              code = "FI" },
    { name = "France",                                               code = "FR" },
    { name = "French Guiana",                                        code = "GF" },
    { name = "French Polynesia",                                     code = "PF" },
    { name = "French Southern Territories",                          code = "TF" },
    { name = "Gabon",                                                code = "GA" },
    { name = "Gambia",                                               code = "GM" },
    { name = "Georgia",                                              code = "GE" },
    { name = "Germany",                                              code = "DE" },
    { name = "Ghana",                                                code = "GH" },
    { name = "Gibraltar",                                            code = "GI" },
    { name = "Greece",                                               code = "GR" },
    { name = "Greenland",                                            code = "GL" },
    { name = "Grenada",                                              code = "GD" },
    { name = "Guadeloupe",                                           code = "GP" },
    { name = "Guam",                                                 code = "GU" },
    { name = "Guatemala",                                            code = "GT" },
    { name = "Guernsey",                                             code = "GG" },
    { name = "Guinea",                                               code = "GN" },
    { name = "Guinea-Bissau",                                        code = "GW" },
    { name = "Guyana",                                               code = "GY" },
    { name = "Haiti",                                                code = "HT" },
    { name = "Heard Island and McDonald Islands",                    code = "HM" },
    { name = "Holy See",                                             code = "VA" },
    { name = "Honduras",                                             code = "HN" },
    { name = "Hong Kong",                                            code = "HK" },
    { name = "Hungary",                                              code = "HU" },
    { name = "Iceland",                                              code = "IS" },
    { name = "India",                                                code = "IN" },
    { name = "Indonesia",                                            code = "ID" },
    { name = "Iran",                                                 code = "IR" },
    { name = "Iraq",                                                 code = "IQ" },
    { name = "Ireland",                                              code = "IE" },
    { name = "Isle of Man",                                          code = "IM" },
    { name = "Israel",                                               code = "IL" },
    { name = "Italy",                                                code = "IT" },
    { name = "Jamaica",                                              code = "JM" },
    { name = "Japan",                                                code = "JP" },
    { name = "Jersey",                                               code = "JE" },
    { name = "Jordan",                                               code = "JO" },
    { name = "Kazakhstan",                                           code = "KZ" },
    { name = "Kenya",                                                code = "KE" },
    { name = "Kiribati",                                             code = "KI" },
    { name = "Korea KP",                                             code = "KP" },
    { name = "Korea KR",                                             code = "KR" },
    { name = "Kuwait",                                               code = "KW" },
    { name = "Kyrgyzstan",                                           code = "KG" },
    { name = "Lao People's Democratic Republic",                     code = "LA" },
    { name = "Latvia",                                               code = "LV" },
    { name = "Lebanon",                                              code = "LB" },
    { name = "Lesotho",                                              code = "LS" },
    { name = "Liberia",                                              code = "LR" },
    { name = "Libya",                                                code = "LY" },
    { name = "Liechtenstein",                                        code = "LI" },
    { name = "Lithuania",                                            code = "LT" },
    { name = "Luxembourg",                                           code = "LU" },
    { name = "Macao",                                                code = "MO" },
    { name = "Madagascar",                                           code = "MG" },
    { name = "Malawi",                                               code = "MW" },
    { name = "Malaysia",                                             code = "MY" },
    { name = "Maldives",                                             code = "MV" },
    { name = "Mali",                                                 code = "ML" },
    { name = "Malta",                                                code = "MT" },
    { name = "Marshall Islands",                                     code = "MH" },
    { name = "Martinique",                                           code = "MQ" },
    { name = "Mauritania",                                           code = "MR" },
    { name = "Mauritius",                                            code = "MU" },
    { name = "Mayotte",                                              code = "YT" },
    { name = "Mexico",                                               code = "MX" },
    { name = "Micronesia",                                           code = "FM" },
    { name = "Moldova",                                              code = "MD" },
    { name = "Monaco",                                               code = "MC" },
    { name = "Mongolia",                                             code = "MN" },
    { name = "Montenegro",                                           code = "ME" },
    { name = "Montserrat",                                           code = "MS" },
    { name = "Morocco",                                              code = "MA" },
    { name = "Mozambique",                                           code = "MZ" },
    { name = "Myanmar",                                              code = "MM" },
    { name = "Namibia",                                              code = "NA" },
    { name = "Nauru",                                                code = "NR" },
    { name = "Nepal",                                                code = "NP" },
    { name = "Netherlands",                                          code = "NL" },
    { name = "New Caledonia",                                        code = "NC" },
    { name = "New Zealand",                                          code = "NZ" },
    { name = "Nicaragua",                                            code = "NI" },
    { name = "Niger",                                                code = "NE" },
    { name = "Nigeria",                                              code = "NG" },
    { name = "Niue",                                                 code = "NU" },
    { name = "Norfolk Island",                                       code = "NF" },
    { name = "Northern Mariana Islands",                             code = "MP" },
    { name = "Norway",                                               code = "NO" },
    { name = "Oman",                                                 code = "OM" },
    { name = "Pakistan",                                             code = "PK" },
    { name = "Palau",                                                code = "PW" },
    { name = "Palestine, State of",                                  code = "PS" },
    { name = "Panama",                                               code = "PA" },
    { name = "Papua New Guinea",                                     code = "PG" },
    { name = "Paraguay",                                             code = "PY" },
    { name = "Peru",                                                 code = "PE" },
    { name = "Philippines",                                          code = "PH" },
    { name = "Pitcairn",                                             code = "PN" },
    { name = "Poland",                                               code = "PL" },
    { name = "Portugal",                                             code = "PT" },
    { name = "Puerto Rico",                                          code = "PR" },
    { name = "Qatar",                                                code = "QA" },
    { name = "Republic of North Macedonia",                          code = "MK" },
    { name = "Romania",                                              code = "RO" },
    { name = "Russian Federation",                                   code = "RU" },
    { name = "Rwanda",                                               code = "RW" },
    { name = "Réunion",                                             code = "RE" },
    { name = "Saint Barthélemy",                                    code = "BL" },
    { name = "Saint Helena",                                         code = "SH" },
    { name = "Saint Kitts and Nevis",                                code = "KN" },
    { name = "Saint Lucia",                                          code = "LC" },
    { name = "Saint Martin (French part)",                           code = "MF" },
    { name = "Saint Pierre and Miquelon",                            code = "PM" },
    { name = "Saint Vincent and the Grenadines",                     code = "VC" },
    { name = "Samoa",                                                code = "WS" },
    { name = "San Marino",                                           code = "SM" },
    { name = "Sao Tome and Principe",                                code = "ST" },
    { name = "Saudi Arabia",                                         code = "SA" },
    { name = "Senegal",                                              code = "SN" },
    { name = "Serbia",                                               code = "RS" },
    { name = "Seychelles",                                           code = "SC" },
    { name = "Sierra Leone",                                         code = "SL" },
    { name = "Singapore",                                            code = "SG" },
    { name = "Sint Maarten (Dutch part)",                            code = "SX" },
    { name = "Slovakia",                                             code = "SK" },
    { name = "Slovenia",                                             code = "SI" },
    { name = "Solomon Islands",                                      code = "SB" },
    { name = "Somalia",                                              code = "SO" },
    { name = "South Africa",                                         code = "ZA" },
    { name = "South Georgia and the South Sandwich Islands",         code = "GS" },
    { name = "South Sudan",                                          code = "SS" },
    { name = "Spain",                                                code = "ES" },
    { name = "Sri Lanka",                                            code = "LK" },
    { name = "Sudan",                                                code = "SD" },
    { name = "Suriname",                                             code = "SR" },
    { name = "Svalbard and Jan Mayen",                               code = "SJ" },
    { name = "Sweden",                                               code = "SE" },
    { name = "Switzerland",                                          code = "CH" },
    { name = "Syrian Arab Republic",                                 code = "SY" },
    { name = "Taiwan",                                               code = "TW" },
    { name = "Tajikistan",                                           code = "TJ" },
    { name = "Tanzania",                                             code = "TZ" },
    { name = "Thailand",                                             code = "TH" },
    { name = "Timor-Leste",                                          code = "TL" },
    { name = "Togo",                                                 code = "TG" },
    { name = "Tokelau",                                              code = "TK" },
    { name = "Tonga",                                                code = "TO" },
    { name = "Trinidad and Tobago",                                  code = "TT" },
    { name = "Tunisia",                                              code = "TN" },
    { name = "Turkey",                                               code = "TR" },
    { name = "Turkmenistan",                                         code = "TM" },
    { name = "Turks and Caicos Islands",                             code = "TC" },
    { name = "Tuvalu",                                               code = "TV" },
    { name = "Uganda",                                               code = "UG" },
    { name = "Ukraine",                                              code = "UA" },
    { name = "United Arab Emirates",                                 code = "AE" },
    { name = "United Kingdom of Great Britain and Northern Ireland", code = "GB" },
    { name = "United States Minor Outlying Islands",                 code = "UM" },
    { name = "United States of America",                             code = "US" },
    { name = "Uruguay",                                              code = "UY" },
    { name = "Uzbekistan",                                           code = "UZ" },
    { name = "Vanuatu",                                              code = "VU" },
    { name = "Venezuela",                                            code = "VE" },
    { name = "Viet Nam",                                             code = "VN" },
    { name = "Virgin Islands (British)",                             code = "VG" },
    { name = "Virgin Islands (U.S.)",                                code = "VI" },
    { name = "Wallis and Futuna",                                    code = "WF" },
    { name = "Western Sahara",                                       code = "EH" },
    { name = "Yemen",                                                code = "YE" },
    { name = "Zambia",                                               code = "ZM" },
    { name = "Zimbabwe",                                             code = "ZW" },
    { name = "Aland Islands",                                        code = "AX" }
}
local country_features = {}
feats.enable_auto_kick = menu.add_feature("Enable", "toggle", femboy_local.country_kick, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_HTTP) then
        menu.notify("HTTP trusted mode must be enabled to use this.", "Femboy Menu")
        f.on = false
    else
        while f.on do
            for pid = 0, 31 do
                local player_ip = player.get_player_ip(pid)
                local response, info = web.get("http://ip-api.com/json/" .. dec_to_ipv4(player_ip) .. "?fields=2")
                if response == 200 then
                    for _, v in pairs(cheese) do
                        if v.on and pid ~= player.player_id() then
                            if string.find(info, v.code) then
                                menu.notify(
                                    string.format(
                                        "Player %s (IP: %s) is from " .. v.name .. "! Removing them now for you! :D",
                                        player.get_player_name(pid), dec_to_ipv4(player_ip)), "Location Detection")
                                network.force_remove_player(pid)
                            end
                        end
                    end
                end
            end
            system.wait(3000)
        end
    end
end)

menu.add_feature("Enable All", "toggle", femboy_local.country_kick, function(f)
    menu.notify("if you enable this and then ask why you keep getting kicked from lobbies, im going to treat you like a retard, so make sure to check twice.", "Femboy Lua")
    for _, feat in pairs(country_features) do
        feat.on = f.on
    end
end)
menu.add_feature("Filter Countries", "action_value_str", femboy_local.country_kick, function(f)
    repeat
        rtn, filter = input.get("Filter Countries", "", 50, eInputType.IT_ASCII)
        if rtn == 2 then return end
        system.wait(0)
    until rtn == 0

    f:set_str_data({ filter ~= "" and filter or "Search" })

    -- if filter contains something then filter by checking if name matches and if it doesnt it sets .hidden to true else false
    if filter ~= "" then
        filter = "^" .. filter or filter
        filter = filter:lower()
        for _, feat in pairs(country_features) do
            feat.hidden = (not feat.data.name:lower():match(filter))
        end
        return
    end

    -- reset if filter is nothing ie ""
    for _, feat in pairs(country_features) do
        feat.hidden = false
    end
end):set_str_data({ "Search" })

menu.add_feature("-- Country List --", "action", femboy_local.country_kick)

for _, v in pairs(cheese) do
    country_features[#country_features + 1] = menu.add_feature("Auto Kick " .. v.name, "toggle", femboy_local.country_kick, function(f)
        v.on = f.on
    end)
    country_features[#country_features].data = v
    feats[v.code] = country_features[#country_features]
end

-- chat_moderation_options
local racismfilter = {
    "assnigger",
    "assnigga",
    "Assnigger",
    "Assnigga",
    "beaner",
    "Beaner",
    "coon",
    "Coon",
    "chink",
    "Chink",
    "chinc",
    "Chink",
    "gook",
    "Gook",
    "guido",
    "Guido",
    "jap",
    "Jap",
    "jigaboo",
    "Jigaboo",
    "negro",
    "Negro",
    "nigaboo",
    "Nigaboo",
    "niggaboo",
    "Niggaboo",
    "nigga",
    "Nigga",
    "nigger",
    "Nigger",
    "niggerish",
    "Niggerish",
    "niggers",
    "Niggers",
    "niglet",
    "nigglet",
    "Niglet",
    "Nigglet",
    "nignog",
    "Nignog",
    "paki",
    "Paki",
    "porch monkey",
    "Porch Monkey",
    "porchmonkey",
    "Porchmonkey",
    "sand nigger",
    "sandnigger",
    "Sand Nigger",
    "Sandnigger",
    "spic",
    "spick",
    "Spic",
    "Spick",
    "wetback",
    "Wetback",
    "ASSNIGGER",
    "ASSNIGGA",
    "BEANER",
    "COON",
    "CHINK",
    "CHINC",
    "GOOK",
    "JAP",
    "JIGABOO",
    "NEGRO",
    "NIGABOO",
    "NIGGABOO",
    "NIGGA",
    "NIGGER",
    "NIGGERISH",
    "NIGGERS",
    "NIGLET",
    "NIGGLET",
    "NIGNOG",
    "PAKI",
    "PORCH MONKEY",
    "PORCHMONKEY",
    "SAND NIGGER",
    "SANDNIGGER",
    "SPIC",
    "SPICK",
    "WETBACK"
}
local f = function(s)
    for k, v in pairs(racismfilter) do
        if s:find(v .. " ") or s:find(" " .. v) or s:find("^" .. v .. "$") then
            return true
        end
    end
    return false
end
feats.blockracism = menu.add_feature("Block Racism", "toggle", femboy_local.chat_moderation_options, function(func)
    if func.on then
        racism = event.add_event_listener("chat", function(e)
            if f(e.body) and not player.player_id() then
                menu.notify(player.get_player_name(e.sender) .. " was removed for being too much of an edgelord",
                    "Femboy Menu")
                network.force_remove_player(e.sender)
            end
        end)
    else
        event.remove_event_listener("chat", racism)
    end
end)

local homophobicfilter = {
    "dike",
    "dyke",
    "fag",
    "faggit",
    "faggot",
    "fagtard",
    "fag tard",
    "gay fuck",
    "homo",
    "tranny",
    "DIKE",
    "DYKE",
    "FAG",
    "FAGGIT",
    "FAGGOT",
    "FAGTARD",
    "FAG TARD",
    "GAY FUCK",
    "HOMO",
    "TRANNY",
    "Dike",
    "Dyke",
    "Fag",
    "Faggit",
    "Faggot",
    "Fagtard",
    "Fag Tard",
    "Gay Fuck",
    "Homo",
    "Tranny",
    "dIKE",
    "dYKE",
    "fAG",
    "fAGGIT",
    "fAGGOT",
    "fAGTARD",
    "fAG tARD",
    "gAY fUCK",
    "hOMO",
    "tRANNY"
}
local f = function(s)
    for k, v in pairs(homophobicfilter) do
        if s:find(v .. " ") or s:find(" " .. v) or s:find("^" .. v .. "$") then
            return true
        end
    end
    return false
end
feats.blockhomophobia = menu.add_feature("Block Homophobia", "toggle", femboy_local.chat_moderation_options, function(func)
    if func.on then
        homophobic = event.add_event_listener("chat", function(e)
            if f(e.body) and not player.player_id() then
                menu.notify(
                    player.get_player_name(e.sender) .. " was removed for being too much of an edgelord, probably gets pegged :shrug:", "Femboy Menu")
                network.force_remove_player(e.sender)
            end
        end)
    else
        event.remove_event_listener("chat", homophobic)
    end
end)

local botspam = {
    "gtagta.cc",
    "discord.gg/"
}
local f = function(s)
    for k, v in pairs(botspam) do
        if s:find(v) then
            return true
        end
    end
    return false
end
local messages = {}
local max_repeats = 2
feats.chatspam = menu.add_feature("Block Bot/Chat Spam", "toggle", femboy_local.chat_moderation_options, function(func)
    if func.on then
        spam = event.add_event_listener("chat", function(e)
            local sender = e.sender
            local message = e.body
            if e.sender then
                if not messages[sender] then
                    messages[sender] = {
                        count = 0,
                        last_message = ""
                    }
                end
                if message == messages[sender].last_message then
                    messages[sender].count = messages[sender].count + 1
                else
                    messages[sender].count = 0
                    messages[sender].last_message = message
                end
                if f(message) or messages[sender].count >= max_repeats and not player.player_id() then
                    for pid = 0, 31 do
                        local name = player.get_player_name(e.sender)
                        menu.notify(name .. " was removed for Chat Spam, likely an ad bot or just annoying",
                            "Femboy Menu")
                        network.force_remove_player(e.sender)
                    end
                    messages[sender].count = 0
                    messages[sender].last_message = message
                end
            end
        end)
    else
        event.remove_event_listener("chat", spam)
    end
end)

-- recovery_feature
-- money_loops
menu.add_feature("750k loop", "toggle", femboy_local.money_loops, function(f)
    while f.on do
        script.set_global_i(0x1E08B9, 0)
        script.set_global_i(0x1E08B9, 2)
        system.wait(6000)
    end
end)

menu.add_feature("500k loop", "toggle", femboy_local.money_loops, function(f)
    while f.on do
        script.set_global_i(0x1E08B9, 0)
        script.set_global_i(0x1E08B9, 1)
        system.wait(6000)
    end
end)

-- remote_business
menu.add_feature("Start CEO", "action", femboy_local.remote_business, function()
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
    else
        menu.notify("May take multiple presses, sometimes may not work", "Femboy Lua", 5, 0xFF00FFFF)
        script.set_global_i(1894584,0)
        script.set_global_i(274986,32)
        script.set_global_i(274984,32)
    end
end)

local remote_business_table = {
    {name = "Airfrieght App", hash = "appsmuggler"},
    {name = "Bunker App", hash = "appbunkerbusiness"},
    {name = "Franklin's Agency", hash = "appfixersecurity"},
    {name = "Master Control Terminal", hash = "apparcadebusinesshub"},
    {name = "Nightclub App App", hash = "appbusinesshub"},
    {name = "Terrobyte Terminal", hash = "apphackertruck"}
}
for _,v in ipairs(remote_business_table) do
    menu.add_feature(v.name, "action", femboy_local.remote_business, function()
        if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
            menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        else
            menu.notify("May require to be pressed twice to open "..v.name, "Femboy Lua", 5, 0xFF00FFFF)
            script.set_global_i(1854376,-1)
            script.set_global_i(1894584,0)
            script.set_global_i(274986,32)
            script.set_global_i(274984,32)
            femboy_native(0x6EB5F71AA68F2E8E, v.hash) -- VOID REQUEST_SCRIPT(const char* scriptName)
            femboy_native(0xE6CC9F3BA0FB9EF1, v.hash) -- BOOL HAS_SCRIPT_LOADED(const char* scriptName)
            femboy_native(0xE81651AD79516E48, v.hash, 54000) -- INT START_NEW_SCRIPT(const char* stackSize)
        end
    end)
end

-- special_cargo
feats.sell_cargo_for_5_million = menu.add_feature("Sell Cargo For 5 Million", "toggle", femboy_local.special_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_global_i(278133, 5780000)
            script.set_global_i(278131, 5780000)
            script.set_global_i(278135, 5780000)
            script.set_global_i(278129, 5780000)
            script.set_global_i(278127, 5780000)
            script.set_global_i(278137, 5780000)
            script.set_global_i(277933, 5791000)
            script.set_global_i(277934, 2895500)
            script.set_global_i(277935, 1930333)
            script.set_global_i(277936, 1158200)
            script.set_global_i(277937, 827285)
            script.set_global_i(277938, 643444)
            script.set_global_i(277939, 413642)
            script.set_global_i(277940, 304789)
            script.set_global_i(277941, 241291)
            script.set_global_i(277942, 199689)
            script.set_global_i(277943, 170323)
            script.set_global_i(277944, 148487)
            script.set_global_i(277945, 131613)
            script.set_global_i(277946, 118183)
            script.set_global_i(277947, 98152)
            script.set_global_i(277948, 83927)
            script.set_global_i(277949, 73303)
            script.set_global_i(277950, 65067)
            script.set_global_i(277951, 58494)
            script.set_global_i(277952, 52645)
            script.set_global_i(277953, 52171)
            system.wait()
        end
    end
end)

feats.auto_supplier = menu.add_feature("Auto Supplier", "toggle", femboy_local.special_cargo, function(f)
    while f.on do
        menu.get_feature_by_hierarchy_key("online.business.manual_actions.supply_special_cargo"):toggle()
        system.wait()
    end
end)

menu.add_feature("Instant Buy", "toggle", femboy_local.special_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_local_i(3942964741,603,1)
            script.set_local_i(3942964741,789,6)
            script.set_local_i(3942964741,790,4)
            system.wait(2500)
        end
    end
end)

menu.add_feature("Instant Sell", "toggle", femboy_local.special_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_local_i(2067673554,541,99999)
            system.wait(2500)
        end
    end
end)

menu.add_feature("Get Max Crates w/ One Purchase", "toggle", femboy_local.special_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_local_i(3942964741, 599, 111)
            system.wait()
        end
    end
end)

menu.add_feature("Remove Special Cargo Cooldown", "toggle", femboy_local.special_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
    else
        while f.on do
            script.set_global_i(277698,0)
            script.set_global_i(277699,0)        
            system.wait(2500)
        end
    end
end)

menu.add_feature("Start CEO", "action", femboy_local.special_cargo, function()
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
    else
        script.set_global_i(1894584,0)
        script.set_global_i(274986,32)
        script.set_global_i(274984,32)
    end
end)

menu.add_feature("Terrobyte Touchscreen Terminal","action", femboy_local.special_cargo,function()
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) and not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Natives and Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
    else
        script.set_global_i(1854376,-1)
        script.set_global_i(1894584,0)
        script.set_global_i(274986,32)
        script.set_global_i(274984,32)
        femboy_native(0x6EB5F71AA68F2E8E, "apphackertruck") -- VOID REQUEST_SCRIPT(const char* scriptName)
        femboy_native(0xE6CC9F3BA0FB9EF1, "apphackertruck") -- BOOL HAS_SCRIPT_LOADED(const char* scriptName)
        femboy_native(0xE81651AD79516E48, "apphackertruck", 54000) -- INT START_NEW_SCRIPT(const char* stackSize)
    end
end)

local normal_crates = {
    {name = "Medical Supplies", idx = 0},
    {name = "Tobacco & Alcohol", idx = 1},
    {name = "Art & Antiques", idx = 2},
    {name = "Electronic Goods", idx = 3},
    {name = "Weapons & Ammo", idx = 4},
    {name = "Narcotics", idx = 5},
    {name = "Gemstones", idx = 6},
    {name = "Animal Materials", idx = 7},
    {name = "Counterfeit Goods", idx = 8},
    {name = "Jewelry", idx = 9},
    {name = "Bullion", idx = 10}
}
for _, v in ipairs(normal_crates) do
    menu.add_feature(v.name, "toggle", femboy_local.normal_crate,function(f)
        while f.on do
            script.set_global_i(1949968,0)
            script.set_global_i(1949814,v.idx)
            system.wait()
        end
    end)
end

local special_crates = {
    {name = "Ornamental Egg", idx = 2},
    {name = "Golden Minigun", idx = 4},
    {name = "Large Diamond", idx = 6},
    {name = "Rare Hide", idx = 7},
    {name = "Film Reel", idx = 8},
    {name = "Rare Pocket Watch", idx = 9}
}
for _, v in ipairs(special_crates) do
    menu.add_feature(v.name, "toggle", femboy_local.special_crate,function(f)
        while f.on do
            script.set_global_i(1949968,1)
            script.set_global_i(1949814,v.idx)
            system.wait()
        end
    end)
end

--[[
--air_cargo 
menu.add_feature("Set Air Cargo Price To 1 Billion", "toggle", air_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_global_i(284955,1147483647)
            script.set_global_i(284956,1147483647)
            script.set_global_i(284957,1147483647)
            script.set_global_i(284958,1147483647)
            script.set_global_i(284959,1147483647)
            script.set_global_i(284960,1147483647)
            script.set_global_i(284961,1147483647)
            script.set_global_i(284962,1147483647)
            script.set_global_i(284963,1147483647)
            system.wait()
        end
    end
end)
menu.add_feature("Set Air Cargo Price To 2 Billion", "toggle", air_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_global_i(284955,2147483647)
            script.set_global_i(284956,2147483647)
            script.set_global_i(284957,2147483647)
            script.set_global_i(284958,2147483647)
            script.set_global_i(284959,2147483647)
            script.set_global_i(284960,2147483647)
            script.set_global_i(284961,2147483647)
            script.set_global_i(284962,2147483647)
            script.set_global_i(284963,2147483647)
            system.wait()
        end
    end
end)
]]

menu.add_feature("Open AirFrieght App", "action", femboy_local.air_cargo, function()
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
    else
        script.set_global_i(1854376,-1)
        script.set_global_i(1894584,0)
        script.set_global_i(274986,32)
        script.set_global_i(274984,32)
        femboy_native(0x6EB5F71AA68F2E8E, "appsmuggler") -- VOID REQUEST_SCRIPT(const char* scriptName)
        femboy_native(0xE6CC9F3BA0FB9EF1, "appsmuggler") -- BOOL HAS_SCRIPT_LOADED(const char* scriptName)
        femboy_native(0xE81651AD79516E48, "appsmuggler", 54000) -- INT START_NEW_SCRIPT(const char* stackSize)
    end
end)

menu.add_feature("Instant Sell", "toggle", femboy_local.air_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_local_i(2882788887,2963,0)
            system.wait(1500)
        end
    end
end)

menu.add_feature("Instant Source", "toggle", femboy_local.air_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_local_i(2882788887,1999,-1)
            system.wait(1500)
        end
    end
end)

menu.add_feature("Source Cargo", "toggle", femboy_local.air_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_local_i(2882788887,2698,15)
            script.set_global_i(2798615,25)
            system.wait(1500)
        end
    end
end)

menu.add_feature("Remove Sell Cooldown", "toggle", femboy_local.air_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_global_i(2766148,0)
            script.set_global_i(284896,0)
            script.set_global_i(284897,0)
            script.set_global_i(284898,0)
            script.set_global_i(284899,0)
            script.set_global_i(284900,0)
            system.wait(0)
        end
    end
end)

menu.add_feature("Alien Egg", "toggle", femboy_local.steal_missions_air, function(f) 
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_STATS) and not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Stats and Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            stats.stat_set_int(3550228704, 1200, true)
            stats.stat_set_int(2531035799, 1200, true)
            stats.stat_set_int(723574901, 1200, true)
            stats.stat_set_int(295142111, 1200, true)
            script.set_global_i(2798615, 2, true)
            system.wait()
        end
    end
end)

local steal_missions = {
    {name = "Altruist Camp", idx = 1},
    {name = "The Dune Buggy", idx = 2},
    {name = "Police Riot", idx = 3},
    {name = "Mine", idx = 4},
    {name = "The Technical Aqua", idx = 5},
    {name = "Rival Operation", idx = 6},
    {name = "Zancudo River", idx = 7},
    {name = "LSIA", idx = 8},
    {name = "Merryweather HQ", idx = 9},
    {name = "Training Ground", idx = 10},
    {name = "Del Perro Beach", idx = 11},
    {name = "Cholla Springs Avenue", idx = 12},
    {name = "Chupacabra Street", idx = 13}
}
for _, v in ipairs(steal_missions) do
    menu.add_feature(v.name, "toggle", femboy_local.steal_missions_air,function(f)
        while f.on do
            script.set_global_i(2798615, v.idx)
            system.wait()
        end
    end)
end

local sell_missions = {
    {name = "HVY Insurgent Pick Up", idx = 14},
    {name = "HVY Insurgent", idx = 15},
    {name = "Marshall", idx = 16},
    {name = "HVY Insurgent Pick Up (custom)", idx = 17},
    {name = "Phantom Wedge", idx = 18},
    {name = "Dune FAV", idx = 19}
}
for _, v in ipairs(sell_missions) do
    menu.add_feature(v.name, "toggle", femboy_local.sell_missions_air,function(f)
        while f.on do
            script.set_global_i(2798615, v.idx)
            system.wait()
        end
    end)
end

-- night_club
local nightclub_notif = false
menu.add_feature("300k Safe Loop", "toggle", femboy_local.night_club, function(f)
    if nightclub_notif == false then 
        menu.notify("- Activate Loop\n- Go to nightclub safe, directly ahead of the computer\n- Open the safe and stand right against it", "Femboy Lua", 5, 0xFF00EEEE)
        nightclub_notif = true
    end
    while f.on do
        script.set_global_i(262145 + 24045, 300000)
        script.set_global_i(262145 + 24041, 300000) 
        stats.stat_set_int(gameplay.get_hash_key("MP0_CLUB_POPULARITY"), 10000, true)
        stats.stat_set_int(gameplay.get_hash_key("MP0_CLUB_PAY_TIME_LEFT"), -1, true)
        stats.stat_set_int(gameplay.get_hash_key("MP0_CLUB_POPULARITY"), 100000, true)
        stats.stat_set_int(gameplay.get_hash_key("MP1_CLUB_POPULARITY"), 10000, true)
        stats.stat_set_int(gameplay.get_hash_key("MP1_CLUB_PAY_TIME_LEFT"), -1, true)
        stats.stat_set_int(gameplay.get_hash_key("MP1_CLUB_POPULARITY"), 100000, true)
        system.wait()
    end
end)

menu.add_feature("Instant Sell","toggle",femboy_local.night_club,function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_local_i(4093145562,2507,15)
            script.set_local_i(4093145562,2508,15)
            script.set_local_i(4093145562,2336,0)
            system.wait(2500)
        end
    end
end)

menu.add_feature("Sell Cargo For 4 Million","toggle",femboy_local.night_club,function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_local_i(3518909077,148,3870000)
            system.wait()
        end
    end
end)

menu.add_feature("Remove Nightclub Sell Cooldown","toggle",femboy_local.night_club,function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_global_i(1962972,-1)
            system.wait()
        end
    end
end)

menu.add_feature("Maximize nightclub popularity", "action", femboy_local.night_club, function()
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_STATS) then
        menu.notify("Stats are required to be enabled to use this feature", "Femboy Lua")
    else
        stats.stat_set_int(2724973317, 1000, true)
        stats.stat_set_int(2295992369, 1000, true)
    end
end)

-- vehicle_cargo 
menu.add_feature("Disable Sell Cooldown", "toggle", femboy_local.vehicle_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_global_i(281830,-1)
            script.set_global_i(2766116,-1)
            script.set_global_i(2766118,-1)
            system.wait()
        end
    end
end)

menu.add_feature("Disable Source Cooldown", "toggle", femboy_local.vehicle_cargo, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_global_i(281459,0)
            script.set_global_i(281827,0)
            script.set_global_i(281828,0)
            script.set_global_i(281829,0)
            script.set_global_i(281830,0)
            system.wait()
        end
    end
end)
 
local top_range = {
    {name = "Roosevelt Valor - [L4WLE55]", idx = 37},
    {name = "Stirling GT - [M4J3ST1C]", idx = 40},
    {name = "FMJ - [C4TCHM3]", idx = 19},
    {name = "Osiris - [OH3LL0]", idx = 16},
    {name = "Pfister 811 - [M1DL1F3]", idx = 25},
    {name = "X80 Prototype - [FUTUR3]", idx = 1},
    {name = "Reaper - [2FA5T4U]", idx = 22},
    {name = "ETR1 - [B1GB0Y]", idx = 13},
    {name = "T20 - [CAR4M3L]", idx = 10},
    {name = "Tyrus - [C1TRUS]", idx = 4},
    {name = "Z-Type - [B1GMON3Y]", idx = 43},
    {name = "Roosevelt Valor - [0LDT1M3R]", idx = 38},
    {name = "Stirling GT - [T0UR3R]", idx = 41},
    {name = "FMJ - [J0K3R]", idx = 20},
    {name = "Mamba - [BLKM4MB4]", idx = 32},
    {name = "Osiris - [PH4R40H]", idx = 17},
    {name = "Pfister 811 - [R3G4L]", idx = 26},
    {name = "X80 Prototype - [M4K3B4NK]", idx = 2},
    {name = "Reaper - [D34TH4U]", idx = 23},
    {name = "ETR1 - [M0N4RCH]", idx = 14},
    {name = "T20 - [T0PSP33D]", idx = 11},
    {name = "Z-Type - [K1NGP1N]", idx = 44},
    {name = "Stirling GT - [R4LLY]", idx = 42},
    {name = "FMJ - [H0T4U]", idx = 21},
    {name = "Mamba - [V1P]", idx = 33},
    {name = "Osiris - [SL33K]", idx = 18},
    {name = "Pfister 811 - [SL1CK]", idx = 27},
    {name = "X80 Prototype - [TURB0]", idx = 3},
    {name = "Reaper - [GR1M]", idx = 24},
    {name = "T20 - [D3V1L]", idx = 12},
    {name = "Tyrus - [TR3X]", idx = 6},
    {name = "Z-Type - [CE0]", idx = 45}
}
for _, v in ipairs(top_range) do
    menu.add_feature(v.name, "toggle", femboy_local.top_range_vehicle,function(f)
        while f.on do
            script.set_global_i(1894772, v.idx)
            system.wait()
        end
    end)
end

local mid_range = {
    {name = "Cheetah - [BUZZ3D]", idx = 76},
    {name = "Coquette Classic - [T0PL3SS]", idx = 73},
    {name = "Coquette BlackFin- [V1NT4G3]", idx = 61},
    {name = "Entity XF - [IML4TE]", idx = 49},
    {name = "Omnis - [0BEYM3]", idx = 58},
    {name = "Seven-70 - [FRU1TY]", idx = 64},
    {name = "Sultan RS - [SN0WFLK3]", idx = 52},
    {name = "Tropos - [1MS0RAD]", idx = 46},
    {name = "Verlierer - [PR3C1OUS]", idx = 67},
    {name = "Zentorno - [W1NN1NG]", idx = 55},
    {name = "Cheetah - [M1DN1GHT]", idx = 77},
    {name = "Coquette Classic - [T0FF33]", idx = 74},
    {name = "Coquette  BlackFin - [W1P30UT]", idx = 62},
    {name = "Entity XF - [0V3RFL0D]", idx = 50},
    {name = "Omnis - [W1D3B0D]", idx = 59},
    {name = "Seven 70 - [4LL0Y5]", idx = 65},
    {name = "Sultan RS - [F1D3L1TY]", idx = 53},
    {name = "Tropos Rallye - [31GHT135]", idx = 47},
    {name = "Verlierer - [0UTFR0NT]", idx = 68},
    {name = "Zentorno - [0LDN3W5]", idx = 56},
    {name = "Cheetah - [B1GC4T]", idx = 78},
    {name = "Coquette Classic - [CL45SY]", idx = 75},
    {name = "Coquette  BlackFin - [BLKF1N]", idx = 63},
    {name = "Entity XF - [W1DEB0Y]", idx = 51},
    {name = "Omnis - [D1RTY]", idx = 60},
    {name = "Seven 70 - [SP33DY]", idx = 66},
    {name = "Sultan RS - [5H0W0FF]", idx = 54},
    {name = "Tropos Rallye - [1985]", idx = 48},
    {name = "Verlierer - [CURV35]", idx = 69},
    {name = "Zentorno - [H3R0]", idx = 57}
}
for _, v in ipairs(mid_range) do
    menu.add_feature(v.name, "toggle", femboy_local.mid_range_vehicles,function(f)
        while f.on do
            script.set_global_i(1894772, v.idx)
            system.wait()
        end
    end)
end

local standard_range = {
    {name = "Alpha- [V1S1ONRY]", idx = 28},
    {name = "Banshee 900R - [DR1FT3R]", idx = 82},
    {name = "Bestia GTS - [BE4STY]", idx = 7},
    {name = "Feltzer - [P0W3RFUL]", idx = 70},
    {name = "Jester - [H0TP1NK]", idx = 94},
    {name = "Massacro - [TR0P1CAL]", idx = 88},
    {name = "Nightshade - [DE4DLY]", idx = 79},
    {name = "Sabre Turbo Custom - [GUNZ0UT]", idx = 91},
    {name = "Tampa - [CH4RG3D]", idx = 34},
    {name = "Alpha- [L0NG80Y]", idx = 29},
    {name = "Banshee 900R - [DOM1NO]", idx = 83},
    {name = "Bestia GTS - [5T34LTH]", idx = 8},
    {name = "Feltzer - [K3YL1M3]", idx = 71},
    {name = "Jester - [T0PCL0WN]", idx = 95},
    {name = "Massacro - [B4N4N4]", idx = 89},
    {name = "Nightshade - [TH37OS]", idx = 80},
    {name = "Sabre Turbo Custom - [0R1G1N4L]", idx = 92},
    {name = "Tampa - [CRU151N]", idx = 35},
    {name = "Turismo R - [M1LKYW4Y]", idx = 86},
    {name = "Alpha- [R31GN]", idx = 30},
    {name = "Banshee 900R - [H0WL3R]", idx = 84},
    {name = "Bestia GTS - [5M00TH]", idx = 9},
    {name = "Feltzer - [R4C3R]", idx = 72},
    {name = "Jester - [NOF00L]", idx = 96},
    {name = "Massacro - [B055]", idx = 90},
    {name = "Nightshade - [E4TM3]", idx = 81},
    {name = "Sabre Turbo Custom - [B0UNC3]", idx = 93},
    {name = "Tampa - [MU5CL3]", idx = 36},
    {name = "Turismo R - [TPD4WG]", idx = 87}
}
for _,v in ipairs(standard_range) do
    menu.add_feature(v.name, "toggle", femboy_local.standard_range_vehicles,function(f)
        while f.on do
            script.set_global_i(1894772, v.idx)
            system.wait()
        end
    end)
end

local unknown_range = {
    {name = "Mamba - [0LDBLU3]", idx = 31},
    {name = "Turismo R - [IN4H4ZE]", idx = 85},
    {name = "Tyrus - [B35TL4P]", idx = 5},
    {name = "Roosevelt Valor - [V4L0R]", idx = 39},
    {name = "ETR1 - [PR3TTY]", idx = 15},
}
for _,v in ipairs(unknown_range) do
    menu.add_feature(v.name, "toggle", femboy_local.unknown_range_vehicles,function(f)
        while f.on do
            script.set_global_i(1894772, v.idx)
            system.wait()
        end
    end)
end

-- recovery_tool 
menu.add_feature("Become a bad sport", "action", femboy_local.bad_sport_manager, function()
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_STATS) then
        menu.notify("Stats are required to be enabled to use this feature", "Femboy Lua")
    else
        stats.stat_set_int(2829961636, 1, true)
        stats.stat_set_int(2301392608, 1, true)
    end
end)

menu.add_feature("Remove bad sport", "action", femboy_local.bad_sport_manager, function()
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_STATS) then
        menu.notify("Stats are required to be enabled to use this feature", "Femboy Lua")
    else
        stats.stat_set_int(2301392608, 0, true)
    end
end)

menu.add_feature("Force Cloud Save", "action", femboy_local.recovery_tool, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        femboy_native(0xE07BCA305B82D2FD, 0, 0, 3, 0)
    end
end)

menu.add_feature("Maximize Inventory", "action", femboy_local.recovery_tool, function()
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_STATS) then
        menu.notify("Stats are required to be enabled to use this feature", "Femboy Lua")
    else
        stats.stat_set_int(3154358306, 30, true)
        stats.stat_set_int(2983015990, 15, true)
        stats.stat_set_int(2098164755, 5, true)
        stats.stat_set_int(3097587663, 10, true)
        stats.stat_set_int(853483879, 10, true)
        stats.stat_set_int(2022518763, 20, true)
        stats.stat_set_int(1031694059, 20, true)
        stats.stat_set_int(1734518001, 11, true)
        stats.stat_set_int(3689384104, 11, true)
    end
end)

local request_services = {
    {name = "Acid Lab", value = 2793984},
    {name = "Avenger", value = 2793979},
    {name = "Ballistic Equipment", value = 2793942},
    {name = "Dinghy", value = 2794012},
    {name = "Kosatka", value = 2794000},
    {name = "Motorcycle", value = 2794034},
    {name = "MOC", value = 2793971},
    {name = "Mini Tank", value = 2799921},
    {name = "RC Bandito", value = 2799920},
    {name = "Terrobyte", value = 2793983},
}
for _,v in ipairs(request_services) do
    menu.add_feature("Request "..v.name, "action", femboy_local.recovery_tool, function(f)
        if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
            menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        else
            script.set_global_i(v.value, 1)
        end
    end)
end

feats.disable_transaction_error = menu.add_feature("Remove Transaction Error", "toggle", femboy_local.disable_tools, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_global_i(4536673, 0)
            script.set_global_i(4536674, 0)
            script.set_global_i(4536675, 0)
            system.wait()
        end
    end
end)

feats.disable_kosatka_missiles_cd = menu.add_feature("Disable Kosatka Missiles Cooldown", "toggle", femboy_local.disable_tools, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_global_i(292332, 0)
            script.set_global_i(292333, 99999)
            system.wait()
        end
    end
end)

feats.disable_mk2_cd = menu.add_feature("Disable MK2 Cooldown", "toggle", femboy_local.disable_tools, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_SCRIPT_VARS) then
        menu.notify("Globals/Locals are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            script.set_global_i(290553, 0)
            system.wait()
        end
    end
end)

-- collectibles 
local collect = {
    {name = "Action Figures", global = 2765117, max = 100},
    {name = "LD Organics Product", global = 2765501, max = 100},
    {name = "Playing Cards", global = 2765118, max = 54},
    {name = "Signal Jammers", global = 2765119, max = 50},
    {name = "Movie Props", global = 2765402, max = 10},
    {name = "Buried Stashes (Daily)", global = 2765461, max = 50},
    {name = "Hidden Cache (Daily)", global = 2765412, max = 10},
    {name = "Treasure Chests (Daily)", global = 2765414, max = 10},
    {name = "Shipwrecks (Daily)", global = 2765455, max = 10},
    {name = "Trick or Treat (halloween)", global = 2765499, max = 200}
}
for _,v in ipairs(collect) do
    local feat = menu.add_feature(v.name, "action_value_i", femboy_local.collectibles, function(f)
        menu.notify("Collect one of "..v.name.." for the value to change to what you set", "Femboy Lua", 5, 0xFF00FF00)
        script.set_global_i(v.global, f.value)
    end)
    feat.min = 0
    feat.max = v.max 
    feat.mod = 1
    v.feat = feat
end

-- world_feature 
femboy_local.distancescale = menu.add_feature("Distance Scale", "value_f", femboy_local.world_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        menu.notify("This will affect your FPS massively", "Femboy Menu")
        while f.on do
            femboy_native(0xA76359FC80B2438E, f.value)
            system.wait()
        end
        femboy_native(0xA76359FC80B2438E, 1.0)
    end
end)
femboy_local.distancescale.min = 0.0
femboy_local.distancescale.max = 200.0
femboy_local.distancescale.mod = 0.5

femboy_local.set_time_scale = menu.add_feature("Set Time Scale", "value_f", femboy_local.world_feature, function(f)
	if f.on then
		femboy_native(0x1D408577D440E81E, f.value) -- SET_TIME_SCALE
	else 
		femboy_native(0x1D408577D440E81E, 1.0)
	end
end) 
femboy_local.set_time_scale.min = 0.0
femboy_local.set_time_scale.max = 1.0
femboy_local.set_time_scale.mod = 0.1

menu.add_feature("Load Map", "action_value_str", femboy_local.world_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        if f.value == 0 then
            femboy_native(0xD7C10C4A637992C9) -- on_enter_sp
        elseif f.value == 1 then 
            femboy_native(0x0888C3502DBBEEF5) -- on_enter_mp
        end 
    end 
end):set_str_data({"SP Map", "MP Map"})

menu.add_feature("Make Nearby NPC's Riot", "toggle", femboy_local.world_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        femboy_native(0x2587A48BC88DFADF, f.on)
    end
end)

menu.add_feature("Blackout", "toggle", femboy_local.world_feature, function(f)
    gameplay.set_blackout(f.on)
end)

femboy_local.rainlvl = menu.add_feature("Magic puddles", "autoaction_value_f", femboy_local.world_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        femboy_native(0x643E26EA6E024D92, f.value)
    end
end)
femboy_local.rainlvl.min = 0.0
femboy_local.rainlvl.max = 10.0
femboy_local.rainlvl.mod = 0.5

femboy_local.windspd = menu.add_feature("Wind speed", "autoaction_value_f", femboy_local.world_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        femboy_native(0xEE09ECEDBABE47FC, f.value)
    end
end)
femboy_local.windspd.min = 0.0
femboy_local.windspd.max = 12.0
femboy_local.windspd.mod = 0.5

femboy_local.waveint = menu.add_feature("Wave Intensity", "value_f", femboy_local.world_feature, function(f)
    if f.on then
        water.set_waves_intensity(f.value)
    else
        water.reset_waves_intensity()
    end
end)
femboy_local.waveint.min = 0.0
femboy_local.waveint.max = 1000.0
femboy_local.waveint.value = 1
femboy_local.waveint.mod = 10.0

-- misc_feature 
menu.add_feature("Custom Alert Message", "toggle", femboy_local.alert_screen, function(f)

	local rtn, subtitle
	repeat
		rtn, body = input.get("Insert Message", "", 1000, eInputType.IT_ASCII)
		if rtn == 2 then return end
		system.wait()
	until rtn == 0 

	while f.on do 
		AlertMessage(body)
		system.wait()
	end
end)

menu.add_feature("Custom Reason Ban Screen", "toggle", femboy_local.alert_screen, function(f)
    
    local rtn, subtitle
    repeat
        rtn, body = input.get("Insert Reason", "", 1000, eInputType.IT_ASCII)
		if rtn == 2 then return end
		system.wait()
	until rtn == 0 

    while f.on do
        AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: "..body.."\nReturn to Grand Theft Auto V.")
        system.wait()
    end
end)

menu.add_feature("Ban Screen (no reason)", "toggle", femboy_local.alert_screen, function(f)
    while f.on do
        AlertMessage("You have been banned from Grand Theft Auto permanently.\nReturn to Grand Theft Auto V.")
        system.wait()
    end
end)

menu.add_feature("Ban Screen w/", "value_str", femboy_local.alert_screen, function(f)
    while f.on do
        if f.value == 0 then 
            AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: Using the best mod menu.\nReturn to Grand Theft Auto V.")
        elseif f.value == 1 then 
            AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: Cheating.\nReturn to Grand Theft Auto V.")
        elseif f.value == 2 then 
            AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: Crasing idiots.\nReturn to Grand Theft Auto V.")
        elseif f.value == 3 then 
            AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: Having too much fun.\nReturn to Grand Theft Auto V.")
        elseif f.value == 4 then 
            AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: Not buying sharkcards.\nReturn to Grand Theft Auto V.")
        elseif f.value == 5 then 
            AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: rawr xD.\nReturn to Grand Theft Auto V.")
        elseif f.value == 6 then 
            AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: Take the L.\nReturn to Grand Theft Auto V.")
        elseif f.value == 7 then 
            AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: What the fuck did you just fucking say about me, you little bitch? I'll have you know I graduated top of my class in the Navy Seals, and I've been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills. I am trained in gorilla warfare and I'm the top sniper in the entire US armed forces. You are nothing to me but just another target. I will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words. You think you can get away with saying that shit to me over the Internet? Think again, fucker. As we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot. The storm that wipes out the pathetic little thing you call your life. You're fucking dead, kid. I can be anywhere, anytime, and I can kill you in over seven hundred ways, and that's just with my bare hands. Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit. If only you could have known what unholy retribution your little 'clever' comment was about to bring down upon you, maybe you would have held your fucking tongue. But you couldn't, you didn't, and now you're paying the price, you goddamn idiot. I will shit fury all over you and you will drown in it. You're fucking dead, kiddo.\nReturn to Grand Theft Auto V.")
        elseif f.value == 8 then 
            AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: w-what the fwickk did you just fwickking say about me,,, y-you wittle m-meanie? i-i’ll have you know i gwaduated t-top of my cwass in the navy seaws, and i’ve been invowved in numewous s-secwet w-waids on aw-quaeda, and i have o-over 300 confiwmed kills ☆⌒ヽ(“､)chu i am twained in g-gowiwwa w-wawfare and i’m the top sniper in the e-entire us a-awmed fowces〜☆ you are nothing t-to me b-but just a-another tawget ☆:・ﾟ i will wipe you the fwickk out with pwecision the wikes of which has never been seen before on this eawth, mawk my fwickking wowds-.- you think you can get away with saying that p-poopoo to me over the intewnet〜☆ t-think again (.).., f-fwickker ☆:・ﾟ a-as we speak i am contacting my secwet netwowk of spies acwoss the u-usa and youw i-ip is b-being twaced wight now so y-you better pwepare f-fow the s-stowm, maggot. the stowm t-that wipes out the pathetic wittle thing you call youw w-wife (≧◡≦) ur fwickking dead (⁄ ⁄>⁄ ▽ ⁄<⁄ ⁄).. kid ☆⌒ヽ(“､)chu i c-can be anywhere uguu.., anytime (⁄ ⁄>⁄ ▽ ⁄<⁄ ⁄).. and i c-can k-kill y-you in over seven hundwed ways, and that’s j-just with my bare hands. not onwy am i extensivewy twained i-in u-unawmed c-combat, but i have access to t-the entire awsenaw of the united states mawine cowps and i w-will use it to its full extent to wipe y-youw misewable boi pussy off the face of the c-continent, you wittle p-poopoo. if onwy y-you couwd have k-known what unhowy wetwibution youw wittle “cwevew” c-comment w-was about to bwing d-down upon you, maybe you w-wouwd have hewd youw fwickking tongue. but you couwdn’t, you didn’tO.o and now ur p-paying the pwice, you goddamn idiot. i will poopoo fuwy all over y-you and you will dwown in it (≧◡≦) ur fwickking dead, k-kiddo.\nReturn to Grand Theft Auto V.")
        elseif f.value == 9 then 
            AlertMessage("You have been banned from Grand Theft Auto permanently.\nReason: 🧐 Why, indubitably you have won this debate and settled our little debacle. However, due to the fact that I am a petty man with no respect for honor, I have gathered your Internet Protocol address for my own usage. With this number, I have excellently triangulated your exact location and henceforth shall be travelling over there. I do suggest that you cower at least a great deal as I have had many weapons in my possession during my transferring from my previous location to your current one. At the present moment, I am exactly four hundred twenty-five metric lengths away from you, and closing the distance at a much considerable rate. 🧐\nReturn to Grand Theft Auto V.")
        end
        system.wait()
    end
end):set_str_data({"Using the best mod menu", "Cheating", "Crasing idiots", "Having too much fun", "Not buying sharkcards", "rawr xD", "Take the L", "Navy Seal Copypasta", "UwU Navy Seal Copypasta", "I have your IP Copypasta"})

menu.add_feature("Suspended Screen", "toggle", femboy_local.alert_screen, function(f)
    while f.on do
        local date = get_future_date()
        AlertMessage("You have been suspended from Grand Theft Auto Online until "..date..".\nIn addition, your Grand Theft Auto Online character(s) will be reset.\nReturn to Grand Theft Auto V.")
        system.wait()
    end
end)

local corrected_alert_screen = {
    {name = "RP given/removed", msg = "Rockstar Game Services have corrected your RP levels to "},
    {name = "Money given/removed", msg = "Rockstar Game Services have corrected your GTA Dollars by $"}
}
for _,v in ipairs(corrected_alert_screen) do
    menu.add_feature(v.name, "toggle", femboy_local.alert_screen, function(f)

        local rtn, value
        repeat
            rtn, value = input.get("Input "..v.name, "", 50, eInputType.IT_ASCII)
            if rtn == 2 then return end
            system.wait()
        until rtn == 0

        while f.on do
            if v.name == "RP given/removed" then
                AlertMessage(v.msg..value.."RP.")
            else
                AlertMessage(v.msg..value)
            end
            system.wait()
        end
    end)
end

feats.skipcutscene = menu.add_feature("Auto Skip Cutscene", "toggle", femboy_local.misc_feature, function(f)
    while f.on do
        if cutscene.is_cutscene_playing() then
            cutscene.stop_cutscene_immediately()
        end
        system.wait(0)
    end
end)

feats.auto_tp_to_waypoint = menu.add_feature("Auto TP To Waypoint", "toggle", femboy_local.misc_feature, function(f)
    while f.on do
        local waypoint = ui.get_waypoint_coord()
        if waypoint.x ~= 16000 then
            menu.get_feature_by_hierarchy_key("local.teleport.waypoint"):toggle()
            ui.set_waypoint_off()
        end
        system.wait()
    end 
end)

menu.add_feature("Get All Achievements", "action", femboy_local.misc_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        for i = 1, 77 do
            femboy_native(0xBEC7076D64130195, i)
        end
    end
end)

menu.add_feature("Set Specicial Edition Version", "action", femboy_local.misc_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        femboy_native(0xDAC073C7901F9E15, 866)
    end
end)

femboy_local.set_radar_angle = menu.add_feature("Set Radar Angle", "value_i", femboy_local.misc_feature, function(f)
    while f.on do 
		femboy_native(0x299FAEBB108AE05B, f.value) -- LOCK_MINIMAP_ANGLE
		system.wait()
	end
	femboy_native(0x8183455E16C42E3A) -- UNLOCK_MINIMAP_ANGLE
end) 
femboy_local.set_radar_angle.min = 1
femboy_local.set_radar_angle.max = 360 
femboy_local.set_radar_angle.mod = 1

menu.add_feature("Hide HUD", "toggle", femboy_local.misc_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        if f.on then
            femboy_native(0xA6294919E56FF02A, false)
            femboy_native(0xA0EBB943C300E693, false)
        else
            femboy_native(0xA6294919E56FF02A, true)
            femboy_native(0xA0EBB943C300E693, true)
        end
    end
end)

menu.add_feature("Disable Above Map Notifs", "toggle", femboy_local.misc_feature, function(f)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on=false
    else
        while f.on do
            femboy_native(0x32888337579A5970, f.on) -- hide feed
            system.wait()
        end
        femboy_native(0x15CFA549788D35EF) -- THEFEED_SHOW
        femboy_native(0xA8FDB297A8D25FBA) -- THEFEED_FLUSH_QUEUE
        menu.notify("Notifications above map enabled", "Femboy Menu")
    end
end)

menu.add_feature("Flush Notifcation Queue", "action", femboy_local.misc_feature, function(f)
    femboy_native(0xA8FDB297A8D25FBA)
end)

-- logging_feature
feats.log_messages_to_console = menu.add_feature("Log Messages To Console", "toggle", femboy_local.logging_feature, function(f)
    if f.on then
        messagelog = event.add_event_listener("chat", function(e)
            local pid = player.get_player_name(e.player)
            local time = os.time()
            local badtime = os.time()
            local goodtime = os.date("%A, %B %d %Y, %X", badtime)
            print("[" .. goodtime .. "] " .. pid .. " > " .. e.body)
        end)
    else
        event.remove_event_listener("chat", messagelog)
    end
end)

feats.log_joins_to_console = menu.add_feature("Log Joins To Console", "toggle", femboy_local.logging_feature, function(f)
    if f.on then
        joinlog = event.add_event_listener("player_join", function(e)
            local pid = player.get_player_name(e.player)
            local ip = player.get_player_ip(e.player)
            local time = os.time()
            local badtime = os.time()
            local goodtime = os.date("%A, %B %d %Y, %X", badtime)
            print("[" .. goodtime .. "] " .. pid .. " [" .. dec_to_ipv4(ip) .. "] Joined The Session")
        end)
    else
        event.remove_event_listener("player_join", joinlog)
    end
end)

feats.log_script_events_to_console = menu.add_feature("Log Script Events To Console", "toggle", femboy_local.logging_feature, function(f)
    if f.on then
        script_listener = event.add_event_listener("script", function(e)
            local pid = e.player
            local script = e.id
            local params = e.params

            for i = 1, #params do
                params[i] = params[i] & 0xFFFFFFFF
            end

            print(string.format("Player %s sent script %d %s", player.get_player_name(pid), script,
                "(" .. table.concat(params, ", ") .. ")"))
        end)
    else
        event.remove_event_listener("script", script_listener)
    end
end)

-- hud_options
local hud_component = {
    {id = 1, name = "WANTED_STARS"},
    {id = 2, name = "WEAPON_ICON"},
    {id = 3, name = "CASH"},
    {id = 4, name = "MP_CASH"},
    {id = 5, name = "MP_MESSAGE"},
    {id = 6, name = "VEHICLE_NAME"},
    {id = 7, name = "AREA_NAME"},
    {id = 8, name = "VEHICLE_CLASS"},
    {id = 9, name = "STREET_NAME"},
    {id = 10, name = "HELP_TEXT"},
    {id = 11, name = "FLOATING_HELP_TEXT_1"},
    {id = 12, name = "FLOATING_HELP_TEXT_2"},
    {id = 13, name = "CASH_CHANGE"},
    {id = 14, name = "RETICLE"},
    {id = 15, name = "SUBTITLE_TEXT"},
    {id = 16, name = "RADIO_STATIONS"},
    {id = 17, name = "SAVING_GAME"},
    {id = 18, name = "GAME_STREAM"},
    {id = 19, name = "WEAPON_WHEEL"},
    {id = 20, name = "WEAPON_WHEEL_STATS"},
    {id = 21, name = "HUD_COMPONENTS"},
    {id = 22, name = "HUD_WEAPONS"},
}
feats.HUD_AND_RADAR = menu.add_feature("HUD_AND_RADAR", "toggle", femboy_local.hud_options, function(f)
    while f.on do
        ui.hide_hud_and_radar_this_frame()
        system.wait()
    end
end)

feats.HIDE_FEED = menu.add_feature("HIDE_FEED", "toggle", femboy_local.hud_options, function(f)
    while f.on do
        femboy_native(0x32888337579A5970, f.on) -- hide feed
        system.wait()
    end
end)

for _, v in ipairs(hud_component) do
    feats[v.name] = menu.add_feature(v.name, "toggle", femboy_local.hud_options, function(f)
        while f.on do
            ui.hide_hud_component_this_frame(v.id)
            system.wait()
        end
    end)
end

-- settings 
menu.add_feature("Save Settings", "action", femboy_local.settings, function(f)
    SaveSettings()
end)

feats.f8_to_save = menu.add_feature("F8 To Save Settings", "toggle", femboy_local.settings, function(f)
    while f.on do
        if controls.is_control_just_pressed(0, 169) or controls.is_control_just_pressed(2, 169) and f.on then
            SaveSettings()
        end
        system.wait()
    end
end)

menu.add_feature("Changelog", "action_value_str", femboy_local.settings, function(f)
    if f.value == 0 then
        menu.notify(
            "#FFC0CBFF#https://github.com/Decuwu/femboylua/blob/main/Changelog.md\n\n#DEFAULT#copied to clipboard, paste it in your browser url to see the scripts changelog",
            "Femboy Menu")
        utils.to_clipboard("https://github.com/Decuwu/femboylua/blob/main/Changelog.md")
    elseif f.value == 1 then
        local response, body = web.get("https://raw.githubusercontent.com/Decuwu/femboylua/main/Changelog.md")
        if response == 200 then
            print(body)
        else
            menu.notify(response)
        end
    end
end):set_str_data({ "Copy Link", "Print To Console" })

menu.add_feature("Feature List", "action", femboy_local.settings, function(f)
    menu.notify(
        "#FFC0CBFF#https://github.com/Decuwu/femboylua/blob/main/Femboy.md\n\n#DEFAULT#copied to clipboard, paste it in your browser url to see the scripts feature list",
        "Femboy Menu")
    utils.to_clipboard("https://github.com/Decuwu/femboylua/blob/main/Femboy.md")
end)

-- vpn checker 
local flagged_players = {}
local enable_vpn_check = true
feats.disable_vpn = menu.add_feature("Disable VPN Check", "toggle", femboy_local.settings, function(f)
    if f.on then
        enable_vpn_check = not enable_vpn_check
    else
        check_vpn(pid)
    end
end)
local vpnListener = event.add_event_listener("player_join", check_vpn)
menu.create_thread(function()
    if network.is_session_started() then -- does a check when you change session
        for i = 0, 31 do
            check_vpn(i)
        end
    end
    for i = 0, 31 do
        if player.is_player_valid(i) then -- does a check for everyone in the session when loading the script
            check_vpn(i)
            system.wait(100)
        end
    end
end)
menu.create_thread(function() -- check if the player has been flagged before, if yes then give the flag back
    while true do
        for pid, v in pairs(flagged_players) do
            local player_parent = menu.get_feature_by_hierarchy_key("online.online_players.player_" .. pid)
            if not player_parent.name:find("VPN") then
                local name = ""
                player_parent.name = player_parent.name .. " #DEFAULT#[#FFC0CBFF#VPN#DEFAULT#]"
            end
        end
        system.wait(3000)
    end
end)

-- credits 
local credits_list = {
    {name = "Toph", notify_map_sub_title = "The Gopher", notify_map = "Helped an absolute BUNCH with understanding the API and helped with a lot of features!", notify_map_pic = "CHAR_HAO", menu_notify = "#FFFFCC00#Credits:\n-#FFFFDD00#Made above map notification\n-#FFFFDD22#IP info function\n-#FFFFDD33#Aim Karma\n-#FFFFDD44#Air Suspension\n-#FFFFDD55#Chat Moderation\n-#FFFFDD66#Minimap Disco\n-#FFFFDD77#Save and Load settings function\n-#FFFFDD88#And more", menu_notify_name = "#FFFFCC00#Toph", menu_notify_colour = 0xFFFFCC00},
    {name = "Rimuru", notify_map_sub_title = "Wannabe Welsh", notify_map = "'let' me learn LUA using her script and still continues to help me all the time", notify_map_pic = "CHAR_WENDY", menu_notify = "#FFFF55AA#Credits:\n-#FFFF4488#Made Auto Updater\n-#FFFF4499#Taught me how to use tables to make features\n-#FFFF44AA#Yelled at me for bad code\n-#FFFF44BB#Let me ask dumb af questions\n-#FFFF44CC#Gave the code for nightclub loop\n-#FFFF44DD#And more", menu_notify_name = "#FFFF55AA#Rimuru", menu_notify_colour = 0xFFFF55AA},
    {name = "GhostOne", notify_map_sub_title = "Has Cheese", notify_map = "Makes zero sense when giving help but still helps a lot", notify_map_pic = "CHAR_TAXI", menu_notify = "#FF00FFEE#Credits:\n-#FF00EEFF#Made Auto Kick By Country\n-#FF00DDFF#Made VPN detection flag\n-#FF00CCFF#Made IP lookup\n-#FF00BBFF#Made a lot of different functions\n-#FF00AAFF#Taught me a lot to do with functions and tables\n-#FF0099FF#Cheese and more", menu_notify_name = "#FF00FFFF#GhostOne", menu_notify_colour = 0xFF00FFFF},
    {name = "Aren", notify_map_sub_title = "Mostly Cringe", notify_map = "Helped me a lot with LUA at the beginning, taught me how to use natives", notify_map_pic = "CHAR_JIMMY", menu_notify = "#FFFF1100#Credits:\n-#FFFF2211#Taught me how to use natives\n-#FFFF3311#Taught me how to start making luas", menu_notify_name = "#FFFF1111#Aren", menu_notify_colour = 0xFFFF1111}
}
for _,v in ipairs(credits_list) do
    menu.add_feature(v.name, "action_value_str", femboy_local.credits, function(f)
        if f.value == 0 then
            if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then 
                return menu.notify(v.notify_map, v.name, 5, v.menu_notify_colour)
            else
                NotifyMap(v.name, "~h~~r~"..v.notify_map_sub_title, v.notify_map, v.notify_map_pic, 140)
            end
        elseif f.value == 1 then 
            menu.notify(v.menu_notify, v.menu_notify_name, 5, v.menu_notify_colour)
        end 
    end):set_str_data({"Credit", "Features Made/Helped With"})
end

-- main_online 

menu.add_player_feature("Waypoint Follow Player", "toggle", femboy_local.main_online, function(f, pid)
    while f.on do
        local player_ped = player.get_player_ped(pid)
        local player_coords = entity.get_entity_coords(player_ped)
        local v2_coord = v2(player_coords.x, player_coords.y)

        if v2_coord.x ~= 0 or v2_coord.y ~= 0 then
            ui.set_new_waypoint(v2_coord)
        end
        system.wait(100)
    end
end)

--- ip_online_lookup
local ip_feats = {}
femboy_local.ip_online_lookup = menu.add_player_feature("IP Lookup", "parent", femboy_local.main_online, function(f, pid)
    local response, my_info = web.get("http://ip-api.com/json/" ..
    dec_to_ipv4(player.get_player_ip(pid)) .. "?fields=66846719")
    if response == 200 then
        for _, playerFeat in pairs(ip_feats) do
            for _, feat in pairs(playerFeat.feats) do
                feat.hidden = true
            end
        end
        for name, value in my_info:gmatch('",*"*(.-)":"*([^,"]*)"*,*') do -- goes through every line that matches `"smth": "value",`
            if not ip_feats[name] then -- checks if the feature already exists or not, if it doesnt exist then it creates one and stores it into ip_feats table
                ip_feats[name] = menu.add_player_feature(name, "action_value_str", f.id)
            end
            ip_feats[name].feats[pid]:set_str_data({ value }) -- updates str_data to have the value
            ip_feats[name].feats[pid].hidden = false
        end
    else
        print("Error.")
    end
end).id

menu.add_player_feature("Post IP Info In Chat", "action_value_str", femboy_local.ip_online_lookup, function(f, pid)
    local ip = player.get_player_ip(pid)
    local response, my_info = web.get("http://ip-api.com/json/" .. dec_to_ipv4(ip) .. "?fields=1189433")
    local message = my_info:gsub(",", "\n"):gsub('[{}"]', ""):gsub(":", " - "):gsub("proxy", "VPN"):gsub("regionName","Region"):gsub("query", "IP"):gsub("continent", "Continent"):gsub("country", "Country"):gsub("city", "City"):gsub("zip", "ZIP/Post Code"):gsub("isp", "ISP"):gsub("org", "Organisation")
    if response == 200 then
        if f.value == 0 then
            local name = player.get_player_name(pid)
            network.send_chat_message(name .. "'s IP info:\n" .. message, true)
        elseif f.value == 1 then
            local name = player.get_player_name(pid)
            network.send_chat_message(name .. "'s IP info:\n" .. message, false)
        end
    else
        print(response)
    end
end):set_str_data({ "Team Chat", "All Chat" })

menu.add_player_feature("Copy IP To clipboard", "action", femboy_local.ip_online_lookup, function(f, pid)
    local ip = player.get_player_ip(pid)
    local p = player.get_player_name(pid)
    utils.to_clipboard(dec_to_ipv4(ip))
    menu.notify(p .. "'s IP " .. dec_to_ipv4(ip) .. " has been added to clipboard")
end)

menu.add_player_feature("                                    -- IP Info --                                        ","action", femboy_local.ip_online_lookup, function()
    menu.notify("Press this if you're gay", "rekt")
end)

--- griefing_options 
menu.add_player_feature("Crush Player", "action", femboy_local.griefing_options, function(f, pid)
    local playerloc = player.get_player_coords(pid)
    playerloc.z = playerloc.z + 2.7
    request_model(2859440138)
    local veh = vehicle.create_vehicle(2859440138, playerloc, 0, true, false)
    entity.set_entity_visible(veh, false)
    system.wait(10000)
    entity.delete_entity(veh)
end)

menu.add_player_feature("Cargoplane Spam", "toggle", femboy_local.griefing_options, function(f, pid)
    while f.on do
        local playerloc = player.get_player_coords(pid)
        playerloc.z = playerloc.z + 2.7
        request_model(2336777441)
        local veh = vehicle.create_vehicle(2336777441, playerloc, 0, true, false)
        system.wait(100)
    end
end)

menu.add_player_feature("Taze Player", "toggle", femboy_local.griefing_options, function(f, pid)
    while f.on do
        local playerstart = player.get_player_coords(pid) + 1
        local playerloc = player.get_player_coords(pid)
        gameplay.shoot_single_bullet_between_coords(playerstart, playerloc, 1000, 911657153, player.player_ped(), true,
            false, 100)
        system.wait()
    end
end)

menu.add_player_feature("Firework Player", "toggle", femboy_local.griefing_options, function(f, pid)
    while f.on do
        local playerstart = player.get_player_coords(pid) + 1
        local playerloc = player.get_player_coords(pid)
        gameplay.shoot_single_bullet_between_coords(playerstart, playerloc, 1000, 2138347493, player.player_ped(), true,
            false, 100)
        system.wait()
    end
end)

menu.add_player_feature("RPG Player", "toggle", femboy_local.griefing_options, function(f, pid)
    while f.on do
        local playerstart = player.get_player_coords(pid) + 1
        local playerloc = player.get_player_coords(pid)
        gameplay.shoot_single_bullet_between_coords(playerstart, playerloc, 1000, 3204302209, player.player_ped(), true,
            false, 100)
        system.wait()
    end
end)

menu.add_player_feature("Orbital Player", "action", femboy_local.griefing_options, function(f, pid)
    local v3_coord = player.get_player_coords(pid)
    fire.add_explosion(v3_coord, 59, false, false, 1, player.player_ped())
    graphics.set_next_ptfx_asset("scr_xm_orbital")
    while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
        graphics.request_named_ptfx_asset("scr_xm_orbital")
        system.yield(0)
    end
    graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", v3_coord, v3(0, 180, 0), 1.0, true, true, true)
end)

menu.add_player_feature("Orbital Player (loop)", "toggle", femboy_local.griefing_options, function(f, pid)
    while f.on do
        local v3_coord = player.get_player_coords(pid)
        player.get_player_coords(pid)
        fire.add_explosion(v3_coord, 59, false, false, 1, player.player_ped())
        graphics.set_next_ptfx_asset("scr_xm_orbital")
        while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
            graphics.request_named_ptfx_asset("scr_xm_orbital")
            system.yield(0)
        end
        graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", v3_coord, v3(0, 180, 0), 1.0, true, true, true)
        system.wait()
    end
end)

menu.add_player_feature("Atomize Player", "toggle", femboy_local.griefing_options, function(f, pid)
    while f.on do
        local playerstart = player.get_player_coords(pid) + 1
        local playerloc = player.get_player_coords(pid)
        gameplay.shoot_single_bullet_between_coords(playerstart, playerloc, 1000, 2939590305, player.player_ped(), true,
            false, 100)
        system.wait()
    end
end)

menu.add_player_feature("Kill Player", "toggle", femboy_local.griefing_options, function(f, pid)
    while f.on do
        local playerstart = player.get_player_coords(pid) + 1
        local playerloc = player.get_player_coords(pid)
        gameplay.shoot_single_bullet_between_coords(playerstart, playerloc, 10000, 3219281620, player.player_ped(), true,
            false, 100)
        system.wait()
    end
end)

--- friendly_options
local rp_models = {
    {name = "Alien", model = 1298470051},
    {name = "Beast", model = 1955543594},
    {name = "Princess Robot Bubblegum", model = 437412629},
    {name = "Impotent Rage", model = 446117594},
    {name = "Republican Space Ranger", model = 3644302825}, 
    {name = "Republican Space Ranger (different one)", model = 601745115},
    {name = "Pogo", model = 1025210927}, 
    {name = "Sasquatch", model = 2568981558}
}
for _,v in ipairs(rp_models) do
    menu.add_player_feature(v.name, "toggle", femboy_local.rp_drop, function(f, pid)
        if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
            menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
            f.on=false
        else
            request_model(v.model)
            while f.on do
                local coords = player.get_player_coords(pid)
                femboy_native(0x673966A0C0FD7171, 738282662, coords, 0, 1, v.model, 0, 1)
                system.wait(5)
            end 
        end 
    end)
end

menu.add_player_feature("Card Drop", "toggle", femboy_local.friendly_options, function(f, pid)
    if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
        menu.notify("Natives are required to be enabled to use this feature", "Femboy Lua")
        f.on = false
    else
        request_model(3030532197)
        while f.on do 
            local coords= player.get_player_coords(pid)
            femboy_native(0x673966A0C0FD7171, -1009939663, coords, 0, 1, 3030532197, 0, 1)
            system.wait(5)
        end
    end 
end)

--- weapon_options
menu.add_player_feature("RP Gun", "toggle", femboy_local.weapon_options, function(f, pid)
    while f.on do 
        request_model(437412629)
        local player_ped = player.get_player_ped(pid)
        local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player_ped)
        if bool_rtn then
            femboy_native(0x673966A0C0FD7171, 738282662, v3_coord, 0, 1, 437412629, 0, 1)
        end
    system.wait()
    end
end)

menu.add_player_feature("Card Gun", "toggle", femboy_local.weapon_options, function(f, pid)
    while f.on do 
        request_model(3030532197)
        local player_ped = player.get_player_ped(pid)
        local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player_ped)
        if bool_rtn then
            femboy_native(0x673966A0C0FD7171, -1009939663, v3_coord, 0, 1, 3030532197, 0, 1)
        end
    system.wait()
    end
end)

menu.add_player_feature("Orbital Gun", "toggle", femboy_local.weapon_options, function(f, pid)
    while f.on do
        local pid_ped = player.get_player_ped(pid)
        local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(pid_ped)
        if bool_rtn then 
            fire.add_explosion(v3_coord, 59, false, false, 1, player.player_ped())
            graphics.set_next_ptfx_asset("scr_xm_orbital")
            while not graphics.has_named_ptfx_asset_loaded("scr_xm_orbital") do
                graphics.request_named_ptfx_asset("scr_xm_orbital")
                system.yield(0)
            end
            graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", v3_coord, v3(0, 180, 0), 1.0, true, true, true)
        end
        system.wait()
    end
end)

menu.add_player_feature("Kick Gun", "toggle", femboy_local.weapon_options, function(f, pid)
    while f.on do
        for i = 0, 31 do
            if player.is_player_valid(i) then 
                local i_ped = player.get_player_ped(i)
                local player_ped = player.get_player_ped(pid)
                local entity_to_kick = player.get_entity_player_is_aiming_at(pid)
                local bool_rtn, v3_coord = ped.get_ped_last_weapon_impact(player_ped)

                local kicker_name = player.get_player_name(pid)
                local kickee_name = player.get_player_name(i)

                if entity_to_kick == i_ped and bool_rtn then 
                    if not player.player_id() then
                        network.force_remove_player(i)
                        menu.notify("Kicking "..kickee_name.." because "..kicker_name.." used Kick Gun on them", "Femboy Lua", 5, 0xFF00EE00)
                    elseif player.player_id() then
                        menu.notify(kicker_name.." tried to kick you using kick gun", "Femboy Lua", 5, 0xFF0000EE)
                    end
                end
                
            end
        end
        system.wait()
    end
end)

menu.add_player_feature("Give All Weapons", "action", femboy_local.weapon_options, function(f,pid)
    local player_ped = player.get_player_ped(pid)
    local weapon_hashes = weapon.get_all_weapon_hashes()
    for _, hash in ipairs(weapon_hashes) do
        weapon.give_delayed_weapon_to_ped(player_ped, hash, 1000, false)
    end
end)

menu.add_player_feature("Remove Held Weapon", "action", femboy_local.weapon_options, function(f, pid)
    local player_ped = player.get_player_ped(pid)
    local held_weapon = ped.get_current_ped_weapon(player_ped)
    weapon.remove_weapon_from_ped(player_ped, held_weapon)
end)

menu.add_player_feature("Remove Held Weapon (loop)", "toggle", femboy_local.weapon_options, function(f, pid)
    while f.on do
        local player_ped = player.get_player_ped(pid)
        local held_weapon = ped.get_current_ped_weapon(player_ped)
        weapon.remove_weapon_from_ped(player_ped, held_weapon)
        system.wait()
    end
end)

menu.add_player_feature("Remove All Weapons", "action", femboy_local.weapon_options, function(f, pid)
    menu.get_feature_by_hierarchy_key("online.online_players.player_"..pid..".weapons.remove_all_weapons"):toggle()
end)

menu.add_player_feature("Remove All Weapons (loop)", "toggle", femboy_local.weapon_options, function(f, pid)
    while f.on do
        menu.get_feature_by_hierarchy_key("online.online_players.player_"..pid..".weapons.remove_all_weapons"):toggle()
    end
end)

LoadSettings()

menu.create_thread(function()
    local resPonse_code, resPonsehody = web.get("https://raw.githubusercontent.com/Decuwu/femboylua/main/Femboy.lua")
    local version_response, version_body = web.get("https://raw.githubusercontent.com/Decuwu/femboylua/main/version.txt")
    if resPonse_code == 200 and version_response == 200 then
        version_body = version_body:gsub("[\r\n]", "")
        if version_body == version then return
        elseif version ~= version_body then
                menu.create_thread(function ()
                local file = io.open(utils.get_appdata_path("PopstarDevs", "2Take1Menu").."\\scripts\\Femboy.lua", "w+b")
                file:write(resPonsehody)
                file:close()
                menu.notify("Updated Femboy Lua, Restart the script to get the new version", "Femboy Lua Auto Updater")
                menu.exit()
            end)
        end
    else
        menu.notify("Failed to find github shit")
    end
end)
