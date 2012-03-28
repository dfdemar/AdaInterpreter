with Ada.Text_IO,
     Ada.Float_Text_IO,
     String_Vectors,
     GNAT.String_Split,
     Ada.Characters.Latin_1,
     Ada.Strings.Unbounded,
     Ada.Exceptions;

use Ada.Text_IO,
    Ada.Float_Text_IO,
    GNAT,
    Ada.Characters,
    Ada.Strings.Unbounded,
    String_Vectors,
    Ada.Exceptions;

package TokenHandlers is

   type TokenHandler is
      record
         tokens : aliased Vector;
         executedtokens : Vector;
      end record;

   function create_Tokens (Filename: in String) return TokenHandler;
   function getCurrentToken(T: in TokenHandler) return String;
   procedure match(token : in String; T: in out TokenHandler);
   procedure moveAhead(numberofelements: in Integer; T: in out TokenHandler);
   function resetTokens(T: in TokenHandler) return Integer;

end TokenHandlers;
