
 Citizen.CreateThread(function()
     while true do
         if IsPedRunning(PlayerPedId()) then 
            RemoveFaim(0.060)
            RemoveSoif(0.060)
         elseif IsPedSprinting(PlayerPedId()) then
            RemoveFaim(0.080)
            RemoveSoif(0.080)
         else
            RemoveFaim(0.040)
            RemoveSoif(0.040)
         end
         Wait(5 * 1000)
     end
 end)

function RemoveFaim(count)
    GM.Faim = GM.Faim - count
    if GM.Faim - count == 60 then
        GM.Utils.ShowNotification("Vous ~o~commencez~s~ à avoir faim")
    elseif GM.Faim - count == 40 then
        GM.Utils.ShowNotification("Vous ~r~devez~s~ manger sinon vous allez ~r~mourir~s~ de faim !")
    elseif GM.Faim - count == 10 then
        GM.Utils.ShowNotification("Mangez ! . Vous allez ~r~mourir~s~ de faim !")
    end

    if GM.Faim < 0 then
        GM.Faim = 0
    end

    if GM.Faim == 0 then      
        GM.Faim = 0
        SetEntityHealth(PlayerPedId(), 0)
        GM.Utils.ShowNotification("Vous étes ~r~rentré~s~ dans un coma !")
    end
end

function RemoveSoif(count)
    GM.Soif = GM.Soif - count
    if GM.Soif - count == 55 then
        GM.Utils.ShowNotification("Vous ~o~commencez~s~ à avoir soif")
    elseif GM.Soif - count == 35 then
        GM.Utils.ShowNotification("Vous ~r~devez~s~ boire sinon vous allez ~r~mourir~s~ de soif !")
    elseif GM.Soif - count == 5 then
        GM.Utils.ShowNotification("Buvez ! . Vous allez ~r~mourir~s~ de soif !")
    end

    if GM.Soif < 0 then
        GM.Soif = 0
    end

    if GM.Soif == 0 then      
        GM.Soif = 0
        SetEntityHealth(PlayerPedId(), 0)
        GM.Utils.ShowNotification("Vous étes ~r~rentré~s~ dans un coma !")
    end
end

function AddFaim(count)
    if GM.Faim > 0 then
        NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false) 
        GM.Faim = GM.Faim + count
    else
        GM.Faim = GM.Faim + count
    end
end

function AddSoif(count)
    if GM.Soif > 0 then
        NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false) 
        GM.Soif = GM.Soif + count
    else
        GM.Soif = GM.Soif + count
    end
end

RegisterCommand("revive", function()
    NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false) 
end)

RegisterCommand("die", function()
    GM.Soif = 0
    SetEntityHealth(PlayerPedId(), 0)
end)