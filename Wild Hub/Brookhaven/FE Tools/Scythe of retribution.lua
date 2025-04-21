local lp = game:GetService("Players").LocalPlayer
local bp = lp.Backpack

local tool = Instance.new("Tool", bp)
tool.Name = "scythe of retribution"

local p = Instance.new("Part", bp)
p.CanCollide = false
p.Name = "Handle"

tool.Equipped:Connect(function()
    local args = {
        [1] = 8131073156
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end)

tool.Unequipped:Connect(function()
    local args = {
        [1] = 8131073156
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end)
