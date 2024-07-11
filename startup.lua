local basalt = require("/apis/basalt")
local main = basalt.createFrame()
local function makeResizeable(frame, minW, minH, maxW, maxH) -- Resizeable windows
    minW = minW or 4
    minH = minH or 4
    maxW = maxW or 99
    maxH = maxH or 99
    local btn = frame:addButton()
        :setPosition("parent.w-1", "parent.h-1")
        :setSize(1, 1)
        :setText("/")
        :setForeground(colors.blue)
        :setBackground(colors.black)
        :onDrag(function(self, event, btn, xOffset, yOffset)
            local w, h = frame:getSize()
            local wOff, hOff = w, h
            if(w+xOffset-1>=minW)and(w+xOffset-1<=maxW)then
                wOff = w+xOffset-1
            end
            if(h+yOffset-1>=minH)and(h+yOffset-1<=maxH)then
                hOff = h+yOffset-1
            end
            frame:setSize(wOff, hOff)
        end)
end
print("basalt needs to be installed") -- lazy way of telling the user that the ui isnt installed.
main:addTexture("wallpapers/low-sierra.bimg", true)
local menubar1 = main:addButton()
	:setPosition(2, 1)
	:setSize(10,1)
	:setText("Power Menu")
	:setBackground(colors.white)
	:setForeground(colors.black)
	 :onClick(
        function()
         local shutdownmenu = main:addMovableFrame("shm")
			:setSize(44, 15)
			:setSize(40,16)
			:setPosition(1, 1)
		makeResizeable(shutdownmenu, 8, 4)
		local titlebar = shutdownmenu:addPane() -- The bar to hold the text and buttons
			:setSize(50, 1)
			:setBackground(colors.gray)
		local titletext = shutdownmenu:addLabel()
			:setText("Shutdown Menu")
			:setFontSize(1)
			:setForeground(colors.white)
		local shutdownr = shutdownmenu:addProgram("shutdownmenus")
			:setBorder(colors.red)
			:execute("/sys/func/power.lua")
			:setSize(40, 13)
			:setPosition(1,2)
			
	 

local exit = shutdownmenu:addButton() -- Exit button
    :setText("X")
    :setHorizontalAlign("center")
    :setBackground(colors.red)
    :setForeground(colors.white)
    :setPosition(37, 1)
    :setSize(3,1)
    :onClick(
        function()
	basalt.removeFrame(shutdownr:getName())
        basalt.removeFrame(shutdownmenu:getName())
        end)
	
local exit = shutdownmenu:addButton() -- Full Screen button
    :setText("[]")
    :setHorizontalAlign("center")
    :setBackground(colors.blue)
    :setForeground(colors.white)
    :setPosition(33, 1)
    :setSize(3,1)
    :onClick(
        function()
	shutdownmenu:setPosition(1, 1)
        shutdownmenu:setSize(51, 19)
        end)

local exit = shutdownmenu:addButton() -- shade button
    :setText("-")
    :setHorizontalAlign("center")
    :setBackground(colors.yellow)
    :setForeground(colors.white)
    :setPosition(29, 1)
    :setSize(3,1)
    :onClick(
        function()
        shutdownmenu:setSize(40, 2)
        end)
end)
    
main:addPane()
	:setPosition(10, 18)
	:setSize(32, 3)
	:setBackground(colors.lightGray)
	:setTransparency(true)
	



local nedit = main:addButton() -- entry for the GUI text editor
	:setHorizontalAlign("center")
	:setVerticalAlign("center")
	:setPosition(18, 18)
	:setSize(3,2)
	:setText("#")
	:setBackground(colors.yellow)
	:setForeground(colors.black)
	 :onClick(
        function()
         local nedit = main:addMovableFrame():setSize(20, 14)
	  :setBorder(colors.yellow)
	  :setPosition(1, 1)
	local neditembed = nedit:addProgram()
	   :execute("/sys/apps/nedit.lua")
        end)
	
local musicplayer = main:addButton() -- hey just letting yk I didn't make it
	:setHorizontalAlign("center")
	:setVerticalAlign("center")
	:setPosition(35, 18)
	:setSize(3,2)
	:setText("(M)")
	:setBackground(colors.purple)
	:setForeground(colors.white)
	 :onClick(
        function()
         local mp = main:addMovableFrame():setSize(41, 11)
	 :setBorder(colors.green)
	 :setPosition(1, 1)
	 makeResizeable(mp, 8, 4)
        		local titlebar = mp:addPane() -- The bar to hold the text and buttons
			:setSize(50, 1)
			:setBackground(colors.gray)
		local titletext = mp:addLabel()
			:setText("Music Player")
			:setFontSize(1)
			:setForeground(colors.white)
		 local mpa = mp:addProgram()
			:setPosition(1,2)
			:setSize(40, 8)
			:execute("/sys/apps/musicplayer.lua")
			
	 

local exit = mp:addButton() -- Exit button
    :setText("X")
    :setHorizontalAlign("center")
    :setBackground(colors.red)
    :setForeground(colors.white)
    :setPosition(37, 1)
    :setSize(3,1)
    :onClick(
        function()
	basalt.removeFrame(mpa:getName())
        basalt.removeFrame(mp:getName())
        end)
	
local exit = mp:addButton() -- Full Screen button
    :setText("[]")
    :setHorizontalAlign("center")
    :setBackground(colors.blue)
    :setForeground(colors.white)
    :setPosition(33, 1)
    :setSize(3,1)
    :onClick(
        function()
	mp:setPosition(1, 1)
        mp:setSize(51, 19)
        end)

local exit = mp:addButton() -- shade button
    :setText("-")
    :setHorizontalAlign("center")
    :setBackground(colors.yellow)
    :setForeground(colors.white)
    :setPosition(29, 1)
    :setSize(3,1)
    :onClick(
        function()
        mp:setSize(40, 2)
        end)
end)
	
local terminalapp = main:addButton() --entry for the Terminal Emulator
	:setHorizontalAlign("center")
	:setVerticalAlign("center")
	:setPosition(12, 18)
	:setSize(3,2)
	:setText(">_")
	:setBackground(colors.black)
	:setForeground(colors.green)
	 :onClick(
        function()
         local terminal = main:addMovableFrame():setSize(40, 11)
	 :setBorder(colors.green)
	 :setPosition(1, 1)
	 makeResizeable(terminal, 8, 4)
        local titlebar = terminal:addPane() -- The bar to hold the text and buttons
			:setSize(50, 1)
			:setBackground(colors.gray)
		local titletext = terminal:addLabel()
			:setText("Lua Terminal")
			:setFontSize(1)
			:setForeground(colors.white)
		 local termapp = terminal:addProgram()
			:setBorder(colors.green)
			:setPosition(1,2)
			:setSize(40,10)
			:execute("lua")
	 

local exit = terminal:addButton() -- Exit button
    :setText("X")
    :setHorizontalAlign("center")
    :setBackground(colors.red)
    :setForeground(colors.white)
    :setPosition(37, 1)
    :setSize(3,1)
    :onClick(
        function()
	basalt.removeFrame(termapp:getName())
        basalt.removeFrame(terminal:getName())
        end)
	
local exit = terminal:addButton() -- Full Screen button
    :setText("[]")
    :setHorizontalAlign("center")
    :setBackground(colors.blue)
    :setForeground(colors.white)
    :setPosition(33, 1)
    :setSize(3,1)
    :onClick(
        function()
	terminal:setPosition(1, 1)
        terminal:setSize(51, 19)
        end)

local exit = terminal:addButton() -- shade button
    :setText("-")
    :setHorizontalAlign("center")
    :setBackground(colors.yellow)
    :setForeground(colors.white)
    :setPosition(29, 1)
    :setSize(3,1)
    :onClick(
        function()
        terminal:setSize(40, 2)
        end)
end)
	
local wormthing = main:addButton() --entry for the snake rip off, worm
	:setHorizontalAlign("center")
	:setVerticalAlign("center")
	:setPosition(24, 18)
	:setSize(3,2)
	:setText("[]")
	:setBackground(colors.red)
	:setForeground(colors.green)
	 :onClick(
        function()
		local wormwindow = main:addMovableFrame("worm"):setSize(44, 15)
			:setSize(40,16)
			:setPosition(1, 1)
		makeResizeable(wormwindow, 8, 4)
		local titlebar = wormwindow:addPane() -- The bar to hold the text and buttons
			:setSize(50, 1)
			:setBackground(colors.gray)
		local titletext = wormwindow:addLabel()
			:setText("Worm")
			:setFontSize(1)
			:setForeground(colors.white)
		local wormsession = wormwindow:addProgram("worms")
			:setBorder(colors.red)
			:execute("worm")
			:setSize(40, 13)
			:setPosition(1,2)
	 

local exit = wormwindow:addButton() -- Exit button
    :setText("X")
    :setHorizontalAlign("center")
    :setBackground(colors.red)
    :setForeground(colors.white)
    :setPosition(37, 1)
    :setSize(3,1)
    :onClick(
        function()
	basalt.removeFrame(wormsession:getName())
        basalt.removeFrame(wormwindow:getName())
        end)
	
local exit = wormwindow:addButton() -- Full Screen button
    :setText("[]")
    :setHorizontalAlign("center")
    :setBackground(colors.blue)
    :setForeground(colors.white)
    :setPosition(33, 1)
    :setSize(3,1)
    :onClick(
        function()
	wormwindow:setPosition(1, 1)
        wormwindow:setSize(51, 19)
        end)

local exit = wormwindow:addButton() -- Min button
    :setText("-")
    :setHorizontalAlign("center")
    :setBackground(colors.yellow)
    :setForeground(colors.white)
    :setPosition(29, 1)
    :setSize(3,1)
    :onClick(
        function()
        wormwindow:setSize(40, 2)
        end)
end)


	
local sysmgr = main:addButton() --entry for the system manager
	:setHorizontalAlign("center")
	:setVerticalAlign("center")
	:setPosition(30, 18)
	:setSize(3,2)
	:setText("%")
	:setBackground(colors.blue)
	:setForeground(colors.yellow)
	 :onClick(
        function()
         local sysmgrwindow = main:addMovableFrame():setSize(40, 16)
	 :setSize(40,16)
	 :setPosition(1, 1)
	 makeResizeable(sysmgrwindow, 8, 4)
	 local sysmgrsession = sysmgrwindow:addProgram()
	 :execute("/sys/apps/sysmgr.lua")
	 :setPosition(1,2)
	 :setSize(40, 15)
        end)

basalt.autoUpdate() -- self explanitary if not read the docs