---
--- Movie Monsters
---

inspect = require "lib.inspect"

print(inspect("Hello"))
function love.draw()
    love.graphics.print("Movie Monster", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
end

function love.keypressed(key)
    -- Global keys
    if key == "escape" then
        love.event.quit()
    end
end
