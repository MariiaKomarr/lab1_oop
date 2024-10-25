grammar LabCalculator;

/*
 * Parser Rules
 */
compileUnit : expression EOF;

expression
    : INC LPAREN expression RPAREN                                   # IncExpr
    | DEC LPAREN expression RPAREN                                   # DecExpr
    | LPAREN expression RPAREN                                       # ParenthesizedExpr
    | expression EXPONENT expression                                 # ExponentialExpr
    | expression operatorToken=(MULTIPLY | DIVIDE | MOD | DIV) expression # MultiplicativeExpr
    | expression operatorToken=(ADD | SUBTRACT) expression           # AdditiveExpr
    | NUMBER                                                         # NumberExpr
    | IDENTIFIER                                                     # IdentifierExpr
    ;

/*
 * Lexer Rules
 */
NUMBER      : INT ('.' INT)?;
IDENTIFIER  : [a-zA-Z]+[1-9][0-9]+;
INT         : ('0'..'9')+;
EXPONENT    : '^';
MULTIPLY    : '*';
DIVIDE      : '/';
SUBTRACT    : '-';
ADD         : '+';
LPAREN      : '(';
RPAREN      : ')';
COMMA       : ',';
INC         : 'inc';
DEC         : 'dec';
MOD         : '%';
DIV         : '//';
WS          : [ \t\r\n]+ -> skip;
