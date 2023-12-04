ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



-- Police alerte
RegisterServerEvent('policealerte')
AddEventHandler('policealerte', function(coordsPly)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
		    TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Braquage en Cours', '~b~Informations', 'Un braquage a été déclenché ici : '..coordsPly, 'CHAR_CHAT_CALL', 2)
        end
    end

end)


RegisterServerEvent('renfort')   ----------- Acces aux jobs sheriff et police
AddEventHandler('renfort', function(coords)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'sheriff' or thePlayer.job.name == 'police' then
			TriggerClientEvent('renfort:setBlip', xPlayers[i], coords)
		end
	end
end)


----- Requiert item

RegisterNetEvent('ifitem')
AddEventHandler('ifitem', function()
    local source = source
    local item = Config.itemNeed
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= 1 then
        xPlayer.removeInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Vous ~g~commencez~s~ le cambriolage")
        TriggerClientEvent('mechanic', source)
        Citizen.Wait(4000)
        TriggerClientEvent('interieur1', source)
    else
        TriggerClientEvent('esx:showNotification', source, "Tu as besoins d'avoir un "..Config.itemNeed.." pour cambrioler")
    end
end)

RegisterNetEvent('ifitem2')
AddEventHandler('ifitem2', function()
    local source = source
    local item = Config.itemNeed
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= 1 then
        xPlayer.removeInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Vous ~g~commencez~s~ le cambriolage")
        TriggerClientEvent('mechanic', source)
        Citizen.Wait(4000)
        TriggerClientEvent('interieur2', source)
    else
        TriggerClientEvent('esx:showNotification', source, "Tu as besoins d'avoir un "..Config.itemNeed.." pour cambrioler")
    end
end)


RegisterNetEvent('ifitem3')
AddEventHandler('ifitem3', function()
    local source = source
    local item = Config.itemNeed
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= 1 then
        xPlayer.removeInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Vous ~g~commencez~s~ le cambriolage")
        TriggerClientEvent('mechanic', source)
        Citizen.Wait(4000)
        TriggerClientEvent('interieur3', source)
    else
        TriggerClientEvent('esx:showNotification', source, "Tu as besoins d'avoir un "..Config.itemNeed.." pour cambrioler")
    end
end)


---- Tele Give

RegisterNetEvent('telegive')
AddEventHandler('telegive', function()
    local source = source
    local item = "tele"
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(item, 1)
    TriggerClientEvent('esx:showNotification', source, "Vous avez volé la télé !")
end)


---- Poste Radio Give


RegisterNetEvent('posteradiogive')
AddEventHandler('posteradiogive', function()
    local source = source
    local item = "posteradio"
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(item, 1)
    TriggerClientEvent('esx:showNotification', source, "Vous avez volé le poste Radio !")
end)


----- Argent Give


RegisterNetEvent('argentgive')
AddEventHandler('argentgive', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local randomMoney = math.random(50,500)

    xPlayer.addMoney(randomMoney)
    TriggerClientEvent('esx:showNotification', source, "Vous avez volé "..randomMoney.." $")
end)


----- Statues Give


RegisterNetEvent('statuesgive')
AddEventHandler('statuesgive', function()
    local source = source
    local item = "statuevole"
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(item, 1)
    TriggerClientEvent('esx:showNotification', source, "Vous avez volé la statue !")
end)


------ Bijoux Give


RegisterNetEvent('bijouxgive')
AddEventHandler('bijouxgive', function()
    local source = source
    local item = "bijoux"
    local xPlayer = ESX.GetPlayerFromId(source)
    local bij = math.random(5,25)

    xPlayer.addInventoryItem(item, bij)
    TriggerClientEvent('esx:showNotification', source, "Vous avez volé "..bij.." bijoux !")
end)



---- Revente télé


RegisterNetEvent('resellT')
AddEventHandler('resellT', function()
    local source = source
    local item = "tele"
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= 1 then
        xPlayer.removeInventoryItem(item, nbitemdansinventaire)
        xPlayer.addMoney(nbitemdansinventaire*Config.TvPrice)
        local needMe = nbitemdansinventaire*Config.TvPrice
        TriggerClientEvent('esx:showNotification', source, "Vous avez vendu "..nbitemdansinventaire.." teles pour "..needMe.." $")
    else
        TriggerClientEvent('esx:showNotification', source, "Tu n'as pas de tele à vendre")
    end
end)


---- Revente Poste Radio


RegisterNetEvent('resellR')
AddEventHandler('resellR', function()
    local source = source
    local item = "posteradio"
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= 1 then
        xPlayer.removeInventoryItem(item, nbitemdansinventaire)
        xPlayer.addMoney(nbitemdansinventaire*Config.RadioPrice)
        local needMe = nbitemdansinventaire*Config.RadioPrice
        TriggerClientEvent('esx:showNotification', source, "Vous avez vendu "..nbitemdansinventaire.." poste(s) radio pour "..needMe.." $")
    else
        TriggerClientEvent('esx:showNotification', source, "Tu n'as pas de poste radio à vendre")
    end
end)



---- Revente Bijoux


RegisterNetEvent('resellB')
AddEventHandler('resellB', function()
    local source = source
    local item = "bijoux"
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= 1 then
        xPlayer.removeInventoryItem(item, nbitemdansinventaire)
        xPlayer.addMoney(nbitemdansinventaire*Config.BijouxPrice)
        local needMe = nbitemdansinventaire*Config.BijouxPrice
        TriggerClientEvent('esx:showNotification', source, "Vous avez vendu "..nbitemdansinventaire.." bijoux pour "..needMe.." $")
    else
        TriggerClientEvent('esx:showNotification', source, "Tu n'as pas de bijoux à vendre")
    end
end)


---- Revente Statues

RegisterNetEvent('resellS')
AddEventHandler('resellS', function()
    local source = source
    local item = "statue"
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= 1 then
        xPlayer.removeInventoryItem(item, nbitemdansinventaire)
        xPlayer.addMoney(nbitemdansinventaire*Config.StatuePrice)
        local needMe = nbitemdansinventaire*Config.StatuePrice
        TriggerClientEvent('esx:showNotification', source, "Vous avez vendu "..nbitemdansinventaire.." statue pour "..needMe.." $")
    else
        TriggerClientEvent('esx:showNotification', source, "Tu n'as pas de statue à vendre")
    end
end)

------- Bucket

RegisterServerEvent("evId:setPlayerToBucket")
AddEventHandler("evId:setPlayerToBucket", function(id)
  SetPlayerRoutingBucket(source, id)
end)

RegisterServerEvent("evId:setPlayerToNormalBucket")
AddEventHandler("evId:setPlayerToNormalBucket", function()
  SetPlayerRoutingBucket(source, 0)
end)




