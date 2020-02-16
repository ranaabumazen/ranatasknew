#!/bin/bash
df -h|awk 'NR==2,NR==8 {printf "%-30s%-10s%s\n",$1,$3,$4}' >> /var/www/html/disk 
echo "TimeStamp" >> /var/www/html/disk &&  date +%x_%H:%M:%S >> /var/www/html/disk

free -m | awk 'NR==2 {print $4,$3}'  >>  /var/www/html/mem && echo "TimeStamp" >>/var/www/html/mem &&  date +%x_%H:%M:%S >> /var/www/html/mem
mpstat -P ALL | awk '{print (100.00-$13),$13}'|sed '1d;2d;3d' >> /var/www/html/cpu && echo "TimeStamp" >>/var/www/html/cpu && date +%x_%H:%M:%S >> /var/www/html/cpu
