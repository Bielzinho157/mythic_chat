RegisterNetEvent('mythic_chat:client:ReceiveMe')
AddEventHandler('mythic_chat:client:ReceiveMe', function(sender, message)
  print("Recieved Packet From Server For /me, Checking If Near Sender")
  local me = PlayerId()
  local senderClient = GetPlayerFromServerId(sender)
  if senderClient == me then
    Citizen.CreateThread(function()
      local timer = 1

      while timer <= 500 do
        local senderPos = GetEntityCoords(GetPlayerPed(senderClient))
        exports['mythic_base']:Print3DText(senderPos, message)
        timer = timer + 1

        Citizen.Wait(1)
      end
    end)
  elseif GetDistanceBetweenCoords(senderPos, GetEntityCoords(GetPlayerPed(me)), true) < 20.0 then
    if HasEntityClearLosToEntity(GetPlayerPed(me), GetPlayerPed(senderClient), 17 ) then
      Citizen.CreateThread(function()
        local timer = 1

        while timer <= 500 do
          local senderPos = GetEntityCoords(GetPlayerPed(senderClient))
          exports['mythic_base']:Print3DText(senderPos, message)
          timer = timer + 1

          Citizen.Wait(1)
        end
      end)
    end
  end
end)

RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  end
end)

RegisterNetEvent('sendProximityMessageMe')
AddEventHandler('sendProximityMessageMe', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 " .. name .." ".."^6 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 " .. name .." ".."^6 " .. message)
  end
end)

RegisterNetEvent('sendProximityMessageDo')
AddEventHandler('sendProximityMessageDo', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^0* " .. name .."  ".."^0  " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^0* " .. name .."  ".."^0  " .. message)
  end
end)