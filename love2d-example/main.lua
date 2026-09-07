
-- settings
local period = 12
local phase_len = (period / 4)

-- load the library
local ease = require("..ease")

-- pull out all the function names and sort them
-- local names = {}
-- for name, func in pairs(ease) do
--   table.insert(names, name)
-- end
-- table.sort(names)

local names = {
  "none",
  "out_quad",
  "out_cubic",
  "out_quart",
  "out_quint",
  "out_sine",
  "out_expo",
  "out_circ",
  "out_elastic",
  "out_back",
  "out_bounce",
  "in_quad",
  "in_cubic",
  "in_quart",
  "in_quint",
  "in_sine",
  "in_expo",
  "in_circ",
  "in_elastic",
  "in_back",
  "in_bounce",
  "in_out_quad",
  "in_out_cubic",
  "in_out_quart",
  "in_out_quint",
  "in_out_sine",
  "in_out_expo",
  "in_out_circ",
  "in_out_elastic",
  "in_out_back",
  "in_out_bounce",
}

-- draw a demo
function love.draw()
  -- timer stuff
  local seconds = love.timer.getTime()
  local cycle = (seconds % period)
  local phase = math.floor(cycle / phase_len)

  local phase_cycle =
    math.min(1,
    math.max(0, (cycle % phase_len) / phase_len))

  local t = phase_cycle

  if     (phase == 1) then  t = 1
  elseif (phase == 2) then  t = 1 - t
  elseif (phase == 3) then  t = 0
  end

  -- drawing stuff
  local y = 8
  local win_w, win_h = love.graphics.getDimensions()
  local bar_left = 200
  local bar_w = (win_w - 8 - bar_left * 2)
  local bar_right = (bar_left + bar_w)

  -- draw
  love.graphics.clear(.1, .1, .2)
  for i, name in ipairs(names) do
    local x = bar_left + (bar_w - 16) * ease[name](t)

    -- back-background stripes
    if (i % 2 == 1) then
    love.graphics.setColor(.15, .15, .25)
    love.graphics.rectangle("fill", 0, y-1, win_w, 17)
    end

    -- background bar
    love.graphics.setColor(.2, .2, .4)
    love.graphics.rectangle("fill", bar_left, y, bar_w, 16)

    -- linear placement
    love.graphics.setColor(.4, .4, .6)
    love.graphics.rectangle("fill", bar_left + (bar_w - 16)*t, y+1, 14, 14)

    -- eased placement
    love.graphics.setColor(1, 1, 1)
    -- love.graphics.rectangle("fill", x, y+1, 14, 14)
    love.graphics.circle("fill", x + 7, y+8, 7)

    -- love.graphics.rectangle("fill", bar_left, y + 14, bar_w * t, 2)

    -- text
    love.graphics.print(name, 8, y)
    love.graphics.print(string.format("%1.2f", t), bar_right + 8, y)

    y = (y + 20)
  end
end

-- quit on request
function love.keyreleased(key, code, isrepeat)
  if key == "q" and love.keyboard.isDown("lctrl", "rctrl", "capslock") then
    love.event.quit()
  end
end
