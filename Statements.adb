with Statements.CompoundStatements, Statements.AssignmentStatements, Statements.PrintStatements, Statements.IfStatements, Statements.WhileStatements;
use Statements.CompoundStatements, Statements.AssignmentStatements, Statements.PrintStatements, Statements.IfStatements, Statements.WhileStatements;

package body Statements is

   procedure createStatement(tokens : Vector; S : out Statement) is
   begin
      S.tokens := tokens;
   end createStatement;

   procedure statementFactory(S: in out Statement; stmt: out Statement_Access) is
      currenttoken : Unbounded_String;
      C            : CompoundStatement;
      A            : AssignmentStatement;
      P            : PrintStatement;
      I            : IfStatement;
      W            : WhileStatement;

   begin
      currenttoken := getCurrentToken(S);
      if currenttoken = "begin" then
         createStatement(S.tokens, C);
         stmt := new CompoundStatement;
         stmt.all := Statement'Class(C);
      elsif isVariable(To_String(currenttoken)) then
         createStatement(S.tokens, A);
         stmt := new AssignmentStatement;
         stmt.all := Statement'Class(A);
      elsif currenttoken = "print" then
         createStatement(S.tokens, P);
         stmt := new PrintStatement;
         stmt.all := Statement'Class(P);
      elsif currenttoken = "if" then
         createStatement(S.tokens, I);
         stmt := new IfStatement;
         stmt.all := Statement'Class(I);
      elsif currenttoken = "while" then
         createStatement(S.tokens, W);
         stmt := new WhileStatement;
         stmt.all := Statement'Class(W);
      else
         raise ParserException with ("No valid syntax: " & To_String(currenttoken));
      end if;
   end statementFactory;

   function getCurrentToken(S: Statement) return Unbounded_String is
   begin
      return To_Unbounded_String(S.tokens.Element(0));
   end getCurrentToken;

   procedure match(S: in out Statement; tokenlist : in out Vector; token : in String) is
   begin
      if(token = tokenlist.First_Element) then
         S.executedtokens.Append(token);
         tokenlist.Delete_First;
      else
         raise ParserException with ("Unexpected token: " & '"' & S.tokens.First_Element & '"' & " does not match expected keyword " & '"' & token & '"');
      end if;
   end match;

   procedure match(S: in out Statement; tokenlist : in out Vector; token : in Unbounded_String) is
   begin
      match(S, tokenlist, To_String(token));
   end match;

   procedure match(S: in out Statement; token : in Unbounded_String) is
   begin
      match(S, S.tokens, To_String(token));
   end match;

   procedure match(S: in out Statement; token : in String) is
   begin
      match(S, S.tokens, token);
   end match;

   procedure moveAhead(S: in out Statement; numberofelements: in Integer) is
   begin
      for I in Integer range 1 .. numberofelements loop
         match(S, getCurrentToken(S));
      end loop;
   end moveAhead;

   procedure resetTokens(S: in out Statement; tokensize: out Integer) is
   begin
      S.tokens.Clear;

      S.tokens := S.executedtokens;

      tokensize := Integer(S.executedtokens.Length);
      S.executedtokens.Clear;
   end resetTokens;

   procedure conditionIsTrue(S: in out Statement; tokenlist: in out Vector; outCondition: in out Vector; Condition: out Boolean) is
      ParserException : Exception;
      currenttoken: Unbounded_String;
      leftvalue: Integer;
      rightvalue: Integer;
   begin
      currenttoken := To_Unbounded_String(tokenlist.First_Element);
      leftvalue := readTokenValue(To_String(currenttoken));
      outCondition.Append(To_String(currenttoken));
      match(S, tokenlist, currenttoken);
      currenttoken := To_Unbounded_String(tokenlist.First_Element);

      if(currenttoken = "<") then
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         currenttoken := To_Unbounded_String(tokenlist.First_Element);
         rightvalue := readTokenValue(To_String(currenttoken));
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         Condition := (leftvalue < rightvalue);

      elsif(currenttoken = ">") then
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         currenttoken := To_Unbounded_String(tokenlist.First_Element);
         rightvalue := readTokenValue(To_String(currenttoken));
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         Condition := (leftvalue > rightvalue);

      elsif(currenttoken = "<=") then
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         currenttoken := To_Unbounded_String(tokenlist.First_Element);
         rightvalue := readTokenValue(To_String(currenttoken));
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         Condition := (leftvalue <= rightvalue);

      elsif(currenttoken = ">=") then
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         currenttoken := To_Unbounded_String(tokenlist.First_Element);
         rightvalue := readTokenValue(To_String(currenttoken));
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         Condition := (leftvalue >= rightvalue);

      elsif(currenttoken = "=") then
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         currenttoken := To_Unbounded_String(tokenlist.First_Element);
         rightvalue := readTokenValue(To_String(currenttoken));
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         Condition := (leftvalue = rightvalue);

      elsif(currenttoken = "/=") then
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         currenttoken := To_Unbounded_String(tokenlist.First_Element);
         rightvalue := readTokenValue(To_String(currenttoken));
         outCondition.Append(To_String(currenttoken));
         match(S, tokenlist, currenttoken);
         Condition := (leftvalue /= rightvalue);

      else
         raise ParserException with ("Not a valid condition: " & To_String(currenttoken));
      end if;
   end conditionIsTrue;

end Statements;
