ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

DISCORD_WEBHOOK = Config.DiscordWebhook
DISCORD_NAME = "ExeLds Log"
DISCORD_IMAGE = "https://i.hizliresim.com/1u4e68.png"


RegisterServerEvent('ExeLds:getConnectionInfo')
AddEventHandler('ExeLds:getConnectionInfo', function(time) 
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local serverTime = os.time() 
		local clientTime = time  
		local difference = serverTime - clientTime 
		if difference > Config.toleransDegeri then
			DropPlayer(source, "Bağlantınız kesildiği için sunucudan atıldınız.")
			print(xPlayer.name.." isimli oyuncu bağlantısı kesildiği için sunucudan atıldı.")
			sendToDiscord(DISCORD_NAME, xPlayer.name.." isimli oyuncu bağlantısı "..Config.toleransDegeri.." saniyeden fazla kesik kaldığı için sunucudan atıldı.", 65508)
		end
	end
end)


function sendToDiscord(name, message, color)
  local connect = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
            },
        }
    }
  PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end
