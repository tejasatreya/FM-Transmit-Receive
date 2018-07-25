#include<stdio.h>
int main(void)
{

FILE *ptr ;
ptr=fopen("phase_increment_data16.txt","w");

if(ptr==NULL)
{
printf("error !") ;

}
else
{
int long num ;

int addr ;
int long final_data=12644370088 ;
int fix_inc=50332 ;
int long init_data=9345862468 ;
num=init_data ;

int com=44 ;
for(addr=0;addr<65536;addr++)
{
fprintf(ptr,"%li %c\n",num,com) ;
num=num+fix_inc ;

}

}

fclose(ptr);

return 0;

}


