#include<stdio.h>
#include<stdlib.h>

//stdin 对应键盘输入
//stdout 对应显示器输出

// int main() {
//     int num;
//     scanf("%d", &num);
//     printf("num = %d\n", num);

//     int numA;
//     fscanf(stdin, "%d", &numA);
//     printf("numA = %d\n", numA);
//     return 0;
// }

int main() {
    char str[50];
    //gets(str); //获取键盘输出, 初始化str
    //fgets(str, sizeof(str) - 1, stdin);
    //fgets 可以从任何文件中获取一个字符串
    //getchar(),得到一个字符，当你只想让用户输入一个字符时，
    //可以考虑用它，它只接受一个字符，其余不要，
    //比如让用户判断yes or no 时，你只想让用户输入Y 或者N时。
    //fputs(str, stdout);
    //system(str);

    //stderr始终在显示器, stdout如果重定向就会被写入磁盘
    //遇到错误, 就可以吧错误信息写入stderr, 会自动在显示器上输出
    fprintf(stderr, "你遇到的是%s, 重试次数是%d\n", "stderr", 3);
    fprintf(stdout, "你遇到的是%s, 重试次数是%d\n", "stdout", 3);

    int W = getw(stdin); //从键盘上获取字符串,系统自动转为二进制(int型只能容纳四个字节)
    putw(W, stdout);  //自动转回字符串, 输出到屏幕  int用于装容两个汉字的二进制
}