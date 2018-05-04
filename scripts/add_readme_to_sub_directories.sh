#!/bin/bash

# usage: sh add_readme_to_sub_directories.sh /path/to/level1/directory
# usage: sh add_readme_to_sub_directories.sh ../data/journal_data/      (adds readme files to immediate sub-folders)

path="$1";
for i in "$path"*; do
    if [[ -d $i ]]; then
        # echo $i;
        if [ ! -f "$i/README.md" ]; then
            # echo "|File|Comment|" >> $i/README.md;
            # echo "|:--:|:-----:|" >> $i/README.md;
            echo '```' >> $i/README.md;
            echo "" >> $i/README.md;
            for j in "$i"/*; do 
                f=`echo "$j" | rev | cut -d '/' -f 1 | rev`;
                # echo "$j";
                if [ "$f" != README.md ]; then
                    echo "$f" >> $i/README.md;
                fi
            done;
            # echo "```" >> $i/README.md;
        fi
    fi
done;
