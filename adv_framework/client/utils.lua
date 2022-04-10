GM.Utils = {}

function GM.Utils.ShowNotification(msg)
    SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end