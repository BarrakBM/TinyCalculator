%{
  int op = 0,i;
  float a, b;
  int error = 0;
%}


dig [0-9]+|([0-9]*)"."([0-9]+)
add "+"
sub "-"
mul "*"
div "/"
pow "^"
ln \n
%%
  
{dig} { if(!error) digi(); } 
{add} { if(!error) op=1;}
{sub} { if(!error) op=2;}
{mul} { if(!error) op=3;}
{div} { if(!error) op=4;}
{pow} { if(!error) op=5;} 

[a-zA-Z0-9]+ { printf("%s - Error in the expression MOMENT \n", yytext); error =1;}

%%
digi()
{
 if(op==0)
  

 a=atof(yytext); 
  
 else
 {
 b=atof(yytext);
  
 switch(op)
 {
   case 1:
    printf("%.2f + %.2f",a,b);
    a=a+b;
    printf(" = %.2f",a);
    break;
  
   case 2:
   printf("%.2f - %.2f",a,b);
   a=a-b;
   printf("= %.2f\n\n",a);
   break;
   
   case 3:
   printf("%.2f * %.2f",a,b);
   a=a*b;
   printf("= %.2f",a);
   break;
   
   case 4:
   printf("%.2f / %.2f",a,b);
   a=a/b;
   printf(" = %.2f\n\n",a);
   break;
   
   case 5:
   printf("%.2f ^ %.2f",a,b);
   for(i=a;b>1;b--){
    a=a*i;
   }
   printf(" = %.2f\n\n",a);
   break;
  }
 op=0;
 }
}
  
main(int argv,char *argc[])
{
 yylex();
}
  
yywrap()
{
return 1;
}
