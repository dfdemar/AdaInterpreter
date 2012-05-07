package body Statements.IfStatements is

   procedure execute(skip: in Boolean; I: in out IfStatement; reset: out Integer) is
      currenttoken : Unbounded_String;
      stmt : Statement_Access;
      tokensexecuted : Integer;
      outcondition : Vector;
      trueCondition : Boolean;
   begin
      match(I, "if");
      currenttoken := getCurrentToken(I);

      if skip then
         while currenttoken /= "else" loop
            match(I, currenttoken);
            currenttoken := getCurrentToken(I);
         end loop;

         match(I, "else");
         statementFactory(I, stmt);
         execute(skip, stmt.all, tokensexecuted);
         moveAhead(I, tokensexecuted);
      end if;

      conditionIsTrue(I, I.tokens, outcondition, trueCondition);

      if trueCondition then
         match(I, "then");
         statementFactory(I, stmt);
         execute(skip, stmt.all, tokensexecuted);
         moveAhead(I, tokensexecuted);

         match(I, "else");
         statementFactory(I, stmt);
         execute(true, stmt.all, tokensexecuted);
         moveAhead(I, tokensexecuted);
      else
         currenttoken := getCurrentToken(I);
         while currenttoken /= "else" loop
            match(I, currenttoken);
            currenttoken := getCurrentToken(I);
         end loop;
         match(I, "else");
         statementFactory(I, stmt);
         execute(skip, stmt.all, tokensexecuted);
         moveAhead(I, tokensexecuted);
      end if;
      resetTokens(I, reset);

   end execute;

end Statements.IfStatements;
