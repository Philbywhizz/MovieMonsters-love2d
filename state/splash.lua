--
-- splashscreen gamestate
--

local splash = {}

local nextState = require("state.movie")
local splashLib = require("lib.splashes")

function splash:init()
    print("splash:init()")
    local splashParams = {
        background = {0, 0, 0},
        delay_before=0.5,
        delay_after=2.0
    }
    splashLib = splashLib(splashParams)
    splashLib.onDone = function() GameState.switch(nextState) end
end

function splash:draw()
    splashLib:draw()
end

function splash:update(dt)
    splashLib:update(dt)
end

function splash:keypressed(key)
    if key == "escape" or key == "space" then
        -- Skip splash screen
        splashLib:skip()
    end
end

function splash:leave()
    print("splash:clear()")
end

return splash
