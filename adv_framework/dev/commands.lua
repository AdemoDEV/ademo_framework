
-- RegisterCommand("add", function(source)
--     ADV.GM:CreatePlayer(source, GetPlayerName(source))
-- end)

-- RegisterCommand("remove", function(source)
--     ADV.GM:RemovePlayer(source)
-- end)

-- RegisterCommand("get", function(source)
--     print(GetEntityCoords(GetPlayerPed(source)))
-- end)

----COMMANDES DU SERVEUR SYSTEME GROUP PLUTARD

RegisterCommand("additem", function (source, args)
    if source == 0 then
        local player = tonumber(args[1])
        local item = args[2]
        local count = args[3]
        local playercache = ADV.GM:GetPlayer(player)
        if playercache then
            playercache.Additem(item, count)
            ADV.GM.Log(("Give %s %s à %s"):format(count, item, GetPlayerName(player)))
        else
            ADV.GM.Log("Le joueur n'a pas été trouvé")
        end
    else
        local player = tonumber(args[1])
        local item = args[2]
        local count = args[3]
        local playercache = ADV.GM:GetPlayer(player)
        if playercache then
            playercache.Additem(item, count)
            ADV.GM.Log(("%s à Give %s %s à %s"):format(GetPlayerName(source), count, item, GetPlayerName(player)))
        else
            ADV.GM.Log("Le joueur n'a pas été trouvé")
        end
    end
end)

RegisterCommand("rmvitem", function (source, args)
    if source == 0 then
        local player = tonumber(args[1])
        local item = args[2]
        local count = args[3]
        local playercache = ADV.GM:GetPlayer(player)
        if playercache then
            playercache.RmvItem(item, count)
            ADV.GM.Log(("Remove %s %s de %s"):format(count, item, GetPlayerName(player)))
        else
            ADV.GM.Log("Le joueur n'a pas été trouvé")
        end
    else
        local player = tonumber(args[1])
        local item = args[2]
        local count = args[3]
        local playercache = ADV.GM:GetPlayer(player)
        if playercache then
            playercache.RmvItem(item, count)
            ADV.GM.Log(("%s à Remove %s %s de %s"):format(GetPlayerName(source), count, item, GetPlayerName(player)))
        else
            ADV.GM.Log("Le joueur n'a pas été trouvé")
        end
    end
end)

RegisterCommand("addmoney", function (source, args)
    if source == 0 then
        local player = tonumber(args[1])
        local type = args[2]
        local count = args[3]
        local playercache = ADV.GM:GetPlayer(player)
        if playercache then
            playercache.AddMoney(type, count)
            ADV.GM.Log(("[AddMoney] %s$ à %s"):format(count, GetPlayerName(player)))
        else
            ADV.GM.Log("Le joueur n'a pas été trouvé")
        end
    else
        local player = tonumber(args[1])
        local type = args[2]
        local count = args[3]
        local playercache = ADV.GM:GetPlayer(player)
        if playercache then
            playercache.AddMoney(type, count)
            ADV.GM.Log(("[AddMoney] %s$ à %s"):format(count, GetPlayerName(player)))
        else
            ADV.GM.Log("Le joueur n'a pas été trouvé")
        end
    end
end)

RegisterCommand("rmvmoney", function (source, args)
    if source == 0 then
        local player = tonumber(args[1])
        local type = args[2]
        local count = args[3]
        local playercache = ADV.GM:GetPlayer(player)
        if playercache then
            playercache.RmvMoney(type, count)
            ADV.GM.Log(("[RmvMoney] %s$ à %s"):format(count, GetPlayerName(player)))
        else
            ADV.GM.Log("Le joueur n'a pas été trouvé")
        end
    else
        local player = tonumber(args[1])
        local type = args[2]
        local count = args[3]
        local playercache = ADV.GM:GetPlayer(player)
        if playercache then
            playercache.RmvMoney(type, count)
            ADV.GM.Log(("[RmvMoney] %s$ à %s"):format(count, GetPlayerName(player)))
        else
            ADV.GM.Log("Le joueur n'a pas été trouvé")
        end
    end
end)


RegisterCommand("admoney", function (source, args)
    local playercache = ADV.GM:GetPlayer(1)
    playercache.AddMoney("money", 100)
end)



