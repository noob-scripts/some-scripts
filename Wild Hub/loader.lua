setclipboard("https://discord.gg/mhzDcapGgA")

local nagi_hub_detected = false
for i, v in pairs(getnilinstances()) do
    if tostring(v) == "ScreenGui" and v:FindFirstChild("TextLabel").Text:lower():find("nagi") then
        nagi_hub_detected = true
        break
    end
end

task.wait(.2)
if nagi_hub_detected then
local SG = Instance.new("ScreenGui", game.CoreGui)
SG.IgnoreGuiInset = true
SG.DisplayOrder = 99999999

local F = Instance.new("Frame", SG)
F.Size = UDim2.new(1,0,1,0)
F.BackgroundColor3 = Color3.new(0,0,0)

local T = Instance.new("TextLabel", F)
T.AnchorPoint = Vector2.new(0.5,0.5)
T.Position = UDim2.new(0.5,0,0.5,0)
T.Size = UDim2.new(0.8,0,0.12,0)
T.BackgroundTransparency = 1
T.TextColor3 = Color3.new(1,1,1)
T.TextScaled = true
T.Text = "⚠️ PLEASE EXECUTE THE ORIGINAL WILD HUB SCRIPT, NAGI HUB SKIDDED WILD HUB\nTHE ORIGINAL CREATOR IS WILD WIDE\nJOIN OFFICIAL SERVER: https://discord.gg/mhzDcapGgA (WILD SCRIPTS)"

task.wait(0.2)
while true do end
end

loadstring(game:HttpGet("https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/Loader.lua?raw=true"))()
