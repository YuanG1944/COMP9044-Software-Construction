today=`date`
echo "Today is "$today
echo "Please enter your birthday(xxxx-xx-xx)"
read birthday
#echo $(echo $birthday | awk '$0~/([0-9]{4})-((0[1-9])|(1[0-2]))-((0[1-9])|([12][0-9])|(3[01]))/{print $0}')
if [[ $(echo $birthday | awk '$0~/([0-9]{4})-((0[1-9])|(1[0-2]))-((0[1-9])|([12][0-9])|(3[01]))/{print $0}') == "" ]]
then
    echo "Erro input!"
else
    bd=`echo $birthday | awk '
                            BEGIN{FS="-"}
                            {sub(/-0/, "-"); print $2}
                          '`
    td=`echo $today | awk '
                            {print substr($2,1,1)}
                          '`
    echo $bd $td
    if (($bd > $td))
    then
        echo `expr $bd - $td`
    else   
        echo `expr $bd + 12 - $td`
    fi
fi

# 表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2，这与我们熟悉的大多数编程语言不一样。
# echo $birthday