all: IMESwitcher

IMESwitcher: IMESwitcher.m
	gcc -o $@ -Wall $< -framework Carbon -framework Foundation
