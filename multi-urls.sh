#!/bin/bash

echo -e $Yellow "

             _       _                   _       
            | |  _  (_)                 | |      
 ____  _   _| |_| |_ _       _   _  ____| |  ___ 
|    \| | | | (_   _) |     | | | |/ ___) | /___)
| | | | |_| | | | |_| |     | |_| | |   | ||___ |
|_|_|_|____/ \_) \__)_|     |____/|_|    \_|___/ 
                                                 

           @imran407704 aka CyberSecOpS

"

target=$1
printf "Total Targets: $(wc -l $1 | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Waybackurls Started\n"
cat $1 | xargs -P 100 -I X bash -c "echo 'X' | waybackurls | tee waybackurls.txt > /dev/null"
printf "✅ Waybackurls data :$(wc -l waybackurls.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Gau-Plus Started\n"
cat $1 | gauplus --random-agent -t 100 -o plus-gau.txt
printf "✅ Plus-gau data :$(wc -l plus-gau.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Gau Data Started\n"
cat $1 | gau > gau.txt
printf "✅ Gau data :$(wc -l gau.txt | awk '{print $1}')\n"

cat waybackurls.txt plus-gau.txt gau.txt | sort -u > uniq-data.txt

printf "Total Uniq-Data :$(wc -l uniq-data.txt)\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
