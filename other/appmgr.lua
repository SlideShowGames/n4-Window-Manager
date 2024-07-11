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
 
