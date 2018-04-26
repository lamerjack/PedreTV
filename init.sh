#!/usr/bin/env python
import os,sys
if not os.getegid() == 0:
 sys.exit()
from pyA20.gpio import gpio,connector,port
from config import *
gpio.init()
gpio.setcfg(port.PA11, gpio.INPUT)
gpio.pullup(port.PA11, gpio.PULLUP)
state=gpio.input(port.PA11)
print state
print Res1

f = open( '/home/lab1/PedreTV/config.py', 'w' )
f.write( 'Res1 = ' + repr(state) + '\n' )
f.close()

if state==Res1:
	print "settings are the same"
	print "no change"
elif state==1:
	print "settings are changed"
	os.system("h3disp -m 1080p60")
	os.system("reboot")
	print "going to apply FullHD"
	print "and reboot"
else:
	print "settings are changed"
	os.system("h3disp -m 4kp30")
	os.system("reboot")
        print "going to apply 4K"
        print "and reboot"

print "starting"

os.system("/home/lab1/PedreTV/PlayVideo")


