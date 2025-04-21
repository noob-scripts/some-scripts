--[[

EQUIP:
local args = {
    [1] = 106026385999324
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))

UNEQUIP:
local args = {
    [1] = 106026385999324
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
]]

local lp = game:GetService("Players").LocalPlayer
local bp = lp.Backpack

local tool = Instance.new("Tool", bp)
tool.Name = "Cyber Blade"
tool.ToolTip = "Equip a Cyber Blade (Left handed)"

local p = Instance.new("Part", bp)
p.CanCollide = false
p.Name = "Handle"

tool:GetPropertyChangedSignal("Parent"):Connect(function()
    if tool.Parent == bp or tool.Parent == lp.Character then
    local args = {
        [1] = 106026385999324
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
        end
end)
