#!/bin/bash
usage()
{
    echo "Provide a directory as an argument to this script"
    echo "To find out Unique file info"
    exit 1
}
if [ $# -ne 1 ]; then
    usage
elif [ $# -eq 1 -a ! -d $1 ]; then
    usage
else
    if [ $(echo $1 | grep -c "/$") -eq 1 ]; then
        input_dir="$(echo ${1} | sed 's/\/$//')"
    else
        input_dir="${1}"
    fi
fi

for i in $(ls ${input_dir})
do
    if [ -f "${input_dir}/${i}" ]; then
        cksum "${input_dir}/${i}"
    fi
done | sort > /tmp/file_list.txt

awk '{ print $1}' /tmp/file_list.txt | sort -u > /tmp/unique_files.txt

unique_file_count=$(wc -l /tmp/unique_files.txt  | awk '{print $1}')
mycount=0
echo "{"
echo "  \"matches\": ["

for i in $(cat /tmp/unique_files.txt)
do
    ((mycount += 1))
    echo "    ["
    filecount=$(grep $i /tmp/file_list.txt | awk '{print $NF}' | wc -l | awk '{print $1}')
    jcount=0
    for j in $(grep $i /tmp/file_list.txt | awk '{print $NF}' | awk -F'/' '{print $NF}')
    do
        ((jcount += 1))
        echo -n "      \"$j\""
        if [[ $jcount -eq $filecount ]]; then
            echo ""
        else
            echo ","
        fi
    done
    if [[ $mycount -eq $unique_file_count ]]; then
        echo "    ]"
    else
        echo "    ],"
    fi
    jcount=0
done
echo "  ]"
echo "}"

# Cleaning up files.
rm /tmp/file_list.txt /tmp/unique_files.txt
