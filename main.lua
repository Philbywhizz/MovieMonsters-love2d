---
--- Movie Monsters
---

local gamestate = require("lib.hump.gamestate")
local title = require("state.title")

function love.load()
    gamestate.registerEvents()
    gamestate.switch(title)
end

function love.update(dt)
    require("lib.lovebird").update(dt)
end

function love.keypressed(key)
    -- Global keys across all states
    if key == "escape" then
        love.event.quit()
    end
end
