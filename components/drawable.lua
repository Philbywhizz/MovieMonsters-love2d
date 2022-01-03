--
-- component: drawable
--
local component = Concord.component("drawable", function(component, rgba)
    component.color = rgba or {1, 1, 1, 1}
end)

return component
