--
-- system: DrawSystem
--
local DrawSystem = Concord.system({pool = {"position", "drawable"}})

function DrawSystem:init() print("DrawSystem:init()") end

local function drawMapGrid(map, xOffset, yOffset, cellsize)
    xOffset = xOffset or 0
    yOffset = yOffset or 0
    love.graphics.setColor(0.2, 0.2, 0.2)
    for y = 1, #map do
        for x = 1, #map[y] do
            love.graphics.rectangle("line", xOffset + (x - 1) * cellsize,
                                    yOffset + (y - 1) * cellsize, cellsize,
                                    cellsize)
        end
    end
end

function DrawSystem:draw()
    -- draw the map grid for reference
    local cellsize = 32
    local map = self:getWorld():getResource("map")
    drawMapGrid(map, 32, 32, cellsize)

    -- draw each entity on the map
    for _, e in ipairs(self.pool) do
        local originX = e.position.x * cellsize + cellsize / 2
        local originY = e.position.y * cellsize + cellsize / 2
        love.graphics.setColor(e.drawable.color)
        love.graphics.circle("fill", originX, originY, e.drawable.size)
        if e:has("heading") then
            -- if entity has a heading, then draw it so we can visualize it
            if e.heading.dir == "N" then
                love.graphics.line(originX, originY, originX,
                                   (originY - (e.drawable.size + 8)))
            elseif e.heading.dir == "S" then
                love.graphics.line(originX, originY, originX,
                                   originY + (e.drawable.size + 8))
            elseif e.heading.dir == "E" then
                love.graphics.line(originX, originY,
                                   originX + (e.drawable.size + 8), originY)
            elseif e.heading.dir == "W" then
                love.graphics.line(originX, originY,
                                   (originX - (e.drawable.size + 8)), originY)
            end
        end
    end
end

return DrawSystem
