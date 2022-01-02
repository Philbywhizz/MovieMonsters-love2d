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
        if e:has("heading") then
            -- if entity has a heading, then draw it so we can visualize it
            if e.heading.dir == "N" then
                love.graphics.line(e.position.x, e.position.y, e.position.x, e.position.y - 10)
            elseif e.heading.dir == "S" then
                love.graphics.line(e.position.x, e.position.y, e.position.x, e.position.y + 10)
            elseif e.heading.dir == "E" then
                love.graphics.line(e.position.x, e.position.y, e.position.x + 10, e.position.y)
            elseif e.heading.dir == "W" then
                love.graphics.line(e.position.x, e.position.y, e.position.x - 10, e.position.y)
            end
        end
    end
end

return DrawSystem
