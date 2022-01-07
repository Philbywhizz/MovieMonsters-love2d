--
-- a simple pause gamestate
--

local pause = {}

function pause:enter(from)
    self.from = from -- previous state
end

function pause:keypressed(key)
    if key == "escape" or key == "p" then
        GameState.pop()
    end
end

function pause:draw()
    local W, H = love.graphics.getWidth(), love.graphics.getHeight()
    -- draw previous state screen
    self.from:draw()
    -- now draw pause message
    love.graphics.setColor(0 ,0 ,0 , 0.25)
    love.graphics.rectangle('fill', 0, 0, W, H)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('Game Paused - Press <p> to resume', 0, H/2, W, 'center')
end

return pause
