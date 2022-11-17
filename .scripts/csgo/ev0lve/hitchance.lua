local cache = { }

local script = {   
    active = false,
    
    time = -0.26,
    max_time = 0
}

--------------------------------------------------------------------------------
-- Menu elements
--------------------------------------------------------------------------------
local ragebot = gui.get_checkbox('rage', 'enable')
local ragebot_hitchance = gui.get_slider('rage', 'hitchance_value')

local m_enable_checkbox = gui.new_checkbox('Hitchance precision', 'hchfx', false)

--------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------
local cache_process = function(condition, should_call, a, b)
    local name = tostring(condition)
    cache[name] = cache[name] ~= nil and cache[name] or condition:get_value()

    if should_call then
        if type(a) == "function" then a() else
            condition:set_value(a)
        end
    else
        if cache[name] ~= nil then
            if b ~= nil and type(b) == "function" then
                b(cache[name])
            else
                condition:set_value(cache[name])
            end
 
            cache[name] = nil
        end
    end
end

local between_shots = function()
    script.active = ragebot:get_value()
    script.time = -0.26
 
    local me = entity_list[engine_client.get_local_player()]
    local weapon = entity_list.get_entity_from_handle(me:get_prop_int('m_hActiveWeapon'))
 
    if weapon == nil then
        return
    end

    --local idx = weapon:index()
    --print( tostring( idx ) ) --output example: [ev0lve] 63701284

    local m_flNextAttack = me:get_prop_float("m_flNextAttack")
    local next_attack = weapon:get_prop_float('m_flNextPrimaryAttack')

    if next_attack == nil then
        script.active = false
        return
    end
 
    local max_time = 0.69
    local current_time = global_vars.curtime
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

    local shots_fired = me:get_prop_int("m_iShotsFired")
    local should_be_called = script.active and is_safe and shots_fired > 0 and shift_time >= (max_time - 0.1)

    return should_be_called
end

--------------------------------------------------------------------------------
-- Callback
--------------------------------------------------------------------------------
function on_setup_command(cmd)
    if m_enable_checkbox:get_value() then
        cache_process(ragebot_hitchance, between_shots(), 0)
    end
end