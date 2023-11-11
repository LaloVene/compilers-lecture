%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
FILE* yyin;
FILE *outputFile;
%}

%union {
    int ival;
    char *sval;
}

%token <sval> START
%token <sval> MOVE
%token <sval> TURN
%token <sval> BLOCKS
%token <sval> DEGREES
%token <sval> NEWLINE
%token <sval> AND
%token <sval> THEN
%token <sval> COMMA
%token <ival> INTEGER


%%
instructions:
        |  instructions instruction
;

instruction:
            NEWLINE                         // empty line
        |   START order NEWLINE
        |   error NEWLINE                   { fprintf(outputFile, "Invalid statement\n"); }
;

order:
            action link action link action
        |   action link action
        |   action
;

action:
            MOVE INTEGER BLOCKS             { fprintf(outputFile, "MOV,%d\n", $2); }
        |   TURN INTEGER DEGREES            { fprintf(outputFile, "TURN,%d\n", $2); }
;
link:
            COMMA AND THEN
        |   AND THEN
        |   COMMA THEN
        |   COMMA AND
        |   COMMA
        |   AND
;
%%

int main(int argc, char **argv) {

    FILE *inputFile = fopen(argv[1], "r");
    if (!inputFile) {
        fprintf(stderr, "Usage: ./robot_compiler filename\n");
        return 1;
    }

    outputFile = fopen("instructions.asm", "w");

    yyin = inputFile;
    yyparse();
    fclose(inputFile);
    fclose(outputFile);
    
    return 0;
}
