with TokenHandlers, String_Vectors, Ada.Text_IO, Ada.Strings.Unbounded, Statements.StatementHandlers;
use TokenHandlers, String_Vectors, Ada.Text_IO, Ada.Strings.Unbounded, Statements.StatementHandlers;

package ProgramStatements is

   type ProgramStatement is private;

   function execute(skip: in Boolean; T: in TokenHandler) return Integer;

private
   type ProgramStatement is
      record
         tokens: Vector;
         programname: String(1..1);
      end record;

end ProgramStatements;
