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
        -- create a component for each input command received
        if love.keyboard.isDown('up') then e:give("movement", "FWD") end
        if love.keyboard.isDown('down') then e:give("movement", "BACK") end
        if love.keyboard.isDown('left') then e:give("movement", "LEFT") end
        if love.keyboard.isDown('right') then e:give("movement", "RIGHT") end
    end
end

return InputSystem
