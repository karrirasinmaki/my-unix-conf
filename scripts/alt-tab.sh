#!/bin/bash

ALT_KEY="Alt_L"

rofi -show window \
	-kb-cancel "$ALT_KEY+Escape,Escape" \
	-kb-accept-entry "!$ALT_KEY-Tab,!Alt+$ALT_KEY,Return" \
	-kb-row-down "$ALT_KEY+Tab,$ALT_KEY+Down" \
	-kb-row-up "$ALT_KEY+Shift+Tab,$ALT_KEY+Up" \
	#-selected-row 1 &

