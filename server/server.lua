local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('dumpsterdiving:server:startDumpsterTimer')
AddEventHandler('dumpsterdiving:server:startDumpsterTimer', function(dumpster)
    startTimer(source, dumpster)
end)

RegisterServerEvent('dumpsterdiving:server:giveDumpsterReward')
AddEventHandler('dumpsterdiving:server:giveDumpsterReward', function()
    local src = tonumber(source)
    local item = {}
    local Player = QBCore.Functions.GetPlayer(src)
	local randomNumber = math.random(1,100)
	
	if randomNumber > 0 and randomNumber <= 90 then
		local _subRan = math.random(1,11)
		if _subRan == 1 then
			Player.Functions.AddItem('plastic', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['plastic'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found some plastic', 'success')
		elseif _subRan == 2 then
			Player.Functions.AddItem('metalscrap', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['metalscrap'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found some metal scrap', 'success')
		elseif _subRan == 3 then
			Player.Functions.AddItem('copper', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['copper'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found some copper', 'success')
		elseif _subRan == 4 then
			Player.Functions.AddItem('aluminum', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['aluminum'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found some aluminum', 'success')
		elseif _subRan == 5 then
			Player.Functions.AddItem('iron', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['iron'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found some iron', 'success')
		elseif _subRan == 6 then
			Player.Functions.AddItem('steel', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['steel'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found some steel', 'success')
		elseif _subRan == 7 then
			Player.Functions.AddItem('rubber', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rubber'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found some rubber', 'success')
		elseif _subRan == 8 then
			Player.Functions.AddItem('glass', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['glass'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found some glass', 'success')
		elseif _subRan == 9 then
			Player.Functions.AddItem('sandwich', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['sandwich'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found a sandwich', 'success')
		elseif _subRan == 10 then
			Player.Functions.AddItem('water_bottle', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['water_bottle'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found some water', 'success')
		else
			TriggerClientEvent('QBCore:Notify', src, 'You did not find anything!', 'error')
		end
		
	elseif randomNumber > 90 and randomNumber <= 100 then
		local _subRan = math.random(1,7)
		if _subRan == 1 then
			Player.Functions.AddItem('weed_white-widow_seed', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_white-widow_seed'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found a white widow seed', 'success')
		elseif _subRan == 2 then
			Player.Functions.AddItem('weed_skunk_seed', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_skunk_seed'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found a skunk seed', 'success')
		elseif _subRan == 3 then
			Player.Functions.AddItem('weed_purple-haze_seed', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_purple-haze_seed'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found a purple haze seed', 'success')
		elseif _subRan == 4 then
			Player.Functions.AddItem('weed_og-kush_seed', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_og-kush_seed'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found a og kush seed', 'success')
		elseif _subRan == 5 then
			Player.Functions.AddItem('weed_amnesia_seed', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_amnesia_seed'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found a amnesia seed', 'success')
		elseif _subRan == 6 then
			Player.Functions.AddItem('weed_ak47_seed', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_ak47_seed'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you found a ak47 seed', 'success')
		else
			TriggerClientEvent('QBCore:Notify', src, 'You did not find anything!', 'error')
		end
    end
end)

function startTimer(id, object)
    local timer = 10 * 60000

    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            TriggerClientEvent('dumpsterdiving:client:removeDumpster', id, object)
        end
    end
end