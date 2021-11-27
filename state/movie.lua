--
-- movie state
--
local movie = {}

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
        ECS.s.input
    )

    -- create 3 simple entities now for testing

    -- one that moves and is drawble
    local entity_1 = Concord.entity(self.world)
    :give("position", 100, 100)
    :give("velocity", 100, 0)
    :give("drawable")

    -- one that is stationary
    local entity_2 = Concord.entity(self.world)
    :give("position", 50, 50)
    :give("drawable")

    -- one that isn't drawable (invisible)
    local entity_3 = Concord.entity(self.world)
    :give("position", 150, 150)

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
