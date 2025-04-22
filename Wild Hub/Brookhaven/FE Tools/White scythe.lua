local lp = game:GetService("Players").LocalPlayer
local bp = lp.Backpack

local tool = Instance.new("Tool", bp)
tool.Name = "White scythe"
tool.ToolTip = "White scythe"

local p = Instance.new("Part", bp)
p.CanCollide = false
p.Name = "Handle"

tool:GetPropertyChangedSignal("Parent"):Connect(function()
    if tool.Parent == bp or tool.Parent == lp.Character then
    local args = {
        [1] = 13327732999
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
        end
end)
