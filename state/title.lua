--
-- title state
--

local title = {}

function title:init()
    print("Init")
end

function title:draw()
    love.graphics.setColor(255, 255,255)
    love.graphics.print("Movie Monster", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
end

return title
