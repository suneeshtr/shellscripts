#!/bin/sh  
#chmod +x cachebust.sh

awk -v low=$(grep low /proc/zoneinfo | awk '{k+=$2}END{print k}') \
 '{a[$1]=$2}
  END{ 
   print a["MemFree:"]+a["Active(file):"]+a["Inactive(file):"]+a["SReclaimable:"]-(12*low); 
  }' /proc/meminfo
