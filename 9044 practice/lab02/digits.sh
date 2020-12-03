while read line
do
    echo $line | sed 's/0/>/g' | sed 's/1/>/g' | sed 's/2/>/g' | sed 's/3/>/g' | sed 's/4/>/g' | sed 's/6/</g' | sed 's/7/</g' | sed 's/8/</g' | sed 's/9/</g'
done