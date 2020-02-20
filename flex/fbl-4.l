/* even more like Unix wc */
%option noyywrap
%{
int chars = 0;
int words = 0;
int lines = 0;
%}
%%
[a-z] { printf("Es una variable\n"); }
[A-Z] { printf("Es una constante\n"); }
"int" {printf("Es un entero");}
"+" { printf("Suma\n"); }
"-" { printf("Resta\n"); }
"*" { printf("Multiplicacion\n"); }
"/" { printf("Division\n"); }
"|" { printf("Valor absoluto\n"); }
[0-9]+ { printf("Numero %s\n", yytext); }
\n { printf("NEWLINE\n"); }
[ \t] { }
. { printf("Mystery character %s\n", yytext); }


%%
main(argc, argv)
int argc;
char **argv;
    {
if(argc > 1) {
if(!(yyin = fopen(argv[1], "r"))) {
perror(argv[1]);
return (1);
}
}
yylex();
printf("%8d%8d%8d\n", lines, words, chars);
}
