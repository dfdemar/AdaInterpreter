package body Statements.AssignmentStatements is

   procedure createAssignmentStatement(T : in TokenHandler; A: out AssignmentStatement) is
   begin
      A.tokens := T.tokens;
   end createAssignmentStatement;

   function execute(skip: in Boolean; T: in TokenHandler; A: in AssignmentStatement) return Integer is
      ParserException : Exception;
      TK : TokenHandler := T;
      currenttoken : Unbounded_String;
      variablebeingassigned : Character;
      variablevalue : Integer;
      operand : Integer;
   begin
      currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
      if(not isVariable(To_String(currenttoken))) then
         raise ParserException with ("Not a variable: " & To_String(currenttoken));
      end if;
      variablebeingassigned := Element(currenttoken, 1);
      match(To_String(currenttoken), TK);
      match(":=", TK);
      currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));

      if(not skip) then
         variablevalue := readTokenValue(To_String(currenttoken));
         variables(variablebeingassigned) := variablevalue;
      end if;

      match(to_String(currenttoken), TK);
      currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));

      while isMathOperator(To_String(currenttoken)) loop
         if currenttoken = "+" then
            match("+", TK);
            currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
            if(not skip) then
               operand := readTokenValue(To_String(currenttoken));
               variablevalue := variablevalue + operand;
               variables(variablebeingassigned) := variablevalue;
            end if;

            match(to_String(currenttoken), TK);

         elsif currenttoken = "-" then
            match("-", TK);
            currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
            if(not skip) then
               operand := readTokenValue(To_String(currenttoken));
               variablevalue := variablevalue - operand;
               variables(variablebeingassigned) := variablevalue;
            end if;

            match(to_String(currenttoken), TK);

         elsif currenttoken = "*" then
            match("*", TK);
            currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
            if(not skip) then
               operand := readTokenValue(To_String(currenttoken));
               variablevalue := variablevalue * operand;
               variables(variablebeingassigned) := variablevalue;
            end if;

            match(to_String(currenttoken), TK);

         elsif currenttoken = "/" then
            match("/", TK);
            currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
            if(not skip) then
               operand := readTokenValue(To_String(currenttoken));
               variablevalue := variablevalue / operand;
               variables(variablebeingassigned) := variablevalue;
            end if;

            match(to_String(currenttoken), TK);
         end if;
         currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
      end loop;

      return resetTokens(TK);
   end execute;

end Statements.AssignmentStatements;
