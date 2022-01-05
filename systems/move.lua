---
--- system: Movesystem
---
local MoveSystem = Concord.system({pool = {"position", "heading", "movement"}})

function MoveSystem:init() print("MoveSystem:init()") end

local function turnEntity(e, direction)
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

local function stepEntity(e, stepDirection)
    local stepSize = 32
    local v = {}
    v.x = 0
    v.y = 0

    -- determine our position offset for the step
    if e.heading.dir == "N" then
        v.y = -stepSize
    elseif e.heading.dir == "S" then
        v.y = stepSize
    elseif e.heading.dir == "E" then
        v.x = stepSize
    elseif e.heading.dir == "W" then
        v.x = -stepSize
    end

    if stepDirection == "FWD" then
        e.position.x = e.position.x + v.x
        e.position.y = e.position.y + v.y
    elseif stepDirection == "BACK" then
        e.position.x = e.position.x - v.x
        e.position.y = e.position.y - v.y
    else
        error("Invalid step direction: " .. stepDirection)
    end
end

function MoveSystem:update(dt)
    for _, e in ipairs(self.pool) do
        if e.movement.command == "FWD" or e.movement.command == "BACK" then
            stepEntity(e, e.movement.command)
        elseif e.movement.command == "LEFT" or e.movement.command == "RIGHT" then
            turnEntity(e, e.movement.command)
        else
            error("Invalid Movement command: " .. e.movement.command)
        end
        -- discard the movement component as it has been processed.
        e:remove("movement")
    end
end

return MoveSystem
