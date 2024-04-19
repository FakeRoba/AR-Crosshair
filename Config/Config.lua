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

AR.Shake = {
    ["WEAPON_PISTOL"] = 1.0, -- overwrites


    ["Pistol"] = 1.1,
    ["Smg"] = 1.2,
    ["Shotgun"] = 1.3,
    ["Rifle"] = 1.5,
    ["LMG"] = 1.8,
    ["Sniper"] = 1.2,
}

AR.FallbackShake = "Pistol" -- if not found on GunTypes then just fallback on that

AR.GunTypes = {
    ["WEAPON_PISTOL"] = "Pistol",
    ["WEAPON_PISTOL_MK2"] = "Pistol",
    ["WEAPON_COMBATPISTOL"] = "Pistol",
    ["WEAPON_APPISTOL"] = "Pistol",
    ["WEAPON_STUNGUN"] = "Pistol",
    ["WEAPON_PISTOL50"] = "Pistol",
    ["WEAPON_SNSPISTOL"] = "Pistol",
    ["WEAPON_SNSPISTOL_MK2"] = "Pistol",
    ["WEAPON_HEAVYPISTOL"] = "Pistol",
    ["WEAPON_VINTAGEPISTOL"] = "Pistol",
    ["WEAPON_FLAREGUN"] = "Pistol",
    ["WEAPON_MARKSMANPISTOL"] = "Pistol",
    ["WEAPON_REVOLVER"] = "Pistol",
    ["WEAPON_REVOLVER_MK2"] = "Pistol",
    ["WEAPON_DOUBLEACTION"] = "Pistol",
    ["WEAPON_RAYPISTOL"] = "Pistol",
    ["WEAPON_CERAMICPISTOL"] = "Pistol",
    ["WEAPON_NAVYREVOLVER"] = "Pistol",
    ["WEAPON_GADGETPISTOL"] = "Pistol",
    ["WEAPON_STUNGUN_MP"] = "Pistol",
    ["WEAPON_PISTOLXM3"] = "Pistol",
    ["WEAPON_MICROSMG"] = "Smg",
    ["WEAPON_SMG"] = "Smg",
    ["WEAPON_SMG_MK2"] = "Smg",
    ["WEAPON_GUSENBERG"] = "Smg",
    ["WEAPON_ASSAULTSMG"] = "Smg",
    ["WEAPON_COMBATPDW"] = "Smg",
    ["WEAPON_MACHINEPISTOL"] = "Smg",
    ["WEAPON_MINISMG"] = "Smg",
    ["WEAPON_RAYCARBINE"] = "Smg",
    ["WEAPON_TECPISTOL"] = "Smg",
    ["WEAPON_PUMPSHOTGUN"] = "Shotgun",
    ["WEAPON_PUMPSHOTGUN_MK2"] = "Shotgun",
    ["WEAPON_SAWNOFFSHOTGUN"] = "Shotgun",
    ["WEAPON_ASSAULTSHOTGUN"] = "Shotgun",
    ["WEAPON_BULLPUPSHOTGUN"] = "Shotgun",
    ["WEAPON_MUSKET"] = "Shotgun",
    ["WEAPON_HEAVYSHOTGUN"] = "Shotgun",
    ["WEAPON_DBSHOTGUN"] = "Shotgun",
    ["WEAPON_AUTOSHOTGUN"] = "Shotgun",
    ["WEAPON_COMBATSHOTGUN"] = "Shotgun",
    ["WEAPON_ASSAULTRIFLE"] = "Rifle",
    ["WEAPON_ASSAULTRIFLE_MK2"] = "Rifle",
    ["WEAPON_CARBINERIFLE"] = "Rifle",
    ["WEAPON_CARBINERIFLE_MK2"] = "Rifle",
    ["WEAPON_ADVANCEDRIFLE"] = "Rifle",
    ["WEAPON_SPECIALCARBINE"] = "Rifle",
    ["WEAPON_SPECIALCARBINE_MK2"] = "Rifle",
    ["WEAPON_BULLPUPRIFLE"] = "Rifle",
    ["WEAPON_BULLPUPRIFLE_MK2"] = "Rifle",
    ["WEAPON_COMPACTRIFLE"] = "Rifle",
    ["WEAPON_MILITARYRIFLE"] = "Rifle",
    ["WEAPON_HEAVYRIFLE"] = "Rifle",
    ["WEAPON_TACTICALRIFLE"] = "Rifle",
    ["WEAPON_MG"] = "LMG",
    ["WEAPON_COMBATMG"] = "LMG",
    ["WEAPON_COMBATMG_MK2"] = "LMG",
    ["WEAPON_SNIPERRIFLE"] = "Sniper", -- Disables shake and crosshair
    ["WEAPON_HEAVYSNIPER"] = "Sniper", -- Disables shake and crosshair
    ["WEAPON_HEAVYSNIPER_MK2"] = "Sniper", -- Disables shake and crosshair
    ["WEAPON_MARKSMANRIFLE"] = "Sniper", -- Disables shake and crosshair
    ["WEAPON_MARKSMANRIFLE_MK2"] = "Sniper", -- Disables shake and crosshair
    ["WEAPON_PRECISIONRIFLE"] = "Sniper", -- Disables shake and crosshair
}