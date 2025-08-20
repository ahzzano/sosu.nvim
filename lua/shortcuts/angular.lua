local angular_proj = vim.fn.findfile('angular.json')

if angular_proj == nil then
    return
end

print("Angular Proj")
