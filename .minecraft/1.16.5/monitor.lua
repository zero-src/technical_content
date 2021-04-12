--------------------------------------------------------------------------------
-- Default LUA functions
--------------------------------------------------------------------------------
local floor, len, min, max = math.floor, string.len, math.min, math.max

--------------------------------------------------------------------------------
-- Glogal variables
--------------------------------------------------------------------------------
local sdk = require("lib/sdk")

local STORAGES = {
   {"ironchest:crystal_chest_0" , 256},
}

local ITEMS_TO_DISPLAY = {
   "minecraft:gold_ingot",
   "minecraft:diamond",
}

local display_selected_items = { }
local item_list = { }

local monitors = {peripheral.wrap("monitor_41")}
local m = monitors[1]

local chest = peripheral.wrap(STORAGES[1][1])

local SLIDER_SIZE = 19

--------------------------------------------------------------------------------
-- Custom functions
--------------------------------------------------------------------------------
function get_item_count(table, item)
    local count = 0
    for i=1, #table do
        if table[i] ~= nil then
            if (table[i]["name"] == item) then
                count = count + table[i]["count"]
            end
        end
    end

    return count
end

function display(table, s_capacity)
    m.clear()
    local screen_x, screen_y =  m.getSize()
    
    local title = "ITEMS"
    local text = ''

    local x_spaces = 4
    local heigh = 5

    local s_len = 0
    local s_min = 0

    m.setBackgroundColor(colors.black)
    m.setTextColor(colours.purple)

    m.setCursorPos(sdk:centred_text_pos(m, title), 1)
    m.write(title)

    local container = sdk:new_container(nil, 'Resources', 2, 3, 10)
    container:draw_container(m, colors.gray)

    for i=1, #table do
        if table[i] ~= nil then
            s_len = sdk:clamp(floor((table[i][2] / s_capacity) * SLIDER_SIZE + 1), s_min, sdk:clamp(SLIDER_SIZE, s_min, screen_x))
            text = table[i][1] .. ": " .. table[i][2] .. " / " .. s_capacity

            sdk:new_slider(m, x_spaces, heigh, 1, SLIDER_SIZE, s_len, colors.gray, sdk:percentage_to_color(table[i][2] / s_capacity * 100), text)
            heigh = heigh + 5
        end
    end

    sdk:reset_container()
end

while true do
    item_list = chest.list()

    display_selected_items = {
        {"gold", get_item_count(item_list, ITEMS_TO_DISPLAY[1])}, 
        {"diamond", get_item_count(item_list, ITEMS_TO_DISPLAY[2])},
    }

    display(display_selected_items, STORAGES[1][2])
    sleep(2)
end