if not game:IsLoaded() then game.Loaded:Wait() end
local RunService = game:GetService("RunService")
local IsClient = RunService.IsClient
local IsServer = RunService.IsServer

getgenv().rconsoleclear = function(...)
end
getgenv().consoleclear = function(...)
end
getgenv().rconsolecreate = function(...)
end
getgenv().consolecreate = function(...)
end
getgenv().consoledestroy = function(...)
end
getgenv().rconsoleinput = function(...)
end
getgenv().consoleinput = function(...)
end
getgenv().rconsoleprint = function(...)
end
getgenv().consoleprint = function(...)
end
getgenv().rconsolesettitle = function(...)
end
getgenv().rconsolename = function(...)
end
getgenv().consolesettitle = function(...)
end

getgenv().crypt = {
    hash = crypthash,
    generatekey = generatekey,
    generatebytes = generatebytes,
    encrypt = encrypt,
    decrypt = decrypt,
    base64decode = base64decode,
    base64encode = base64encode,
    base64_decode = base64decode,
    base64_encode = base64encode,
    base64 = {
     encode = base64encode,
     decode = base64decode
    },
  }

getgenv().connectionsocket = function(msg)
local userdata = newproxy(true)
local metatable = getmetatable(userdata)

connectinit(msg)
return metatable
end
  
  getgenv().WebSocket = {
    connect = connectionsocket
  } 

  getgenv().base64 = {
    encode = base64encode,
    decode = base64decode
  }  

getgenv().unlockmodulescript = true

local oldrequire = require

getgenv().require = function(x)
    if typeof(x) ~= "Instance" or x.ClassName ~= "ModuleScript" then
        error("ModuleScript expected", 2)
    elseif type(x) ~= "number" then
        error("Number expected", 2)
    end

    local success, result = pcall(oldrequire, x)

    if not success then
        error(result, 2)
    end

    return result
end

getgenv().getexecutioncontext = function()
    local runService = game:GetService("RunService")
    
    if runService:IsClient() then
        return "Client"
    elseif runService:IsServer() then
        return "Server"
    else
        return "Studio"
    end
end

getgenv().getallthreads = function()
    local threads = {}
    local index = 1

    while true do
        local thread = debug.getthread(index)
        if thread then
            threads[index] = thread
            index = index + 1
        else
            break
        end
    end

    return threads
end

getgenv().securecall = function(Closure, Spoof, ...)
    assert(typeof(Spoof) == "Instance" and (Spoof.ClassName == "LocalScript" or Spoof.ClassName == "ModuleScript"),
           "invalid argument #1 to 'securecall' (LocalScript or ModuleScript expected)")

    local OldScript = getfenv().script
    local OldThreadID = getidentity()

    getfenv().script = Spoof
    setidentity(2)

    local success, err = pcall(Closure, ...)

    setidentity(OldThreadID)
    getfenv().script = OldScript

    if not success then
        error(err)
    end
end

getgenv().getactors = function()
return getproperties(workspace)
end

getgenv().run_on_actor = function(func, link)
    return loadstring(link, "=(run_on_actor)", "t", _ENV)
end

getgenv().newlclosure = function(f)
    return f
end

getgenv().syn = {
    secure_call = securecall,
    run_on_actor = run_on_actor,
    request = request,
    get_thread_identity = getidentity,
    is_beta = false,
    set_thread_identity = setidentity
}

getgenv().dumpstring = function(p1)
    return "\\" .. p1:gsub(".", function(c)
        return "\\" .. string.byte(c)
    end)
end

getgenv().getsenv = function(script_instance)
    for _, v in pairs(getreg()) do
        if type(v) == "function" and getfenv(v).script == script_instance then
            return getfenv(v)
        end
    end
end
)--";
std::string initscript = R"--(
if not game:IsLoaded() then game.Loaded:Wait() end
local security = {'ReportAbuse', 'GetMessageId', 'Publish', 'OpenBrowserWindow', 'RequestInternal', 'ExecuteJavaScript', 'GetRobuxBalance', 'PerformPurchase' } 

local httpget = function(self, ...)
    return HttpGet(...)
end

getgenv().getcustomasset = function(p1)
return "rbxasset://", p1 --Roblox UWP dont giving acces FileSystem Library
end

getgenv().isnetworkowner = function(p1)
-- "NetworkOwnerV3" can't be accessed in lua due to it being a 'SystemAddress' type property
assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
assert(IsA(p1, "BasePart"), "invalid argument #1 to '?' (BasePart expected)", 2)
local A = LocalPlayer.SimulationRadius
local B = LocalPlayer.Character or Wait(LocalPlayer.CharacterAdded)
local C = WaitForChild(B, "HumanoidRootPart", 300)
if C then
    if p1.Anchored then
        return false
    end
    if IsDescendantOf(p1, B) or (C.Position - p1.Position).Magnitude <= A then
        return true
    end
end
return p1
end

getgenv().fireproximityprompt = function(Obj, Amount, Skip)
    if Obj.ClassName == "ProximityPrompt" then 
        Amount = Amount or 1
        local PromptTime = Obj.HoldDuration
        if Skip then 
            Obj.HoldDuration = 0
        end
        for i = 1, Amount do 
            Obj:InputHoldBegin()
            if not Skip then 
                wait(Obj.HoldDuration)
            end
            Obj:InputHoldEnd()
        end
        Obj.HoldDuration = PromptTime
    else 
        error("ProximityPrompt expected")
    end
end

  getgenv().firesignal = function(signal, ...)
            assert(signal, "Signal requrest!");
            for i,v in pairs(getconnections(signal)) do
              v.Function(...)
            end
        end

getgenv().isluau = function()
    return true == "Luau"
end

getgenv().firetouchinterest = function(a, b, mode)
    if mode == 0 then
        for _,v in pairs(getconnections(b.Touched)) do
            v.Function(a);
        end
    end
end

getgenv().getscripthash = function(script)
return script:GetHash()
end

--getgenv().hookmetamethod = function(Object, MetaMethod, Function)
    --local mt = getrawmetatable(Object)
   -- return hookfunction(mt[MetaMethod], Function);
--end 

getgenv().hookmetamethod = function(self, method, func)
    local mt = getrawmetatable(self)
    local old = mt[method]
    setreadonly(mt, false)
    mt[method] = func
    setreadonly(mt, true)
    return old
end

getgenv().GetObjects = function(asset)
    return { game:GetService("InsertService"):LoadLocalAsset(asset) }
end

getgenv().getobjects = function(asset)
    return { game:GetService("InsertService"):LoadLocalAsset(asset) }
end

local script = Instance.new("LocalScript")
script.Name = "Init"
getgenv().script = script


local gaem = game
local gmt = getrawmetatable(game)
local oldindex = gmt.__index
local oldnamecall = gmt.__namecall

setreadonly(gmt, false)

hookmetamethod(game, "__index", function(self, i)
    if self == gaem and i == 'HttpGet' then
      return function(self, ...)
        return gaem:HttpGet(...)
    end
    end
     if self == gaem and i == 'HttpGetAsync' then
      return function(self, ...)
        return gaem:HttpGet(...)
     end
     end
   if self == gaem and i == 'GetObjects' then
      return function(self, ...)
        return gaem:GetObjects(...)
     end
     end
   if self == gaem and i == 'RunService' then
      return function(self, ...)
        return gaem:RunService(...)
     end
     end
   real_game=game;
    if table.find(security, i) then
        warn('disabled for security reason.')
        return nil
    end

    
    return oldindex(self, i)
end)

hookmetamethod(game, "__tostring" ,function()
return "Game"
end)

hookmetamethod(game, "__namecall", function(self, ...)
    if self == gaem and getnamecallmethod() == 'HttpGet' then
        return httpget(self, ...)
    end
    if self == gaem and getnamecallmethod() == 'HttpGetAsync' then
        return httpget(self, ...)
    end
    if self == gaem and getnamecallmethod() == 'GetObjects' then
        return GetObjects(...)
    end
    if self == gaem and getnamecallmethod() == 'RunService' then
    local RunService = game:GetService("RunService")
        return RunService(...)
    end
    real_game=game;
    if table.find(security, getnamecallmethod()) then
       warn('disabled for security reason.')
       return nil
    end

    return oldnamecall(self, ...)
end)

setreadonly(gmt, true)

getgenv().getmenv = getsenv
getgenv().getcallingscript = function() return getgenv(0).script end


getgenv().getinstances = function()
            local objs = {}
            for i,v in next, getreg() do
               if type(v)=='table' then
                  for o,b in next, v do
                      if typeof(b) == "Instance" then
                           table.insert(objs, b)
                      end
                  end
               end
            end
      return objs
 end

getgenv().getnilinstances = function()
    local objs = {}
	for i,v in next,getreg() do
		if type(v)=="table" then
			for o,b in next,v do
				if typeof(b) == "Instance" and b.Parent==nil then
					table.insert(objs, b)
				end
			end
		end
	end
	return objs
end

getgenv().getscripts = function()
    local scripts = {}
    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("LocalScript") or v:IsA("ModuleScript") then
            table.insert(scripts, v)
        end
    end
    return scripts
end

local function getscriptenvs()
   local gs = getscripts 
   local scr, envs = getscripts(), {}
   assert(scr, "Couldn't get scripts")
   for k, v in pairs(scr) do
       local s, env = pcall(getsenv, v)
       if s and "table" == type(env) then
           envs[s] = env
       else
           envs[s] = {}
       end
   end
   return envs or {}
end

getgenv().getcurrentthread = function()
   return coroutine.running()
end

getgenv().gethui = function()
   return game.Players.LocalPlayer.PlayerGui
end

getgenv().getmodules = function()
        local t = {}
		for i,v in pairs(getinstances()) do
			if v:IsA('ModuleScript') then
				table.insert(t, v)
			end
		end
	return t
end


getgenv().getloadedmodules = function()
        local t = {}
		for i,v in pairs(getinstances()) do
			if v:IsA('ModuleScript') then
				table.insert(t, v)
			end
		end
	return t
end

getgenv().getrunningscripts = function()
    local scripts = {}
    for _, script in ipairs(game:GetService("Players").LocalPlayer:GetDescendants()) do
        if script:IsA("LocalScript") or script:IsA("ModuleScript") then
            scripts[#scripts + 1] = script
        end
    end
    return scripts
end

--syn support
getgenv().syn_mouse1press = mouse1press
getgenv().syn_mouse2click = mouse2click
getgenv().syn_mousemoverel = movemouserel
getgenv().syn_mouse2release = mouse2up
getgenv().syn_mouse1release = mouse1up
getgenv().syn_mouse2press = mouse2down
getgenv().syn_mouse1click = mouse1click
getgenv().syn_newcclosure = newcclosure
getgenv().syn_clipboard_set = setclipboard
getgenv().syn_clipboard_get = getclipboard
getgenv().syn_islclosure = islclosure
getgenv().syn_iscclosure = iscclosure
getgenv().syn_getsenv = getsenv
getgenv().syn_getscripts = getscripts
getgenv().syn_getgenv = getgenv
getgenv().syn_getinstances = getinstances
getgenv().syn_getreg = getreg
getgenv().syn_getrenv = getrenv
getgenv().syn_getnilinstances = getnilinstances
getgenv().syn_fireclickdetector = fireclickdetector
getgenv().syn_getgc = getgc

local lz4 = {}

type Streamer = {
	Offset: number,
	Source: string,
	Length: number,
	IsFinished: boolean,
	LastUnreadBytes: number,

	read: (Streamer, len: number?, shiftOffset: boolean?) -> string,
	seek: (Streamer, len: number) -> (),
	append: (Streamer, newData: string) -> (),
	toEnd: (Streamer) -> ()
}

type BlockData = {
	[number]: {
		Literal: string,
		LiteralLength: number,
		MatchOffset: number?,
		MatchLength: number?
	}
}

local function plainFind(str, pat)
	return string.find(str, pat, 0, true)
end

local function streamer(str): Streamer
	local Stream = {}
	Stream.Offset = 0
	Stream.Source = str
	Stream.Length = string.len(str)
	Stream.IsFinished = false	
	Stream.LastUnreadBytes = 0

	function Stream.read(self: Streamer, len: number?, shift: boolean?): string
		local len = len or 1
		local shift = if shift ~= nil then shift else true
		local dat = string.sub(self.Source, self.Offset + 1, self.Offset + len)

		local dataLength = string.len(dat)
		local unreadBytes = len - dataLength

		if shift then
			self:seek(len)
		end

		self.LastUnreadBytes = unreadBytes
		return dat
	end

	function Stream.seek(self: Streamer, len: number)
		local len = len or 1

		self.Offset = math.clamp(self.Offset + len, 0, self.Length)
		self.IsFinished = self.Offset >= self.Length
	end

	function Stream.append(self: Streamer, newData: string)
		-- adds new data to the end of a stream
		self.Source ..= newData
		self.Length = string.len(self.Source)
		self:seek(0) --hacky but forces a recalculation of the isFinished flag
	end

	function Stream.toEnd(self: Streamer)
		self:seek(self.Length)
	end

	return Stream
end

getgenv().lz4compress = function(str: string): string
	local blocks: BlockData = {}
	local iostream = streamer(str)

	if iostream.Length > 12 then
		local firstFour = iostream:read(4)

		local processed = firstFour
		local lit = firstFour
		local match = ""
		local LiteralPushValue = ""
		local pushToLiteral = true

		repeat
			pushToLiteral = true
			local nextByte = iostream:read()

			if plainFind(processed, nextByte) then
				local next3 = iostream:read(3, false)

				if string.len(next3) < 3 then
					--push bytes to literal block then break
					LiteralPushValue = nextByte .. next3
					iostream:seek(3)
				else
					match = nextByte .. next3

					local matchPos = plainFind(processed, match)
					if matchPos then
						iostream:seek(3)
						repeat
							local nextMatchByte = iostream:read(1, false)
							local newResult = match .. nextMatchByte

							local repos = plainFind(processed, newResult) 
							if repos then
								match = newResult
								matchPos = repos
								iostream:seek(1)
							end
						until not plainFind(processed, newResult) or iostream.IsFinished

						local matchLen = string.len(match)
						local pushMatch = true

						if iostream.Length - iostream.Offset <= 5 then
							LiteralPushValue = match
							pushMatch = false
							--better safe here, dont bother pushing to match ever
						end

						if pushMatch then
							pushToLiteral = false

							-- gets the position from the end of processed, then slaps it onto processed
							local realPosition = string.len(processed) - matchPos
							processed = processed .. match

							table.insert(blocks, {
								Literal = lit,
								LiteralLength = string.len(lit),
								MatchOffset = realPosition + 1,
								MatchLength = matchLen,
							})
							lit = ""
						end
					else
						LiteralPushValue = nextByte
					end
				end
			else
				LiteralPushValue = nextByte
			end

			if pushToLiteral then
				lit = lit .. LiteralPushValue
				processed = processed .. nextByte
			end
		until iostream.IsFinished
		table.insert(blocks, {
			Literal = lit,
			LiteralLength = string.len(lit)
		})
	else
		local str = iostream.Source
		blocks[1] = {
			Literal = str,
			LiteralLength = string.len(str)
		}
	end

	-- generate the output chunk
	-- %s is for adding header
	local output = string.rep("\x00", 4)
	local function write(char)
		output = output .. char
	end
	-- begin working through chunks
	for chunkNum, chunk in blocks do
		local litLen = chunk.LiteralLength
		local matLen = (chunk.MatchLength or 4) - 4

		-- create token
		local tokenLit = math.clamp(litLen, 0, 15)
		local tokenMat = math.clamp(matLen, 0, 15)

		local token = bit32.lshift(tokenLit, 4) + tokenMat
		write(string.pack("<I1", token))

		if litLen >= 15 then
			litLen = litLen - 15
			--begin packing extra bytes
			repeat
				local nextToken = math.clamp(litLen, 0, 0xFF)
				write(string.pack("<I1", nextToken))
				if nextToken == 0xFF then
					litLen = litLen - 255
				end
			until nextToken < 0xFF
		end

		-- push raw lit data
		write(chunk.Literal)

		if chunkNum ~= #blocks then
			-- push offset as u16
			write(string.pack("<I2", chunk.MatchOffset))

			-- pack extra match bytes
			if matLen >= 15 then
				matLen = matLen - 15

				repeat
					local nextToken = math.clamp(matLen, 0, 0xFF)
					write(string.pack("<I1", nextToken))
					if nextToken == 0xFF then
						matLen = matLen - 255
					end
				until nextToken < 0xFF
			end
		end
	end
	--append chunks
	local compLen = string.len(output) - 4
	local decompLen = iostream.Length

	return string.pack("<I4", compLen) .. string.pack("<I4", decompLen) .. output
end

getgenv().lz4decompress = function(lz4data: string): string
	local inputStream = streamer(lz4data)

	local compressedLen = string.unpack("<I4", inputStream:read(4))
	local decompressedLen = string.unpack("<I4", inputStream:read(4))
	local reserved = string.unpack("<I4", inputStream:read(4))

	if compressedLen == 0 then
		return inputStream:read(decompressedLen)
	end

	local outputStream = streamer("")

	repeat
		local token = string.byte(inputStream:read())
		local litLen = bit32.rshift(token, 4)
		local matLen = bit32.band(token, 15) + 4

		if litLen >= 15 then
			repeat
				local nextByte = string.byte(inputStream:read())
				litLen += nextByte
			until nextByte ~= 0xFF
		end

		local literal = inputStream:read(litLen)
		outputStream:append(literal)
		outputStream:toEnd()
		if outputStream.Length < decompressedLen then
			--match
			local offset = string.unpack("<I2", inputStream:read(2))
			if matLen >= 19 then
				repeat
					local nextByte = string.byte(inputStream:read())
					matLen += nextByte
				until nextByte ~= 0xFF
			end

			outputStream:seek(-offset)
			local pos = outputStream.Offset
			local match = outputStream:read(matLen)
			local unreadBytes = outputStream.LastUnreadBytes
			local extra
			if unreadBytes then
				repeat
					outputStream.Offset = pos
					extra = outputStream:read(unreadBytes)
					unreadBytes = outputStream.LastUnreadBytes
					match ..= extra
				until unreadBytes <= 0
			end

			outputStream:append(match)
			outputStream:toEnd()
		end

	until outputStream.Length >= decompressedLen

	return outputStream.Source
end