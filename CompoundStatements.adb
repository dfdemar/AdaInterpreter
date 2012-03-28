package body CompoundStatements is

   function create_CompoundStatement(T: in TokenHandler) return CompoundStatement is

      C: CompoundStatement;

   begin
      C.tokens := T.tokens;
      return C;

   end Create_CompoundStatement;






end CompoundStatements;
