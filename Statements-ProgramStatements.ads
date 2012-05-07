with Statements, TokenHandlers, Ada.Text_IO, Ada.Strings.Unbounded, Statements.CompoundStatements, Ada.Integer_Text_IO;
use Statements, TokenHandlers, Ada.Text_IO, Ada.Strings.Unbounded, Statements.CompoundStatements;

package Statements.ProgramStatements is

   type ProgramStatement is new Statement with private;

   ParserException : Exception;

   procedure execute(skip: in Boolean; P: in out ProgramStatement; reset: out Integer);

private
   type ProgramStatement is new Statement with
      record
         programname : String(1..1);
      end record;

end Statements.ProgramStatements;
