ADV = {}
ADV.GM = {}
ADV.GM.Spawned = false
ADV.GM.Source = nil
ADV.GM.License = nil
ADV.GM.Job = {}
ADV.GM.Org = {}
ADV.GM.Group = nil
ADV.GM.Account = {}
ADV.GM.Inv = {}
ADV.GM.Weight = 40.0
ADV.GM.Name = nil
ADV.GM.Token = nil

GM = {}
GM.Faim = 100
GM.Soif = 100
GM.Death = false



RegisterNetEvent("Initialisation:Client")
AddEventHandler("Initialisation:Client", function(object)
    DoScreenFadeOut(2000)
    Wait(2000)
    DoScreenFadeIn(1000)
    SetEntityCoordsNoOffset(PlayerPedId(), object.position.x, object.position.y, object.position.z, 0, 0, 0)
    ADV.GM.Source = object.source
    ADV.GM.License = object.License
    ADV.GM.Group = object.group
    ADV.GM.Account = {money = object.account.money, bank = object.account.bank, black = object.account.black}
    ADV.GM.Inv = object.inventory
    ADV.GM.Weight = object.weight
    ADV.GM.Spawned = true
    ADV.GM.Token = object.token
    ADV.GM.Job = {name = object.job.job, grade = object.job.grade, label = object.job.grade_label, boss = object.job.boss}
    ADV.GM.Org = {name = object.org.org, grade = object.org.grade, label = object.org.grade_label, boss = object.org.boss}
    SendNUIMessage({
        firt = true,
        money = ADV.GM.Account.money,
        dirty = ADV.GM.Account.black,
        bank = ADV.GM.Account.bank,
        job =  ADV.GM.Job.name.." - "..ADV.GM.Job.label,
        job2 = ADV.GM.Org.name.." - "..ADV.GM.Org.label
    })

    if not GM.Death then
        NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false) 
    end
end)


RegisterNetEvent("ademo_core:handlerjob")
AddEventHandler("ademo_core:handlerjob", function(type, object)
    if type == "job" then
        ADV.GM.Job.name = object.job
        ADV.GM.Job.grade = object.grade
        ADV.GM.Job.label = object.grade_label
        ADV.GM.Job.boss = object.boss
    elseif type == "job2" then
        ADV.GM.Org.name = object.org
        ADV.GM.Org.grade = object.grade
        ADV.GM.Org.label = object.grade_label
        ADV.GM.Org.boss = object.boss
    end
end)

RegisterNetEvent("ademo_core:handlermoney")
AddEventHandler("ademo_core:handlermoney", function(object, type, amount)
    SendNUIMessage({
        addmoney = true,
        type = type,
        count = amount,
    })
    ADV.GM.Account = {money = object.money, bank = object.bank, black = object.black}
end)

RegisterNetEvent("ademo_core:handlerInv")
AddEventHandler("ademo_core:handlerInv", function(inv, weight)
    ADV.GM.Inv = inv
    ADV.GM.Weight = weight
end)

RegisterNetEvent("ademo_core:TokenRecup")
AddEventHandler("ademo_core:TokenRecup", function(cb)
    CreateThread(function() 
        while ADV.GM.Token == nil do 
            Wait(10)
        end 
        cb(ADV.GM.Token)
    end)
end)

RegisterCommand("info", function()
    print("Money: "..ADV.GM.Account.money)
    print("Bank: "..ADV.GM.Account.bank)
    print("Dirty: "..ADV.GM.Account.black)
    print("Weight: "..ADV.GM.Weight.."/40")
    print("Job: "..ADV.GM.Job.label, ADV.GM.Job.grade)
    print("Org: "..ADV.GM.Org.label, ADV.GM.Org.grade)
    print(" -----------     Inventaire     -----------")
    print(json.encode(ADV.GM.Inv))
end)

