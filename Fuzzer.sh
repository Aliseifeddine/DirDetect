#!/bin/bash
figlet -f big.flf DirDetect
sleep 1
echo -e "\e[93m\e[1m\e[3m\e[4mDone By Ali Seif Eddine\e[0m\e[0m\e[0m\e[0m"
sleep 2
ping -c 1 8.8.8.8 > /dev/null 2>&1
if [ $? -eq 0 ];
then
echo -e "\e[1m\e[32mConnection Successfully done\e[0m\e[0m"
sleep 1
myArray=("Offesinve" "Security" "Arsenal")
for i in "${myArray[@]}";
do
echo -n -e "\e[1m\e[34m$i \e[0m\e[0m"
sleep 0.1
sleep 1
done
echo -e "\n"
read -e -p $'\e[1m\e[35mEnter Your Target : \e[0m\e[0m' target
read -e -p $'\e[1m\e[35mDefault list / Your List : \e[0m\e[0m' list
read -e -p $'\e[1m\e[35mEnter The Delay Between Requests: /n for no delay \e[0m\e[0m' delay
echo -e "\n"
read -e -p $'\e[1m\e[35mVerbose Mode Y/N : \e[0m\e[0m' verbose
sleep 0.5
if [ $delay == "n" ]
then
if [ $verbose == "y" ];
then
for target in $(cat $list);
do
echo -e "----------"
for input in $(cat $list)
do
response=$(curl -s -o /dev/null -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response"
done
done
if [ "$response" == "403" ]
then
response1=(curl -s -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response1"

fi
elif [ $verbose == "n" ]
then
echo -e "\e[1m\e[35mWaiting To Finish\e[0m\e[0m"
for target in $(cat $list);
do
for input in $(cat $list)
do
response=$(curl -s -o /dev/null -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response" >> output.txt
done
done
if [ "$response" == "403" ]
then
response1=(curl -s -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response1" >> 403.txt
fi
fi
if [ $verbose == "y" ];
then
for target in $(cat $list);
do
echo -e "\t\t----------"
for input in $(cat $list)
do
response=$(curl -s -o /dev/null -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response"
sleep $delay
done
done
if [ "$response" == "403" ]
then
response1=(curl -s -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response1"

fi
elif [ $verbose == "n" ]
then
echo -e "\e[1m\e[35mWaiting To Finish\e[0m\e[0m"
for target in $(cat $list);
do
for input in $(cat $list)
do
response=$(curl -s -o /dev/null -w "%{http_code}""-->""%{size_download}" $target/$input)
sleep $delay
echo "$input---->$response" >> output.txt
done
done
if [ "$response" == "403" ]
then
response1=(curl -s -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response1" >> 403.txt
fi
fi
else
echo -e  "\e[1m\e[31mcheck your connection\e[0m\e[0m"
exit
fi


fi
