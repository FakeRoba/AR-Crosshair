local YtdFile = "crosshairs"
local CurrentlyShaking = false
local GunShakes = {}

GetShakeSpeed = function(WeaponHash)
    local GunType = GetWeapontypeGroup(WeaponHash)
    local ShakeSpeed = GunShakes[WeaponHash] or GunShakes[GunType]

    return ShakeSpeed or 0.0
end

CreateThread(function()
    lib.requestStreamedTextureDict(YtdFile, 1100)

    for k, v in pairs(AR.Shake) do -- Convert
        local Key = k

        if not k:find("WEAPON_") then
            Key = ("%s_%s"):format("GROUP", k)
        end

        print(Key, GetHashKey(Key))
        GunShakes[GetHashKey(Key)] = v
    end

    while true do
        local Sleep = 250 -- idle just waiting for freeaim
        local Ped = PlayerPedId()
        local hasWeapon, weaponHash = GetCurrentPedWeapon(Ped)

        if not hasWeapon then
            Sleep = 1100
        end

        if hasWeapon and GetWeapontypeGroup(weaponHash) ~= "GROUP_SNIPER" and GetFollowPedCamViewMode() ~= 4 and IsPlayerFreeAiming(PlayerId()) then
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
