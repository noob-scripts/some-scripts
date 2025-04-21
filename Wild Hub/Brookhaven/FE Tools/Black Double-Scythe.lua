local lp = game:GetService("Players").LocalPlayer
local bp = lp.Backpack

local tool = Instance.new("Tool", bp)
tool.Name = "Black Double-Scythe"
tool.ToolTip = "Black Double-Scythe"

local p = Instance.new("Part", bp)
p.CanCollide = false
p.Name = "Handle"

tool.Equipped:Connect(function()
    local args = {
        [1] = 4995111473
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end)

tool.Unequipped:Connect(function()
    local args = {
        [1] = 4995111473
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end)
