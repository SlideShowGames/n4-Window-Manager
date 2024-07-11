local basalt = require("/apis/basalt")
print("basalt needs to be installed") -- lazy way of telling the user that the ui isnt installed.
local main = basalt.createFrame()
	:setBorder(colors.green)
	:setBackground(colors.gray)
	:setForeground(colors.green)
main:addLabel()
	:setText("n4 Window Manager Copyleft 2024 MIT License")
	
local appmgr = main:addMovableFrame() -- App launcher
	:setBorder(colors.blue)
	:setSize(42,16)
	:setPosition(20, 20)
	:setBackground(colors.white)
	
appmgr:addLabel()
	:setText("App Launcher")
	:setForeground(colors.white)
	:setBackground(colors.blue)
	
		 
	 local titlebar = appmgr:addPane() -- The bar to hold the text and buttons
	:setSize(50, 1)
	:setBackground(colors.black)
local titletext = appmgr:addLabel()
	:setText("App Launcher")
	:setFontSize(1)
	:setForeground(colors.white)
	
	
local exit = appmgr:addButton() -- Full Screen button
    :setText("[]")
    :setHorizontalAlign("center")
    :setBackground(colors.blue)
    :setForeground(colors.white)
    :setPosition(33, 1)
    :setSize(3,1)
    :onClick(
        function()
        appmgr:setSize(50, 25)
        end)

local exit = appmgr:addButton() -- Min button
    :setText("-")
    :setHorizontalAlign("center")
    :setBackground(colors.yellow)
    :setForeground(colors.white)
    :setPosition(29, 1)
    :setSize(3,1)
    :onClick(
        function()
        appmgr:setSize(50, 2)
        end)


local aButton = appmgr:addButton() -- More buttons even for test
    :setText("Reboot")
    :setBackground(colors.red)
    :setForeground(colors.white)
    :setPosition(3, 13)
    :onClick(
        function()
         shell.run("reboot")
        end)
	

local nedit = appmgr:addButton() -- entry for the GUI text editor
	:setHorizontalAlign("center")
	:setVerticalAlign("center")
	:setPosition(2, 4)
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
	
local terminalapp = appmgr:addButton() --entry for the Terminal Emulator
	:setHorizontalAlign("center")
	:setVerticalAlign("center")
	:setPosition(8, 4)
	:setSize(3,2)
	:setText(">_")
	:setBackground(colors.black)
	:setForeground(colors.green)
	 :onClick(
        function()
         local terminal = main:addMovableFrame():setSize(40, 20)
	 :setBorder(colors.green)
	 :setPosition(1, 1)
	 local termapp = terminal:addProgram()
	 :setBorder(colors.green)
	 :setSize(40,20)
	 :execute("shell")
        end)
	
local wormthing = appmgr:addButton() --entry for the snake rip off, worm
	:setHorizontalAlign("center")
	:setVerticalAlign("center")
	:setPosition(14, 4)
	:setSize(3,2)
	:setText("[]")
	:setBackground(colors.red)
	:setForeground(colors.green)
	 :onClick(
        function()
         local wormwindow = main:addMovableFrame():setSize(40, 16)
	 :setBorder(colors.red)
	 :setSize(40,16)
	 :setPosition(1, 1)
	 	 local titlebar = wormwindow:addPane() -- The bar to hold the text and buttons
	:setSize(50, 1)
	:setBackground(colors.black)
local titletext = wormwindow:addLabel()
	:setText("Worm")
	:setFontSize(1)
	:setForeground(colors.white)
	local wormsession = wormwindow:addProgram()
	 :setBorder(colors.red)
	 :execute("worm")
	 :setSize(40, 16)

local exit = wormwindow:addButton() -- Exit button
    :setText("X")
    :setHorizontalAlign("center")
    :setBackground(colors.red)
    :setForeground(colors.white)
    :setPosition(37, 1)
    :setSize(3,1)
    :onClick(
        function()
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
        wormwindow:setSize(50, 25)
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
        wormwindow:setSize(50, 2)
        end)



	
local sysmgr = appmgr:addButton() --entry for the system manager
	:setHorizontalAlign("center")
	:setVerticalAlign("center")
	:setPosition(20, 4)
	:setSize(3,2)
	:setText("%")
	:setBackground(colors.blue)
	:setForeground(colors.yellow)
	 :onClick(
        function()
         local sysmgrwindow = main:addMovableFrame():setSize(40, 16)
	 :setSize(40,16)
	 :setPosition(1, 1)
	 local sysmgrsession = sysmgrwindow:addProgram()
	 :execute("/sys/apps/sysmgr.lua")
	 :setSize(40, 16)
        end)

local test = appmgr:addButton() --entry for the testing window
	:setHorizontalAlign("center")
	:setVerticalAlign("center")
	:setPosition(25, 4)
	:setSize(3,2)
	:setText("T")
	:setBackground(colors.gray)
	:setForeground(colors.red)
	 :onClick(
        function()
         local testwindow = main:addMovableFrame():setSize(40, 16)
	 :setSize(40,16)
	 :setPosition(1, 1)
	 
	 local titlebar = testwindow:addPane() -- The bar to hold the text and buttons
	:setSize(50, 1)
	:setBackground(colors.black)
local titletext = testwindow:addLabel()
	:setText("Hello, World!")
	:setFontSize(1)
	:setForeground(colors.white)
	

local exit = testwindow:addButton() -- Exit button
    :setText("X")
    :setHorizontalAlign("center")
    :setBackground(colors.red)
    :setForeground(colors.white)
    :setPosition(37, 1)
    :setSize(3,1)
    :onClick(
        function()
        basalt.removeFrame(testwindow:getName())
        end)
	
local exit = testwindow:addButton() -- Full Screen button
    :setText("[]")
    :setHorizontalAlign("center")
    :setBackground(colors.blue)
    :setForeground(colors.white)
    :setPosition(33, 1)
    :setSize(3,1)
    :onClick(
        function()
        testwindow:setSize(50, 50)
        end)

local exit = testwindow:addButton() -- Min button
    :setText("-")
    :setHorizontalAlign("center")
    :setBackground(colors.yellow)
    :setForeground(colors.white)
    :setPosition(29, 1)
    :setSize(3,1)
    :onClick(
        function()
        testwindow:setSize(50, 2)
        end)

	 local tests = testwindow:addProgram()
	 :execute("/sys/apps/test.lua")
	 :setSize(40, 16)
        end)


local aButton = appmgr:addButton() -- More buttons even for test
    :setText("Reboot")
    :setBackground(colors.red)
    :setForeground(colors.white)
    :setPosition(3, 13)
    :onClick(
        function()
         shell.run("reboot")
        end)
basalt.autoUpdate() -- self explanitary if not read the docs