with Ada.Containers;
use Ada.Containers;

package body Statements.WhileStatements is

   procedure execute(skip: in Boolean; W: in out WhileStatement; reset: out Integer) is
      stmt: Statement_Access;
      tokensexecuted: Integer;
      statementistrue: Boolean;
      conditiontokens: Vector;
      size: Integer;
   begin
      match(W, "while");
      conditionIsTrue(W, W.tokens, conditiontokens, statementistrue);
      match(W, "do");
      statementFactory(W, stmt);

      while(statementistrue) loop
         execute(skip, stmt.all, tokensexecuted);
         tokencopy := conditiontokens;
         conditiontokens.Clear;
         conditionIsTrue(W, tokencopy, conditiontokens, statementistrue);
         size := Integer(W.executedtokens.Length);

         for I in reverse (size - Integer(conditiontokens.Length)) .. (size - 1) loop
            W.executedtokens.Delete_Last;
         end loop;
      end loop;

      resetTokens(W, reset);
   end execute;

end Statements.WhileStatements;
