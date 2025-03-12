local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Seven7-lua/Roblox/refs/heads/main/Librarys/Orion/Orion.lua')))()
local default = {
    Main = Color3.fromRGB(10, 10, 50),
    Second = Color3.fromRGB(5, 5, 20),
    Stroke = Color3.fromRGB(2, 2, 10),
    Divider = Color3.fromRGB(2, 2, 10),
    Text = Color3.fromRGB(240, 240, 240),
    TextDark = Color3.fromRGB(150, 150, 150)
}
OrionLib.Theme.Default = default

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Toggleui"
if syn then
    syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = gethui() or game.CoreGui
ScreenGui.ResetOnSpawn = false

local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BackgroundTransparency = 0
Toggle.TextSize = 25
Toggle.Text = "+"
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 55, 0, 55)
Toggle.Draggable = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0.2, 0)
Corner.Parent = Toggle

local Corner2 = Instance.new("UICorner")
Corner2.CornerRadius = UDim.new(0.2, 0)
Corner2.Parent = Image

Toggle.MouseButton1Click:Connect(function()
    OrionLib:ToggleUi()
    if Toggle.Text == "+" then
        Toggle.Text = "-"
    else
        Toggle.Text = "+"
    end
end)

return OrionLib
