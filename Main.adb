with TokenHandlers, Statements.ProgramStatements, Statements;
use TokenHandlers, Statements.ProgramStatements, Statements;

procedure Main is

   Filename : String := "C:/David/School/prog3.txt";
   Dummy    : Integer;
   P        : ProgramStatement;

begin
   createStatement(Create_Tokens(Filename), P);
   execute(False, P, Dummy);

end Main;
