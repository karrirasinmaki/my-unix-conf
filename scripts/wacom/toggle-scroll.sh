#!/bin/bash

DEVICE="Wacom Intuos BT S"

STYLUS="$DEVICE Pen stylus"

if [ -z $(xsetwacom get "$STYLUS" Button 1 | grep "button") ]
then
	xsetwacom set "$STYLUS" Button 1 "button +1"
else
	xsetwacom set "$STYLUS" Button 1 "pan"
fi


