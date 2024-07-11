local basalt = require("/apis/basalt")
local main = basalt.createFrame()
	:setBorder(colors.yellow)
local aTextfield = main:addTextfield()

-- Add some lines of text to the Textfield
aTextfield:addLine("This is the first line.")
aTextfield:addLine("This is the second line.")
aTextfield:addLine("This is the third line.")

basalt.autoUpdate()