---
--- Movie Monsters
---

inspect = require "lib.inspect"
local Concord = require("lib.concord")

-- Modules
local Entity     = Concord.entity
local Component  = Concord.component
local System     = Concord.system
local World      = Concord.world

-- Containers
local Components  = Concord.components

print(inspect("Hello"))
function love.draw()
    love.graphics.print("Movie Monster", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
end

function love.update(dt)
    require("lib.lovebird").update()
end

function love.keypressed(key)
    -- Global keys
    if key == "escape" then
        love.event.quit()
    end
end
