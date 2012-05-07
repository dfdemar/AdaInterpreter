with Ada.Text_IO,
     Ada.Integer_Text_IO,
     String_Vectors,
     GNAT.String_Split,
     Ada.Characters.Latin_1,
     Ada.Strings.Unbounded,
     Ada.Exceptions,
     Ada.Characters.Handling;

use Ada.Text_IO,
    GNAT,
    Ada.Characters,
    Ada.Strings.Unbounded,
    String_Vectors,
    Ada.Exceptions,
    Ada.Characters.Handling;

package TokenHandlers is

--   type TokenHandler is
--      record
         tokencopy : Vector;
--      end record;

   variables : array (Character range 'a' .. 'z') of Integer; -- := (others => 0);
   ParserException : Exception;

   function create_Tokens (Filename: String) return Vector;
   function isVariable(token: in String) return Boolean;
   function isConstant(token: in String) return Boolean;
   function isMathOperator(token: in String) return Boolean;
   function readTokenValue(token: in String) return Integer;

end TokenHandlers;
