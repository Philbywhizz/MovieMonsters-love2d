--
-- movie state
--
local movie = {}

function movie:init()
    print("movie:init()")
end

function movie:enter()
    print("movie:enter()")
    self.world = Concord.world()
    self.world:addSystems(ECS.s.draw, ECS.s.move)

    local entity_1 = Concord.entity(self.world)
    :give("position", 100, 100)
    :give("velocity", 100, 0)
    :give("drawable")

    local entity_2 = Concord.entity(self.world)
    :give("position", 50, 50)
    :give("drawable")

    local entity_3 = Concord.entity(self.world)
    :give("position", 200, 200)

end

function movie:leave()
    print("movie:clear()")
    self.world:clear()
end

function movie:draw()
    self.world:emit("draw")
end

function movie:update(dt)
    self.world:emit("update", dt)
end

function movie:keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

return movie
