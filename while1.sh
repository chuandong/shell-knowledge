#!/bin/bash 

#I=0

#while [ $I -lt 10 ]; do
#	printf "\e[1;3%dm%3d\e[0m" `expr $I % 8`  $I
#	I=`expr $I + 1`
#done
#echo ""


I=0
while ((I < 10)); do
	printf "\e[1;3%dm%3d\e[0m" $(($I % 8)) $I
	((I++))
done
echo ""
