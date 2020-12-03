#include<stdio.h>

// "r"	以“只读”方式打开文件。只允许读取，
//     不允许写入。文件必须存在，否则打开失败。
// "w"	以“写入”方式打开文件。如果文件不存在，
//     那么创建一个新文件；如果文件存在，那么清空文件内容（相当于删除原文件，再创建一个新文件）。
// "a"	以“追加”方式打开文件。如果文件不存在，
//     那么创建一个新文件；如果文件存在，那么将写入的数据追加到文件的末尾（文件原有的内容保留）。
// "r+"以“读写”方式打开文件。
//     既可以读取也可以写入，也就是随意更新文件。文件必须存在，否则打开失败。
// "w+"以“写入/更新”方式打开文件，
//     相当于w和r+叠加的效果。既可以读取也可以写入，也就是随意更新文件。如果文件不存在，那么创建一个新文件；如果文件存在，那么清空文件内容（相当于删除原文件，再创建一个新文件）。
// "a+"以“追加/更新”方式打开文件，
//     相当于a和r+叠加的效果。既可以读取也可以写入，也就是随意更新文件。如果文件不存在，那么创建一个新文件；如果文件存在，那么将写入的数据追加到文件的末尾（文件原有的内容保留）。

// int main(int argc, char const *argv[]){
//     /* code */
//     return 0;
// }

// int main(){
//     FILE * fp;
//     fp = fopen("testfile", "a+");
//     fprintf(fp, "%s", "我正在向文件中写入\n");
//     fclose(fp);
//     //printf("%s\n, ch");
//     // printf("%s\n, fp");
//     return 0;
// }

// int main()
// {
//    FILE *fp;
//    char c;

//    fp = fopen("testfile", "w");

//    c = fgetc(fp);
//    if( ferror(fp) )
//    {
//       printf("读取文件：file.txt 时发生错误\n");
//    }
//    clearerr(fp);
//    if( ferror(fp) )
//    {
//       printf("读取文件：file.txt 时发生错误\n");
//    }
//    fclose(fp);

//    return(0);
// }

int main(int argc, char const *argv[]){
    FILE * fp;
    fp = fopen("testfile", "r");
    int ch;
    if(fp == NULL){
      perror("打开文件时发生错误");
      return(-1);
    }
    for(;;){
        ch = fgetc(fp);
        if(feof(fp)){ //fp读取结束后feof(fp) == 0;
            break;
        }
        printf("%c", ch);
    }
    fclose(fp);
    return 0;
}
 