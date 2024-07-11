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
         local wormwindow = main:addMovableFrame()
	 :setBorder(colors.red)
	 :setSize(40,16)
	 :setPosition(1, 1)
	 local wormsession = wormwindow:addProgram()
	 :setSize(40, 16)
	 :execute("worm")

local aButton = appmgr:addButton() -- More buttons even for test
    :setText("Reboot")
    :setBackground(colors.red)
    :setForeground(colors.white)
    :setPosition(3, 13)
    :onClick(
        function()
         shell.run("reboot")
        end)
	
basalt.autoUpdate()