package body Statements.PrintStatements is

   procedure createPrintStatement(T : in TokenHandler; P: out PrintStatement) is
   begin
      P.tokens := T.tokens;
   end createPrintStatement;

   function execute(skip: in Boolean; T: in TokenHandler; P: in PrintStatement) return Integer is
      TK : TokenHandler := T;
      nexttoken : Unbounded_String;
   begin
      match("print", TK);
      nexttoken := To_Unbounded_String(getCurrentToken(TK));
      if(not skip) then
         Ada.Integer_Text_IO.Put(readTokenValue(To_String(nexttoken)));
      end if;
      match(To_String(nexttoken), TK);
      return resetTokens(TK);
   end execute;

end Statements.PrintStatements;
