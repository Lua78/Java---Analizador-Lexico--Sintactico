package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}
(":") {lexeme=yytext(); return Dos_P;}


/* Tipos de datos */
( byte | char | long | float | double ) {lexeme=yytext(); return T_dato;}

/* Tipo de dato String */
( String ) {lexeme=yytext(); return Cadena;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexeme=yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/*Salida de datos*/
( << ) {lexeme=yytext(); return Doble_Menor;}
( >> ) {lexeme=yytext(); return Doble_Mayor;}
("cout")  {lexeme=yytext(); return Cout;}

/*Include*/
("#include") {lexeme=yytext(); return Include;}

/* Libreria */
("<iostream>" | "<cctype>" | "<cmath>" | "<ctime>"  | "<cstring>" | "<cstdlib>" | "<random>" ) {lexeme=yytext(); return Libreria;}

/* Using */
("using") {lexeme=yytext(); return Using;}

/* Nombre de espacio */
("namespace") {lexeme=yytext(); return NameSpace;}

/* Espacio std */
("std") {lexeme=yytext(); return Espacio_de_Nombre;}

/* break  */
("break") {lexeme=yytext(); return Break;}
("bool") {lexeme=yytext(); return Bool;}
("default") {lexeme=yytext(); return Default;}
("case") {lexeme=yytext(); return Case;}
("asm") {lexeme=yytext(); return Asm;}
("catch") {lexeme=yytext(); return Catch;}

("dynamic_cast") {lexeme=yytext(); return Dynamic_cast;}
("explicit") {lexeme=yytext(); return Explicit;}
("friend") {lexeme=yytext(); return Friend;}
("inline") {lexeme=yytext(); return Inline;}

("mutable") {lexeme=yytext(); return Mutable;}
("new") {lexeme=yytext(); return New;}
("operator") {lexeme=yytext(); return Operator;}
("private") {lexeme=yytext(); return Private;}
("protected") {lexeme=yytext(); return Protected;}
("public") {lexeme=yytext(); return Public;}
("register") {lexeme=yytext(); return Register;}
("reinterpret_cast") {lexeme=yytext(); return Reinterpret_cast;}
("return") {lexeme=yytext(); return Return;}
("short") {lexeme=yytext(); return Short;}
("signed") {lexeme=yytext(); return Signed;}
("sizeof") {lexeme=yytext(); return Sizeof;}
("static") {lexeme=yytext(); return Static;}
("static_cast") {lexeme=yytext(); return Static_cast;}
("struct") {lexeme=yytext(); return Struct;}
("switch") {lexeme=yytext(); return Switch;}
("template") {lexeme=yytext(); return Template;}
("this") {lexeme=yytext(); return This;}
("throw") {lexeme=yytext(); return Throw;}
("try") {lexeme=yytext(); return Try;}
("typedef") {lexeme=yytext(); return Typedef;}
("typeid") {lexeme=yytext(); return Typeid;}
("typename") {lexeme=yytext(); return Typename;}
("union") {lexeme=yytext(); return Union;}
("unsigned") {lexeme=yytext(); return Unsigned;}
("virtual") {lexeme=yytext(); return Virtual;}
("void") {lexeme=yytext(); return Void;}
("volatile") {lexeme=yytext(); return Volatile;}
("cin") {lexeme=yytext(); return Cin;}


/* Identificador */
({L}({L}|{D} | "_")*"\,") {lexeme=yytext(); return Variables;}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/*Palabra*/
("\""({L}|{D}|" ")*"\"") {lexeme=yytext(); return Palabra;}


/* Error de analisis */
 . {return ERROR;}
