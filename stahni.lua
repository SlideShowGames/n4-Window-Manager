verze = "21.0617.R1"
local tArgs = { ... }
local PastebinMode = false
local DevbinMode = false

if #tArgs < 2 then
    return
end

	if fs.exists("/C/system/RAM/online") then
	term.setBackgroundColor(colors.black)
		local data = fs.open("/C/system/RAM/online", "r")
		local Conser = data.readLine()
		if (Conser == "pastebin.com") then PastebinMode = true  DevbinMode = false
		elseif (Conser == "devbin.dev") then DevbinMode = true PastebinMode = false
		else DevbinMode = false PastebinMode = false end
		data.close()
	else DevbinMode = false PastebinMode = false end
	
if not http then
    return
end

local function extractId(paste)
    local patterns = {
        "^([%a%d]+)$",
        "^https?://pastebin.com/([%a%d]+)$",
        "^pastebin.com/([%a%d]+)$",
        "^https?://pastebin.com/raw/([%a%d]+)$",
        "^pastebin.com/raw/([%a%d]+)$",
    }

    for i = 1, #patterns do
        local code = paste:match(patterns[i])
        if code then return code end
    end

    return nil
end

local function get(url)
    local paste = extractId(url)
    if not paste then
        io.stderr:write("Invalid pastebin code.\n")
        io.write("The code is the ID at the end of the pastebin.com URL.\n")
        return
    end

    local cacheBuster = ("%x"):format(math.random(0, 2 ^ 30))
    local response, err = http.get(
        "https://pastebin.com/raw/" .. textutils.urlEncode(paste) .. "?cb=" .. cacheBuster
    )

    if response then
        -- If spam protection is activated, we get redirected to /paste with Content-Type: text/html
        local headers = response.getResponseHeaders()
        if not headers["Content-Type"] or not headers["Content-Type"]:find("^text/plain") then
            io.stderr:write("Failed.\n")
            return
        end

        local sResponse = response.readAll()
        response.close()
        return sResponse
    else
        io.stderr:write("Failed.\n")
    end
end

local function getdevbin( pasteid, filepath ) --#more descriptive variable names
  local handle = http.get( "https://devbin.dev/raw/" .. pasteid ) --#sometimes CC has problems with https
  if handle then --#if the request succeeded
    local file = fs.open( filepath, "w" )
    file.write( handle.readAll() )
    file.close()
    handle.close() --#always close web handles!
    return true --#we succeeded, return true
  end
  return false --#it didn't work, return false
end

if PastebinMode or DevbinMode then
	local cesta = tArgs[3]

	if (cesta == "/C/system/api/device.api") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "34aaDf4t"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "mjcr9z3b"
		end
	elseif (cesta == "/C/Programs/PepekSoft/smanager.lua") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "z02yAN3M"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "cn90fdux"
		end
	elseif (cesta == "/C/setting.lua") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "vxJjQzem"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "nhbaj5fb"
		end
	elseif (cesta == "/C/system/api/bluescreen.lua") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "DSNcZuMZ"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "ofep5qq2"
		end
	elseif (cesta == "/C/system/api/sound.api") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "Td7gSZZq"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "6mfywzvq"
		end
	elseif (cesta == "/C/system/api/print.api") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "VEfwuEHM"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "4sx3qe7f"
		end
	elseif (cesta == "/C/system/api/smbc.lua") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "gQVYieMJ"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "op7md1yp"
		end
	elseif (cesta == "/C/system/api/stahni.api") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "GssKCexp"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "can5mlrd"
		end
	elseif (cesta == "/C/system/api/commands.lua") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "r18V4xrG"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "kvbpbizu"
		end
	elseif (cesta == "/C/system/api/commander.lua") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "LY8cUArW"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "mjcr9z3b"
		end
	elseif (cesta == "/startup.lua") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "0xh6jEx1"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "nJ6DXtfN"
		end
	elseif (cesta == "/C/system/.core/desktop.lua") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "HyhMtGvd"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "dyxq5e3a"
		end
	elseif (cesta == "/C/system/api/APIS.lua") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "rt2e0GLX"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "yezxwowf"
		end
	elseif (cesta == "/C/system/RAM/AccountCreate.lua") then
		if PastebinMode then tArgs[1] = "get" tArgs[2] = "McRCnrpM"
		elseif DevbinMode then tArgs[1] = "getDev"  tArgs[2] = "8qEKn8A1"
		end
	end
end

local sCommand = tArgs[1]
if sCommand == "getDev" then
	getdevbin( tArgs[2], tArgs[3])
elseif sCommand == "get" then

    local sCode = tArgs[2]
    local sFile = tArgs[3]
    local sPath = shell.resolve(sFile)
    if fs.exists(sPath) then
        return
    end

    local res = get(sCode)
    if res then
        local file = fs.open(sPath, "w")
        file.write(res)
        file.close()
    end
elseif sCommand == "run" then
    local sCode = tArgs[2]

    local res = get(sCode)
    if res then
        local func, err = load(res, sCode, "t", _ENV)
        if not func then
            return
        end
        local success, msg = pcall(func, select(3, ...))
    end
else
    return
end