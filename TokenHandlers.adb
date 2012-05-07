with String_Vectors; use String_Vectors;

package body Tokenhandlers is

   function Create_Tokens (Filename: String) return Vector is

      Contents : Unbounded_String := Null_Unbounded_String;
      File     : Ada.Text_IO.File_Type;
      List     : String_Split.Slice_Set;
      tokens   : Vector;

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
            tokens.Append(To_Lower(S));
         end;
      end loop;

      return tokens;
   end Create_Tokens;

   function isVariable(token: in String) return Boolean is
      pragma Assert (token'First = 1);
      variable : Unbounded_String := To_Unbounded_String(token);
   begin
      if(token'Length = 1 and Is_Letter(Element(variable, 1))) then
         return True;
      end if;

      return False;

   end isVariable;

   function isConstant(token: in String) return Boolean is
      Dummy: Integer;
   begin
      Dummy := Integer'Value(token);
      return True;
   exception
      when others =>
         return False;
   end isConstant;

   function isMathOperator(token: in String) return Boolean is
   begin
      return token = "+" or token = "-" or token = "*" or token = "/";
   end isMathOperator;

   function readTokenValue(token: in String) return Integer is
      pragma Assert (token'First = 1);
      u_token : Unbounded_String := To_Unbounded_String(token);
      variablevalue: Integer;
   begin
      if(isVariable(token)) then
         --Put(token);
         variablevalue := variables(Element(u_token, 1));
         if not variablevalue'Valid then
            raise ParserException with ("Variable " & token & " not valid.");
         end if;
         return variablevalue;

      elsif(isConstant(token)) then
         return Integer'Value(token);

      else
         raise ParserException with ("Not a valid variable : " & token);
      end if;
   end readTokenValue;

end TokenHandlers;

