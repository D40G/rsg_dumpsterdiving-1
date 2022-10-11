local QBCore = exports['qb-core']:GetCoreObject()

local searched = {3423423424}
local canSearch = true
local dumpsters = {218085040, 666561306, -58485588, -206690185, 1511880420, 682791951, 1329570871, 1614656839, 1437508529, 344662182}
local searchTime = 5000
local sleep = 0

Citizen.CreateThread(function()
    while true do
        sleep = 1500
        if canSearch then
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local dumpsterFound = false

            for i = 1, #dumpsters do
                local dumpster = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, dumpsters[i], false, false, false)
                local dumpPos = GetEntityCoords(dumpster)
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dumpPos.x, dumpPos.y, dumpPos.z, true)

                if dist < 1.8 then
                    sleep = 5
                    DrawText3D(dumpPos.x, dumpPos.y, dumpPos.z + 1.0, 'Press [~y~E~w~] to search bins')
                    if IsControlJustReleased(0, 38) then -- [E]
                        for i = 1, #searched do
                            if searched[i] == dumpster then
                                dumpsterFound = true
                            end
                            if i == #searched and dumpsterFound then
								QBCore.Functions.Notify("You\'ve already searched this bin...", "error")
                            elseif i == #searched and not dumpsterFound then
                                startSearching(searchTime, 'amb@prop_human_bum_bin@base', 'base', 'dumpsterdiving:server:giveDumpsterReward')
                                TriggerServerEvent('dumpsterdiving:server:startDumpsterTimer', dumpster)
                                table.insert(searched, dumpster)
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('dumpsterdiving:client:removeDumpster')
AddEventHandler('dumpsterdiving:client:removeDumpster', function(object)
    for i = 1, #searched do
        if searched[i] == object then
            table.remove(searched, i)
        end
    end
end)

-- Functions

function startSearching(time, dict, anim, cb)
    local animDict = dict
    local animation = anim
    local ped = GetPlayerPed(-1)

    canSearch = false

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(0)
    end
	
	QBCore.Functions.Progressbar("searching_dumpster", "Searching bin...", time, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	})
	TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, time, 1, 1, 0, 0, 0)

    local ped = GetPlayerPed(-1)

    Wait(time)
    ClearPedTasks(ped)
    canSearch = true
    TriggerServerEvent(cb)
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end