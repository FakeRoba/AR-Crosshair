local YtdFile = "crosshairs"
local CurrentlyShaking = false
local GunTypes, GunShakes = {}, {} -- converttaan hashiks suoraan

GetShakeSpeed = function(WeaponHash)
    local GunType = GunTypes[WeaponHash] or AR.FallbackShake
    local ShakeSpeed = GunShakes[WeaponHash] or GunShakes[GunType]

    return ShakeSpeed or 0.0
end

CreateThread(function()
    lib.requestStreamedTextureDict(YtdFile, 1100)

    for k, v in pairs(AR.GunTypes) do -- Convert
        GunTypes[GetHashKey(k)] = v
    end

    for k, v in pairs(AR.Shake) do -- Convert
        local Key = k

        if k:find("WEAPON_") then
            Key = GetHashKey(k)
        end

        GunShakes[Key] = v
    end

    while true do
        local Sleep = 250 -- idle just waiting for freeaim
        local Ped = PlayerPedId()
        local hasWeapon, weaponHash = GetCurrentPedWeapon(Ped)

        if not hasWeapon then
            Sleep = 1100
        end

        if hasWeapon and (GunTypes[weaponHash] and GunTypes[weaponHash] ~= "Sniper") and GetFollowPedCamViewMode() ~= 4 and IsPlayerFreeAiming(PlayerId()) then
            Sleep = 1
            DrawSprite(YtdFile, CurrentCrosshair, 0.5, 0.5, (0.03*25)*CurrentCrosshairWidth, CurrentCrosshairWidth, 0.0, CurrentCrosshairColor.x, CurrentCrosshairColor.y, CurrentCrosshairColor.z, 255)

            if not CurrentlyShaking then
                CurrentlyShaking = true
                ShakeGameplayCam("HAND_SHAKE", GetShakeSpeed(weaponHash))
            end
        end

        if Sleep ~= 1 and CurrentlyShaking then
            CurrentlyShaking = false
            ShakeGameplayCam("HAND_SHAKE", 0.0)
        end

        Wait(Sleep)
    end
end)
