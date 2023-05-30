package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}
(":") {return new Symbol(sym.Dos_P, yychar, yyline, yytext());}

/* Tipos de datos */
( byte | char | long | float | double ) {return new Symbol(sym.T_dato, yychar, yyline, yytext());}

/* Tipo de dato Int (Para el main) */
( "int" ) {return new Symbol(sym.Int, yychar, yyline, yytext());}

/* Tipo de dato String */
( String ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Operador Division */
( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<="  ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "++" | "--" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( true | false ) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/*Salida de datos*/
("cout") {return new Symbol(sym.Cout, yychar, yyline, yytext());}
("cin") {return new Symbol(sym.Cin, yychar, yyline, yytext());}

("<<") {return new Symbol(sym.Doble_Menor, yychar, yyline, yytext());}
(">>") {return new Symbol(sym.Doble_Mayor, yychar, yyline, yytext());}

/*Include*/
("#include") {return new Symbol(sym.Include, yychar, yyline, yytext());}

/*Librerias*/
("<iostream>") {return new Symbol(sym.Libreria, yychar, yyline, yytext());}

/*using*/
("using") {return new Symbol(sym.Using, yychar, yyline, yytext());}

/*Librerias*/
("namespace") {return new Symbol(sym.NameSpace, yychar, yyline, yytext());}

/*Librerias*/
("std") {return new Symbol(sym.Espacio_de_Nombre, yychar, yyline, yytext());}

("break") {return new Symbol(sym.Break, yychar, yyline, yytext());}
("bool") {return new Symbol(sym.Bool, yychar, yyline, yytext());}
("default") {return new Symbol(sym.Default, yychar, yyline, yytext());}
("case") {return new Symbol(sym.Case, yychar, yyline, yytext());}
("asm") {return new Symbol(sym.Asm, yychar, yyline, yytext());}
("catch") {return new Symbol(sym.Catch, yychar, yyline, yytext());}

("class") {return new Symbol(sym.Class, yychar, yyline, yytext());}
("const") {return new Symbol(sym.Const, yychar, yyline, yytext());}
("continue") {return new Symbol(sym.Continue, yychar, yyline, yytext());}
("delete") {return new Symbol(sym.Delete, yychar, yyline, yytext());}
("dynamic_cast") {return new Symbol(sym.Dynamic_cast, yychar, yyline, yytext());}
("explicit") {return new Symbol(sym.Explicit, yychar, yyline, yytext());}

("friend") {return new Symbol(sym.Friend, yychar, yyline, yytext());}
("inline") {return new Symbol(sym.Inline, yychar, yyline, yytext());}

("mutable") {return new Symbol(sym.Mutable, yychar, yyline, yytext());}
("new") {return new Symbol(sym.New, yychar, yyline, yytext());}
("operator") {return new Symbol(sym.Operator, yychar, yyline, yytext());}
("private") {return new Symbol(sym.Private, yychar, yyline, yytext());}
("protected") {return new Symbol(sym.Protected, yychar, yyline, yytext());}
("public") {return new Symbol(sym.Public, yychar, yyline, yytext());}
("register") {return new Symbol(sym.Register, yychar, yyline, yytext());}
("reinterpret_cast") {return new Symbol(sym.Reinterpret_cast, yychar, yyline, yytext());}
("return") {return new Symbol(sym.Return, yychar, yyline, yytext());}
("short") {return new Symbol(sym.Short, yychar, yyline, yytext());}
("signed") {return new Symbol(sym.Signed, yychar, yyline, yytext());}
("sizeof") {return new Symbol(sym.Sizeof, yychar, yyline, yytext());}
("static") {return new Symbol(sym.Static, yychar, yyline, yytext());}
("static_cast") {return new Symbol(sym.Static_cast, yychar, yyline, yytext());}
("struct") {return new Symbol(sym.Struct, yychar, yyline, yytext());}
("switch") {return new Symbol(sym.Switch, yychar, yyline, yytext());}
("template") {return new Symbol(sym.Template, yychar, yyline, yytext());}
("this") {return new Symbol(sym.This, yychar, yyline, yytext());}
("throw") {return new Symbol(sym.Throw, yychar, yyline, yytext());}
("try") {return new Symbol(sym.Try, yychar, yyline, yytext());}
("typedef") {return new Symbol(sym.Typedef, yychar, yyline, yytext());}
("typeid") {return new Symbol(sym.Typeid, yychar, yyline, yytext());}
("typename") {return new Symbol(sym.Typename, yychar, yyline, yytext());}
("union") {return new Symbol(sym.Union, yychar, yyline, yytext());}
("unsigned") {return new Symbol(sym.Unsigned, yychar, yyline, yytext());}
("virtual") {return new Symbol(sym.Virtual, yychar, yyline, yytext());}
("void") {return new Symbol(sym.Void, yychar, yyline, yytext());}
("volatile") {return new Symbol(sym.Volatile, yychar, yyline, yytext());}




/*Para declaracion simultanea de variables*/
{L}({L}|{D}|"_")*"\," {return new Symbol(sym.Variables, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}


/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/*Cadena de Carateres*/
("\""({L}|{D}|" ")*"\"") {return new Symbol(sym.Palabra, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
