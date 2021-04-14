#!/bin/bash

DEVICE="Wacom Intuos BT S"

CURSOR="$DEVICE Pen cursor"
STYLUS="$DEVICE Pen stylus"
ERASER="$DEVICE Pen eraser"
PAD="$DEVICE Pad pad"

## Stylus
xsetwacom set "$STYLUS" PressureCurve 0 15 85 100
xsetwacom set "$STYLUS" Button 2 "pan button +2"
xsetwacom set "$STYLUS" PanScrollThreshold 100

## Eraser
xsetwacom set "$ERASER" PressureCurve 0 0 100 100

## Pad
xsetwacom set "$PAD" Button 1 "key ctrl shift s"
xsetwacom set "$PAD" Button 2 "key"
xsetwacom set "$PAD" Button 3 "button +8"
xsetwacom set "$PAD" Button 8 "button +9"
