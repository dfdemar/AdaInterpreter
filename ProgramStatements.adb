package body ProgramStatements is

   function execute(skip: in Boolean; T: in TokenHandler) return Integer is
      P: ProgramStatement;
      C: CompoundStatement;
      TK: TokenHandler := T;
      tokensexecuted: Integer;
      currenttoken : Unbounded_String;
   begin
      TokenHandlers.match("program", TK);
      currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));

      if(not skip) then
         P.programname := To_String(currenttoken);
      end if;

      TokenHandlers.match(To_String(currenttoken), TK);
      tokensexecuted := execute(False, TK, C);
      TokenHandlers.moveAhead(tokensexecuted, TK);
      return resetTokens(TK);
   end execute;



end ProgramStatements;
