procedure get_statement(lex : in out Lexical_Analyzer; stmt: out Statement_Access) is
   token  : Lexeme; --Lexeme is type String;
   w_stmt : While_Statement;

begin
   get_next_token(lex, token);
   if token = "while" then
      get_while_statement(lex, w_stmt);
      stmt := new While_Statement;
      stmt.all := Statement'Class(w_stmt);
   elsif token = "if"



     S: Statement_Access

       get_statement(lex, S);
