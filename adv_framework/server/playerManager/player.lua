ADV.GM.Player = {}
ADV.GM.Player.Index__ = ADV.GM.Player

setmetatable(ADV.GM.Player, {
    __call = function(_, source_player)
        local self = setmetatable({}, ADV.GM.Player)
            self.source = source_player
            self.license = ADV.GM.GetIdentifier(self.source, "license")
            self.name = GetPlayerName(self.source)
            self.group = Framework.StartingPlayer.Group
            self.position = {x = -1757.135, y = 427.63, z = 127.68}
            self.token = ADV.GM:TokenInit(self.source)
            self.account = {money = Framework.StartingPlayer.Money, bank = Framework.StartingPlayer.Bank, black = Framework.StartingPlayer.Black}
            self.inventory = {}
            self.weight = 0
            self.job = {job = Framework.StartingPlayer.Job, grade = Framework.StartingPlayer.Job_grade, grade_label = ADV.GM.Job:GetLabelJob(Framework.StartingPlayer.Job), boss = false}
            self.org = {org = Framework.StartingPlayer.Org, grade = Framework.StartingPlayer.Org_grade, grade_label = ADV.GM.Job2:GetLabelJob(Framework.StartingPlayer.Org), boss = false}

            function self.GetInv()
                return self.inventory
            end

            function self.setJob(job, grade)
                if job ~= nil then
                    if grade ~= nil then
                        self.job.job = job 
                        self.job.grade = grade 
                        self.job.grade_label = ADV.GM.Job:GetLabelJob(job)
                        self.job.boss = ADV.GM.Job:GetIsBoss(job, grade)
                        TriggerClientEvent("ademo_core:handlerjob", self.source, "job", self.job)
                    end
                end
            end
            
            function self.setJob2(job2, grade)
                if job2 ~= nil then
                    if grade ~= nil then
                        self.org.org = job2
                        self.org.grade = grade 
                        self.org.grade_label = ADV.GM.Job2:GetLabelJob(job2)
                        self.org.boss = ADV.GM.Job2:GetIsBoss2(job2, grade)
                        TriggerClientEvent("ademo_core:handlerjob", self.source, "job2", self.org)
                    end
                end
            end

            function self.GetWeight()
                local inventory = self.GetInv()
                local count = 0
                for k,v in pairs(inventory) do
                    local masse = v.count * ADV.GM.Items:GetWeightItem(v.name)
                    count = count + masse
                    self.weight = count
                end 
                return count
            end

            function self.Additem(item, count)
                local inventory = self.GetInv()
                if ADV.GM.Items:GetItem(item) then
                     if inventory[item] == nil then
                         inventory[item] = {name = ADV.GM.Items:GetNameItem(item), count = count}
                         self.GetWeight()
                     else
                         inventory[item].count = inventory[item].count + count
                         self.GetWeight()
                     end
                     TriggerClientEvent("ademo_core:handlerInv", self.source, self.inventory, self.weight)
                else
                    print("Item Existe Pas")
                end

            end

            function self.AddMoney(type, count)
                if type == "money" then            
                    self.account.money = self.account.money + count
                elseif type == "dirty" then
                    self.account.black = self.account.black + count
                elseif type == "bank" then
                    self.account.bank = self.account.bank + count
                end
                TriggerClientEvent("ademo_core:handlermoney", self.source, self.account, type, tonumber(count))
            end

            function self.RmvMoney(type, count)
                if type == "money" then
                    local money = self.account.money
                    if money - count == 0 then
                        money = 0
                    else
                        money = money - count
                    end
                elseif type == "dirty" then
                    local dirty = self.account.black
                    if dirty - count == 0 then
                        dirty = 0
                    else
                        dirty = dirty - count
                    end
                elseif type == "bank" then
                    local bank = self.account.bank
                    if bank - count == 0 then
                        bank = 0 
                    else
                        bank = bank - count
                    end
                end
                TriggerClientEvent("ademo_core:handlermoney", self.source, self.account)
            end

            function self.RmvItem(item, count)
                local inventory = self.GetInv()
                if inventory[item] then
                    if inventory[item].count - count == 0 then
                        inventory[item] = nil
                        self.GetWeight()
                    else
                        inventory[item].count = inventory[item].count - count
                        self.GetWeight()
                    end
                    TriggerClientEvent("ademo_core:handlerInv", self.source, self.inventory, self.weight)
                else
                    print("Item existe pas dans ton inventaire batard")
                end
            end

        return self
    end
})

function ADV.GM:GetPlayer(source)
    if ADV.GM.Player[source] ~= nil then
        return ADV.GM.Player[source]
    else
        ADV.GM.Log("Joueur ^1non-existant^7")
        return false
    end
end

