with TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Ada.Integer_Text_IO, Ada.Text_IO, Statements;
use TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Ada.Integer_Text_IO, Ada.Text_IO, Statements;

package Statements.IfStatements is

   type IfStatement is new Statement with private;

   procedure execute(skip: in Boolean; I: in out IfStatement; reset: out Integer);

private
   type IfStatement is new Statement with null record;

end Statements.IfStatements;
