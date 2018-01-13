#!/usr/bin/python3
import os

mars = "Mars4_5.jar" # 你的 Mars 地址
filename = "mips.asm" # 你的汇编代码文件地址

for len in range(10000000, 20000000, 1000000):
    out = os.popen("java -jar " + mars + " " + str(len) + " " + filename).read()
    if "terminated" in out:
    	print("步数大于 " + str(len))
    else:
    	print("步数小于 " + str(len))
    	break
    
