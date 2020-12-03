#include<stdio.h>
#include<stdlib.h>

//r文件必须存在
//
int main(){
    FILE *pf = fopen("testfile", "r");
    if(!pf){
        printf("文件打开失败\n");
    }else{
        printf("文件打开成功\n");
        // while(!feof(pf)){
        //     char ch = fgetc(pf); //从文件读取一个字符保存到ch中
        //     // putchar(ch);  //输出这个字符
        //     printf("%c", ch);
        // }
        for(;;){
            int ch = fgetc(pf);
            if(feof(pf)){
                break;
            }
            putchar(ch);
        }
        fclose(pf); //关闭文件指针
    }
}