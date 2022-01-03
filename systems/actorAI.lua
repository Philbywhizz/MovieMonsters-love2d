--
-- system: actorAI
--
local ActorAISystem = Concord.system({pool = {"actor", "position", "heading"}})

function ActorAISystem:init()
    print("ActorAISystem:init()")
end

function ActorAISystem:update()
    for _, e in ipairs(self.pool) do
        -- just do a random decisions for now just to test the concept
        local decision = love.math.random()
        if decision > .90 and decision <= .95 then
            -- Step forward
            e:give("movement", "FWD")
        elseif decision > .95 and decision <= .96 then
            -- Step backward
            e:give("movement", "BACK")
        elseif decision > .97 and decision <= .98 then
            -- Turn left
            e:give("movement", "LEFT")
        elseif decision > .99 then
            -- Turn right
            e:give("movement", "RIGHT")
        end
    end
end

return ActorAISystem
