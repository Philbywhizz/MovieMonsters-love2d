--
-- component: drawable
--
local component = Concord.component("heading", function(component, dir)
    component.dir = dir or "X"
end)

return component
