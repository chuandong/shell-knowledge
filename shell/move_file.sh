#!/bin/bash
set -e
echo "************************************"
echo "**the code is mv the dictorty file**"
echo "************************************"

cd /home/dong/core/data/treated

ls -lrt  /home/dong/core/data/treated | awk '{print $9}' | grep -v "allfile" |grep -v "^$" > /home/dong/aa.txt

#doc=`sed -n '1p' /home/dong/aa.txt`
#doct=`ls /home/dong/core/data/treated/$doc`
echo "Please input you want move file date:"
read date
echo "you input date is:$date"
mkdir -p /home/dong/core/data/treated/allfile/$date
for file in `cat /home/dong/aa.txt`
do

    echo "instcd is $file"
    if [ ! -d "/home/dong/core/data/treated/$file/$date" ]; then
        continue
    fi
    cp -a /home/dong/core/data/treated/$file/$date/backdir/*  /home/dong/core/data/treated/allfile/$date
done

for filename in  /home/dong/core/data/treated/allfile/$date/*
do
    file_name=${filename##*.}
    mv ${filename} /home/dong/core/data/treated/allfile/$date/${file_name}
    echo "file name is:$file_name"
done
echo "move file finish!"
rm -rf /home/dong/aa.txt
