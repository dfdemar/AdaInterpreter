with TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Statements, Ada.Text_IO;
use TokenHandlers, Ada.Strings.Unbounded, String_Vectors, Statements, Ada.Text_IO;

package Statements.WhileStatements is

   type WhileStatement is new Statement with private;

   procedure execute(skip: in Boolean; W: in out WhileStatement; reset: out Integer);

private
   type WhileStatement is new Statement with
      record
         conditiontokens: Vector;
      end record;

end Statements.WhileStatements;
