#!/bin/bash

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

# Check memory usage
MEM_USAGE=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')

# Check disk usage
DISK_USAGE=$(df -h | grep '^/dev/' | awk '{ print $5 " " $1 }')

# Check if a service is running (example: nginx)
SERVICE="nginx"
if pgrep -x "$SERVICE" >/dev/null
then
    SERVICE_STATUS="$SERVICE is running"
else
    SERVICE_STATUS="$SERVICE is not running"
fi

echo "CPU Usage: $CPU_USAGE"
echo "Memory Usage: $MEM_USAGE%"
echo "Disk Usage: $DISK_USAGE"
echo "$SERVICE_STATUS"
