#include<stdio.h>
#include<stdlib.h>
/**
 * fflush
*/
// int main(){
//     FILE *pf;
//     pf = fopen("testfile2", "a+");
//     if(pf == NULL){
//         //文件打开失败
//         printf("文件打开失败");
//     }else{
//         printf("文件打开成功\n");
//         fputs("学海无涯,真特么类,头发掉光光!\n", pf);  //写入文本
//         fflush(pf); //强制将缓冲区内容写入文件, buf中有效数据清零, 指针回到起始地址
//         fclose(pf);
//     }
//     return 0;
// }


/**
 * 文件重定向
 * c语言将所有东西当做文本处理
 * stdin: 标准输入文件指针, 系统分配为键盘
 * stdout: 标准输出文件指针, 系统分配为显示器
*/

int main() {
    //printf("锄禾日当午\n");
    //显示器当做一个文件来操作
    fprintf(stdout, "锄禾日当午\n");
    //fprintf可以输出任何文静
    puts("汗滴禾下土\n");
    fputs("汗滴禾下土\n", stdout);
    putchar('A');
    fputc('A', stdout);
    return 0;
}