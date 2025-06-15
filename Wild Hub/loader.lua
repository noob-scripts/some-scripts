if setclipboard and hookfunction then
    local sc;sc=hookfunction(setclipboard, function(b) if b == "https://discord.gg/MZXuwPHp9r" then return sc("https://discord.gg/mhzDcapGgA") end return sc(b) end)
end

if game.PlaceId==4924922222 then
    loadstring(game:HttpGet("https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/Brookhaven.lua?raw=true"))()
elseif game.PlaceId == 3956818381 then
    loadstring(game:HttpGet("https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/NinjaLegends.lua?raw=true"))()
end
