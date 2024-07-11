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
 
