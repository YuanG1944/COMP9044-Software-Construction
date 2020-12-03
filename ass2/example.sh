#!/bin/dash

echo '输入 1 到 4 之间的数字:'
echo '你输入的数字为:'
read aNum
case $aNum in
    1)  echo '你选择了 1'
    ;;
    2)  echo '你选择了 2'
    ;;
    3)  echo '你选择了 3'
    ;;
    4)  echo '你选择了 4'
    ;;
    *)  echo '你没有输入 1 到 4 之间的数字'
    ;;
esac

# given ($num) {
#    when ($_ > 0.7) {
#        say "$_ is larger than 0.7";
#    }
#    when ($_ > 0.4) {
#        say "$_ is larger than 0.4";
#    }
#    default {
#        say "$_ is something else";
#    }
# }
 

echo $*
echo =========
echo $@