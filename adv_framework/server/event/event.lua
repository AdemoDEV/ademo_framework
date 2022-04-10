ADV.GM.Event = {}

local charNum = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}
function GenerateToken()
    local newToken = ""
    for i = 1 , 12 do
        newToken = string.format("%s %s", newToken, charNum[(math.random(1, #charNum))])
    end
    return newToken
end

function ADV.GM.TriggerEvent(source, eventName, ...)
    local token = GenerateToken()
    local name = string.format("%s,%s", token, eventName)
    local EventRegistered = AddEventHandler(name, function(source, eventName, ...) 
        if ADV.GM.Event[eventName] then
            ADV.GM.Event[eventName].data(source, ...)
        else
            ADV.GM.Log(GetPlayerName(source).." Déclanche un event ^1interdit^7")
        end
    end)
    TriggerEvent(name, source, eventName)
    RemoveEventHandler(EventRegistered)
end

function ADV.GM.RegisterEvent(name, data)
    ADV.GM.Log("New Registered Event ^5"..name.."^7")
    if ADV.GM.Event[name] == nil then
        ADV.GM.Event[name] = {data = data}
    end
end

local EventDefault = "Initialisation:Player"
RegisterNetEvent("adv_event")
AddEventHandler("adv_event", function(eventName, ...)
    local source = source
    if eventName == EventDefault then
        ADV.GM.TriggerEvent(source, eventName, ...)
    else
        if ADV.GM.CheckToken(source, ADV.GM:GetToken(source)) then
            ADV.GM.TriggerEvent(source, eventName, ...)
        end
    end
end)