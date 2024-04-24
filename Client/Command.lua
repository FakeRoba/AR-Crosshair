local Inventories = {
    ["ox_inventory"] = "nui://ox_inventory/web/images/%s.png",
    ["qb-inventory"] = "nui://qb-inventory/html/images/%s.png",
    ["ps-inventory"] = "nui://ps-inventory/html/images/%s.png",
    ["lj-inventory"] = "nui://lj-inventory/html/images/%s.png",
    ["qs-inventory"] = "nui://qs-inventory/html/images/%s.png",
}

local ImagesPath = nil
CurrentCrosshair = ""
CurrentCrosshairColor = {}
CurrentCrosshairWidth = 0.03

function GetInventoryIcon(itemName)
    if not ImagesPath then
        print('Your inventory script did not get found, images or previews dont work on this script!')
        return
    end

    return ImagesPath:format(itemName) .. '?height=128'
end

CreateThread(function()
    lib.locale()

    for k, v in pairs(Inventories) do
        if GetResourceState(k) == 'started' then
            ImagesPath = v
            break
        end
    end

    CurrentCrosshair = GetResourceKvpString("AR-Crosshair:CurrentCrosshair")
    CurrentCrosshairColor = GetResourceKvpString("AR-Crosshair:CurrentCrosshairColor")
    local TempWidth = GetResourceKvpString("AR-Crosshair:Width")

    if TempWidth and TempWidth ~= "" then
        CurrentCrosshairWidth = tonumber(TempWidth)
    end

    if not CurrentCrosshair or CurrentCrosshair == "" or not AR.CrosshairTextures[CurrentCrosshair] then
        CurrentCrosshair = AR.DefaultCrosshair
        SetResourceKvp("AR-Crosshair:CurrentCrosshair", AR.DefaultCrosshair)
    end

    -- myönnättäköön olin hukassa mut if it works, it works

    if not CurrentCrosshairColor or CurrentCrosshairColor == "{}" then
        CurrentCrosshairColor = json.encode(AR.DefaultCrosshairColor)
        SetResourceKvp("AR-Crosshair:CurrentCrosshairColor", json.encode(AR.DefaultCrosshairColor))
    end

    CurrentCrosshairColor = json.decode(CurrentCrosshairColor)

    local CrosshairOptions = {}

    for k, v in pairs(AR.CrosshairTextures) do
        table.insert(CrosshairOptions,
            {
                title = locale("custom_crosshair_"..k) or v, -- oli nätimpi tollain kuin format
                icon = 'hand',
                image = GetInventoryIcon(k),
                onSelect = function()
                    CurrentCrosshair = k
                    SetResourceKvp("AR-Crosshair:CurrentCrosshair", k)
                end
            }
        )
    end

    lib.registerContext({
        id = 'AR-Crosshair:Crosshairs:Menu',
        title = 'Crosshair selection menu',
        options = CrosshairOptions
    })

    lib.registerContext({
        id = 'AR-Crosshair:Menu',
        title = 'Crosshair menu',
        options = {
            {
                title = locale("choose_crosshair"),
                icon = 'crosshairs',
                onSelect = function()
                    lib.showContext('AR-Crosshair:Crosshairs:Menu')
                end
            },
            {
                title = locale("set_crosshair_color"),
                icon = 'paint-roller',
                onSelect = function()
                    local input = lib.inputDialog(locale("crosshair_color"), {
                        {type = 'color', label = locale("color"), format = 'rgb'},
                    })

                    if not input then
                        return
                    end

                    CurrentCrosshairColor = lib.math.torgba(input[1])
                    SetResourceKvp("AR-Crosshair:CurrentCrosshairColor", json.encode(CurrentCrosshairColor))
                end
            },
            {
                title = locale("crosshair_height_width"),
                icon = 'angle-up',
                onSelect = function()
                    local input = lib.inputDialog(locale("crosshair_height_width"), {
                        {type = 'slider', default = 21, min = 20, max = 100, label = locale("height")}
                    })

                    if not input then
                        return
                    end

                    CurrentCrosshairWidth = tonumber(input[1])/1000
                    SetResourceKvp("AR-Crosshair:Width", tostring(tonumber(input[1])/1000))
                end
            }
        }
    })

    if not ImagesPath then
        for i = 1, 10 do
            print('[WARNING]: Your inventory script did not get found, images or previews dont work on this script!')
            Wait(1100)
        end
    end
end)

RegisterCommand("crosshair", function()
    lib.showContext('AR-Crosshair:Menu')
end)