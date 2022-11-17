--------------------------------------------------------------------------------
-- Menu elements
--------------------------------------------------------------------------------
local m_hkey = gui.new_checkbox('Display hotkey list', 'enable_hkey', false)

--------------------------------------------------------------------------------
-- Hotkey window settings
--------------------------------------------------------------------------------
local cache = { }

local bind_list = {
    --  ...     = { element_reference,                          name_to_display },
    fast_fire   = { gui.get_checkbox('rage', 'enable_fast_fire'),   'Fast fire' },
    inverter    = { gui.get_checkbox('antiaim', 'desync_flip'),     'Inverter'  },
    fakeduck    = { gui.get_checkbox('antiaim', 'fake_duck'),       'FakeDuck'  },
    hideshot    = { gui.get_checkbox('antiaim', 'hide_shot'),       'HideShots' }, 
}

local settings = {
    title = 'Hotkeys',

    col = { 
        [ 'background' ] = color.new(13, 13, 13, 160), 
        [ 'font'       ] = color.new(220, 220, 220) 
    },

    font_title = fonts.verdana12,
    font_binds = fonts.verdana12
}

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
local screen = { engine_client.get_screen_size() }
local length_table = { }

local start_pos = { renderer.get_text_size(settings.title, settings.font_title) }
local header_indict = 4

local hotkey_dragging = gui.new_draggable(
    (screen[1] / 2) - (start_pos[1] * 5),
    (screen[2] / 2) - (start_pos[2] / 2),
    settings.col['background'],
    false
)

local hotkey_window = gui.new_drawable()

hotkey_window:attach(hotkey_dragging)

--------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------
local clamp = function(num, lower, upper)
    assert(num and lower and upper, "Error: clamp(num, lower, upper)")
    return math.max(lower, math.min(upper, num))
end

local max = function(a)
    local values = {}
  
    for k,v in pairs(a) do
      if type(k) == "number" and type(v) == "number" then
        values[#values+1] = v
      end
    end
    table.sort(values)
  
    return values[#values]
end


local not_empty_binds = function()
    local state = false

    for _, element in pairs(bind_list) do
        if element[1]:get_value() then
            state = true
            break
        end
    end

    return state
end

function renderer:animated_text(x, y, col, text, font, time, align_horiz, align_vert)
    align_horiz = align_horiz or 0
    align_vert = align_vert or 0

    cache[text] = cache[text] or 0
    col.a = col.a or 255
    time = time or 50
    
    if cache[text] ~= 1 then
        time = time / 1000
        cache[text] = cache[text] + 1 / time * global_vars.frametime
    end

    renderer.text(x, y, color.new(220, 220, 220, math.floor(clamp(cache[text] * 100, 0, 255))), text, font, align_horiz, align_vert)
end

function hotkey_window:update()
    -- set parameters
    self.text = settings.title
    self.size_x, self.size_y = renderer.get_text_size(self.text, settings.font_title)

    -- set padding
    self.size_x = self.size_x + header_indict
end

function hotkey_window:paint(x, y)
    renderer.text(x + header_indict / 2, y, settings.col['font'], self.text, settings.font_title)

    length_table = { }
    local offset = 3

    for _, element in pairs(bind_list) do
        if element[1]:get_value() then
            local size_x, size_y = renderer.get_text_size(element[2], settings.font_binds)
            local r, g, b = settings.col['font'].r, settings.col['font'].g, settings.col['font'].b
            local name = tostring(element[2])
            
            length_table[#length_table + 1] = size_x

            offset = offset + size_y
            renderer:animated_text(x, y + offset, settings.col['font'], element[2], settings.font_binds, 69)
        else
            cache[tostring(element[2])] = nil
        end
    end

    header_indict = #length_table == 0 and 4 or max(length_table)
end

--------------------------------------------------------------------------------
-- Callbacks
--------------------------------------------------------------------------------
function on_paint()
    if not (engine_client.is_connected() and engine_client.is_ingame()) then
        return
    end

    local is_menu_open = gui.is_menu_open()

    if m_hkey:get_value() and (not_empty_binds() or is_menu_open) then
        hotkey_dragging:draw()
    end
end
