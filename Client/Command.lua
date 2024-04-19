CurrentCrosshair = ""
CurrentCrosshairColor = {}
CurrentCrosshairWidth = 0.03

CreateThread(function()
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
                title = v,
                icon = 'hand',
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
                title = "Valitse crosshair",
                icon = 'crosshairs',
                onSelect = function()
                    lib.showContext('AR-Crosshair:Crosshairs:Menu')
                end
            },
            {
                title = "Valitse crosshairin väri",
                icon = 'paint-roller',
                onSelect = function()
                    local input = lib.inputDialog('Crosshairin väri', {
                        {type = 'color', label = 'Väri', format = 'rgb'},
                    })

                    if not input then
                        return
                    end

                    CurrentCrosshairColor = lib.math.torgba(input[1])
                    SetResourceKvp("AR-Crosshair:CurrentCrosshairColor", json.encode(CurrentCrosshairColor))
                end
            },
            {
                title = "Crosshairin pituus",
                icon = 'angle-up',
                onSelect = function()
                    local input = lib.inputDialog('Crosshairin pituus', {
                        {type = 'slider', default = 21, min = 20, max = 100, label = 'Pituus'}
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
end)

RegisterCommand("crosshair", function()
    lib.showContext('AR-Crosshair:Menu')
end)