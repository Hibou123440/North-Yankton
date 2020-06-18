_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Airport", "Buy Plane Tickets!")
_menuPool:Add(mainMenu)

function AddMenuPlane(menu)
	local Item = NativeUI.CreateItem("Fly to North Yankton!", "Take a trip!")
    Item.Activated = function(ParentMenu, SelectedItem)
		if nyat == false and lsat == true then
			NYfly()
			nyat = true
			lsat = false
		elseif nyat == true then
			ShowNotification("You are already here goofball!")
		end
    end
    menu:AddItem(Item)
	local Item = NativeUI.CreateItem("Fly to San Andreas!", "Take a trip!")
    Item.Activated = function(ParentMenu, SelectedItem)
		if lsat == false and nyat == true then
			LSfly()
			nyat = false
			lsat = true
		elseif lsat == true then
			ShowNotification("You are already here goofball!")
		end
    end
    menu:AddItem(Item)
end

AddMenuPlane(mainMenu)
_menuPool:MouseControlsEnabled(false)
_menuPool:ControlDisablingEnabled(false)
_menuPool:RefreshIndex()

local coords = {
  {x=5343.38, y=-5200.4, z=83.26}, -- LSIA
  {x=-1042.27, y=-2745.06, z=21.36}, -- North Yankton
}

DrawText3D = function(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local scale = 0.45 
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.030 + factor , 0.030, 66, 66, 66, 150)
	end
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

CreateThread(function()
    while true do
        Wait(0)
        _menuPool:ProcessMenus()
    end
end)

AddEventHandler('onClientMapStart', function(source)
	AddBlips()
end)

function AddBlips()
    for _, info in pairs(coords) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, 90)
	  SetBlipAsShortRange(info.blip, true)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, 3)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Airport")
      EndTextCommandSetBlipName(info.blip)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(coords) do
            -- Draw Marker Here --
            DrawMarker(7, coords[k].x, coords[k].y, coords[k].z, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 1.5001, 255, 255, 255, 200, 1, 0, 0, 3)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(coords) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, coords[k].x, coords[k].y, coords[k].z)
            if dist <= 1.2 then
			DrawText3D(coords[k].x, coords[k].y, coords[k].z, "~r~Press E to open menu.")
				if IsControlJustPressed(1,51) then -- "E"
					mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)
