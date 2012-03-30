with String_Vectors; use String_Vectors;

package body Tokenhandlers is

   function Create_Tokens (Filename: in String) return TokenHandler is

      Contents : Unbounded_String := Null_Unbounded_String;
      File     : Ada.Text_IO.File_Type;
      List     : String_Split.Slice_Set;
      T        : TokenHandler;

      Delimiters : constant String := " " & Latin_1.Semicolon & Latin_1.LF;

   begin
      Ada.Text_IO.Open (File => File,
                        Mode => Ada.Text_IO.In_File,
                        Name => Filename);

      while not Ada.Text_IO.End_Of_File (File) loop
         Append (Contents, Ada.Text_IO.Get_Line (File));
         Append (Contents, ASCII.LF);
      end loop;
      -- remove last Linefeed
      Delete (Contents, Length(Contents), Length(Contents));
      Ada.Text_IO.Close (File);
      --Ada.Text_IO.Put (To_String (Contents));

      String_Split.Create (S          => List,
                           From       => To_String(Contents),
                           Separators => Delimiters,
                           Mode       => String_Split.Multiple);

      for I in 1 .. String_Split.Slice_Count (List) loop
         --  Loop though the substrings.
         declare
            S : constant String := String_Split.Slice (List, I);
            --  Pull the next substring out into a string object for easy handling.
         begin
            T.Tokens.Append(S);
         end;
      end loop;

      return T;

   end Create_Tokens;

   function getCurrentToken(T: in TokenHandler) return String is
      token : String := T.Tokens.Element(0);
   begin
      return token;
   end getCurrentToken;

   procedure match(token : in String; T: in out TokenHandler) is
      ParserException : Exception;
   begin
      if(token = T.Tokens.First_Element) then
         T.executedtokens.Append(token);
         T.tokens.Delete_First;
      else
         raise ParserException with ("Unexpected token: " & token & " does not match " & T.tokens.First_Element);
      end if;
   end match;

   procedure moveAhead(numberofelements: in Integer; T: in out TokenHandler) is
   begin
      for I in Integer range 1 .. numberofelements loop
         match(getCurrentToken(T), T);
      end loop;
   end moveAhead;

   function resetTokens(T: in TokenHandler) return Integer is
      TK: TokenHandler := T;
      tokenSize: Integer := 0;
   begin
      for I in T.Tokens.First_Index .. T.Tokens.Last_Index loop
         TK.tokens.Delete_First;
      end loop;

      for I in T.executedtokens.First_Index .. T.executedtokens.Last_Index loop
         TK.tokens.Append(New_Item => TK.executedtokens.Element(I));
         tokensize := tokensize + 1;
      end loop;

      for I in T.executedtokens.First_Index .. T.executedtokens.Last_Index loop
         TK.executedtokens.Delete_First;
      end loop;

      return tokenSize;
   end resetTokens;


end TokenHandlers;

