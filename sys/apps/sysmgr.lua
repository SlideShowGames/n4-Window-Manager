local basalt = require("/apis/basalt")
print("basalt needs to be installed") -- lazy way of telling the user that the ui isnt installed.
local mgrtab = basalt.createFrame()
	:setBorder(colors.blue)
	:setBackground(colors.white)
	:setForeground(colors.green)
	
basalt.autoUpdate()