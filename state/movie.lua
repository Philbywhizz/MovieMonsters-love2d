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
        ECS.s.playerInput
    )

    -- create a test entity
    local entity_1 = Concord.entity(self.world)
    :give("position", 50, 50)
    :give("player")
    :give("heading", "E")
    :give("drawable")

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
