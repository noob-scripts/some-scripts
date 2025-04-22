local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Seven7-lua/Roblox/refs/heads/main/Librarys/Orion/Orion.lua')))()
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
if syn then
    syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = gethui() or game.CoreGui
ScreenGui.ResetOnSpawn = false

function rstr(length)
	local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local result = ""
	for i = 1, length do
		local randIndex = math.random(1, #chars)
		result = result .. chars:sub(randIndex, randIndex)
	end
	return result
end

local name = "Logo-" .. rstr(15) .. "-WHub.png"
writefile(name, game:HttpGet("https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/WildHub.png"))
local Toggle = Instance.new("ImageButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(10, 10, 50)
Toggle.BackgroundTransparency = 0.2
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 55, 0, 55)
Toggle.Image = getcustomasset(name)
Toggle.Draggable = true
Toggle.Selectable = true
Toggle.Active = true
Toggle.MouseButton1Click:Connect(function()
        OrionLib:ToggleUi()
    end)
delfile(name)

return OrionLib
