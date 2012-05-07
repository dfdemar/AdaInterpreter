with String_Vectors, Ada.Text_IO, Ada.Integer_Text_IO, TokenHandlers, Ada.Strings.Unbounded;
use String_Vectors, Ada.Text_IO, Ada.Integer_Text_IO, TokenHandlers, Ada.Strings.Unbounded;

package Statements is

   type Statement is abstract tagged private;

   type Statement_Access is access all Statement'Class;
   ParserException : Exception;

   procedure execute(skip: in Boolean; S: in out Statement; reset: out Integer) is abstract;

   procedure createStatement(tokens : Vector; S : out Statement);
   procedure statementFactory(S: in out Statement; stmt: out Statement_Access);
   function getCurrentToken(S: Statement) return Unbounded_String;
   procedure match(S: in out Statement; tokenlist: in out Vector; token : in String);
   procedure match(S: in out Statement; tokenlist : in out Vector; token : in Unbounded_String);
   procedure match(S: in out Statement; token : in Unbounded_String);
   procedure match(S: in out Statement; token : in String);
   procedure moveAhead(S: in out Statement; numberofelements: in Integer);
   procedure resetTokens(S: in out Statement; tokensize: out Integer);
   procedure conditionIsTrue(S: in out Statement; tokenlist: in out Vector; outCondition: in out Vector; Condition: out Boolean);

private
   type Statement is abstract tagged
      record
         tokens : Vector;
         executedtokens : Vector;
      end record;


end Statements;
