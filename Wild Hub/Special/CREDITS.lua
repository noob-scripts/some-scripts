local gui = Instance.new("ScreenGui")
if syn and syn.protect_gui then
	syn.protect_gui(gui)
end
gui.ResetOnSpawn = false

local text = Instance.new("TextLabel")
text.Parent = gui
text.Text = "Wild Hub by Wild Wide"
text.TextColor3 = Color3.new(1, 1, 1)
text.BackgroundTransparency = 1
text.TextScaled = true
text.Size = UDim2.new(0, 100, 0, 20)
text.Font = Enum.Font.SourceSansBold

local TweenService = game:GetService("TweenService")
local random = Random.new()

gui.Parent = (gethui and gethui()) or cloneref(game:GetService("CoreGui"))

while true do
	local x = random:NextNumber(0,1)
	local y = random:NextNumber(0,1)

	local newPos = UDim2.new(x, -50, y, -10)
	local info = TweenInfo.new(1, Enum.EasingStyle.Linear)

	local tween = TweenService:Create(text, info, {Position = newPos})
	tween:Play()
	tween.Completed:Wait()

	task.wait(9)
end
