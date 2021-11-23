---
--- Movie Monsters
---

local humpGameState = require("lib.hump.gamestate")
local titleState = require("state.title")
local gameState = require("state.game")

function love.load()
    humpGameState.registerEvents()
    humpGameState.switch(gameState)
end

function love.keypressed(key)
    -- Global keys across all states
    if key == "escape" then
        love.event.quit()
    end
end
