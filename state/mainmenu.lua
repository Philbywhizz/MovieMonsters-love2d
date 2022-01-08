--
-- a simple mainMenu
--
local mainMenu = {}

local Slab = require 'lib.slab'
local movieState = require("state.movie")
local nyiState = require("state.nyi")

function mainMenu:init()
    print("mainMenu:init()")
    love.graphics.setBackgroundColor(0, 0, 0)
    Slab.SetINIStatePath(nil)
    Slab.Initialize()
    self.imgMonster = love.graphics.newImage("assets/monster.png")
end

function mainMenu:enter() print("mainMenu:enter()") end

function mainMenu:update(dt)
    Slab.Update(dt)

    Slab.BeginWindow("mainMenu", {
        Title = "Movie Monsters",
        X = love.graphics.getWidth() / 2 - 275,
        Y = love.graphics.getHeight() / 2 - 150,
        W = 550,
        H = 300,
        AllowMove = false,
        AutoSizeWindow = false,
        ShowMinimize = false
    })

    Slab.BeginLayout("mainMenu-layout", {
        AlignX = "center",
        AlignY = "center",
        AlignRowY = "center",
        ExpandW = false,
        Columns = 2
    })
    do
        Slab.SetLayoutColumn(1)
        Slab.Image("monster", {Image = self.imgMonster})

        Slab.SetLayoutColumn(2)
        do
            local params = {W = 150, H = 50}
            if Slab.Button("Enter Movie", params) then
                GameState.push(movieState)
            end
            if Slab.Button("Ticket Booth", params) then
                GameState.push(nyiState)
            end
            if Slab.Button("Box Office", params) then
                GameState.push(nyiState)
            end
            if Slab.Button("Manager's Office", params) then
                GameState.push(nyiState)
            end
            if Slab.Button("Quit", params) then love.event.quit() end
        end
    end
    Slab.EndLayout()

    Slab.EndWindow()
end

function mainMenu:draw() Slab.Draw() end

function mainMenu:keypressed(key) if key == "escape" then love.event.quit() end end

function mainMenu:quit() print("mainMenu:quit()") end

return mainMenu
