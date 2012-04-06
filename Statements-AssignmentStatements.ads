with TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Ada.Integer_Text_IO;
use TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Ada.Integer_Text_IO;

package Statements.AssignmentStatements is

   type AssignmentStatement is new Statement with private;

   procedure createAssignmentStatement(T : in TokenHandler; A: out AssignmentStatement);
   function execute(skip: in Boolean; T: in TokenHandler; A: in AssignmentStatement) return Integer;

private
   type AssignmentStatement is new Statement with null record;

end Statements.AssignmentStatements;
