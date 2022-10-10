ESX = nil
Objs={}
Citizen.CreateThread(function()
while ESX == nil do
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
Citizen.Wait(0)
end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.prop) do
        
        ESX.Game.SpawnObject(GetHashKey(v.name), vector3(v.coords.x,v.coords.y,v.coords.z), function(obj)
            SetEntityHeading(obj, v.coords.h)
            FreezeEntityPosition(obj , true)
            table.insert(Objs,{name=obj})
        end)
        -- print(GetHashKey(v.name))
    
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        for k,v in pairs(Objs) do
        ESX.Game.DeleteObject(v.name)
        end
    end 
  end)