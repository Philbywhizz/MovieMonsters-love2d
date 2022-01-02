--
-- component: movement
--
local component = Concord.component("movement", function(component, cmd)
    component.command = cmd or "XXX"
end)

return component
