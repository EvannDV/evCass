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



function RevenMenu()



    local RevMenu = RageUI.CreateMenu("Revendeur","Que veux tu vendres ?")
  
    RageUI.Visible(RevMenu, not RageUI.Visible(RevMenu))
  
    while RevMenu do
        
        Citizen.Wait(0)
  
        RageUI.IsVisible(RevMenu,true,true,true,function()
        
            
  
  
            RageUI.ButtonWithStyle("Télé", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                  TriggerServerEvent("resellT")
                  RageUI.CloseAll()    
                end
            end)


            RageUI.ButtonWithStyle("Poste Radio", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                  TriggerServerEvent("resellR")
                  RageUI.CloseAll()    
                end
            end)


            RageUI.ButtonWithStyle("Bijoux", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                  TriggerServerEvent("resellB")
                  RageUI.CloseAll()    
                end
            end)


            RageUI.ButtonWithStyle("Statue", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                  TriggerServerEvent("resellS")
                  RageUI.CloseAll()    
                end
            end)

  
  
  
  
  
        
  
        end, function()
        end)
  
        if not RageUI.Visible(RevMenu) then
            RevMenu=RMenu:DeleteType("RevMenu", true)
        end
  
    end
  
  end



  Citizen.CreateThread(function()
    while true do 
        local wait = 750

                for k in pairs {vector3(-14.634689331055,-2145.08984375,10.14305973053)} do 
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local pos = {vector3(-14.634689331055,-2145.08984375,10.14305973053)}
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

                if dist <= 6 then 
                    wait = 0
                    DrawMarker(6, -14.634689331055,-2145.08984375,10.14305973053-0.99, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.7, 0.5, 0.7, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist <= 1.0 then 
                    wait = 0

                    AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ ~s~pour parler au reselleur")
                    DisplayHelpTextThisFrame("HELP", false)
                    if IsControlJustPressed(1, 51) then 
                        RevenMenu()
                    end
                end
                

        end
    Citizen.Wait(wait)
    end
end)



--------------PED

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_dealer_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
      Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "s_m_y_dealer_01", -14.307241439819,-2145.1110839844,9.14305973053, 91.16487121582033, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)
