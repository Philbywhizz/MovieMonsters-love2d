--
-- component: drawable
--
local component = Concord.component("drawable", function(component, size, rgba)
    component.size = size or 4
    component.color = rgba or {1, 1, 1, 1}
end)

return component
