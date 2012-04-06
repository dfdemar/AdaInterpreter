with TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Ada.Integer_Text_IO;
use TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Ada.Integer_Text_IO;

package Statements.PrintStatements is

   type PrintStatement is new Statement with private;

   procedure createPrintStatement(T : in TokenHandler; P: out PrintStatement);
   function execute(skip: in Boolean; T: in TokenHandler; P: in PrintStatement) return Integer;

private
   type PrintStatement is new Statement with null record;

end Statements.PrintStatements;
