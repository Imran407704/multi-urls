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
mkdir -p output-multi_url
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Waybackurls Started\n"
cat $1 | xargs -P 100 -I X bash -c "echo 'X' | waybackurls > output-multi_url/waybackurls.txt > /dev/null"
printf "✅ Waybackurls data :$(wc -l output-multi_url/waybackurls.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Gau-Plus Started\n"
cat $1 | gauplus --random-agent -t 100 -o output-multi_url/plus-gau.txt
printf "✅ Plus-gau data :$(wc -l output-multi_url/plus-gau.txt | awk '{print $1}')\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
printf "Gau Data Started\n"
cat $1 | gau --o output-multi_url/gau.txt
printf "✅ Gau data :$(wc -l output-multi_url/gau.txt | awk '{print $1}')\n"

cat output-multi_url/waybackurls.txt output-multi_url/plus-gau.txt output-multi_url/gau.txt | sort -u > output-multi_url/all-urls.txt

cat output-multi_url/all-urls.txt | httpx > output-multi_url/live-multi_url.txt

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

printf "Total all-urls :$(wc -l output-multi_url/all-urls.txt)\n"
printf "Total live-multi_url :$(wc -l output-multi_url/live-multi_url.txt)\n"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
