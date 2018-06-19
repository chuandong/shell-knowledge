#!/bin/bash
#set -e
#set -x

echo "Please input you want nums:"
read  num

file_path=/home/jkcore/core/data/yace_file/

if [ ! -d $file_path ]; then
    mkdir -p $file_path
fi

for (( i = 0; i < num; i++ ));
do   
#get 12 bytes time random numbers
date_time=$(date +%s%N | cut -c2-13)

#get 10 bytes random numbers
nums=$(date +%N)

#get 20 bytes random card numbers
card=$(<  /dev/urandom tr -dc 0-9|head -c ${1:-19};echo)


#copy file
cp /home/jkcore/core/data/BCPD180615104030144982805256766906A  /home/jkcore/core/data/yace_file/BCPD${date_time}14498280${nums}A
sed -i 's/CARD_NO/'$card'/' ${file_path}BCPD${date_time}14498280${nums}A

done
