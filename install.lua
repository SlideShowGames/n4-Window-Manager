shell.run("mkdir /apis/")
shell.run("mkdir /sys/")
shell.run("mkdir /sys/apps/")
shell.run("mkdir /sys/bin/")
shell.run("mkdir /sys/games/")
shell.run("mkdir /sys/lib/")
shell.run("mkdir /sys/users/")
shell.run("mkdir /sys/users/root/")
shell.run("mkdir /other/")
shell.run("cd /")
shell.run("wget https://raw.githubusercontent.com/SlideShowGames/n4-Window-Manager/main/startup.lua")
shell.run("wget https://raw.githubusercontent.com/SlideShowGames/n4-Window-Manager/main/basalt.lua")
shell.run("cd /apis/")
shell.run("https://raw.githubusercontent.com/SlideShowGames/n4-Window-Manager/main/apis/basalt.lua")
shell.run("cd /sys/apps/")
shell.run("wget https://raw.githubusercontent.com/SlideShowGames/n4-Window-Manager/main/sys/apps/nedit.lua")
shell.run("https://raw.githubusercontent.com/SlideShowGames/n4-Window-Manager/main/sys/apps/sysmgr.lua")
shell.run("https://raw.githubusercontent.com/SlideShowGames/n4-Window-Manager/main/sys/apps/musicplayer.lua")
shell.run("cd /sys/users/root/")
shell.run("wget https://github.com/SlideShowGames/n4-Window-Manager/raw/main/sys/users/root/image.nfp")
shell.run("mkdir music/")
shell.run("cd /disk/")
shell.run("wget https://github.com/SlideShowGames/n4-Window-Manager/raw/main/sys/users/root/music/guh.dfpwm")
shell.run("cd /")
print("done now rebooting")
shell.run("reboot")



