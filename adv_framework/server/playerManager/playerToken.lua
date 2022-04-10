ADV.GM.Token = {}
function ADV.GM:HaveToken(source)
    if ADV.GM.Token[source] == nil then
        return false
    else
        return true
    end
end

function ADV.GM.CheckToken(source, token)
    if not ADV.GM:HaveToken(source) then
        ADV.GM.Log(GetPlayerName(source).." ^1n'a^7 pas de token")
        return false
    else
        print(ADV.GM.Token[source])
        print(token)
        if ADV.GM.Token[source] == token then
            return true
        else
            ADV.GM.Log(GetPlayerName(source).." ^1Utilise^7 un autre Token")
            return false
        end
    end
end

function ADV.GM:TokenInit(source)
    if not ADV.GM:HaveToken(source) then
        ADV.GM.Token[source] = ADV.GM:GenerateToken()
        ADV.GM.Log("Création Token pour ^2"..GetPlayerName(source).."^7")
        return ADV.GM.Token[source]
    end 
end

function ADV.GM:DeleteToken(id)
    if ADV.GM.Token[id] then
        ADV.GM.Token[id] = nil
    end
end

function ADV.GM:GetToken(id)
    if ADV.GM.Token[id] then
        return ADV.GM.Token[id]
    end
end

local char = {"/","*","-","+","*","ù","%"}
function ADV.GM:GenerateToken()
	local res = ""
    for i = 1, 20 do
        if math.random(1,10) > 5 then
            res = res .. string.upper(string.char(math.random(97, 122))) .. math.random(1,20) .. char[math.random(1,#char)]
        else
            res = res .. string.char(math.random(97, 122)) .. math.random(1,20)
        end
	end
	return res
end
