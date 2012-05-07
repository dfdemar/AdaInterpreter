with TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Ada.Integer_Text_IO;
use TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Ada.Integer_Text_IO;

package Statements.AssignmentStatements is

   type AssignmentStatement is new Statement with private;

   procedure execute(skip: in Boolean; A: in out AssignmentStatement; reset: out Integer);

private
   type AssignmentStatement is new Statement with null record;

end Statements.AssignmentStatements;
