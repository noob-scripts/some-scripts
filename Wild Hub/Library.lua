local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Seven7-lua/Roblox/refs/heads/main/Librarys/Orion/Orion.lua')))()
local default = {
    Main = Color3.fromRGB(10, 10, 50),
    Second = Color3.fromRGB(5, 5, 20),
    Stroke = Color3.fromRGB(2, 5, 10),
    Divider = Color3.fromRGB(2, 2, 10),
    Text = Color3.fromRGB(255, 255, 255),
    TextDark = Color3.fromRGB(255, 255, 255)
}
OrionLib.Themes.Default = default

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Toggleui"
if syn then
    syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = gethui() or game.CoreGui
ScreenGui.ResetOnSpawn = false

local Toggle = Instance.new("ImageButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BackgroundTransparency = 1
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 55, 0, 55)
Toggle.ImageId = "rbxassetid://81086834143424"
Toggle.Draggable = true
Toggle.Selectable = true
Toggle.Active = true

return OrionLib
