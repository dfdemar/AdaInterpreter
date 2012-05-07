package body Statements.ProgramStatements is

   procedure execute(skip: in Boolean; P: in out ProgramStatement; reset: out Integer) is
      C : CompoundStatement;
      tokensexecuted : Integer;
      currenttoken : Unbounded_String;
   begin
      match(P, "program");
      currenttoken := getCurrentToken(P);

      if(not skip) then
         if (Length(currenttoken)) = 1 then
            P.programname := To_String(currenttoken);
         else
            raise ParserException with ("Not a valid program name : " & To_String(currenttoken));
         end if;
      end if;

      match(P, currenttoken);
      createStatement(P.tokens, C);
      execute(skip, C, tokensexecuted);
      moveAhead(C, tokensexecuted);
      resetTokens(C, reset);
   end execute;

end Statements.ProgramStatements;
