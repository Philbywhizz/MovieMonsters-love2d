--
-- movie state
--
local movie = {}

local pause = require 'state.pause'

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
    :give("position", 2, 2)
    :give("player")
    :give("heading", "E")
    :give("drawable", 8, {1, 0, 0})

    -- create random actors
    for _=1,10 do
        local pos = Vector()
        while self.world:getResource("map"):invalid(pos) do
            -- make sure the random entity position is a valid one
            pos = Vector(love.math.random(1, self.world:getResource("map").sizeX - 1),
            love.math.random(1, self.world:getResource("map").sizeY) - 1)
        end
        local _ = Concord.entity(self.world)
            :give("position", pos.x, pos.y)
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
        GameState.pop()
    end
    if key == "p" then
        GameState.push(pause)
    end
end

-- triggered on quitting the game, only called when this state active.
function movie:quit()
    self:leave()
    print("movie:quit()")
end

return movie
