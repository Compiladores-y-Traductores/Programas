/* calculator with AST */
%{
# include <stdio.h>
# include <stdlib.h>
# include "fb3-1.h"
%}
%union {
struct ast *a;
double d;
}
/* declare tokens */
%token <d> NUMBER
%token EOL
%type <a> exp factor term