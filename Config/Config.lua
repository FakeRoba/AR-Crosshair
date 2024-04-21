AR = {}

AR.DefaultCrosshair = "circle" -- vaiha jos haluut
AR.DefaultCrosshairColor = {162, 0, 255} -- r, g, b

AR.CrosshairTextures = {
    ["circle"] = "Ympyrä", -- add more
    ["cock"] = "K18",
    ["melkeinkolmio"] = "Wnb kolmio",
    ["csgodefault"] = "Csgo default",
    ["smallcircle_fill"] = "Ympyrä täytetty",
    ["circle_ring"] = "Ympyrä rinkula",
    ["circlesemi"] = "Semi ympyrä",
    ["circle_fill"] = "Ympyrä täytetty",
    ["x"] = "Raksi (ei se ruokala)",
    ["drip"] = "HULLU DRIP",
    ["smallcircle"] = "Pieni ympyrä",
    ["risti"] = "Risti"
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