---
--- Movie Monsters
---

-- inspect = require "lib.inspect"
-- local Concord = require "lib.concord"
Gamestate = require("lib.gamestate")

-- Modules
-- local Entity     = Concord.entity
-- local Component  = Concord.component
-- local System     = Concord.system
-- local World      = Concord.world

-- Containers
-- local Components  = Concord.components

local title = require("state.title")

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(title)
end

function love.draw()
    Gamestate.draw()
end

function love.update(dt)
    require("lib.lovebird").update()
    Gamestate.update(dt)
end

function love.keypressed(key)
    -- Global keys
    if key == "escape" then
        love.event.quit()
    end
end

function love.quit()
    Gamestate.quit()
end
