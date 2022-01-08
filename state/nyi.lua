--
-- a simple nyi (not yet implemented) gamestate
--

local nyi = {}

function nyi:enter(from)
    self.from = from -- previous state
end

function nyi:keypressed(key)
    if key == "escape" then
        GameState.pop()
    end
end

function nyi:draw()
    local W, H = love.graphics.getWidth(), love.graphics.getHeight()
    -- draw previous state screen
    self.from:draw()
    -- now draw nyi message
    love.graphics.setColor(0 ,0 ,0 , 0.75)
    love.graphics.rectangle('fill', 0, 0, W, H)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('Not Yet Implemented - Press <ESC> to return', 0, H/2, W, 'center')
end

return nyi
