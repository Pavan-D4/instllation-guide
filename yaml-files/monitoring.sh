#!/bin/bash

while true
do
# gathering disk usage information
  df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5, "", $1}' >> /home/ubuntu/cpu_mem_monitor.txt

#gathering memory info
  free -m | awk 'NR==2{printf "memory usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2}' >> /home/ubuntu/cpu_mem_monitor.txt

# gathering CPU Load
  top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}' >> /home/ubuntu/cpu_mem_monitor.txt
  sleep 5
done
