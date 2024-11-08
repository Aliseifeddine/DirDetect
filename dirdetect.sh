#!/bin/bash
RED='\033[0;31m'
RESET='\033[0m'
text="DirDetect"
echo -e "${RED}"
figlet -f big.flf "$text"
echo -e "${RESET}"
sleep 1
echo -e "\e[31m\e[1m\e[3m\e[4mMaintained And Developed By Ali Seif Eddine\e[0m"
sleep 2
ping -c 1 8.8.8.8 > /dev/null 2>&1
if [ $? -eq 0 ];
then
echo -e "\e[1m\e[32mConnection Successfully done\e[0m"
sleep 1
echo -e "\n"
myArray=("Offesinve" "Security" "Arsenal")
for i in "${myArray[@]}";
do
echo -n -e "\e[1m\e[31m$i \e[0m"
sleep 0.4
done
echo -e "\n"
read -e -p $'\e[1m\e[31mEnter Your Target : \e[0m' target
read -e -p $'\e[1m\e[31mDefault list / Your List : \e[0m' list
read -e -p $'\e[1m\e[31mEnter the target with specific path to Bypass \ Enter to skip : \e[0m' target2
if [ -n "$target2" ]; then
    read -e -p $'\e[1m\e[31mEnter the Bypass list for specific path : \e[0m' Bypass
else
    echo -e "\e[1m\e[31mskipped\e[0m"
fi
read -e -p $'\e[1m\e[31mEnter The Delay Between Requests: /n for no delay \e[0m' delay
echo -e "\n"
read -e -p $'\e[1m\e[31mVerbose Mode Y/N : \e[0m' verbose
sleep 0.5
if [ -n "$target2" ] && [ -f "$Bypass" ]; then

for input1 in $(cat $Bypass)
do

r=$(curl -s -o /dev/null -w "%{http_code}""-->""%{size_download}" "$target2/$input1")

echo "$input1--->$r"

done
else
echo -e "\e[1m\e[31mskipped\e[0m"
fi

if [ $delay = "n" ]
then
if [ $verbose = "y" ];
then
echo -e "---------------------------------------------"
for input in $(cat $list)
do
response=$(curl -s -m 5 -o /dev/null -w "%{http_code}""-->""%{size_download}" "$target/$input")
echo "$input---->$response"

forbidden=$(curl -s -m 5 -o /dev/null -w "%{http_code}" "$target/$input")
if [ "$forbidden" = "403" ]
then
path=$input
res=$(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Custom-IP-Authorization: 127.0.0.1")
echo "Custom auth--->$res" >> auth.txt
response=$(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Original-URL: $path")
echo "$path---->$response" >> headers.txt
response1=$(curl -s -m 5 -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response1" >> PATCH.txt
response2=$(curl -s -m 5 -o /dev/null -X TRACE -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response2" >> TRACE.txt
response3=$(curl -s -m 5 -o /dev/null -X POST -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response3" >> POST.txt
fi
done
elif [ $verbose = "n" ]
then
echo -e "\e[1m\e[31mWaiting To Finish\e[0m"
for input in $(cat $list)
do
response=$(curl -s -m 5 -o /dev/null -w "%{http_code}""-->""%{size_download}" "$target/$input")
echo "$input---->$response" >> output.txt
forbidden=$(curl -s -m 5 -o /dev/null -w "%{http_code}" "$target/$input")
if [ "$forbidden" = "403" ]
then
path=$input
res=$(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Custom-IP-Authorization: 127.0.0.1")
echo "Custom auth--->$res" >> auth.txt
response=$(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Original-URL: $path")
echo "$path---->$response" >> headers.txt
response1=$(curl -s -m 5 -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response1" >> PATCH.txt
response2=$(curl -s -m 5 -o /dev/null -X TRACE -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response2" >> TRACE.txt
response3=$(curl -s -m 5 -o /dev/null -X POST -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response3" >> POST.txt
fi
done
fi
elif [ $delay = $delay ]
then
if [ $verbose = "y" ];
then
echo -e "----------"
for input in $(cat $list)
do
response=$(curl -s -m 5 -o /dev/null -w "%{http_code}""-->""%{size_download}" "$target/$input")
echo "$input---->$response"

forbidden=$(curl -s -m 5 -o /dev/null -w "%{http_code}" "$target/$input")
if [ "$forbidden" = "403" ]
then
path=$input
res=$(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Custom-IP-Authorization: 127.0.0.1")
echo "Custom auth--->$res" >> auth.txt
response=$(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Original-URL: $path")
echo "$path---->$response" >> headers.txt
response1=$(curl -s -m 5 -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response1" >> PATCH.txt
response2=$(curl -s -m 5 -o /dev/null -X TRACE -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response2" >> TRACE.txt
response3=$(curl -s -m 5 -o /dev/null -X POST -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response3" >> POST.txt
fi
done
elif [ $verbose = "n" ]
then
echo -e "\e[1m\e[31mWaiting To Finish\e[0m"
for input in $(cat $list)
do
response=$(curl -s -m 5 -o /dev/null -w "%{http_code}""-->""%{size_download}" "$target/$input")
echo "$input---->$response" >> output.txt
forbidden=$(curl -s -m 5 -o /dev/null -w "%{http_code}" "$target/$input")
if [ "$forbidden" = "403" ]
then
path=$input
res=$(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Custom-IP-Authorization: 127.0.0.1")
echo "Custom auth--->$res" >> auth.txt
response=$(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Original-URL: $path")
echo "$path---->$response" >> headers.txt
response1=$(curl -s -m 5 -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response1" >> PATCH.txt
response2=$(curl -s -m 5 -o /dev/null -X TRACE -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response2" >> TRACE.txt
response3=$(curl -s -m 5 -o /dev/null -X POST -w "%{http_code}""-->""%{size_download}" $target/$path)
echo "$path---->$response3" >> POST.txt
fi
done
fi
fi
else
echo -e  "\e[1m\e[31mcheck your connection\e[0m"
exit
fi
