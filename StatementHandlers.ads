with TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Statements; use TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Statements;


package StatementHandlers is

   type StatementHandler is tagged
      record
         tokens: TokenHandler;
      end record;

   type CompoundStatement is new Statement_Access;

   function createStatement(T: in TokenHandler) return Statement_Access;
   function executeCompoundStatement(skip: in Boolean; T: in TokenHandler) return Integer;

end StatementHandlers;
