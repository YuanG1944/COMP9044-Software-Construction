# a1="$(echo `egrep "Australian Capital Territory" parliament.txt | wc -l` "Australian Capital Territory")\n"
# a2="$(echo `egrep "Northern Territory" parliament.txt | wc -l` "Northern Territory")\n"
# a3="$(echo `egrep "Tasmania" parliament.txt | wc -l` "Tasmania")\n"
# a4="$(echo `egrep " Western Australia" parliament.txt | wc -l` " Western Australia")\n"
# a5="$(echo `egrep "South Australia" parliament.txt | wc -l` "South Australia")\n"
# a6="$(echo `egrep "Queensland" parliament.txt | wc -l` "Queensland")\n"
# a7="$(echo `egrep "Victoria" parliament.txt | wc -l` "Victoria")\n"
# a8="$(echo `egrep "New South Wales" parliament.txt | wc -l` "New South Wales")"
# echo $a1$a2$a3$a4$a5$a6$a7$a8| sort -n

# # echo "$a1" "$a2" "$a3" "$a4" "$a5" "$a6" "$a7" "$a8"


# sed -i "s/Hon Dr/1/g"

# cut -f1-3 -d" " parliament.txt

# cat parliament.txt | sed 's/^Hon //g' | sed 's/(^Dr )|(^Mrs )|(^Mr )//g'

# b=$(cat parliament.txt | sed 's/^Hon //g' | sed 's/^Dr //g' | sed 's/^Mrs //g' |  sed 's/^Mr //g' |  sed 's/^Ms //g' | cut -f1 -d" " | sort | uniq -c | sort -nr | head -n1)
# b=$(echo $b | tr -d 'a-zA-Z')
# c=$(cat parliament.txt | sed 's/^Hon //g' | sed 's/^Dr //g' | sed 's/^Mrs //g' |  sed 's/^Mr //g' |  sed 's/^Ms //g' | cut -f1 -d" " | sort | uniq -c | sort -nr | head | egrep -v "$b" | head -n1)
# c=$(echo $c | tr -d 'a-zA-Z')
# cat parliament.txt | sed 's/^Hon //g' | sed 's/^Dr //g' | sed 's/^Mrs //g' |  sed 's/^Mr //g' |  sed 's/^Ms //g' | cut -f1 -d" " | sort | uniq -c | sort -nr | head | egrep -v "$b" | head -n1

cat parliament.txt | sed 's/^Hon //g' | sed 's/^Dr //g' | sed 's/^Mrs //g' |  sed 's/^Mr //g' |  sed 's/^Ms //g' | cut -f1 -d" " | sort | uniq -c | sort -nr | head -n2 | tail -n1 | tr "0-9" " " | tr -d " "