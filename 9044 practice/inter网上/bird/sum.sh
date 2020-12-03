echo Please enter a number:
read num
sum=0
while (($num != 0))
do
    let sum+=num
    let num--
done
echo The sum = $sum