#!/usr/bin/env python2.7

from random import randint

import sys
rnd_commands_arr = ["R","W"]
if (len(sys.argv) == 2):
	for i in range(1, int(sys.argv[1])+1):
		print "0x%08X %s" % (randint(0,4294967296), rnd_commands_arr[randint(0,1)])
else:
	print "error, pass iteration limit as parameter"
