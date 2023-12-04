ESX = nil


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)



RegisterCommand('evTest5', function()
    print("no config")
end)




RegisterNetEvent('interieur1')
AddEventHandler('interieur1', function()
    InitCoords = GetEntityCoords(GetPlayerPed(-1), false)
    TriggerEvent("evId:setPlayerToBucket", GetPlayerServerId(PlayerId()))
    SetEntityCoords(PlayerPedId(), evProperties.appartMot)
end)


RegisterNetEvent('interieur2')
AddEventHandler('interieur2', function()
    InitCoords = GetEntityCoords(GetPlayerPed(-1), false)
    TriggerEvent("evId:setPlayerToBucket", GetPlayerServerId(PlayerId()))
    SetEntityCoords(PlayerPedId(), evProperties.appartMod)
end)

RegisterNetEvent('interieur3')
AddEventHandler('interieur3', function()
    InitCoords = GetEntityCoords(GetPlayerPed(-1), false)
    TriggerEvent("evId:setPlayerToBucket", GetPlayerServerId(PlayerId()))
    SetEntityCoords(PlayerPedId(), evProperties.appartM)
end)


RegisterNetEvent('mechanic')
AddEventHandler('mechanic', function()
    ExecuteCommand('e mechanic')
end)


-----------BLIPS Renfort

RegisterNetEvent('renfort:setBlip')
AddEventHandler('renfort:setBlip', function(coords)
    PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
    ESX.ShowAdvancedNotification('<C>Central', '~b~<C>Délit', '<C>Cambriolage en Cours.', 'CHAR_CHAT_CALL', 8)
    Wait(1000)
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
    color = 47
	local blipId = AddBlipForCoord(coords)
	SetBlipSprite(blipId, 161)
	SetBlipScale(blipId, 1.2)
	SetBlipColour(blipId, color)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Cambriolage')
	EndTextCommandSetBlipName(blipId)
	Wait(80 * 850)
	RemoveBlip(blipId)
end)


----- 1 braquage motel

Citizen.CreateThread(function()
    while true do 
        local wait = 750

                for k in pairs {vector3(329.23950195313,-224.94720458984,54.22176361084)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(329.23950195313,-224.94720458984,54.22176361084)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 329.23950195313,-224.94720458984,54.22176361084-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour cambrioler")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        TriggerServerEvent('ifitem')
                        viewMarker = true
                        okEv = true
                        evTry()
                        Citizen.Wait(20*60000)
                    end
                end
                

        end
    Citizen.Wait(wait)
    end
end)


----- 1 braquage mod

Citizen.CreateThread(function()
    while true do 
        local wait = 750

                for k in pairs {vector3(292.05227661133,-1078.8392333984,29.404642105103)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(292.05227661133,-1078.8392333984,29.404642105103)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 292.05227661133,-1078.8392333984,29.404642105103-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour cambrioler")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then
                        TriggerServerEvent('ifitem2')
                        viewMarker = true
                        okEv = true
                        evTry()
                        Citizen.Wait(20*60000)
                    end
                end
                

        end
    Citizen.Wait(wait)
    end
end)

----- 1 braquage modern

Citizen.CreateThread(function()
    while true do 
        local wait = 750

                for k in pairs {vector3(-17.60546875,-296.65866088867,45.755924224854)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(-17.60546875,-296.65866088867,45.755924224854)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, -17.60546875,-296.65866088867,45.755924224854-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour cambrioler")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then
                        TriggerServerEvent('ifitem3')
                        viewMarker = true
                        okEv = true
                        evTry()
                        Citizen.Wait(20*60000)
                    end
                end
                

        end
    Citizen.Wait(wait)
    end
end)


function evTry()
    if viewMarker == true then
----------- Appart Modest

Citizen.CreateThread(function()
    while true do
        if okEv == true then 
        local wait = 750

                for k in pairs {vector3(262.78283691406,-1002.5545654297,-99.008720397949)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(262.78283691406,-1002.5545654297,-99.008720397949)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 262.78283691406,-1002.5545654297,-99.008720397949-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 0, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour voler la télé")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        local tele = math.random(1,3)
                        if tele == 1 or 3 then
                            ESX.ShowNotification("C'est trop lourd pour vous, vous l'avez fait tomber!")
                            local coordsPly = GetEntityCoords(GetPlayerPed(-1), false)
                            TriggerServerEvent('renfort', coordsPly)
                            ESX.ShowNotification("Le bruit a alerté les voisins qui ont ~r~appelé la police")
                            Citizen.Wait(5*60000)
                        else
                            TriggerServerEvent('telegive')
                            Citizen.Wait(5*60000)
                        end
                    end
                end
            end

        end
    Citizen.Wait(wait)
    end
end)


Citizen.CreateThread(function()
    while true do 
        if okEv == true then
        local wait = 750

                for k in pairs {vector3(257.06274414063,-995.78381347656,-99.008560180664)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(257.06274414063,-995.78381347656,-99.008560180664)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 257.06274414063,-995.78381347656,-99.008560180664-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 0, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour voler la télé")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        local tele = math.random(1,3)
                        if tele == 1 or 3 then
                            ESX.ShowNotification("C'est trop lourd pour vous, vous l'avez fait tomber!")
                            local coordsPly = GetEntityCoords(GetPlayerPed(-1), false)
                            TriggerServerEvent('renfort', coordsPly)
                            ESX.ShowNotification("Le bruit a alerté les voisins qui ont ~r~appelé la police")
                            Citizen.Wait(5*60000)
                        else
                            TriggerServerEvent('telegive')
                            Citizen.Wait(5*60000)
                        end
                    end
                end
            end  

        end
    Citizen.Wait(wait)
    end
end)



Citizen.CreateThread(function()
    while true do 
        if okEv == true then
        local wait = 750

                for k in pairs {vector3(257.06274414063,-995.78381347656,-99.008560180664)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(257.06274414063,-995.78381347656,-99.008560180664)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 257.06274414063,-995.78381347656,-99.008560180664-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 0, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour voler le poste radio")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        local tele = math.random(1,8)
                        if tele == 1 then
                            local coordsPly = GetEntityCoords(GetPlayerPed(-1), false)
                            TriggerServerEvent('renfort', coordsPly)
                            ESX.ShowNotification("La police viens d etre alerté")
                            Citizen.Wait(5*60000)
                        else
                            TriggerServerEvent('posteradiogive')
                            Citizen.Wait(5*60000)
                        end
                    end
                end
            end  

        end
    Citizen.Wait(wait)
    end
end)


Citizen.CreateThread(function()
    while true do 
        if okEv == true then
        local wait = 750

                for k in pairs {vector3(265.76431274414,-999.50274658203,-99.008583068848)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(265.76431274414,-999.50274658203,-99.008583068848)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 265.76431274414,-999.50274658203,-99.008583068848-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 0, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour voler l'argent")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        local tele = math.random(1,6)
                        if tele == 1 then
                            local coordsPly = GetEntityCoords(GetPlayerPed(-1), false)
                            TriggerServerEvent('renfort', coordsPly)
                            ESX.ShowNotification("La police viens d'etre alerté")
                            Citizen.Wait(5*60000)
                        else
                            TriggerServerEvent('argentgive')
                            Citizen.Wait(5*60000)
                        end
                    end
                end
            end  

        end
    Citizen.Wait(wait)
    end
end)



Citizen.CreateThread(function()
    while true do
        if okEv == true then 
        local wait = 750

                for k in pairs {vector3(266.11645507813,-1007.1711425781,-101.00843048096)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(266.11645507813,-1007.1711425781,-101.00843048096)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 266.11645507813,-1007.1711425781,-101.00843048096-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour sortir")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        TriggerServerEvent("evId:setPlayerToNormalBucket", GetPlayerServerId(PlayerId()))
                        okEv = false
                        evTry()
                        SetEntityCoords(PlayerPedId(), InitCoords)
                    end
                end
            end 

        end
    Citizen.Wait(wait)
    end
end)





----------- Appart Luxe

Citizen.CreateThread(function()
    while true do 
        if okEv == true then
        local wait = 750

                for k in pairs {vector3(345.17636108398,-994.44573974609,-99.196182250977)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(345.17636108398,-994.44573974609,-99.196182250977)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 345.17636108398,-994.44573974609,-99.196182250977-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 0, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour voler la statue")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        local tele = math.random(1,3)
                        if tele == 1 then
                            local coordsPly = GetEntityCoords(GetPlayerPed(-1), false)
                            TriggerServerEvent('renfort', coordsPly)
                            ESX.ShowNotification("La Police a été alerté !")
                            Citizen.Wait(5*60000)
                        else
                            TriggerServerEvent('statuesgive')
                            Citizen.Wait(5*60000)
                        end
                    end
                end
            end  

        end
    Citizen.Wait(wait)
    end
end)



Citizen.CreateThread(function()
    while true do 
        if okEv == true then
        local wait = 750

                for k in pairs {vector3(339.52239990234,-1000.1644287109,-99.196144104004)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(339.52239990234,-1000.1644287109,-99.196144104004)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 339.52239990234,-1000.1644287109,-99.196144104004-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 0, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour voler l'argent")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        local tele = math.random(1,4)
                        if tele == 1 then
                            local coordsPly = GetEntityCoords(GetPlayerPed(-1), false)
                            TriggerServerEvent('renfort', coordsPly)
                            ESX.ShowNotification("La Police a été alerté !")
                            Citizen.Wait(5*60000)
                        else
                            TriggerServerEvent('argentgive')
                            Citizen.Wait(5*60000)
                        end
                    end
                end
            end 

        end
    Citizen.Wait(wait)
    end
end)




Citizen.CreateThread(function()
    while true do
        if okEv == true then 
        local wait = 750

                for k in pairs {vector3(351.28088378906,-999.08801269531,-99.196151733398)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(351.28088378906,-999.08801269531,-99.196151733398)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 351.28088378906,-999.08801269531,-99.196151733398-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 0, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour voler les bijoux")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        local tele = math.random(1,6)
                        if tele == 1 then
                            local coordsPly = GetEntityCoords(GetPlayerPed(-1), false)
                            TriggerServerEvent('renfort', coordsPly)
                            ESX.ShowNotification("La Police a été alerté !")
                            Citizen.Wait(5*60000)
                        else
                            TriggerServerEvent('bijouxgive')
                            Citizen.Wait(5*60000)
                        end
                    end
                end
            end  

        end
    Citizen.Wait(wait)
    end
end)




Citizen.CreateThread(function()
    while true do 
        if okEv == true then
        local wait = 750

                for k in pairs {vector3(346.54461669922,-1012.8231811523,-99.196159362793)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(346.54461669922,-1012.8231811523,-99.196159362793)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 346.54461669922,-1012.8231811523,-99.196159362793-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour sortir")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        TriggerServerEvent("evId:setPlayerToNormalBucket", GetPlayerServerId(PlayerId()))
                        okEv = false
                        evTry()
                        SetEntityCoords(PlayerPedId(), InitCoords)
                    end
                end
            end  

        end
    Citizen.Wait(wait)
    end
end)









-------------- Motel




Citizen.CreateThread(function()
    while true do 
        if okEv == true then
        local wait = 750

                for k in pairs {vector3(151.40869140625,-1004.518737793,-99.000022888184)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(151.40869140625,-1004.518737793,-99.000022888184)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 151.40869140625,-1004.518737793,-99.000022888184-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 0, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour voler la télé")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        local tele = math.random(1,3)
                        if tele == 1 or 3 then
                            ESX.ShowNotification("C'est trop lourd pour vous, vous l'avez fait tomber!")
                            local coordsPly = GetEntityCoords(GetPlayerPed(-1), false)
                            TriggerServerEvent('renfort', coordsPly)
                            ESX.ShowNotification("Le bruit a alerté les voisins qui ont ~r~appelé la police")
                            Citizen.Wait(5*60000)
                        else
                            TriggerServerEvent('telegive')
                            Citizen.Wait(5*60000)
                        end
                    end
                end
            end

        end
    Citizen.Wait(wait)
    end
end)




Citizen.CreateThread(function()
    while true do 
        if okEv == true then
        local wait = 750

                for k in pairs {vector3(151.33236694336,-1007.9470825195,-99.000022888184)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(151.33236694336,-1007.9470825195,-99.000022888184)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 151.33236694336,-1007.9470825195,-99.000022888184-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour sortir")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        TriggerServerEvent("evId:setPlayerToNormalBucket", GetPlayerServerId(PlayerId()))
                        okEv = false
                        evTry()
                        SetEntityCoords(PlayerPedId(), InitCoords)
                    end
                end
            end 

        end
    Citizen.Wait(wait)
    end
end)


Citizen.CreateThread(function()
    while true do 
        if okEv == true then
        local wait = 750

                for k in pairs {vector3(154.43531799316,-1006.099609375,-99.000007629395)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(154.43531799316,-1006.099609375,-99.000007629395)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, 154.43531799316,-1006.099609375,-99.000007629395-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 0, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour voler l'argent")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        local tele = math.random(1,4)
                        if tele == 1 then
                            local coordsPly = GetEntityCoords(GetPlayerPed(-1), false)
                            TriggerServerEvent('renfort', coordsPly)
                            ESX.ShowNotification("La Police a été alerté !")
                            Citizen.Wait(5*60000)
                        else
                            TriggerServerEvent('argentgive')
                            Citizen.Wait(5*60000)
                        end
                    end
                end
            end  

        end
    Citizen.Wait(wait)
    end
end)
else
    print("nothing")
end
end
