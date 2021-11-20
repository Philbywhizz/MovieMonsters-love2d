--
-- title gamestate
--

local title = {}

function title:draw()
    love.graphics.print("Movie Monsters", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
end

return title
