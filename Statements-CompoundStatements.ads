with TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Statements, Ada.Text_IO;
use TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Statements, Ada.Text_IO;

package Statements.CompoundStatements is

   type CompoundStatement is new Statement with private;

   procedure execute(skip: in Boolean; C: in out CompoundStatement; reset: out Integer);

private
   type CompoundStatement is new Statement with null record;

end Statements.CompoundStatements;
