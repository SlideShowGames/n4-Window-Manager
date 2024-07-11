local basalt = require("/apis/basalt")
print("basalt needs to be installed") -- lazy way of telling the user that the ui isnt installed.
local test = basalt.createFrame("test")
	:setBorder(colors.blue)
	:setBackground(colors.white)
	:setForeground(colors.green)
	
basalt.debug("test window use for custom themes and window decor")

basalt.autoUpdate()