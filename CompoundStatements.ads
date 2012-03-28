with TokenHandlers, String_Vectors, Statements, Ada.Text_IO, Ada.Strings.Unbounded, StatementHandlers;
use TokenHandlers, String_Vectors, Statements, Ada.Text_IO, Ada.Strings.Unbounded, StatementHandlers;


package CompoundStatements is

   type CompoundStatement is new Statement with private;

   function create_CompoundStatement(T: in TokenHandler) return CompoundStatement;
--   function execute(skip: in Boolean; T: in TokenHandler) return Integer;

private
   type CompoundStatement is new Statement with
      record
         tokens: Vector;
      end record;

end CompoundStatements;
