with Ada.Containers;
use Ada.Containers;

package body Statements.CompoundStatements is

   procedure execute(skip: in Boolean; C: in out CompoundStatement; reset: out Integer) is
      stmt: Statement_Access;
      tokensexecuted: Integer;
      currenttoken : Unbounded_String;
   begin
      match(C, "begin");
      currenttoken := getCurrentToken(C);
      while(currenttoken /= "end") loop
         statementFactory(C, stmt);
         execute(skip, stmt.all, tokensexecuted);
         moveAhead(C, tokensexecuted);
         currenttoken := getCurrentToken(C);
      end loop;
      match(C, "end");
      resetTokens(C, reset);
   end execute;

end Statements.CompoundStatements;
