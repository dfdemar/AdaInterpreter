pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "system__fat_flt_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "system__fat_llf_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exception_table_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "ada__containers_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "ada__io_exceptions_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "ada__strings_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "ada__strings__maps_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "ada__tags_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__streams_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "interfaces__c_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "interfaces__c__strings_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__secondary_stack_E");
   E062 : Short_Integer; pragma Import (Ada, E062, "system__finalization_root_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__finalization_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "ada__strings__unbounded_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "system__storage_pools_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__finalization__heap_management_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "gnat__string_split_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "system__os_lib_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "system__pool_global_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "system__file_control_block_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "ada__streams__stream_io_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__file_io_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__strings__stream_ops_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__text_io_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "ada__text_io__generic_aux_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "string_vectors_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "tokenhandlers_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "statements_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "compoundstatements_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "programstatements_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
      LE_Set : Boolean;
      pragma Import (Ada, LE_Set, "__gnat_library_exception_set");
   begin
      E151 := E151 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "programstatements__finalize_spec");
      begin
         F1;
      end;
      E153 := E153 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "compoundstatements__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "statements__finalize_spec");
      begin
         E154 := E154 - 1;
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__text_io__generic_aux__finalize_body");
      begin
         E094 := E094 - 1;
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "ada__text_io__finalize_body");
      begin
         E055 := E055 - 1;
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "ada__text_io__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "ada__streams__stream_io__finalize_body");
      begin
         E161 := E161 - 1;
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__file_io__finalize_body");
      begin
         E075 := E075 - 1;
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "ada__streams__stream_io__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__file_control_block__finalize_spec");
      begin
         E086 := E086 - 1;
         F10;
      end;
      E088 := E088 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__pool_global__finalize_spec");
      begin
         F11;
      end;
      E057 := E057 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "ada__finalization__heap_management__finalize_spec");
      begin
         F12;
      end;
      E132 := E132 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "ada__strings__unbounded__finalize_spec");
      begin
         F13;
      end;
      E062 := E062 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "system__finalization_root__finalize_spec");
      begin
         F14;
      end;
      if LE_Set then
         declare
            LE : Ada.Exceptions.Exception_Occurrence;
            pragma Import (Ada, LE, "__gnat_library_exception");
            procedure Raise_From_Controlled_Operation (X : Ada.Exceptions.Exception_Occurrence;  From_Abort : Boolean);
            pragma Import (Ada, Raise_From_Controlled_Operation, "__gnat_raise_from_controlled_operation");
         begin
            Raise_From_Controlled_Operation (LE, False);
         end;
      end if;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");
   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Zero_Cost_Exceptions : Integer;
      pragma Import (C, Zero_Cost_Exceptions, "__gl_zero_cost_exceptions");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Zero_Cost_Exceptions := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Fat_Flt'Elab_Spec;
      E109 := E109 + 1;
      System.Fat_Llf'Elab_Spec;
      E097 := E097 + 1;
      System.Exception_Table'Elab_Body;
      E021 := E021 + 1;
      Ada.Containers'Elab_Spec;
      E157 := E157 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E076 := E076 + 1;
      Ada.Strings'Elab_Spec;
      E130 := E130 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E060 := E060 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      E080 := E080 + 1;
      E078 := E078 + 1;
      Ada.Tags'Elab_Body;
      E047 := E047 + 1;
      E136 := E136 + 1;
      System.Soft_Links'Elab_Body;
      E011 := E011 + 1;
      System.Secondary_Stack'Elab_Body;
      E015 := E015 + 1;
      System.Finalization_Root'Elab_Spec;
      E062 := E062 + 1;
      Ada.Finalization'Elab_Spec;
      E059 := E059 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E132 := E132 + 1;
      System.Storage_Pools'Elab_Spec;
      E070 := E070 + 1;
      Ada.Finalization.Heap_Management'Elab_Spec;
      E057 := E057 + 1;
      Gnat.String_Split'Elab_Spec;
      E168 := E168 + 1;
      System.Os_Lib'Elab_Body;
      E083 := E083 + 1;
      System.Pool_Global'Elab_Spec;
      E088 := E088 + 1;
      System.File_Control_Block'Elab_Spec;
      E086 := E086 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      System.File_Io'Elab_Body;
      E075 := E075 + 1;
      Ada.Streams.Stream_Io'Elab_Body;
      E161 := E161 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E159 := E159 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E055 := E055 + 1;
      Ada.Text_Io.Generic_Aux'Elab_Body;
      E094 := E094 + 1;
      String_Vectors'Elab_Spec;
      E156 := E156 + 1;
      E165 := E165 + 1;
      Statements'Elab_Spec;
      E154 := E154 + 1;
      Compoundstatements'Elab_Spec;
      E153 := E153 + 1;
      programstatements'elab_spec;
      E151 := E151 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\DavidDeMar\AdaInterpreter\String_Vectors.o
   --   C:\Users\DavidDeMar\AdaInterpreter\TokenHandlers.o
   --   C:\Users\DavidDeMar\AdaInterpreter\Statements.o
   --   C:\Users\DavidDeMar\AdaInterpreter\CompoundStatements.o
   --   C:\Users\DavidDeMar\AdaInterpreter\ProgramStatements.o
   --   C:\Users\DavidDeMar\AdaInterpreter\Main.o
   --   -LC:\Users\DavidDeMar\AdaInterpreter\
   --   -LC:/GNAT/2011/lib/gcc/i686-pc-mingw32/4.5.3/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
