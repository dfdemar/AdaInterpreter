with TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Ada.Integer_Text_IO;
use TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Ada.Integer_Text_IO;

package Statements.PrintStatements is

   type PrintStatement is new Statement with private;

   procedure execute(skip: in Boolean; P: in out PrintStatement; reset: out Integer);

private
   type PrintStatement is new Statement with null record;

end Statements.PrintStatements;
