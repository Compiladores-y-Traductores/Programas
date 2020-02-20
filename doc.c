//Ej5_Funciones.c
#include <stdio.h>
#include <stdlib.h>
//prueba de un commit
int main(int argc, char*argv[]){
    FILE *fp;
    int i=0;
    char c;
    fp=fopen(argv[1],"r");
    while(!feof(fp)){
        c = getc(fp);
        i++;
    }
    rewind(fp);
    char leida[i];
    while(fgets(leida, i, fp)) {
        printf("%s",leida);
    }

    //fgets(leida,i,fp);
    fclose(fp);
    //printf("\nCadena leida: %s\n",leida);
    //system("PAUSE");
    return 0;
}

