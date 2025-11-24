local gui = Instance.new("ScreenGui")
if syn and syn.protect_gui then
    syn.protect_gui(gui)
end
gui.ResetOnSpawn = false

local text = Instance.new("TextLabel")
text.Parent = gui
text.Text = "Script made by Wild Wide"
text.TextColor3 = Color3.new(1, 1, 1)
text.BackgroundTransparency = 1
text.TextScaled = true
text.Size = UDim2.new(0, 100, 0, 20)
text.Font = Enum.Font.SourceSansBold

local random = Random.new()

while true do
    local x = random:NextNumber(0, 1)
    local y = random:NextNumber(0, 1)

    text.Position = UDim2.new(x, -50, y, -10)

    task.wait(10)
end
