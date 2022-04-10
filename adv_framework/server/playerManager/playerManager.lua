
function ADV.GM:CreatePlayer(id)
    local player = ADV.GM.Player(id)
    ADV.GM.Player[id] = player
    ADV.GM.Log("Un ^2Nouveau^7 Joueur crée dans le cache ^4Dynamique^7")
end

function ADV.GM:RemovePlayer(id)
    if ADV.GM.Player[id] then
        ADV.GM:SaveBdd(id)
        ADV.GM.Player[id] = nil
        ADV.GM:DeleteToken(id)
        ADV.GM.Log("Un Joueur ^1Effacer^7 du cache ^4Dynamique^7")
    end
end

function ADV.GM:SaveBdd(id)
    local cache = ADV.GM:GetPlayer(id)
    local job = {job = cache.job.job, grade = cache.job.grade}
    local org = {org = cache.org.org, grade = cache.job.grade}
    local inventory = {inv = cache.inventory, weight = cache.weight}
    local coords = GetEntityCoords(GetPlayerPed(id))
    local position = {x = coords.x, y = coords.y, z = coords.z}
    exports.oxmysql:execute("UPDATE `adv_players` SET `accounts` = ?, `job` = ?, `org` = ?, `group` = ?, `inventory` = ?, `pos` = ? WHERE `license` = ?", {
        json.encode(cache.account),
        json.encode(job),
        json.encode(org),
        cache.group,
        json.encode(inventory),
        json.encode(position),
        cache.license,
    })
    ADV.GM.Log("Un Joueur ^1SAVE^7 BDD^7")
end

ADV.GM.RegisterEvent("Initialisation:Player", function(source)
    local source = source
    ADV.GM:CreatePlayer(source)
    local cache = ADV.GM:GetPlayer(source)
    local player_db = exports.oxmysql:executeSync('SELECT * FROM adv_players WHERE license = ?', {cache.license})
    if player_db[1] then
        for _, player in pairs(player_db) do
            local acccounts = json.decode(player.accounts)
            local inventory = json.decode(player.inventory)
            local positions = json.decode(player.pos)
            local job = json.decode(player.job)
            local org = json.decode(player.org)
            cache.account.money = acccounts.money
            cache.account.bank = acccounts.bank
            cache.account.black = acccounts.black
            cache.group = player.group
            if inventory == nil then
                cache.inventory = {}
                cache.weight = 0
            else
                if inventory.inv == nil then
                    cache.inventory = {}
                else
                    cache.inventory = inventory.inv
                end

                if inventory.weight == nil then
                    cache.weight = 0
                else
                    cache.weight = inventory.weight
                end
            end
            cache.job = {job = job.job, grade = job.grade, grade_label = ADV.GM.Job:GetLabelJob(job.job), boss = ADV.GM.Job:GetIsBoss(job.job, job.grade)}
            cache.org = {org = org.org, grade = org.grade, grade_label = ADV.GM.Job2:GetLabelJob(org.org), boss = ADV.GM.Job2:GetIsBoss2(org.org, org.grade)}
            cache.position = {x = positions.x, y = positions.y, z = positions.z} 
        end
        TriggerClientEvent("Initialisation:Client", source, cache)
        ADV.GM.Log("^3"..cache.name.."^7 Trouver en ^5BDD^7")
    else
        local job = {job = cache.job, grade = cache.job_grade}
        local org = {org = cache.org, grade = cache.org_grade}
        local inventory = {inv = {}, weight = 40.0}
        local accounts = {money = cache.account.money, bank = cache.account.bank, black = cache.account.black}
        local position = {x = cache.position.x, y = cache.position.y, z = cache.position.z}
        exports.oxmysql:insert("INSERT INTO adv_players (license, name, accounts, job, org, inventory, pos) VALUES (?,?,?,?,?,?,?)", {
            cache.license,
            cache.name,
            json.encode(accounts),
            json.encode(job),
            json.encode(org),
            json.encode(inventory),
            json.encode(position)
        })
        TriggerClientEvent("Initialisation:Client", source, cache)
        ADV.GM.Log("^3Nouveau^7 Joueur Enregistrer en ^5BDD^7")
    end
end)


RegisterCommand("save", function()
    ADV.GM:SaveBdd(1)
end)