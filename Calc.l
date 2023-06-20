
/*Alphabet : [a-zA-z]+*/
/*Digit : [0-9]+*/
/*Alphanumeric : [A-Za-z0-9]+*/
/*Identifier : [a-zA-Z][a-zA-Z0-9]* */
/*Unsigned integer number : [0-9]+  */
/*Unsigned decimal number : [0-9]+.[0-9]+ */
/*Unsigned decimal number in scientific notation : [0-9]+.[0-9]+([eE][+-]?[0-9]+)? */


%{
  int op = 0,i;
  float a, b;
  int error = 0;
  int operand_count = 0;
%}


dig [0-9]+|([0-9]*)"."([0-9]+)
add "+"
sub "-"
mul "*"
div "/"
pow "^"
ln \n
%%
  
{dig} { 
    if(!error) {
        digi(); 
        operand_count++; //count number of operand 
    } 
} 
{add} { 
    if(!error) {
      // if the operator didn't encounter more than 2 then there's it enough operands
        if(operand_count > 1) {
            printf("ERROR in the expression!!\n");
            error= 1;
            break;
        } else {
            op=1;
        }
    } 
}
{sub} { 
  if(!error) {
      // if the operator didn't encounter more than 2 then there's it enough operands
        if(operand_count > 1) {
            printf("ERROR in the expression!!\n");
            error= 1;
            break;
        } else {
            op=2;
        }
    } 
}

{mul} { 
  if(!error) {
      // if the operator didn't encounter more than 2 then there's it enough operands
        if(operand_count > 1) {
            printf("ERROR in the expression!!\n");
            error= 1;
            break;
        } else {
            op=3;
        }
    } 
}
{div} { 
  if(!error) {
      // if the operator didn't encounter more than 2 then there's it enough operands
        if(operand_count > 1) {
            printf("ERROR in the expression!!\n");
            error= 1;
            break;
        } else {
            op=4;
        }
    } 
}
{pow} { 
  if(!error) {
      // if the operator didn't encounter more than 2 then there's it enough operands
        if(operand_count > 1) {
            printf("ERROR in the expression!!\n");
            error= 1;
            break;
        } else {
            op=5;
        }
    } 
}

[a-zA-Z0-9]+ { printf("%s - Error in the expression MOMENT \n", yytext); error = 1; break;}

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
    printf(" = %.2f\n\n",a);
    break;
  
   case 2:
   printf("%.2f - %.2f",a,b);
   a=a-b;
   printf("= %.2f\n\n",a);
   break;
   
   case 3:
   printf("%.2f * %.2f",a,b);
   a=a*b;
   printf("= %.2f\n\n",a);
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
