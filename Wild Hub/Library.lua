local OrionLib = loadstring(game:HttpGet(('https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/custom_orion.lua')))()
local default = {
    Main = Color3.fromRGB(10, 10, 50),
    Second = Color3.fromRGB(5, 5, 20),
    Stroke = Color3.fromRGB(255, 255, 255),
    Divider = Color3.fromRGB(2, 2, 10),
    Text = Color3.fromRGB(255, 255, 255),
    TextDark = Color3.fromRGB(255, 255, 255),
    
}
OrionLib.Themes.Default = default

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Toggleui"
ScreenGui.Parent = gethui() or game.CoreGui
ScreenGui.ResetOnSpawn = false

local Toggle = Instance.new("ImageButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(10, 10, 50)
Toggle.BackgroundTransparency = 0.2
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 55, 0, 55)
Toggle.Image = "rbxassetid://85516588040138"
Toggle.Draggable = true
Toggle.Selectable = true
Toggle.Active = true
Toggle.MouseButton1Click:Connect(function()
        OrionLib:ToggleUi()
    end)

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = Toggle

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = Toggle

_G.WILD_HUB_BUTTON = ScreenGui

return OrionLib
