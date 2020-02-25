/* recognize tokens for the calculator and print them out */
%%
"+" { printf("PLUS\n"); }
"-" { printf("MINUS\n"); }
"*" { printf("TIMES\n"); }
"/" { printf("DIVIDE\n"); }
"|" { printf("ABS\n"); }
[0-9]+ { printf("NUMBER %s\n", yytext); }
\n { printf("NEWLINE\n"); }
[ \t] { }
. { printf("Mystery character %s\n", yytext); }
%%

int main(int argc, char **argv)
    {
        /* even more like Unix wc */
        %option noyywrap
        %{
                int chars = 0;
                int words = 0;
                int lines = 0;
        %}
        %%
        [a-zA-Z]+
        \n
        .
        { words++; chars += strlen(yytext); }
        { chars++; lines++; }
        { chars++; }
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
        }
        yylex();
        printf("%8d%8d%8d\n", lines, words, chars);
        FILE *fp;
        char i, z;
        fp=fopen(argv[1],"r");

        //Este ciclo lee cada caracter del archivo hasta llegar al final del archivo
        while(!feof(fp))
            {
                getc(fp);
                i++;
            }

         char j[i];

        //Regresa al inicio del archivo
        rewind(fp);

        //Obtine el tamaño de cada linea del archivo
        while(fgets(j,i,fp))
            {
                printf("%s\n", j);
            }

        fclose(fp);
    }
