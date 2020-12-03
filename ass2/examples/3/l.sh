#!/bin/dash
# l [file|directories...] - list files
# written by andrewt@cse.unsw.edu.au as a COMP2041 example

ls -las "$@"
exit 0
echo good # qwe
echo bad
ls /good #aaaa
ls /bad
asd=123
asd=456 #bbbbb
asd=$bbb #ccccc
asd=$bbb
asd=$bbb #ccccc
cd
cd #asd
cd /asd
cd /asd #asd
exit 1
    exit 1 #asd
# read 123
# echo 123

if test -r /dev/null
then
    if test -r /dev/null
    then
        echo a #asdsddad
        asd=$bbb ######ccccc
    elif test -r /dev/null
        echo b
    fi
elif test -r /dev/null
    echo b # asdasd
fi

if test nonexistantfile > sdfdfs
then
    for i in $asd
    do
        if test nonexistantfile > sdfdfs
        then
            echo b
        fi
    done
else
    echo a
fi
