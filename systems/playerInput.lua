--
-- system: playerInputSystem
--
-- An input system that manges player input and creates components as requried
-- to pass messages onto other systems
local InputSystem = Concord.system({pool = {"player"}})

-- Initialise the system
function InputSystem:init() print("InputSystem:init()") end

-- keypressed loopback function
function InputSystem:keypressed(key)
    for _, e in ipairs(self.pool) do

        print("InputSystem:keypressed()")
        if love.keyboard.isDown('up') then print("FWD") end
        if love.keyboard.isDown('down') then print("BACK") end
        if love.keyboard.isDown('left') then print("LEFT") end
        if love.keyboard.isDown('right') then print("RIGHT") end
    end
end

return InputSystem
