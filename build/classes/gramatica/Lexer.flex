package gramatica;
import java_cup.runtime.Symbol;
import principal.main;

%%
%public
%class AnalizadorLexico
%cup
%cupdebug
%line
%column

/*Identificadores*/
Binario = [01]

%{

    private Symbol symbol(int tipo){
        return new Symbol(tipo, yyline+1, yycolumn+1);
    }

    private Symbol symbol(int tipo, Object value){
        return new Symbol(tipo, yyline+1, yycolumn+1, value);
    }

%}
%%
<YYINITIAL>{
    "."                                                             {return symbol(sym.PUNTO);}
    {Binario}                                                       {return symbol(sym.BIN, new Integer(yytext()));}
    .                                                               {return symbol(sym.ERRO);}   
}
