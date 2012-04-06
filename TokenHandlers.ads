with Ada.Text_IO,
     Ada.Float_Text_IO,
     Ada.Integer_Text_IO,
     String_Vectors,
     GNAT.String_Split,
     Ada.Characters.Latin_1,
     Ada.Strings.Unbounded,
     Ada.Exceptions,
     Ada.Characters.Handling;

use Ada.Text_IO,
    Ada.Float_Text_IO,
    GNAT,
    Ada.Characters,
    Ada.Strings.Unbounded,
    String_Vectors,
    Ada.Exceptions,
    Ada.Characters.Handling;

package TokenHandlers is

   type TokenHandler is
      record
         tokens : aliased Vector;
         executedtokens : Vector;
         tokencopy : Vector;
      end record;

   variables : array (Character range 'a' .. 'z') of Integer := (others => 0);

   function create_Tokens (Filename: in String) return TokenHandler;
   function isVariable(token: in String) return Boolean;
   function isConstant(token: in String) return Boolean;
   function isMathOperator(token: in String) return Boolean;
   function getCurrentToken(T: in TokenHandler) return String;
   procedure match(token : in String; T: in out TokenHandler);
   procedure moveAhead(numberofelements: in Integer; T: in out TokenHandler);
   function resetTokens(T: in TokenHandler; tokenSize: out Integer)
   procedure conditionIsTrue(T: in out TokenHandler; outCondition: in out Vector; Condition: out Boolean);
   function readTokenValue(token: in String) return Integer;

end TokenHandlers;
