with TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Statements, Ada.Text_IO;
use TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Statements, Ada.Text_IO;

package Statements.StatementHandlers is

   type CompoundStatement is new Statement with private;

   procedure createStatement(T : in TokenHandler; stmt: out Statement_Access);
   procedure createCompoundStatement(T : in TokenHandler; C: out CompoundStatement);
   function execute(skip: in Boolean; T: in TokenHandler; C: in CompoundStatement) return Integer;


private
   type CompoundStatement is new Statement with null record;

end Statements.StatementHandlers;
