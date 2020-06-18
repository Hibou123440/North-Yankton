local nyat = false
local lsat = true

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

function NYfly()
	DoScreenFadeOut(1000) --first part
	Wait(1000)
	NYIpl()
	
	SetEntityCoords(GetPlayerPed(-1), tonumber(514.77), tonumber(4752.67), tonumber(-69) + 0.0, 1, 0, 0, 1) --part two
	SetEntityHeading(GetPlayerPed(-1), 174.76)
	FreezeEntityPosition(GetPlayerPed(-1), true)
	Wait(1000)
	FreezeEntityPosition(GetPlayerPed(-1), false)
	
	DoScreenFadeIn(1000) --part three
	anim = true
	Wait(10000)
	
	DoScreenFadeOut(1000)
	
	Wait(1000)
	anim = false
	SetEntityCoords(GetPlayerPed(-1), tonumber(5338.01), tonumber(-5215.3), tonumber(81.71) + 0.0, 1, 0, 0, 1)
	SetEntityHeading(GetPlayerPed(-1), 275.27)
	FreezeEntityPosition(GetPlayerPed(-1), true) -- go sure that he does not fall through the map.
	SetDrawMapVisible(true)
	Wait(8000)
	FreezeEntityPosition(GetPlayerPed(-1), false) --unfreeze him.
	DoScreenFadeIn(1000)
	inNY = true
end

function LSfly()
	DoScreenFadeOut(1000) --first part
	Wait(1000)
	unlNYipl()
	
	SetEntityCoords(GetPlayerPed(-1), tonumber(514.77), tonumber(4752.67), tonumber(-69) + 0.0, 1, 0, 0, 1) --part two
	SetEntityHeading(GetPlayerPed(-1), 174.76)
	FreezeEntityPosition(GetPlayerPed(-1), true)
	SetDrawMapVisible(false)
	Wait(1000)
	
	DoScreenFadeIn(1000) --part three
	FreezeEntityPosition(GetPlayerPed(-1), false)
	anim = true
	Wait(10000)
	
	DoScreenFadeOut(1000)
	
	Wait(1000)
	anim = false
	SetEntityCoords(GetPlayerPed(-1), tonumber(-1038.64), tonumber(-2739.79), tonumber(19.17) + 0.0, 1, 0, 0, 1)
	SetEntityHeading(GetPlayerPed(-1), 327.68)
	FreezeEntityPosition(GetPlayerPed(-1), true) -- go sure that he does not fall through the map.
	Wait(2000)
	FreezeEntityPosition(GetPlayerPed(-1), false) --unfreeze him.
	DoScreenFadeIn(1000)
	inNY = false
end

function NYIpl()
--load unloaded ipl's
  LoadMpDlcMaps()
  EnableMpDlcMaps(true)
  RequestIpl("FIBlobbyfake")
  RequestIpl("DT1_03_Gr_Closed")
  RequestIpl("v_tunnel_hole")
  RequestIpl("TrevorsMP")
  RequestIpl("TrevorsTrailer")
  RequestIpl("farm")
  RequestIpl("farmint")
  RequestIpl("farmint_cap")
  RequestIpl("farm_props")
  RequestIpl("CS1_02_cf_offmission")
  RequestIpl("prologue01")
  RequestIpl("prologue01c")
  RequestIpl("prologue01d")
  RequestIpl("prologue01e")
  RequestIpl("prologue01f")
  RequestIpl("prologue01g")
  RequestIpl("prologue01h")
  RequestIpl("prologue01i")
  RequestIpl("prologue01j")
  RequestIpl("prologue01k")
  RequestIpl("prologue01z")
  RequestIpl("prologue02")
  RequestIpl("prologue03")
  RequestIpl("prologue03b")
  RequestIpl("prologue04")
  RequestIpl("prologue04b")
  RequestIpl("prologue05")
  RequestIpl("prologue05b")
  RequestIpl("prologue06")
  RequestIpl("prologue06b")
  RequestIpl("prologue06_int")
  RequestIpl("prologuerd")
  RequestIpl("prologuerdb ")
  RequestIpl("prologue_DistantLights")
  RequestIpl("prologue_LODLights")
  RequestIpl("prologue_m2_door")  
end

function unlNYipl()
  LoadMpDlcMaps()
  EnableMpDlcMaps(false)
  RemoveIpl("FIBlobbyfake")
  RemoveIpl("DT1_03_Gr_Closed")
  RemoveIpl("v_tunnel_hole")
  RemoveIpl("TrevorsMP")
  RemoveIpl("TrevorsTrailer")
  RemoveIpl("farm")
  RemoveIpl("farmint")
  RemoveIpl("farmint_cap")
  RemoveIpl("farm_props")
  RemoveIpl("CS1_02_cf_offmission")
  RemoveIpl("prologue01")
  RemoveIpl("prologue01c")
  RemoveIpl("prologue01d")
  RemoveIpl("prologue01e")
  RemoveIpl("prologue01f")
  RemoveIpl("prologue01g")
  RemoveIpl("prologue01h")
  RemoveIpl("prologue01i")
  RemoveIpl("prologue01j")
  RemoveIpl("prologue01k")
  RemoveIpl("prologue01z")
  RemoveIpl("prologue02")
  RemoveIpl("prologue03")
  RemoveIpl("prologue03b")
  RemoveIpl("prologue04")
  RemoveIpl("prologue04b")
  RemoveIpl("prologue05")
  RemoveIpl("prologue05b")
  RemoveIpl("prologue06b")
  RemoveIpl("prologue06_int")
  RemoveIpl("prologuerd")
  RemoveIpl("prologuerdb ")
  RemoveIpl("prologue_DistantLights")
  RemoveIpl("prologue_LODLights")
  RemoveIpl("prologue_m2_door") 
end
