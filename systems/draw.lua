--
-- system: DrawSystem
--
local DrawSystem = Concord.system({pool = {"position", "drawable"}})

function DrawSystem:init()
    print("DrawSystem:init()")
end

function DrawSystem:draw()
    for _,e in ipairs(self.pool) do
        love.graphics.circle("fill", e.position.x, e.position.y, 5)
    end
end

return DrawSystem
