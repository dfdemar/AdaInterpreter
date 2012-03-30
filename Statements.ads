with String_Vectors, TokenHandlers; use String_Vectors, TokenHandlers;

package Statements is

   type Statement is abstract tagged private;
   type Statement_Access is access all Statement'Class;

 --  procedure createStatement(T: in TokenHandler; stmt: out Statement_Access);
   function execute(skip: in Boolean; T: in TokenHandler; M: in Statement) return Integer is abstract;

private
   type Statement is abstract tagged
      record
         tokens: Vector;
      end record;

end Statements;
