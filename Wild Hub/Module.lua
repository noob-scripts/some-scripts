-- THIS IS STILL IN DEVELOPMENT
local module = {}
local zalgo_up = {"̍","̎","̄","̅","̿","̑","̆","̐","͒","͗","͑","̇","̈","̊","͂","̓","̈́","͊","͋","͌","̃","̂","̌","͐","̀","́","̋","̏","̽","̉","ͣ","ͤ","ͥ","ͦ","ͧ","ͨ","ͩ","ͪ","ͫ","ͬ","ͭ","ͮ","ͯ","̾","͛","͆","̚"}
local zalgo_down = {"̖","̗","̘","̙","̜","̝","̞","̟","̠","̤","̥","̦","̩","̪","̫","̬","̭","̮","̯","̰","̱","̲","̳","̹","̺","̻","̼","ͅ","͇","͈","͉","͍","͎","͓","͔","͕","͖","͙","͚","̣"}
local zalgo_mid = {"̕","̛","̀","́","͘","̡","̢","̧","̨","̴","̵","̶","͜","͝","͞","͟","͠","͢","̸","̷","͡"}

local function grz(tbl, count)
	local str = ""
	for _ = 1, count do
		str = str .. tbl[math.random(1, #tbl)]
	end
	return str
end

function module:__index(self, index)
    return self[index]
end

function module:ToZalgoText(text)
	local zalgoText = ""
	for i = 1, #text do
		local c = text:sub(i, i)
		if c:match("%s") then
			zalgoText = zalgoText .. c
		else
			zalgoText = zalgoText .. c
				.. grz(zalgo_up, math.random(1, 3))
				.. grz(zalgo_mid, math.random(0, 2))
				.. grz(zalgo_down, math.random(1, 3))
		end
	end
	return zalgoText
end

function module:BypassText(inputString)
   local addAfter = zalgo_down[math.random(1, #zalgo_up)]
    return string.gsub(inputString, ".", function(char)
        return char .. addAfter
    end)
end

-- pls dont add _G.ERROR_MESSAGE_WILD_HUB before, it maybe break all scripts
if _G.ERROR_MESSAGE_WILD_HUB then
	_G.ERROR_MESSAGE_WILD_HUB:Destroy()
end
_G.ERROR_MESSAGE_WILD_HUB = nil
function module:Error(Message)
	if not _G.ERROR_MESSAGE_WILD_HUB then
		_G.ERROR_MESSAGE_WILD_HUB = Instance.new("Message", workspace)
		_G.ERROR_MESSAGE_WILD_HUB.Text = "[WILD HUB ERROR] [" .. identifyexecutor() .. "]\n\t{{ \"" .. Message .. "\" }}"
	else
		_G.ERROR_MESSAGE_WILD_HUB:Destroy()
	end
end
return module
