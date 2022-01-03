--
-- component: position
--
local component = Concord.component("position", function(component, x, y)
    component.vector = Vector(x,y)
end)

return component
