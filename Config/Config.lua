AR = {}

AR.DefaultCrosshair = "circle" -- Change if you want
AR.DefaultCrosshairColor = {162, 0, 255} -- r, g, b

AR.CrosshairTextures = {
    --[[
        ["texturename"] = "label"
        OR
        ["texturename"] = true then go to Locales, select your language and add this:
        "custom_crosshair_CROSSHAIRNAMEHERE": "LABEL HERE",
        replace CROSSHAIRNAMEHERE with your crosshair name .png/ and add label
        the name is have to be the same in the .ytd file
    ]]

    ["circle"] = true,
    ["cock"] = true,
    ["melkeinkolmio"] = true,
    ["csgodefault"] = true,
    ["smallcircle_fill"] = true,
    ["circle_ring"] = true,
    ["circlesemi"] = true,
    ["circle_fill"] = true,
    ["x"] = true,
    ["drip"] = true,
    ["smallcircle"] = true,
    ["risti"] = true
}

-- Shake --

AR.Shake = { -- if group not found or the gun then there is no shake
    ["WEAPON_PISTOL"] = 1.0, -- overwrites the group value

    -- GROUPS
    ["PISTOL"] = 1.1,
    ["STUNGUN"] = 1.1,
    ["SMG"] = 1.2,
    ["SHOTGUN"] = 1.3,
    ["RIFLE"] = 1.5,
    ["MG"] = 1.8, -- MACHINE GUN / LIGHT MACHINE GUN
    ["SNIPER"] = 1.2,
    -- there is also HEAVY but idk what is that
}
