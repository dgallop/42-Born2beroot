# Monitoring script for Born2beroot
# Architecture
Arch=$(uname -a)
# CPU Physical
Cpu=$(grep ^cpu\\scores /proc/cpuinfo | uniq |  awk '{print $4}')
# Virtual CPU
vCpu=$(cat /proc/cpuinfo | grep processor | wc -l)
# Memory usage
MemoryU=$(free -m | awk 'NR == 2 {print $3"/"$2"MB ""("$3/$2*100"%)"}')
# Disk usage
DiskU=$(df -m | awk 'NR != 1 {total = total + $3}{total1 = total1 + $4}END{print total"/"total1"MB"" ""("total/total1*100"%)"}')
# CPU Load
CpuLoad=$(top -bn1 | awk '$1 == "%Cpu(s):" {printf("%.2f"), $2 +$4}')
# Last boot of system
LastB=$(who -b | awk '{print $3 " " $4}')
# Check for LVM existence
LVM=$(lsblk | grep "lvm" | wc -l)
LVMTest=$(if [ $LVM -eq 0 ]; then echo no; else echo yes; fi)
# Check for connection via TCP
Conn=$(ss -s | awk '$1 == "TCP:" {print $4}' | sed 's/,//')
# User log
UserLog=$(who | wc -l)
# Network
# IP adress
Ip=$(hostname -I)
# MAC adress
MAC=$(ip a | grep link/ether | awk '{print $2}')
# Sudo log
SudoLog=$(journalctl _COMM=sudo | grep "COMMAND" | wc -l)
# Write all the information
wall 	" -Architecture: $Arch
	#CPU physical: $Cpu
	#vCPU: $vCpu
	#Memory Usage: $MemoryU
	#Disk Usage: $DiskU
	#CPU load: $CpuLoad%
	#Last Boot: $LastB
	#LVM use: $LVMTest
	#Connexions TCP: $Conn ESTABLISHED
	#User log: $UserLog
	#Network: IP $Ip ($MAC)
	#Sudo: $SudoLog cmd"
