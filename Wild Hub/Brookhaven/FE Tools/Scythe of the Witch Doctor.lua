local lp = game:GetService("Players").LocalPlayer
local bp = lp.Backpack

local tool = Instance.new("Tool", bp)
tool.Name = "Scythe of the witch doctor"

local p = Instance.new("Part", bp)
p.CanCollide = false
p.Name = "Handle"

tool.Equipped:Connect(function()
    local args = {
        [1] = 8716157625
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end)

tool.Unequipped:Connect(function()
    local args = {
        [1] = 8716157625
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end)
