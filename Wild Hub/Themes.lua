local white_theme = {
    Main = Color3.fromRGB(240, 240, 240),
    Second = Color3.fromRGB(220, 220, 220),
    Stroke = Color3.fromRGB(200, 200, 200),
    Divider = Color3.fromRGB(180, 180, 180),
    Text = Color3.fromRGB(0, 0, 0),
    TextDark = Color3.fromRGB(50, 50, 50)
}

local orion_lib_theme = {
    Main = Color3.fromRGB(25, 25, 25),
    Second = Color3.fromRGB(32, 32, 32),
    Stroke = Color3.fromRGB(60, 60, 60),
		Divider = Color3.fromRGB(60, 60, 60),
		Text = Color3.fromRGB(240, 240, 240),
		TextDark = Color3.fromRGB(150, 150, 150)
}

local crimson_shadow = {
    Main = Color3.fromRGB(10, 5, 5),
    Second = Color3.fromRGB(30, 10, 10),
    Stroke = Color3.fromRGB(60, 20, 20),
    Divider = Color3.fromRGB(45, 15, 15),
    Text = Color3.fromRGB(255, 50, 50),
    TextDark = Color3.fromRGB(180, 40, 40)
}

local default = {
    Main = Color3.fromRGB(10, 10, 50),
    Second = Color3.fromRGB(5, 5, 20),
    Stroke = Color3.fromRGB(2, 2, 10),
    Divider = Color3.fromRGB(2, 2, 10),
    Text = Color3.fromRGB(240, 240, 240),
    TextDark = Color3.fromRGB(150, 150, 150)
}

return {
    ["Default"] = default,
    ["White theme"] = white_theme,
    ["Orion library"] = orion_lib_theme,
    ["Crimson shadow"] = crimson_shadow
}
