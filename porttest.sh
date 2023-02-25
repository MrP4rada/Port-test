#!/bin/zsh

function Ctrl-c(){
echo -e "\n\n[+] Exiting...\n"
exit 1
}
#Ctrl-c

trap Ctrl-c INT

thirdip=$(hostname -I | awk '{print $1}' | tr "." " " | awk '{print $3}')

for i in $(echo "$(nmap -sS --min-rate 5000 -p$1 --open 192.168.$thirdip.1-254)" | grep report | tr "(" " " | tr ")" " " | awk '{print$NF}');do
echo -e "\n\n[+]This host accepts connections on port $1 -> $i"
done
