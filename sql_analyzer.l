%{
#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>

bool Mayuscula_minuscula(const char* s1, const char* s2) {
    while (*s1 && *s2) {
        if (tolower(*s1) != tolower(*s2)) {
            return false;
        }
        s1++;
        s2++;
    }
    return (*s1 == *s2);
}
%}

%%
[ \t\n]
[0-9]+                      { printf("NUMERO: %s\n", yytext); }
"="                         { printf("OPREL: %s\n", yytext); }
"<"                         { printf("OPREL: %s\n", yytext); }
","                         { printf("SIGNO: %s\n", yytext); }

[[:alpha:]_][[:alnum:]_]*   {
    if(Mayuscula_minuscula(yytext, "select") || Mayuscula_minuscula(yytext, "from") || Mayuscula_minuscula(yytext, "where")) {
        printf("PC: %s\n", yytext);
    } else {
        printf("ID: %s\n", yytext);
    }
}

.         { printf("TOKEN NO DEFINIDO: %s\n", yytext);}                  ; 

%%

int main() {
    yylex();
    return 0;
}
