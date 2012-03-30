with Statements;
use Statements;

package body Statements.StatementHandlers is

   procedure createStatement(T : in TokenHandler; stmt: out Statement_Access) is
      currenttoken : Unbounded_String;
      C            : CompoundStatement;

   begin
      currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(T));
      if currenttoken = "begin" then
         createCompoundStatement(T, C);
         stmt := new CompoundStatement;
         stmt.all := Statement'Class(C);
      end if;
   end createStatement;

   procedure createCompoundStatement(T : in TokenHandler; C: out CompoundStatement) is
   begin
      C.tokens := T.tokens;
   end createCompoundStatement;

   function execute(skip: in Boolean; T: in TokenHandler; C: in CompoundStatement) return Integer is
      TK: TokenHandler := T;
      stmt: Statement_Access;
      tokensexecuted: Integer;
      currenttoken : Unbounded_String;
   begin
      TokenHandlers.match("begin", TK);
      currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
      while(currenttoken /= "end") loop
         Put(To_String(currenttoken));
         createStatement(T, stmt);
         tokensexecuted := execute(False, TK, stmt);
         TokenHandlers.moveAhead(tokensexecuted, TK);
         currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
      end loop;
      TokenHandlers.match("end", TK);
      return TokenHandlers.resetTokens(TK);
   end execute;


end Statements.StatementHandlers;
