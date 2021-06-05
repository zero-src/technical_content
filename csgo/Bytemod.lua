local ffi = require 'ffi'

ffi.cdef[[
    typedef bool(__thiscall* console_is_visible_t)(void*);
]]

local engine_client = utils.CreateInterface("engine.dll", "VEngineClient014")
local engine_client_class = ffi.cast(ffi.typeof("void***"), engine_client)
local console_is_visible = ffi.cast("console_is_visible_t", engine_client_class[0][11])

--------------------------------------------------------------------------------
-- Simplification
--------------------------------------------------------------------------------
local is_connected, is_in_game = g_EngineClient:IsConnected(), g_EngineClient:IsInGame()
local min, max, abs, sqrt, floor = math.min, math.max, math.abs, math.sqrt, math.floor

local slider_int = menu.SliderInt

--------------------------------------------------------------------------------
-- Cheat
--------------------------------------------------------------------------------
local dir = {
    ['ragebot'] = { 'Aimbot', 'Ragebot' },
    ['antiaim'] = { 'Aimbot', 'Anti Aim'},
    ['view']    = { 'Visuals', 'View' }
}

local reference = function(table, ...)
    return g_Config:FindVar(table[1], table[2], ...)
end

--------------------------------------------------------------------------------
-- References
--------------------------------------------------------------------------------
local ref = {
    ragebot             = reference(dir['ragebot'], 'Main',         'Enable Ragebot'),
    doubletap           = reference(dir['ragebot'], 'Exploits',     'Double Tap'),
    hitchance           = reference(dir['ragebot'], 'Accuracy',     'Hit Chance'),
    vis_damage          = reference(dir['ragebot'], 'Min. Damage',  'Visible'),
    aw_damage           = reference(dir['ragebot'], 'Min. Damage',  'Autowall'),

    yaw_add             = reference(dir['antiaim'], 'Main',         'Yaw Add'),
    inverter            = reference(dir['antiaim'], 'Fake Angle',   'Inverter'),
    lby_mode            = reference(dir['antiaim'], 'Fake Angle',   'LBY Mode'),
    desync_limit_left   = reference(dir['antiaim'], 'Fake Angle',   'Left Limit'),
    desync_limit_right  = reference(dir['antiaim'], 'Fake Angle',   'Right Limit'),
    desync_on_shot      = reference(dir['antiaim'], 'Fake Angle',   'Desync On Shot'),
    desync_on_peek      = reference(dir['antiaim'], 'Fake Angle',   'Freestanding Desync'),
    fakelag             = reference(dir['antiaim'], 'Fake Lag',     'Enable Fake Lag'),
    slow_walk           = reference(dir['antiaim'], 'Misc',         'Slow Walk'),

    thirdperson         = reference(dir['view'],    'Thirdperson',  'Enable Thirdperson')
}

--------------------------------------------------------------------------------
-- Tables
--------------------------------------------------------------------------------
local cache = { }

local hitgroups = { 
    [1] = {0, 1}, 
    [2] = {5, 4, 6}, 
    [3] = {3, 2}, 
    [4] = {13, 15, 16, 14, 17, 18}, 
    [5] = {7, 9, 11, 8, 10, 12}, 
}

local console_materials = { 
    'vgui_white', 
    'vgui/hud/800corner1', 
    'vgui/hud/800corner2', 
    'vgui/hud/800corner3', 
    'vgui/hud/800corner4' 
}

local script = {   
    active = false,
    
    time = -0.26,
    max_time = 0
}

local menu_items = {
    dt_weapons = { 'SCAR-20/G3SG1', 'Deagle' },
    hitboxes = { 'Disabled', 'Head', 'Chest', 'Stomach', 'Arms', 'Legs' }
}

--------------------------------------------------------------------------------
-- Menu functions
--------------------------------------------------------------------------------
local dir_resolver = function(s)
    local name = ''
    for word in string.gmatch(s, "[^%s]+") do
        name = name .. word:sub(1,1):upper()..word:sub(2) .. ' '
    end
    return name
end

local ui = { 
    checkbox    = menu.Switch,
    combobox    = menu.Combo,
    slider_int  = menu.SliderInt,
    multiselect = menu.MultiCombo,
    colorpicker = menu.SwitchColor 
}

--------------------------------------------------------------------------------
-- New elements
--------------------------------------------------------------------------------
local m_doubletap_enabled   = ui.checkbox('Double Tap', 'Double Tap Settings', false)
local m_override_speed      = ui.slider_int('Double Tap', 'Ticks to recharge', 13, 12, 15)
local m_doubletap_hitchance = ui.slider_int('Double Tap', 'Hitchance', ref.hitchance:GetInt(), 0, 100, 'Hitchance between DoubleTap shots')
local m_doubletap_damage    = ui.multiselect('Double Tap', 'Damage (Health / 2)', menu_items.dt_weapons, 0)

local m_hitbox_priority     = ui.combobox('Target based ragebot', 'Hitbox Preference', menu_items.hitboxes, 0)
local m_target_hitchance    = ui.checkbox('Target based ragebot', 'Target Hitchance', false)
local m_target_scar_stand_h = ui.slider_int('Target based ragebot', 'Scar: Stand', 0, 0, 100)
local m_target_scar_move_h  = ui.slider_int('Target based ragebot', 'Scar: Move', 0, 0, 100)

local m_automatic_desync    = ui.checkbox('Anti-Aimbot', 'Automatic desync', false)
local m_automatic_yaw       = ui.checkbox('Anti-Aimbot', 'Automatic yaw', false)

local m_foot_shadow         = ui.checkbox('Visuals', 'Disable foot contact shadows', false)

local m_console_color       = ui.colorpicker('Misc', 'Console Color', false, Color.new(0.43, 0.43, 0.43, 0.9))
local m_console_clear       = ui.checkbox('Misc', 'Console Clear', false, "Clears console on 'round_prestart'")

--------------------------------------------------------------------------------
-- Custom functions
--------------------------------------------------------------------------------
local cache_process_int = function(condition, should_call, a, b)
    local name = tostring(condition)
    cache[name] = cache[name] ~= nil and cache[name] or condition:GetInt()
 
    if should_call then
        if type(a) == "function" then a() else
            condition:SetInt(a)
        end
    else
        if cache[name] ~= nil then
            if b ~= nil and type(b) == "function" then
                b(cache[name])
            else
                condition:SetInt(cache[name])
            end
 
            cache[name] = nil
        end
    end
end

local cache_process_bool = function(condition, should_call, a, b)
    local name = tostring(condition)
    cache[name] = cache[name] ~= nil and cache[name] or condition:GetBool()
 
    if should_call then
        if type(a) == "function" then a() else
            condition:SetBool(a)
        end
    else
        if cache[name] ~= nil then
            if b ~= nil and type(b) == "function" then
                b(cache[name])
            else
                condition:SetBool(cache[name])
            end
 
            cache[name] = nil
        end
    end
end

local materials_dump = function(table_from)
    local table_to = { }

    local cur_material_idx = g_MatSystem:FirstMaterial()
    local cnt = 0

    while(cnt < #table_from) do
        local mat = g_MatSystem:GetMaterial(cur_material_idx)
        local name = mat:GetName()

        for i = 1, #table_from do
            if name == table_from[i] then
                --print(table_to[i] .. " | idx: " .. cur_material_idx)
                table_to[cnt] = cur_material_idx
                cnt = cnt + 1
                break
            end
        end

        cur_material_idx = g_MatSystem:NextMaterial(cur_material_idx)
    end

    return table_to
end

local between_shots = function()
    script.active = ref.ragebot:GetBool()
    script.time = -0.26
 
    local me = g_EntityList:GetClientEntity(g_EngineClient:GetLocalPlayer()):GetPlayer()
    local weapon = me:GetActiveWeapon()
 
    if weapon == nil then
        return
    end

    local m_flNextAttack = me:GetProp("m_flNextAttack")
    local next_attack = weapon:GetProp("m_flNextPrimaryAttack")
 
    if next_attack == nil then
        script.active = false
        return
    end
 
    local max_time = 0.69
    local current_time = g_GlobalVars.curtime
    local m_flAttackTime = next_attack + 0.5
 
    local m_flNextAttack = m_flNextAttack + 0.5
    local shift_time = m_flAttackTime - current_time
 
    if m_flAttackTime < m_flNextAttack then
        max_time = 1.52
        shift_time = m_flNextAttack - current_time
    end
 
    script.time = shift_time
    script.max_time = max_time
 
    local is_safe = max_time ~= 1.52 and shift_time > 0.1

    local shots_fired = me:GetProp("m_iShotsFired")
    local should_be_called = script.active and is_safe and shots_fired > 0 and shift_time >= (max_time - 0.1)

    return should_be_called
end

local velocity_type = function(enemy)
    local vx, vy = enemy:GetProp("m_vecVelocity[0]"), enemy:GetProp("m_vecVelocity[1]")

    local state = 'stand'
    local speed = 0

    if (vx ~= nil) and (vy ~= nil) then
        speed = abs(floor( sqrt(vx*vx + vy*vy) ))
    end

    if (speed > 5) and (speed <= 50) then
        state = 'walk'
    end

    if speed > 50 then
        state = 'run'
    end

    return state
end

local enemy_controller = function()
    if not (is_connected and is_in_game) then
        return
    end

    -- Local player information
    local me = g_EntityList:GetClientEntity(g_EngineClient:GetLocalPlayer()):GetPlayer()
    local weapon = me:GetActiveWeapon()

    if weapon == nil then
        return
    end

    -- Main variables    
    local doubletap_hitchance = m_doubletap_hitchance:GetInt()

    local dt_sniper, dt_deagle = m_doubletap_damage:GetInt(0), m_doubletap_damage:GetInt(1)
    local ents = g_EntityList:GetEntitiesByName('CCSPlayer')
    local wepID = weapon:GetWeaponID() 

    -- Enemy Characteristics
    local weapon_hitchance = {
        [ 'stand']   = between_shots() and doubletap_hitchance or m_target_scar_stand_h:GetInt(),
        [ 'walk' ]   = between_shots() and doubletap_hitchance or m_target_scar_stand_h:GetInt(),
        [ 'run'  ]   = between_shots() and doubletap_hitchance or m_target_scar_move_h:GetInt()
    }

    local health = 0

    -- DoubleTap Hitchance
    if m_doubletap_enabled:GetBool() and ref.doubletap:GetBool() and not m_target_hitchance:GetBool() then
        cache_process_int(ref.hitchance, between_shots(), doubletap_hitchance)
    end

    -- Enemy Scanner
    for player_id, player_ptr in ipairs(ents) do        
        if me:EntIndex() == player_id or player_ptr:GetPlayer():IsTeamMate() or player_ptr:GetPlayer():IsDormant() then
            goto continue
        end

        health = player_ptr:GetProp("m_iHealth")

        -- With Enabled DoubleTap
        if m_doubletap_enabled:GetBool() and ref.vis_damage:GetInt() > 5 and ref.aw_damage:GetInt() > 5 then
            local damage = health > 50 and floor(health / 2) + 1 or health + 1

            -- Target based damage { HEALTH / 2 }
            if dt_sniper and ((wepID == 11) or (wepID == 38)) then
                ragebot.OverrideMinDamage(player_id, damage)
            end

            if dt_deagle and wepID == 1 then
                ragebot.OverrideMinDamage(player_id, damage)
            end
        end

        -- Target Based Hitchance
        if m_target_hitchance:GetBool() then
            if (wepID == 11) or (wepID == 38) then
                local movement = velocity_type(player_ptr)

                ragebot.OverrideHitchance(player_id, weapon_hitchance[movement])
            end
        end

        -- Hitbox Priority
        if m_hitbox_priority:GetInt() ~= 0 then
            local hitbox = hitgroups[m_hitbox_priority:GetInt()]
            
            for i=1, #hitbox do
                ragebot.SetHitboxPriority(i, hitbox[i], 101-i)
            end
        end

        ::continue::
    end
end

local antiaim_tab = function()
    if not (is_connected and is_in_game) then
        return
    end
    
    -- Local player information
    local me = g_EntityList:GetClientEntity(g_EngineClient:GetLocalPlayer()):GetPlayer()
    local weapon = me:GetActiveWeapon()

    if weapon == nil then
        return
    end

    local wepID = weapon:GetWeaponID() 
    local dt_state = ref.doubletap:GetBool()
    local left = antiaim.GetInverterState()

    -- Anti-Aimbot Settings
    if m_automatic_desync:GetBool() then
        local dsy_angle = 48 
        local dsy_angle_dt = left and 60 or 20
        
        ref.desync_limit_left:SetInt(dt_state and dsy_angle_dt or dsy_angle)
        ref.desync_limit_right:SetInt(dt_state and dsy_angle_dt or dsy_angle)
    end

    if m_automatic_yaw:GetBool() then
        local yaw_angle = left and 17 or -7
        local yaw_angle_dt = left and 29 or -14

        ref.yaw_add:SetInt(dt_state and yaw_angle_dt or yaw_angle)
    end
end

local multi_event_actions = function(event)
    if event:GetName() == 'player_death' then
        local state = m_doubletap_enabled:GetBool()
        local speed = m_override_speed:GetInt()
    
        local cvar = g_CVar:FindVar('sv_maxusrcmdprocessticks')
        cvar:SetInt((state and speed > 14) and speed + 2 or 16)
    end

    if event:GetName() == 'round_prestart' and m_console_clear:GetBool() then
        g_EngineClient:ExecuteClientCmd('clear')
    end
end

--------------------------------------------------------------------------------
-- 400iq 
--------------------------------------------------------------------------------
local cl_foot_contact_shadows_state = m_foot_shadow:GetBool() and '0' or '1'
g_EngineClient:ExecuteClientCmd('cl_foot_contact_shadows ' .. cl_foot_contact_shadows_state)

m_override_speed:SetVisible(m_doubletap_enabled:GetBool())
m_doubletap_hitchance:SetVisible(m_doubletap_enabled:GetBool())
m_doubletap_damage:SetVisible(m_doubletap_enabled:GetBool())

m_target_scar_stand_h:SetVisible(m_target_hitchance:GetBool())
m_target_scar_move_h:SetVisible(m_target_hitchance:GetBool())

--------------------------------------------------------------------------------
-- Visibility Callbacks
--------------------------------------------------------------------------------
m_doubletap_enabled:RegisterCallback(function()
    local state = m_doubletap_enabled:GetBool()
    local speed = m_override_speed:GetInt()

    m_override_speed:SetVisible(state)
    m_doubletap_hitchance:SetVisible(state)
    m_doubletap_damage:SetVisible(state)

    exploits.OverrideDoubleTapSpeed(state and speed or 13)
    exploits.ForceTeleport()
end)

m_target_hitchance:RegisterCallback(function()
    local state = m_target_hitchance:GetBool()

    m_target_scar_stand_h:SetVisible(state)
    m_target_scar_move_h:SetVisible(state)
end)

--------------------------------------------------------------------------------
-- Menu Callbacks
--------------------------------------------------------------------------------
m_override_speed:RegisterCallback(function()
    local state = m_doubletap_enabled:GetBool()
    local speed = m_override_speed:GetInt()

    local cvar = g_CVar:FindVar('sv_maxusrcmdprocessticks')
    cvar:SetInt((state and speed > 14) and speed + 2 or 16)

    exploits.OverrideDoubleTapSpeed(m_override_speed:GetInt())
end)

m_foot_shadow:RegisterCallback(function()
    local command = m_foot_shadow:GetBool() and '0' or '1'
    g_EngineClient:ExecuteClientCmd('cl_foot_contact_shadows ' .. command)
end)

ref.slow_walk:RegisterCallback(function()
    cache_process_bool(ref.inverter, true, not antiaim.GetInverterState())
    cache_process_int(ref.desync_on_peek, ref.slow_walk:GetInt() ~= 0, 0)
end)

--------------------------------------------------------------------------------
-- Cheat Callbacks
--------------------------------------------------------------------------------
-- Dumping materials for console
local materials_to_paint = materials_dump(console_materials)

cheat.RegisterCallback('events', multi_event_actions)

cheat.RegisterCallback('draw', function()
    local color = m_console_color:GetColor()
    local r, g, b, a = color:r(), color:g(), color:b(), color:a()

    if not (console_is_visible(engine_client) and m_console_color:GetBool()) then
        r, g, b, a = 1.0, 1.0, 1.0, 1.0
    end

    for _, mat in pairs(materials_to_paint) do
        g_MatSystem:GetMaterial(mat):AlphaModulate(a)
        g_MatSystem:GetMaterial(mat):ColorModulate(r, g, b)
    end
end)

cheat.RegisterCallback('pre_prediction', antiaim_tab)
cheat.RegisterCallback('prediction', enemy_controller)

cheat.RegisterCallback('destroy', function()
    g_EngineClient:ExecuteClientCmd('cl_foot_contact_shadows 1')

    exploits.OverrideDoubleTapSpeed(13)

    for _, mat in pairs(materials_to_paint) do
        g_MatSystem:GetMaterial(mat):AlphaModulate(1.0)
        g_MatSystem:GetMaterial(mat):ColorModulate(1.0, 1.0, 1.0)
    end
end)
