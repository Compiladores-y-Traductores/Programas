%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%
"int"	{ printf("Es tipo entero ");}
"+"	{ printf(" Suma ");  }
"-"	{ printf(" Resta "); }
"*"	{ printf(" Multiplicacion "); }
"/"	{ printf(" Division "); }
"|"	{ printf(" Valor Absoluto"); }
"="	{ printf(" Igual ");}
" "	{ printf(" ");}
"^" { printf("Elevacion "); }
[0-9]+ 	{ printf("%s", yytext); }
[a-z]+	{ printf("%s",yytext);}
[A-Z]+	{ printf("%s",yytext);}
\n	{ printf("\n Salto de Linea \n"); }
[\t]    { }
.	{ printf("Caracter no valido %s\n", yytext); }

%%

int main(int argc,char **argv)
	{
		if(argc > 1) {
			if(!(yyin = fopen(argv[1], "r"))) {
				perror(argv[1]);
				return (1);
			}
		}
		yylex();
	}