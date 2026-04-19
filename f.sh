#!/bin/bash
RED='\033[0;31m'
text="DirDetect"
echo -e "${RED}"
figlet -f big.flf "$text"
echo -e "${RESET}"
sleep 1
echo -e "\e[31m\e[1m\e[3m\e[4mMaintained And Developed By Ali Seif Eddine\e[0m\e[0m\e[0m\e[0m"
sleep 2
ping -c 1 8.8.8.8 > /dev/null 2>&1
if [ $? -eq 0 ];
then
echo -e "\e[1m\e[32mConnection Successfully done\e[0m\e[0m"
sleep 1
myArray=("Offesinve" "Security" "Arsenal")
for i in "${myArray[@]}";
do
echo -n -e "\e[1m\e[31m$i \e[0m\e[0m"
sleep 0.1
sleep 1
done
echo -e "\n"
read -e -p $'\e[1m\e[31mEnter Your Target : \e[0m\e[0m' target
read -e -p $'\e[1m\e[31mDefault list / Your List : \e[0m\e[0m' list
read -e -p $'\e[1m\e[31mEnter The Delay Between Requests: /n for no delay \e[0m\e[0m' delay
echo -e "\n"
read -e -p $'\e[1m\e[31mVerbose Mode Y/N : \e[0m\e[0m' verbose
sleep 0.5

if [ $delay == "n" ]
then
if [ $verbose == "y" ];
then
content_length=$(curl -s -I $target/$input | grep -i 'content-length' | awk '{print $2}')
if [ "$1" = "-f" ]; then
if [ "$content_length" -eq "$2" ]; then
 echo "filtered"
fi

echo -e "---------------------------------------------"
echo -e "\e[1m\e[31minput--->status--->Length\e[0m\e[0m"
for input in $(cat $list)
do
response=$(curl -s -m 5 -o /dev/null -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response"

forbidden=$(curl -s -m 5 -o /dev/null -w "%{http_code}" $target/$input)
if [ "$forbidden" == "403" ]
then
response0=(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Original-URL: $input")
echo "$input---->response0" > headers.txt
response1=(curl -s -m 5 -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response1" > PATCH.txt
response2=(curl -s -m 5 -o /dev/null -X TRACE -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response2" > TRACE.txt
response3=(curl -s -m 5 -o /dev/null -X POST -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response3" > POST.txt
fi
done
elif [ $verbose == "n" ]
then
echo -e "\e[1m\e[31mWaiting To Finish\e[0m\e[0m"
for input in $(cat $list)
do
response=$(curl -s -m 5 -o /dev/null -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response" >> output.txt
forbidden=$(curl -s -m 5 -o /dev/null -w "%{http_code}" $target/$input)
if [ "$forbidden" == "403" ]
then
response0=(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Original-URL: $input")
echo "$input---->response0" > headers.txt
response1=(curl -s -m 5 -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response1" >> PATCH.txt
response2=(curl -s -m 5 -o /dev/null -X TRACE -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response2" > TRACE.txt
response3=(curl -s -m 5 -o /dev/null -X POST -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response3" > POST.txt
fi
done
fi
elif [ $delay == $delay ]
then
if [ $verbose == "y" ];
then
echo -e "----------"
for input in $(cat $list)
do
response=$(curl -s -m 5 -o /dev/null -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response"

forbidden=$(curl -s -m 5 -o /dev/null -w "%{http_code}" $target/$input)
if [ "$forbidden" == "403" ]
then
response0=(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Original-URL: $input")
echo "$input---->response0" > headers.txt
response1=(curl -s -m 5 -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response1" > PATCH.txt
response2=(curl -s -m 5 -o /dev/null -X TRACE -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response2" > TRACE.txt
response3=(curl -s -m 5 -o /dev/null -X POST -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response3" > POST.txt
fi
$delay
done
elif [ $verbose == "n" ]
then
echo -e "\e[1m\e[31mWaiting To Finish\e[0m\e[0m"
for input in $(cat $list)
do
response=$(curl -s -m 5 -o /dev/null -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response" >> output.txt
forbidden=$(curl -s -m 5 -o /dev/null -w "%{http_code}" $target/$input)
if [ "$forbidden" == "403" ]
then
response0=(curl -s -m 5 -o /dev/null -X GET -w "%{http_code}""-->""%{size_download}" $target -H "X-Original-URL: $input")
echo "$input---->response0" > headers.txt
response1=(curl -s -m 5 -o /dev/null -X PATCH -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response1" >> PATCH.txt
response2=(curl -s -m 5 -o /dev/null -X TRACE -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response2" > TRACE.txt
response3=(curl -s -m 5 -o /dev/null -X POST -w "%{http_code}""-->""%{size_download}" $target/$input)
echo "$input---->$response3" > POST.txt
fi
$delay
done
fi
fi
fi
else
echo -e  "\e[1m\e[31mcheck your connection\e[0m\e[0m"
exit
fi
