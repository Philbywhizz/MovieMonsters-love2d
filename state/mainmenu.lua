--
-- a simple mainMenu
--

local mainMenu = {}

local Slab = require 'lib.slab'
local movieState = require("state.movie")
local nyiState = require("state.nyi")

function mainMenu:enter()
    print("mainMenu:enter()")
    Slab.Initialize()
end

function mainMenu:update(dt)
    Slab.Update(dt)

    Slab.BeginWindow("mainMenu", {Title="Movie Monsters", AllowMove=false, ShowMinimize=false})

    if Slab.Button("Enter Movie") then
        GameState.push(movieState)
    end

    if Slab.Button("Ticket Booth") then
        GameState.push(nyiState)
    end

    if Slab.Button("Box Office") then
        GameState.push(nyiState)
    end

    if Slab.Button("Manager's Office") then
        GameState.push(nyiState)
    end

    if Slab.Button("Quit") then
        love.event.quit()
    end

    Slab.EndWindow()
end

function mainMenu:draw()
    Slab.Draw()
end

function mainMenu:keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function mainMenu:leave()
    print("mainMenu:leave()")
end

return mainMenu
