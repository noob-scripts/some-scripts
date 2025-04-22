local lp = game:GetService("Players").LocalPlayer
local bp = lp.Backpack

local tool = Instance.new("Tool", bp)
tool.Name = "Axe"
tool.ToolTip = "Equip a Axe"

local p = Instance.new("Part", bp)
p.CanCollide = false
p.Name = "Handle"

tool:GetPropertyChangedSignal("Parent"):Connect(function()
    if tool.Parent == bp or tool.Parent == lp.Character then
    local args = {
        [1] = 3240543366
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
        end
end)
