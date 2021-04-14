--------------------------------------------------------------------------------
-- Default LUA functions
--------------------------------------------------------------------------------
local floor, len, min, max = math.floor, string.len, math.min, math.max

--------------------------------------------------------------------------------
-- Glogal variables
--------------------------------------------------------------------------------
local sdk = (function()local a,b,c,d=math.floor,string.len,math.min,math.max;local e={name='',x=-2,y=-2,h=0,l=0,v=0}function e:in_range(f,c,d)return f>=c and f<=d end;function e:centred_text_pos(g,h)local i=g.getSize()return a(i/2-b(h)/2)+1 end;function e:clamp(j,k,l)assert(j and k and l,'Error: clamp(num, lower, upper)')return d(k,c(l,j))end;function e:measure_text(m,...)local n,o=0,0;local p={...}for q=1,#p do n=n+b(p[q])end;if m=='-'or m==nil or m=='c'then n=n;o=1 else n=n*2;o=2 end;return a(n+0.5),o end;function e:percentage_to_color(r)local colors={[100]=0x20,[80]=0x2000,[60]=0x10,[40]=0x2,[20]=0x4000}local s=0x1;if r>=100 then s=colors[100]elseif e:in_range(r,80,99)then s=colors[80]elseif e:in_range(r,60,79)then s=colors[60]elseif e:in_range(r,40,59)then s=colors[40]else s=colors[20]end;return s end;function e:new_line(g,t,u,v,w)g.setCursorPos(t,u)g.setBackgroundColor(w)g.write(string.rep(" ",v))g.setBackgroundColor(colors.black)end;function e:new_box(g,t,u,x,b,s)e:new_line(g,t,u,b,s)e:new_line(g,t,u+x+1,b,s)for q=1,x do e:new_line(g,t,u+q,1,s)e:new_line(g,t+b-1,u+q,1,s)end end;function e:new_outline(g,t,u,x,b,s)for q=1,x do e:new_line(g,t,u+q,1,s)e:new_line(g,t+b-1,u+q,1,s)end end;function e:new_slider(g,y,z,f,A,B,C,t,u)local D,E=t or self.x+2,u or self.y+2;local F=4;g.setCursorPos(D,E+self.h)g.write(C)e:new_outline(g,D,E+y+self.h,y,z,A)for q=1,y do e:new_line(g,D+1,E+y+self.h+q,f-2,B)end;self.l=d(z+4,b(C)+2)self.h=self.h+y+F end;function e:reset()self.name=''self.x=0;self.y=0;self.h=0;self.l=0;self.v=0 end;function e:get()return self.v,self.x,self.y,self.h,self.name end;function e:new_container(G,C,t,u,x,b)G=G or{}setmetatable(G,self)self.__index=self;C=C or''t=t or 0;u=u or 0;x=x or self.h;b=b or self.l;self.name=C;self.x=t;self.y=u;self.h=x;self.l=b;return G end;function e:draw_container(g,w)local i,H=g.getSize()local I=e:measure_text(nil,self.name)local J=self.l;local K=3;local L=J-I-5;g.setCursorPos(self.x+4,self.y)g.write(self.name)e:new_line(g,self.x,self.y,K,w)e:new_line(g,self.x+I+5,self.y,L,w)for q=1,self.h do e:new_line(g,self.x,self.y+q,1,w)e:new_line(g,self.x+J-1,self.y+q,1,w)end;e:new_line(g,self.x,self.y+self.h+1,J,w)end;return e end)()

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

local SLIDER_SIZE = 20

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

function setup_display(name, bg_color, text_color)
    bg_color, text_color = bg_color or colors.black, text_color or colors.white
    m.clear()

    m.setBackgroundColor(colors.black)
    m.setTextColor(colours.purple)

    m.setCursorPos(sdk:centred_text_pos(m, name), 1)
    m.write(name)
end

function display(table, s_capacity)
    setup_display("ITEMS")

    local container = sdk:new_container(nil, 'Resources', 2, 3)
    local screen_x, screen_y =  m.getSize()
    
    local txt = ''
    local val = 0
    
    for i=1, #table do
        if table[i] ~= nil then
            val = sdk:clamp(floor((table[i][2] / s_capacity) * SLIDER_SIZE + 1), 0, sdk:clamp(SLIDER_SIZE, 0, screen_x))
            txt = table[i][1] .. ": " .. table[i][2] .. " / " .. s_capacity

            container:new_slider(m, 1, SLIDER_SIZE, val, colors.gray, sdk:percentage_to_color(table[i][2] / s_capacity * 100), txt)
        end
    end

    container:draw_container(m, colors.gray)
    container:reset()
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