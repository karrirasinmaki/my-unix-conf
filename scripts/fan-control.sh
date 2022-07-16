#!/usr/bin/env bash
set -e

# This is the path to the PWM controlled fan (use lm_sensors/fancontrol to help you identify this)
fan=/sys/class/hwmon/hwmon1/pwm1
# Read https://www.kernel.org/doc/Documentation/hwmon/ for your PWM chip to find the correct values (I have a nct6792)
automatic=5
manual=1
# Temperature at which to run fan at 100% speed
max=80

# Re-enable automatic fan control on exit
trap "echo ${automatic} > ${fan}_enable; exit" SIGHUP SIGINT SIGTERM ERR EXIT

# Enable manual fan control
echo ${manual} > ${fan}_enable

function temperature() {
        nvidia-settings -q [gpu:0]/gpucoretemp -t
}

function fan_speed() {
        echo Setting FAN Speed to $1%
        echo $(((($1 * 255)) / 100)) > ${fan}
}

while true; do
        temp=`temperature`
        echo GPU Temperature: $temp

        if [ "$temp" -ge "$max" ] ; then
                fan_speed 100
        else
                fan_speed $(($temp + ((100 - $max))))
        fi

        sleep 1
done
