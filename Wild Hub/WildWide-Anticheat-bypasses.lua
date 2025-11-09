-- bypass v1
function hook_table(tbl)
    local mt = getrawmetatable(tbl)
    if not mt or mt.__index then return end
    if type(mt.__index) ~= "function" then
        local old_index = clonefunction(mt.__index)
        mt.__index = function(self, index)
            if tostring(index) == "1" then
                return nil
            end
            return old_index(self, index)
        end
    end
end

function hook_table2(tbl)
    while true do
        if (tbl[1] and typeof(tbl[1]) == "Instance") and (tbl[2] and type(tbl[2]) == "table" and #tbl[2] == 0) then
            local class = tbl[1].ClassName
            if class == game:GetService("CoreGui").ClassName then
                hook_table(tbl)
            end
        end
        task.wait()
    end
end

function disable_script(scr)
    local name = tostring(scr)
    scr.Disabled = true
    scr:Destroy()

    print("DISABLED SCRIPT:", name)
end

local smt_hook = hookfunction(setmetatable, function(a, b)
    if b and b.__mode and b.__mode == "kv" then
        hook_table2(a)
        disable_script(getcallingscript())
        return
    end
    return smt_hook(a, b)
end)

-- bypass v2
function check_table(tbl)
    if tbl[1] == game:GetService("CoreGui") and (type(tbl[2]) == "table" and #tbl[2] == 0) and (type(tbl[3]) == "userdata" and type(tbl[4]) == "userdata") then
        return true
    end
    return false
end

local smt_hook = hookfunction(setmetatable, function(a, b)
    if b and b.__mode and b.__mode == "v" then
        if check_table(a) then
            disable_script(getcallingscript())
            return
        end
    end
    return smt_hook(a, b)
end)

-- bypass v3
local mathrnd = hookfunction(math.random, function(...)
    local args = {...}
    if #args == 0 then
        task.spawn(function()
            local rand = mathrnd()
            task.wait(.1)
            local gc = getgc(true)
            for i, v in pairs(gc) do
                if type(v) == "table" and #v == 1 then
                    if v[1] == rand then
                        local k; k = hookfunction(setmetatable, function(a, b)
                            if a == v and (b and b.__mode and b.__mode == "v") then
                                disable_script(getcallingscript())
                                return
                            end
                            return k(a, b)
                        end)
                    end
                end
            end
        end)
    end
    return mathrnd(table.unpack(args))
end)

local NamecallInstanceDetector = nil

for i, v in pairs(getgc(true)) do
    if type(v) == "table" and type(rawget(v, "IndexInstance")) == "table" and rawget(v, "IndexInstance")[1] == "kick" then
        if type(v.tvk) == "table" and type(v.tvk[2]) == "function" then
            v.tvk = {"kick", function(...) return nil end}
            hookfunction(v.tvk[2], newcclosure(function(...) return nil end))
        end
    end

    if typeof(v) ~= "table" then continue end
    if not rawget(v, "namecallInstance") then continue end

    for SecondIndex, StackContainerTable in pairs(v) do
        if typeof(StackContainerTable) ~= "table" then continue end
        for ThirdIndex, Upvalues in pairs(StackContainerTable) do
            if StackContainerTable[ThirdIndex] ~= "kick" then continue end
            if typeof(StackContainerTable[ThirdIndex + 1]) ~= "function" then continue end

            local FrozenDetectionFunction = StackContainerTable[ThirdIndex + 1]
            for _, DetectionIdentifier in pairs(getconstants(FrozenDetectionFunction)) do
                if DetectionIdentifier == "namecallInstance" then
                    NamecallInstanceDetector = FrozenDetectionFunction
                end
            end
        end
    end
end

if NamecallInstanceDetector then
    hookfunction(NamecallInstanceDetector, newcclosure(function(...) return false end))
end

task.spawn(function()
    local j; j = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if table.find({"GetService", "WaitForChild", "FindFirstChild", "FindFirstChildOfClass", "FindFirstChildWhichIsA"}, method) and args[1] == "CoreGui" and not checkcaller() then
            return nil
        end
        return j(self, ...)
    end)
    local x; x = hookmetamethod(game, "__index", function(self, index)
        if self == game and table.find({"GetService", "FindFirstChild", "WaitForChild", "FindFirstChildOfClass", "FindFirstChildWhichIsA"}, index) then
            return newcclosure(function(a)
                if a == "CoreGui" then return end
                return x(self, index)
            end)
        end
        return x(self, index)
    end)
end)

-- bypass v4
task.spawn(function()
     local k; k = hookmetamethod(game, "__index", function(self, index)
         local result = k(self, index)
         if result:match("rbxassetid://") and not checkcaller() then
             return result:gsub("rbxassetid://", "rbxasset://")
         end
         return result
     end)
end)

function get_all_functions()
    local funcs = {}
    for i, v in pairs(getgc()) do
        if type(v) == "function" and not isexecutorclosure(v) then
            table.insert(funcs, v)
        end
    end
    return funcs
end

function hook_functions()
    for i, v in pairs(get_all_functions()) do
        if iscclosure(v) then continue end
        local constants = debug.getconstants(v)
        for k, x in pairs(constants) do
            local constant = tostring(x):lower()
            if table.find({"anti","cheat","cheats","exploit","scripter"}, constant) then
                hookfunction(v, newcclosure(function(...) end))
                print("HOOKED:", debug.getinfo(v).name)
            end
        end
    end
end

hook_functions()

task.spawn(function()
    while task.wait(5) do
        hook_functions()
    end
end)

local placeid = game.PlaceId

local runtasks do
	local max_yield = 1.25
	
	runtasks = function(...: (any) -> ())
		local args = {...}
		local r = #args
		
		for _, func in ipairs(args) do
			local callback = Instance.new("BindableEvent")
			callback.Event:Once(function()
				r -= 1
				callback:Destroy()
			end)
					
			task.spawn(function()
				task.spawn(function()
					task.wait(max_yield)
					pcall(callback.Fire, callback)
				end)

				func()
				pcall(callback.Fire, callback)
			end)
		end
		
		repeat task.wait() until r == 0
	end
end

local gcinf do
	gcinf = function()
		--repeat task.wait() until game:IsLoaded()

		local Amplitude = 200
		local RandomValue = {-200,200}
		local RandomTime = {.1, 1}

		local floor = math.floor
		local cos = math.cos
		local sin = math.sin
		local acos = math.acos
		local pi = math.pi

		local Maxima = 0

		--Waiting for gcinfo to decrease
		while task.wait() do
			if gcinfo() >= Maxima then
				Maxima = gcinfo()
			else
				break
			end
		end

		--task.wait(0.30)
		local OldGcInfo = gcinfo()+Amplitude
		local tick = 0

		--Spoofing gcinfo
		local function getreturn()
			local Formula = ((acos(cos(pi * (tick)))/pi * (Amplitude * 2)) + -Amplitude )
			return floor(OldGcInfo + Formula);
		end

		local Old; Old = hookfunction(getrenv().gcinfo, function(...)
			return getreturn();
		end)
		local Old2; Old2 = hookfunction(getrenv().collectgarbage, function(arg, ...)
			local suc, err = pcall(Old2, arg, ...)
			if suc and arg == "count" then
				return getreturn();
			end
			return Old2(arg, ...);
		end)

		game:GetService("RunService").Stepped:Connect(function()
			local Formula = ((acos(cos(pi * (tick)))/pi * (Amplitude * 2)) + -Amplitude)
			if Formula > ((acos(cos(pi * (tick)+.01))/pi * (Amplitude * 2)) + -Amplitude) then
				tick = tick + .07
			else
				tick = tick + 0.01
			end
		end)

		local old1 = Amplitude
		for i,v in next, RandomTime do
			RandomTime[i] = v * 10000
		end

		local RandomTimeValue = math.random(RandomTime[1],RandomTime[2])/10000

		--I can make it 0.003 seconds faster, yea, sure
		while wait(RandomTime) do
			Amplitude = math.random(old1+RandomValue[1], old1+RandomValue[2])
			RandomTimeValue = math.random(RandomTime[1],RandomTime[2])/10000
		end
	end
end

local memoryv1 do
	memoryv1 = function()
		--repeat task.wait() until game:IsLoaded()

		local RunService = cloneref(game:GetService("RunService"))
		local Stats = cloneref(game:GetService("Stats"))

		local CurrMem = Stats:GetTotalMemoryUsageMb();
		local Rand = 0

		RunService.Stepped:Connect(function()
			local random = Random.new()
			Rand = random:NextNumber(-10, 10);
		end)

		local function GetReturn()
			return CurrMem + Rand;
		end

		local _MemBypass
		_MemBypass = hookmetamethod(game, "__namecall", function(self,...)
			local method = getnamecallmethod();

			if not checkcaller() then
				if typeof(self) == "Instance" and (method == "GetTotalMemoryUsageMb" or method == "getTotalMemoryUsageMb") and self.ClassName == "Stats" then
					return GetReturn();
				end
			end

			return _MemBypass(self,...)
		end)

		-- Indexed Versions
		local _MemBypassIndex; _MemBypassIndex = hookfunction(Stats.GetTotalMemoryUsageMb, function(self, ...)
			if not checkcaller() then
				if typeof(self) == "Instance" and self.ClassName == "Stats" then
					return GetReturn();
				end
			end
		end)
	end
end

local memoryv2 do
	memoryv2 = function()
		--repeat task.wait() until game:IsLoaded()

		local RunService = cloneref(game:GetService("RunService"))
		local Stats = cloneref(game:GetService("Stats"))

		local CurrMem = Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Gui);
		local Rand = 0

		RunService.Stepped:Connect(function()
			local random = Random.new()
			Rand = random:NextNumber(-0.1, 0.1);
		end)

		local function GetReturn()
			return CurrMem + Rand;
		end

		local _MemBypass
		_MemBypass = hookmetamethod(game, "__namecall", function(self,...)
			local method = getnamecallmethod();

			if not checkcaller() then
				if typeof(self) == "Instance" and (method == "GetMemoryUsageMbForTag" or method == "getMemoryUsageMbForTag") and self.ClassName == "Stats" then
					return GetReturn();
				end
			end

			return _MemBypass(self,...)
		end)

		-- Indexed Versions
		local _MemBypassIndex; _MemBypassIndex = hookfunction(Stats.GetMemoryUsageMbForTag, function(self, ...)
			if not checkcaller() then
				if typeof(self) == "Instance" and self.ClassName == "Stats" then
					return GetReturn();
				end
			end
		end)
	end
end

local preloadasync do
	preloadasync = function()
		-- ContentProvider Bypasses
		local Content = cloneref(game:GetService("ContentProvider"));
		local CoreGui = cloneref(game:GetService("CoreGui"));
		local randomizedCoreGuiTable;
		local randomizedGameTable;

		local coreguiTable = {}

		game:GetService("ContentProvider"):PreloadAsync({CoreGui}, function(assetId) --use preloadasync to patch preloadasync :troll:
			if not assetId:find("rbxassetid://") then
				table.insert(coreguiTable, assetId);
			end
		end)
		local gameTable = {}

		for i, v in pairs(game:GetDescendants()) do
			if v:IsA("ImageLabel") then
				if v.Image:find('rbxassetid://') and v:IsDescendantOf(CoreGui) then else
					table.insert(gameTable, v.Image)
				end
			end
		end

		local function randomizeTable(t)
			local n = #t
			while n > 0 do
				local k = math.random(n)
				t[n], t[k] = t[k], t[n]
				n = n - 1
			end
			return t
		end

		local ContentProviderBypass
		ContentProviderBypass = hookmetamethod(game, "__namecall", function(self, Instances, ...)
			local method = getnamecallmethod();
			local args = ...;

			if not checkcaller() and (method == "preloadAsync" or method == "PreloadAsync") then
				if Instances and Instances[1] and self.ClassName == "ContentProvider" then
					if Instances ~= nil then
						if typeof(Instances[1]) == "Instance" and (table.find(Instances, CoreGui) or table.find(Instances, game)) then
							if Instances[1] == CoreGui then
								randomizedCoreGuiTable = randomizeTable(coreguiTable)
								return ContentProviderBypass(self, randomizedCoreGuiTable, ...)
							end

							if Instances[1] == game then
								randomizedGameTable = randomizeTable(gameTable)
								return ContentProviderBypass(self, randomizedGameTable, ...)
							end
						end
					end
				end
			end

			return ContentProviderBypass(self, Instances, ...)
		end)

		local preloadBypass; preloadBypass = hookfunction(Content.PreloadAsync, function(a, b, c)
			if not checkcaller() then
				if typeof(a) == "Instance" and tostring(a) == "ContentProvider" and typeof(b) == "table" then
					if (table.find(b, CoreGui) or table.find(b, game)) and not (table.find(b, true) or table.find(b, false)) then
						if b[1] == CoreGui then -- Double Check
							randomizedCoreGuiTable = randomizeTable(coreguiTable)
							return preloadBypass(a, randomizedCoreGuiTable, c)
						end
						if b[1] == game then -- Triple Check
							randomizedGameTable = randomizeTable(gameTable)
							return preloadBypass(a, randomizedGameTable, c)
						end
					end
				end
			end

			return preloadBypass(a, b, c)
		end)
	end
end

local proxy do
	proxy = function()
		local TableNumbaor001 = {}
		local SomethingOld;
		SomethingOld = hookfunction(getrenv().newproxy, function(...)
			local proxy = SomethingOld(...)
			table.insert(TableNumbaor001, proxy)
			return proxy
		end)

		local RunService = cloneref(game:GetService("RunService"))
		RunService.Stepped:Connect(function()
			for i,v in pairs(TableNumbaor001) do
				if v == nil then end
			end
		end)
	end
end

runtasks(
    preloadasync,
    memoryv1,
    memoryv2,
    textbox,
    gcinf,
    proxy
)