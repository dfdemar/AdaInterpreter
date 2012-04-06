with Statements, Statements.PrintStatements, Statements.AssignmentStatements, Ada.Containers;
use Statements, Statements.PrintStatements, Statements.AssignmentStatements, Ada.Containers;

package body Statements.StatementHandlers is

   procedure createStatement(T : in TokenHandler; stmt: out Statement_Access) is
      currenttoken : Unbounded_String;
      C            : CompoundStatement;
      P            : PrintStatement;
      A            : AssignmentStatement;

   begin
      currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(T));
      if currenttoken = "begin" then
         createCompoundStatement(T, C);
         stmt := new CompoundStatement;
         stmt.all := Statement'Class(C);
      elsif currenttoken = "print" then
         createPrintStatement(T, P);
         stmt := new PrintStatement;
         stmt.all := Statement'Class(P);
      elsif isVariable(To_String(currenttoken)) then
         createAssignmentStatement(T, A);
         stmt := new AssignmentStatement;
         stmt.all := Statement'Class(A);
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
      match("begin", TK);
      currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
      while(currenttoken /= "end") loop
         createStatement(TK, stmt);
         tokensexecuted := execute(skip, TK, stmt.all);
         TokenHandlers.moveAhead(tokensexecuted, TK);
         currenttoken := To_Unbounded_String(TokenHandlers.getCurrentToken(TK));
      end loop;
      TokenHandlers.match("end", TK);
      return TokenHandlers.resetTokens(TK);
   end execute;

   function execute(skip: in Boolean; T: in TokenHandler; W: in WhileStatement) return Integer is
      TK: TokenHandler := T;
      stmt: Statement_Access;
      tokensexecuted: Integer;
      statementistrue: Boolean;
      conditiontokens: Vector;
      size: Integer;
   begin
      match("while", TK);
      conditionIsTrue(TK, conditiontokens, statementistrue);
      match("do", TK);
      createStatement(T, stmt);

      while(statementistrue) loop
         tokensexecuted := execute(skip, TK, stmt.all);
         TK.tokencopy := conditiontokens;

         while(conditiontokens.Length > 0) loop
            conditiontokens.Delete_First;
         end loop;

         conditionIsTrue(TK, conditiontokens, statementistrue);
         size := Integer(T.executedtokens.Length);

         for I in (size - Integer(conditiontokens.Length)) .. (size - 1) loop
            TK.executedtokens.Delete_First;
         end loop;
      end loop;

      return TokenHandlers.resetTokens(TK);
   end execute;




end Statements.StatementHandlers;
