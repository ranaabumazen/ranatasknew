#!/bin/bash
echo "the average of free mem " >> /var/www/html/memavg
free -m | awk 'NR==2 {print $4,$3}'  |awk '{totalm +=$1;countm++ }END {print totalm/countm}' >> /var/www/html/memavg
echo "the average of used mem " >> /var/www/html/memavg 
free -m | awk 'NR==2 {print $4,$3}'  |awk '{totallm +=$2;countsm++ }END {print totallm/countsm}' >> /var/www/html/memavg && echo "TimeStamp" >>/var/www/html/memavg &&  date +%x_%H:%M:%S >> /var/www/html/memavg

echo "the average of used cpu " >> /var/www/html/cpuavg
mpstat -P ALL | awk '{print (100.00-$13),$13}'|sed '1d;2d;3d' | awk '{totalc +=$1;countc++ }END {print totalc/countc}'>> /var/www/html/cpuavg
echo "the average of cpu idle " >> /var/www/html/cpuavg
mpstat -P ALL | awk '{print (100.00-$13),$13}'|sed '1d;2d;3d' | awk '{totallc +=$2;countcs++ }END {print totallc/countcs}'>> /var/www/html/cpuavg && echo "TimeStamp" >>/var/www/html/cpuavg &&  date +%x_%H:%M:%S >> /var/www/html/cpuavg
echo "the average of used " >> /var/www/html/diskavg
df | awk '{print $3}'|sed  '1d' |awk '{total +=$1;count++ }END {print total/count}' >> /var/www/html/diskavg
echo "the avearge of available" >> /var/www/html/diskavg
df | awk '{print $4}'|sed  '1d' |awk '{totall +=$1;counts++ }END {print totall/counts}' >> /var/www/html/diskavg && echo "TimeStamp" >>/var/www/html/diskavg &&  date +%x_%H:%M:%S >> /var/www/html/diskavg
