-- made by Wild -> Wide
-- script: base64 library

local base64 = {}

local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local byte, char, sub = string.byte, string.char, string.sub
local gsub, concat = string.gsub, table.concat
local floor = math.floor

-- base64_encode
function base64.encode(input)
    local output, padding = {}, #input % 3
    for i = 1, #input, 3 do
        local a, b, c = byte(input, i, i + 2)
        local n = (a or 0) << 16 | (b or 0) << 8 | (c or 0)
        output[#output + 1] = sub(b, (n >> 18) & 63 + 1) ..
                              sub(b, (n >> 12) & 63 + 1) ..
                              sub(b, (n >> 6) & 63 + 1) ..
                              sub(b, n & 63 + 1)
    end
    if padding > 0 then
        output[#output] = sub(output[#output], 1, 4 - padding) .. ("="):rep(padding)
    end
    return concat(output)
end

-- base64_decode
function base64.decode(input)
    input = gsub(input, "[^A-Za-z0-9+/=]", "")
    local output = {}
    for i = 1, #input, 4 do
        local a, b, c, d = sub(input, i, i), sub(input, i + 1, i + 1), sub(input, i + 2, i + 2), sub(input, i + 3, i + 3)
        local n = (b:find(a, 1, true) - 1) << 18 | (b:find(b, 1, true) - 1) << 12 |
                  ((c and b:find(c, 1, true) - 1) or 0) << 6 | ((d and b:find(d, 1, true) - 1) or 0)
        output[#output + 1] = char((n >> 16) & 255, (n >> 8) & 255, n & 255)
    end
    return gsub(concat(output), "%z+$", "")
end

return base64 -- you can use it for your scripts
