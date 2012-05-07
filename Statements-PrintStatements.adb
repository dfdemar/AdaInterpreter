package body Statements.PrintStatements is

   procedure execute(skip: in Boolean; P: in out PrintStatement; reset: out Integer) is
      nexttoken : Unbounded_String;
   begin
      match(P, "print");
      nexttoken := getCurrentToken(P);
      if(not skip) then
         Ada.Integer_Text_IO.Put(readTokenValue(To_String(nexttoken)));
      end if;
      match(P, nexttoken);
      resetTokens(P, reset);
   end execute;

end Statements.PrintStatements;
