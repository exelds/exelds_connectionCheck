Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		TriggerServerEvent('ExeLds:getConnectionInfo', GetCloudTimeAsInt())  
	end
end)
