#include<stdio.h>
#include<stdlib.h>

//函数指针的指针
int add(int a, int b){
    printf("%d, %d\n", a, b);

    return a + b;
}

int add8848(int a, int b){
    printf("%d, %d\n", a, b);

    return a + b;
}

int main(){
    int (*p)(int a, int b) = add;
    int i = 0;
}