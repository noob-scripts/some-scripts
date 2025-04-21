--[[

EQUIP:
local args = {
    [1] = 14062209051
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))

UNEQUIP:
local args = {
    [1] = 14062209051
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
]]

local lp = game:GetService("Players").LocalPlayer
local bp = lp.Backpack

local tool = Instance.new("Tool", bp)
tool.Name = "Plunger tool"
tool.ToolTip = "Equip a Plunger"

local p = Instance.new("Part", bp)
p.CanCollide = false
p.Name = "Handle"

tool.Equipped:Connect(function()
    local args = {
        [1] = 14062209051
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end)

tool.Unequipped:Connect(function()
    local args = {
        [1] = 1406220905114062209051
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end)
