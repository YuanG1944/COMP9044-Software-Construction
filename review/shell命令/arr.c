#include<stdio.h>
#include<stdlib.h>

// int main(){
//     int num[100]; //数组是连续排列的一段连续内存
//     for(int i = 0; i < 100; i++){
//         num[i] = i + 10;  //初始化数组
//     }
//     FILE *pf; //定义一个文件指针
//     pf = fopen("binArr", "w"); //二进制写入模式打开这个文件
//     if(pf == NULL){
//         printf("文件打开失败\n");
//     }else{
//         int res = 0;
//         res = fwrite(num, sizeof(int), 100, pf); //将内存写入文件
//         //写成功多少个, 会返回数量
//         //要写入内存的首地址
//         //一个元素有多大
//         //参数写多少个文件
//         //写到哪个文件
//         if(res == 100){
//             printf("写入成功\n");
//         }else{
//             printf("写入失败\n");
//         }
//         fclose(pf);
//     }
    
//     return 0;
// }

int main(){
    int num[100] = {0}; //数组是连续排列的一段连续内存
    FILE *pf; //定义一个文件指针
    pf = fopen("binArr", "rb"); //二进制写入模式打开这个文件
    if(pf == NULL){
        printf("文件打开失败\n");
    }else{
        int res = 0;
        res = fread(num, sizeof(int), 100, pf); //读取文件写入内存
        //res代表读成功多少个就返回数量
        //第一个参数,要写入内存的首地址
        //元素大小
        //数量
        //文件的指针
        if(res == 100){
            printf("读取成功\n");
        }else{
            printf("读取失败\n");
        }
        for(int i = 0; i < 100; i++){
            printf("num[%d] = %d\n", i, num[i]); //打印数据
        }
        fclose(pf);
    }
}