with Statements, CompoundStatements, ProgramStatements;
use Statements, CompoundStatements, ProgramStatements;

package body StatementHandlers is

   function createStatement(T: in TokenHandler) return Statement_Access is

      currenttoken : String := (T.tokens.Element(0));
      S : Statement_Access;



   begin
      if(currenttoken = "begin") then
         return S;
      end if;
      return S;


   end createStatement;

   function executeCompoundStatement(skip: in Boolean; T: in TokenHandler) return Integer is
      TK: TokenHandler := T;
      S: StatementHandler;
      tokensexecuted: Integer;
      currenttoken : Unbounded_String;
   begin
      TokenHandlers.match("begin", TK);
      currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
      while(currenttoken /= "end") loop
         if(currenttoken = "begin") then
           createStatement(T);
           tokensexecuted := executeCompoundStatement(False, TK);
         end if;
         TokenHandlers.moveAhead(tokensexecuted, TK);
         currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
      end loop;
      TokenHandlers.match("end", TK);
      return TokenHandlers.resetTokens(TK);
   end executeCompoundStatement;


end StatementHandlers;
