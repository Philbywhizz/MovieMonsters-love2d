--
-- system: InputSystem
--
-- An central input system that manges inputs and passes them to other systems
-- as required

local InputSystem = Concord.system({})

-- Initialise the system
function InputSystem:init()
    print("InputSystem:init()")
end

function InputSystem:update(dt)
    if love.keyboard.isDown('w') then
        print("InputSystem:update()->W")
    end
    if love.keyboard.isDown('s') then
        print("InputSystem:update()->S")
    end
    if love.keyboard.isDown('a') then
        print("InputSystem:update()->A")
    end
    if love.keyboard.isDown('d') then
        print("InputSystem:update()->D")
    end
end

-- keypressed loopback function
function InputSystem:keypressed(key)
    print("InputSystem:keypressed()")
end

return InputSystem
