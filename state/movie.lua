--
-- movie state
--
local movie = {}

local Map = require 'map.map'

-- initialise the movie state once only
function movie:init()
    print("movie:init()")
end

-- runs on every movie enter
function movie:enter()
    print("movie:enter()")
    self.world = Concord.world()
    self.world:addSystems(
        ECS.s.draw,
        ECS.s.move,
        ECS.s.playerInput,
        ECS.s.actorAI
    )

    self.world:setResource("map", Map)

    -- create a test player
    local _ = Concord.entity(self.world)
    :give("position", 48, 48)
    :give("player")
    :give("heading", "E")
    :give("drawable", 16, {1, 0, 0})

    -- create random actors
    for _=1,10 do
        local _ = Concord.entity(self.world)
        :give("position", love.math.random() * love.graphics.getWidth(), love.math.random() * love.graphics.getHeight())
        :give("actor")
        :give("heading", "E")
        :give("drawable", 4, {0, 1, 1})
    end

end

-- runs on movie state leaves
function movie:leave()
    print("movie:clear()")
    self.world:clear()
end

-- draw on the screen, runs every frame
function movie:draw()
    self.world:emit("draw")
end

-- update the game state, runs every frame
function movie:update(dt)
    self.world:emit("update", dt)
end

-- triggered when a key is pressed
function movie:keypressed(key)
    self.world:emit("keypressed", key)
    if key == "escape" then
        -- emergency abort key
        love.event.quit()
    end
end

-- triggered on quitting the game, only called when this state active.
function movie:quit()
    self:leave()
    print("movie:quit()")
end

return movie
