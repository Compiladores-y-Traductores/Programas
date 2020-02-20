%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%
"int"	{ printf("Es tipo entero\n");}
"+"	{ printf("PLUS\n");  }
"-"	{ printf("MINUS\n"); }
"*"	{ printf("TIMES\n"); }
"/"	{ printf("DIVIDE\n"); }
"|"	{ printf("ABS\n"); }
"="	{ printf("Asignacion =\n");}
" "	{ printf(" ");}
"^" { printf("Elevacion\n"); }
[0-9]+ 	{ printf("NUMBER %s\n", yytext); }
[a-z]+	{ printf("Variable %s\n",yytext);}
[A-Z]+	{ printf("Constante %s\n",yytext);}
\n	{ printf("NEWLINE\n"); }
[\t]    { }
.	{ printf("Mystery character %s\n", yytext); }

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