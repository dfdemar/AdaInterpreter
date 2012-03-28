with Ada.Text_IO,
     Ada.Integer_Text_IO,
     Ada.Float_Text_IO,
     Ada.Strings.Unbounded,
     TokenHandlers,
     ProgramStatements;

use Ada.Text_IO,
    Ada.Integer_Text_IO,
    Ada.Float_Text_IO,
    Ada.Strings.Unbounded,
    TokenHandlers,
    ProgramStatements;

procedure Main is

   Filename : String := "C:/David/School/prog1.txt";
   T        : TokenHandler;
   var      : Integer;
--   P        : ProgramStatement;

begin

   T := Create_Tokens(Filename);

   for I in T.Tokens.First_Index .. T.Tokens.Last_Index loop
      Ada.Text_IO.Put_Line(Item => T.Tokens.Element(I));
   end loop;

--   P := create_ProgramStatement(T);
   var := execute(False, T);



--   Ada.Text_IO.Put_Line(Item => T.Tokens.Element(Index => 1));

end Main;
