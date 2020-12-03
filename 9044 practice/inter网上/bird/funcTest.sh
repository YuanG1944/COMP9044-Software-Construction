func(){
    echo $1
}
num=`func 3`
echo `expr $num + 2`
echo 进程号: $$

function demoFun1(){
    echo "这是我的第一个 shell 函数!"
    return `expr 1 + 1`
}
demoFun1
echo $?