local scripts = {
    [4924922222] = "https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/Brookhaven.lua?raw=true",
    [3956818381] = "https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/NinjaLegends.lua?raw=true",
    [155382109] = "https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/Small-Scripts/SAKTKIA51.lua?raw=true",
    [3101667897] = "https://github.com/noob-scripts/some-scripts/blob/master/Wild%20Hub/LegendsOfSpeed.lua?raw=true"
}

local placeid = game.PlaceId
if scripts[placeid] then
    loadstring(game:HttpGet(scripts[placeid]))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/noob-scripts/some-scripts/refs/heads/master/Wild%20Hub/Universal.lua"))()
end
