with TokenHandlers, String_Vectors; use TokenHandlers, String_Vectors;

package Statements is

   type Statement is abstract tagged private;
   type Statement_Access is access all Statement'Class;

   function execute(skip: in Boolean) return Integer is abstract;

private
   type Statement is abstract tagged
      record
         tokens: TokenHandler;
      end record;

end Statements;
