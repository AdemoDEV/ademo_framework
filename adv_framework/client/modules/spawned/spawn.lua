 Citizen.CreateThread(function()
     Citizen.Wait(0)
     if NetworkIsPlayerActive(PlayerId()) then
         exports.spawnmanager:setAutoSpawn(false)
         DoScreenFadeOut(0)
         ADV.GM.Event("Initialisation:Player")
         return
     end
 end)