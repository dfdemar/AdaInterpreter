package body Statements.AssignmentStatements is

   procedure execute(skip: in Boolean; A: in out AssignmentStatement; reset: out Integer) is
      ParserException : Exception;
      currenttoken : Unbounded_String;
      variablebeingassigned : Character;
      variablevalue : Integer;
      operand : Integer;
   begin
      currenttoken := getCurrentToken(A);
      if(not isVariable(To_String(currenttoken))) then
         raise ParserException with ("Not a variable: " & To_String(currenttoken));
      end if;
      variablebeingassigned := Element(currenttoken, 1);
      match(A, currenttoken);
      match(A, ":=");
      currenttoken := getCurrentToken(A);

      if(not skip) then
         variablevalue := readTokenValue(To_String(currenttoken));
         variables(variablebeingassigned) := variablevalue;
      end if;

      match(A, currenttoken);
      currenttoken := getCurrentToken(A);

      while isMathOperator(To_String(currenttoken)) loop
         if currenttoken = "+" then
            match(A, "+");
            currenttoken := getCurrentToken(A);
            if(not skip) then
               operand := readTokenValue(To_String(currenttoken));
               variablevalue := variablevalue + operand;
               variables(variablebeingassigned) := variablevalue;
            end if;

            match(A, currenttoken);

         elsif currenttoken = "-" then
            match(A, "-");
            currenttoken := getCurrentToken(A);
            if(not skip) then
               operand := readTokenValue(To_String(currenttoken));
               variablevalue := variablevalue - operand;
               variables(variablebeingassigned) := variablevalue;
            end if;

            match(A, currenttoken);

         elsif currenttoken = "*" then
            match(A, "*");
            currenttoken := getCurrentToken(A);
            if(not skip) then
               operand := readTokenValue(To_String(currenttoken));
               variablevalue := variablevalue * operand;
               variables(variablebeingassigned) := variablevalue;
            end if;

            match(A, currenttoken);

         elsif currenttoken = "/" then
            match(A, "/");
            currenttoken := getCurrentToken(A);
            if(not skip) then
               operand := readTokenValue(To_String(currenttoken));
               if operand = 0 then
                  raise ParserException with("Cannot divide by zero.");
               end if;
               variablevalue := variablevalue / operand;
               variables(variablebeingassigned) := variablevalue;
            end if;

            match(A, currenttoken);
         end if;
         currenttoken := getCurrentToken(A);
      end loop;

      resetTokens(A, reset);
   end execute;

end Statements.AssignmentStatements;
