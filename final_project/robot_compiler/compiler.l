%{
#include "y.tab.h"
%}

%%
[ \t]+                  ; /* ignore whitespace */
[0-9]+                  { yylval.ival = atoi(yytext);   return INTEGER; }
"Robot please"          { yylval.sval = strdup(yytext); return START; }
"move"                  { yylval.sval = strdup(yytext); return MOVE; }
"turn"                  { yylval.sval = strdup(yytext); return TURN; }
"blocks"                { yylval.sval = strdup(yytext); return BLOCKS; }
"degrees"               { yylval.sval = strdup(yytext); return DEGREES; }
"and"                   { yylval.sval = strdup(yytext); return AND; }
"then"                  { yylval.sval = strdup(yytext); return THEN; }
","                     { yylval.sval = strdup(yytext); return COMMA; }
\n                      { yylval.sval = strdup(yytext); return NEWLINE; }
.                       ; /* ignore all other characters */
%%

int yywrap(void){
        return 1;
}