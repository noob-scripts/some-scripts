-- made by Wild -> Wide
-- script: crypt library

local base64 = loadstring(game:HttpGet("https://github.com/noob-scripts/some-scripts/blob/master/base64_lib.lua?raw=true"))()
local crypt = loadstring(game:HttpGet("https://github.com/noob-scripts/some-scripts/blob/master/encrypt_decrypt.lua?raw=true"))()
local lz4 = loadstring(game:HttpGet("https://gist.githubusercontent.com/metatablecat/92345df2fd6d450da288c28272555faf/raw/e7158792997a45101802dd1cc32bbb9382b67a6d/lz4.lua"))() -- credits to metatable cat

local function url_encode(data)
    return (data:gsub("([^%w%-%.%_~/])", function(c)
        return string.format("%%%02X", string.byte(c))
    end))
end

local function url_decode(data)
    return (data:gsub("%%(%x%x)", function(h)
        return string.char(tonumber(h, 16))
    end))
end

local function hex_encode(data)
    return (data:gsub(".", function(c)
        return string.format("%02X", string.byte(c))
    end))
end

local function hex_decode(data)
    return (data:gsub("%x%x", function(h)
        return string.char(tonumber(h, 16))
    end))
end

getgenv().crypt = {
      base64 = base64,
      lz4 = lz4,
      encrypt = crypt.encrypt,
      decrypt = crypt.decrypt,
      url = {
          encode = url_encode,
          decode = url_decode
      },
      hex = {
         encode = hex_encode,
         decode = hex_decode
      }
}

getgenv().base64_encode = crypt.base64.encode
getgenv().base64_decode = crypt.base64.decode
getgenv().lz4compress = crypt.lz4.compress
getgenv().lz4decompress = crypt.lz4.decompress

return crypt
