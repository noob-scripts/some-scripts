-- made by Wild -> Wide
-- script: encrypt and decrypt

local function encrypt(input)
    local result = {}
    for i = 1, #input do
        local char = input:byte(i) + (i % 5) + 1
        result[#input - i + 1] = string.char(char)
    end
    return table.concat(result)
end

local function decrypt(input)
    local result = {}
    for i = 1, #input do
        local char = input:byte(i) - ( (#input - i + 1) % 5 ) - 1
        result[#input - i + 1] = string.char(char)
    end
    return table.concat(result)
end

return {encrypt = encrypt, decrypt = decrypt}
