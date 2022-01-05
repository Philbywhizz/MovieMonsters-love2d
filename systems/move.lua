---
--- system: Movesystem
---
local MoveSystem = Concord.system({pool = {"position", "heading", "movement"}})

function MoveSystem:init() print("MoveSystem:init()") end

local function turnEntity(map, e, direction)
    if direction == "LEFT" then
        -- simply rotate our entity on the spot in the 4 possible compass directions
        if e.heading.dir == "N" then
            e.heading.dir = "W"
        elseif e.heading.dir == "W" then
            e.heading.dir = "S"
        elseif e.heading.dir == "S" then
            e.heading.dir = "E"
        elseif e.heading.dir == "E" then
            e.heading.dir = "N"
        end
    elseif direction == "RIGHT" then
        -- simply rotate our entity on the spot in the 4 possible compass directions
        if e.heading.dir == "N" then
            e.heading.dir = "E"
        elseif e.heading.dir == "E" then
            e.heading.dir = "S"
        elseif e.heading.dir == "S" then
            e.heading.dir = "W"
        elseif e.heading.dir == "W" then
            e.heading.dir = "N"
        end
    else
        error("Invalid entity direction: " .. direction)
    end
end

local function stepEntity(map, e, stepDirection)
    local direction = Vector()
    local currentPos = Vector(e.position.x, e.position.y)

    -- determine our position offset for the step
    if e.heading.dir == "N" then
        direction = Vector.dir("up")
    elseif e.heading.dir == "S" then
        direction = Vector.dir("down")
    elseif e.heading.dir == "E" then
        direction = Vector.dir("right")
    elseif e.heading.dir == "W" then
        direction = Vector.dir("left")
    end

    if stepDirection == "FWD" then
        if map[currentPos.y + direction.y][currentPos.x + direction.x] == 0 then
            local newPos = currentPos + direction
            e.position.x, e.position.y = newPos:split()
        end
    elseif stepDirection == "BACK" then
        if map[currentPos.y - direction.y][currentPos.x - direction.x] == 0 then
            local newPos = currentPos - direction
            e.position.x, e.position.y = newPos:split()
        end
    else
        error("Invalid step direction: " .. stepDirection)
    end
end

function MoveSystem:update(dt)
    local map = self:getWorld():getResource("map")

    for _, e in ipairs(self.pool) do
        if e.movement.command == "FWD" or e.movement.command == "BACK" then
            stepEntity(map, e, e.movement.command)
        elseif e.movement.command == "LEFT" or e.movement.command == "RIGHT" then
            turnEntity(map, e, e.movement.command)
        else
            error("Invalid Movement command: " .. e.movement.command)
        end
        -- discard the movement component as it has been processed.
        e:remove("movement")
    end
end

return MoveSystem
