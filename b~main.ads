pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2011 (20110428)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#82389555#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#7d892fe9#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#b2760b05#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#08dd46b8#;
   pragma Export (C, u00005, "ada__exceptionsB");
   u00006 : constant Version_32 := 16#9b58bcb3#;
   pragma Export (C, u00006, "ada__exceptionsS");
   u00007 : constant Version_32 := 16#52aba3be#;
   pragma Export (C, u00007, "ada__exceptions__last_chance_handlerB");
   u00008 : constant Version_32 := 16#48e7b9e5#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerS");
   u00009 : constant Version_32 := 16#bc164b96#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#360d120c#;
   pragma Export (C, u00010, "system__soft_linksB");
   u00011 : constant Version_32 := 16#c254e109#;
   pragma Export (C, u00011, "system__soft_linksS");
   u00012 : constant Version_32 := 16#92dc3a55#;
   pragma Export (C, u00012, "system__parametersB");
   u00013 : constant Version_32 := 16#bfbc7097#;
   pragma Export (C, u00013, "system__parametersS");
   u00014 : constant Version_32 := 16#1907a5d3#;
   pragma Export (C, u00014, "system__secondary_stackB");
   u00015 : constant Version_32 := 16#a8786c38#;
   pragma Export (C, u00015, "system__secondary_stackS");
   u00016 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00016, "system__storage_elementsB");
   u00017 : constant Version_32 := 16#46db360e#;
   pragma Export (C, u00017, "system__storage_elementsS");
   u00018 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00018, "system__stack_checkingB");
   u00019 : constant Version_32 := 16#1fb4f7ba#;
   pragma Export (C, u00019, "system__stack_checkingS");
   u00020 : constant Version_32 := 16#53547b86#;
   pragma Export (C, u00020, "system__exception_tableB");
   u00021 : constant Version_32 := 16#2d789733#;
   pragma Export (C, u00021, "system__exception_tableS");
   u00022 : constant Version_32 := 16#ff3fa16b#;
   pragma Export (C, u00022, "system__htableB");
   u00023 : constant Version_32 := 16#53c9e749#;
   pragma Export (C, u00023, "system__htableS");
   u00024 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00024, "system__string_hashB");
   u00025 : constant Version_32 := 16#9a8a9302#;
   pragma Export (C, u00025, "system__string_hashS");
   u00026 : constant Version_32 := 16#6a8a6a74#;
   pragma Export (C, u00026, "system__exceptionsB");
   u00027 : constant Version_32 := 16#2aa87202#;
   pragma Export (C, u00027, "system__exceptionsS");
   u00028 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00028, "system__img_intB");
   u00029 : constant Version_32 := 16#becdab54#;
   pragma Export (C, u00029, "system__img_intS");
   u00030 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00030, "system__tracebackB");
   u00031 : constant Version_32 := 16#dd919fe3#;
   pragma Export (C, u00031, "system__tracebackS");
   u00032 : constant Version_32 := 16#d6f717e0#;
   pragma Export (C, u00032, "system__unsigned_typesS");
   u00033 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00033, "system__wch_conB");
   u00034 : constant Version_32 := 16#03fd65ab#;
   pragma Export (C, u00034, "system__wch_conS");
   u00035 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00035, "system__wch_stwB");
   u00036 : constant Version_32 := 16#2eec49aa#;
   pragma Export (C, u00036, "system__wch_stwS");
   u00037 : constant Version_32 := 16#5d4d477e#;
   pragma Export (C, u00037, "system__wch_cnvB");
   u00038 : constant Version_32 := 16#1d03e37d#;
   pragma Export (C, u00038, "system__wch_cnvS");
   u00039 : constant Version_32 := 16#f77d8799#;
   pragma Export (C, u00039, "interfacesS");
   u00040 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00040, "system__wch_jisB");
   u00041 : constant Version_32 := 16#49717869#;
   pragma Export (C, u00041, "system__wch_jisS");
   u00042 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00042, "system__traceback_entriesB");
   u00043 : constant Version_32 := 16#ee37a5d7#;
   pragma Export (C, u00043, "system__traceback_entriesS");
   u00044 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00044, "ada__float_text_ioB");
   u00045 : constant Version_32 := 16#e61b3c6c#;
   pragma Export (C, u00045, "ada__float_text_ioS");
   u00046 : constant Version_32 := 16#8332779a#;
   pragma Export (C, u00046, "ada__tagsB");
   u00047 : constant Version_32 := 16#02144d76#;
   pragma Export (C, u00047, "ada__tagsS");
   u00048 : constant Version_32 := 16#e6965fe6#;
   pragma Export (C, u00048, "system__val_unsB");
   u00049 : constant Version_32 := 16#c65ffadb#;
   pragma Export (C, u00049, "system__val_unsS");
   u00050 : constant Version_32 := 16#46a1f7a9#;
   pragma Export (C, u00050, "system__val_utilB");
   u00051 : constant Version_32 := 16#b7bbde89#;
   pragma Export (C, u00051, "system__val_utilS");
   u00052 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00052, "system__case_utilB");
   u00053 : constant Version_32 := 16#110a2b1e#;
   pragma Export (C, u00053, "system__case_utilS");
   u00054 : constant Version_32 := 16#7a8f4ce5#;
   pragma Export (C, u00054, "ada__text_ioB");
   u00055 : constant Version_32 := 16#e76e8bfb#;
   pragma Export (C, u00055, "ada__text_ioS");
   u00056 : constant Version_32 := 16#339a1fb2#;
   pragma Export (C, u00056, "ada__finalization__heap_managementB");
   u00057 : constant Version_32 := 16#b0f96d78#;
   pragma Export (C, u00057, "ada__finalization__heap_managementS");
   u00058 : constant Version_32 := 16#6d616d1b#;
   pragma Export (C, u00058, "ada__finalizationB");
   u00059 : constant Version_32 := 16#a11701ff#;
   pragma Export (C, u00059, "ada__finalizationS");
   u00060 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00060, "ada__streamsS");
   u00061 : constant Version_32 := 16#f7ab51aa#;
   pragma Export (C, u00061, "system__finalization_rootB");
   u00062 : constant Version_32 := 16#bd6af943#;
   pragma Export (C, u00062, "system__finalization_rootS");
   u00063 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00063, "system__address_imageB");
   u00064 : constant Version_32 := 16#1dfad6ac#;
   pragma Export (C, u00064, "system__address_imageS");
   u00065 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00065, "system__img_boolB");
   u00066 : constant Version_32 := 16#49cf3a7d#;
   pragma Export (C, u00066, "system__img_boolS");
   u00067 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00067, "system__ioB");
   u00068 : constant Version_32 := 16#2254bcd9#;
   pragma Export (C, u00068, "system__ioS");
   u00069 : constant Version_32 := 16#d21112bd#;
   pragma Export (C, u00069, "system__storage_poolsB");
   u00070 : constant Version_32 := 16#a9b91ff2#;
   pragma Export (C, u00070, "system__storage_poolsS");
   u00071 : constant Version_32 := 16#7a48d8b1#;
   pragma Export (C, u00071, "interfaces__c_streamsB");
   u00072 : constant Version_32 := 16#40dd1af2#;
   pragma Export (C, u00072, "interfaces__c_streamsS");
   u00073 : constant Version_32 := 16#13cbc1ce#;
   pragma Export (C, u00073, "system__crtlS");
   u00074 : constant Version_32 := 16#efe3a128#;
   pragma Export (C, u00074, "system__file_ioB");
   u00075 : constant Version_32 := 16#b1614c7b#;
   pragma Export (C, u00075, "system__file_ioS");
   u00076 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00076, "ada__io_exceptionsS");
   u00077 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00077, "interfaces__cB");
   u00078 : constant Version_32 := 16#a0f6ad03#;
   pragma Export (C, u00078, "interfaces__cS");
   u00079 : constant Version_32 := 16#b3abd60c#;
   pragma Export (C, u00079, "interfaces__c__stringsB");
   u00080 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00080, "interfaces__c__stringsS");
   u00081 : constant Version_32 := 16#a50435f4#;
   pragma Export (C, u00081, "system__crtl__runtimeS");
   u00082 : constant Version_32 := 16#9cd5d2c4#;
   pragma Export (C, u00082, "system__os_libB");
   u00083 : constant Version_32 := 16#a6d80a38#;
   pragma Export (C, u00083, "system__os_libS");
   u00084 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00084, "system__stringsB");
   u00085 : constant Version_32 := 16#0bfc0152#;
   pragma Export (C, u00085, "system__stringsS");
   u00086 : constant Version_32 := 16#6329a5ac#;
   pragma Export (C, u00086, "system__file_control_blockS");
   u00087 : constant Version_32 := 16#ebb6b8da#;
   pragma Export (C, u00087, "system__pool_globalB");
   u00088 : constant Version_32 := 16#f2b3b4b1#;
   pragma Export (C, u00088, "system__pool_globalS");
   u00089 : constant Version_32 := 16#67335317#;
   pragma Export (C, u00089, "system__memoryB");
   u00090 : constant Version_32 := 16#769df783#;
   pragma Export (C, u00090, "system__memoryS");
   u00091 : constant Version_32 := 16#d5f9759f#;
   pragma Export (C, u00091, "ada__text_io__float_auxB");
   u00092 : constant Version_32 := 16#f854caf5#;
   pragma Export (C, u00092, "ada__text_io__float_auxS");
   u00093 : constant Version_32 := 16#515dc0e3#;
   pragma Export (C, u00093, "ada__text_io__generic_auxB");
   u00094 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00094, "ada__text_io__generic_auxS");
   u00095 : constant Version_32 := 16#6d0081c3#;
   pragma Export (C, u00095, "system__img_realB");
   u00096 : constant Version_32 := 16#7bbe1a74#;
   pragma Export (C, u00096, "system__img_realS");
   u00097 : constant Version_32 := 16#632d95a6#;
   pragma Export (C, u00097, "system__fat_llfS");
   u00098 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00098, "system__float_controlB");
   u00099 : constant Version_32 := 16#5cea08aa#;
   pragma Export (C, u00099, "system__float_controlS");
   u00100 : constant Version_32 := 16#06417083#;
   pragma Export (C, u00100, "system__img_lluB");
   u00101 : constant Version_32 := 16#9f3e1723#;
   pragma Export (C, u00101, "system__img_lluS");
   u00102 : constant Version_32 := 16#194ccd7b#;
   pragma Export (C, u00102, "system__img_unsB");
   u00103 : constant Version_32 := 16#49032b17#;
   pragma Export (C, u00103, "system__img_unsS");
   u00104 : constant Version_32 := 16#ec662de1#;
   pragma Export (C, u00104, "system__powten_tableS");
   u00105 : constant Version_32 := 16#730c1f82#;
   pragma Export (C, u00105, "system__val_realB");
   u00106 : constant Version_32 := 16#423f3c87#;
   pragma Export (C, u00106, "system__val_realS");
   u00107 : constant Version_32 := 16#0be1b996#;
   pragma Export (C, u00107, "system__exn_llfB");
   u00108 : constant Version_32 := 16#3d925579#;
   pragma Export (C, u00108, "system__exn_llfS");
   u00109 : constant Version_32 := 16#3fcf3241#;
   pragma Export (C, u00109, "system__fat_fltS");
   u00110 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00110, "ada__integer_text_ioB");
   u00111 : constant Version_32 := 16#f1daf268#;
   pragma Export (C, u00111, "ada__integer_text_ioS");
   u00112 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00112, "ada__text_io__integer_auxB");
   u00113 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00113, "ada__text_io__integer_auxS");
   u00114 : constant Version_32 := 16#ef6c8032#;
   pragma Export (C, u00114, "system__img_biuB");
   u00115 : constant Version_32 := 16#10d59fad#;
   pragma Export (C, u00115, "system__img_biuS");
   u00116 : constant Version_32 := 16#10618bf9#;
   pragma Export (C, u00116, "system__img_llbB");
   u00117 : constant Version_32 := 16#51128f53#;
   pragma Export (C, u00117, "system__img_llbS");
   u00118 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00118, "system__img_lliB");
   u00119 : constant Version_32 := 16#ad591e47#;
   pragma Export (C, u00119, "system__img_lliS");
   u00120 : constant Version_32 := 16#f931f062#;
   pragma Export (C, u00120, "system__img_llwB");
   u00121 : constant Version_32 := 16#f87eacc5#;
   pragma Export (C, u00121, "system__img_llwS");
   u00122 : constant Version_32 := 16#b532ff4e#;
   pragma Export (C, u00122, "system__img_wiuB");
   u00123 : constant Version_32 := 16#7e94183f#;
   pragma Export (C, u00123, "system__img_wiuS");
   u00124 : constant Version_32 := 16#7993dbbd#;
   pragma Export (C, u00124, "system__val_intB");
   u00125 : constant Version_32 := 16#f4b361a9#;
   pragma Export (C, u00125, "system__val_intS");
   u00126 : constant Version_32 := 16#936e9286#;
   pragma Export (C, u00126, "system__val_lliB");
   u00127 : constant Version_32 := 16#2632ad36#;
   pragma Export (C, u00127, "system__val_lliS");
   u00128 : constant Version_32 := 16#68f8d5f8#;
   pragma Export (C, u00128, "system__val_lluB");
   u00129 : constant Version_32 := 16#ac054092#;
   pragma Export (C, u00129, "system__val_lluS");
   u00130 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00130, "ada__stringsS");
   u00131 : constant Version_32 := 16#261c554b#;
   pragma Export (C, u00131, "ada__strings__unboundedB");
   u00132 : constant Version_32 := 16#762d3000#;
   pragma Export (C, u00132, "ada__strings__unboundedS");
   u00133 : constant Version_32 := 16#574e372d#;
   pragma Export (C, u00133, "ada__strings__searchB");
   u00134 : constant Version_32 := 16#b5a8c1d6#;
   pragma Export (C, u00134, "ada__strings__searchS");
   u00135 : constant Version_32 := 16#96e9c1e7#;
   pragma Export (C, u00135, "ada__strings__mapsB");
   u00136 : constant Version_32 := 16#24318e4c#;
   pragma Export (C, u00136, "ada__strings__mapsS");
   u00137 : constant Version_32 := 16#63c123de#;
   pragma Export (C, u00137, "system__bit_opsB");
   u00138 : constant Version_32 := 16#c30e4013#;
   pragma Export (C, u00138, "system__bit_opsS");
   u00139 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00139, "ada__charactersS");
   u00140 : constant Version_32 := 16#051b1b7b#;
   pragma Export (C, u00140, "ada__characters__latin_1S");
   u00141 : constant Version_32 := 16#c4857ee1#;
   pragma Export (C, u00141, "system__compare_array_unsigned_8B");
   u00142 : constant Version_32 := 16#662dbd5b#;
   pragma Export (C, u00142, "system__compare_array_unsigned_8S");
   u00143 : constant Version_32 := 16#9d3d925a#;
   pragma Export (C, u00143, "system__address_operationsB");
   u00144 : constant Version_32 := 16#7c68a201#;
   pragma Export (C, u00144, "system__address_operationsS");
   u00145 : constant Version_32 := 16#86099d09#;
   pragma Export (C, u00145, "system__machine_codeS");
   u00146 : constant Version_32 := 16#e033c94e#;
   pragma Export (C, u00146, "system__atomic_countersB");
   u00147 : constant Version_32 := 16#4a8d2d3a#;
   pragma Export (C, u00147, "system__atomic_countersS");
   u00148 : constant Version_32 := 16#a6e358bc#;
   pragma Export (C, u00148, "system__stream_attributesB");
   u00149 : constant Version_32 := 16#e89b4b3f#;
   pragma Export (C, u00149, "system__stream_attributesS");
   u00150 : constant Version_32 := 16#a0556de8#;
   pragma Export (C, u00150, "programstatementsB");
   u00151 : constant Version_32 := 16#e3a3f047#;
   pragma Export (C, u00151, "programstatementsS");
   u00152 : constant Version_32 := 16#6f831651#;
   pragma Export (C, u00152, "statementsS");
   u00153 : constant Version_32 := 16#bdaee5be#;
   pragma Export (C, u00153, "string_vectorsB");
   u00154 : constant Version_32 := 16#deaf831b#;
   pragma Export (C, u00154, "string_vectorsS");
   u00155 : constant Version_32 := 16#5e196e91#;
   pragma Export (C, u00155, "ada__containersS");
   u00156 : constant Version_32 := 16#71efeffb#;
   pragma Export (C, u00156, "system__strings__stream_opsB");
   u00157 : constant Version_32 := 16#8453d1c6#;
   pragma Export (C, u00157, "system__strings__stream_opsS");
   u00158 : constant Version_32 := 16#5bd55df1#;
   pragma Export (C, u00158, "ada__streams__stream_ioB");
   u00159 : constant Version_32 := 16#9fa60b9d#;
   pragma Export (C, u00159, "ada__streams__stream_ioS");
   u00160 : constant Version_32 := 16#595ba38f#;
   pragma Export (C, u00160, "system__communicationB");
   u00161 : constant Version_32 := 16#3e38e5bc#;
   pragma Export (C, u00161, "system__communicationS");
   u00162 : constant Version_32 := 16#2b1b347c#;
   pragma Export (C, u00162, "tokenhandlersB");
   u00163 : constant Version_32 := 16#0600140f#;
   pragma Export (C, u00163, "tokenhandlersS");
   u00164 : constant Version_32 := 16#39591e91#;
   pragma Export (C, u00164, "system__concat_2B");
   u00165 : constant Version_32 := 16#47c6b96a#;
   pragma Export (C, u00165, "system__concat_2S");
   u00166 : constant Version_32 := 16#3493e6c0#;
   pragma Export (C, u00166, "system__concat_4B");
   u00167 : constant Version_32 := 16#be49a828#;
   pragma Export (C, u00167, "system__concat_4S");
   u00168 : constant Version_32 := 16#ae97ef6c#;
   pragma Export (C, u00168, "system__concat_3B");
   u00169 : constant Version_32 := 16#ca3c49fc#;
   pragma Export (C, u00169, "system__concat_3S");
   u00170 : constant Version_32 := 16#c0176944#;
   pragma Export (C, u00170, "system__val_charB");
   u00171 : constant Version_32 := 16#cbb2c934#;
   pragma Export (C, u00171, "system__val_charS");
   u00172 : constant Version_32 := 16#2b93a046#;
   pragma Export (C, u00172, "system__img_charB");
   u00173 : constant Version_32 := 16#20221371#;
   pragma Export (C, u00173, "system__img_charS");
   u00174 : constant Version_32 := 16#833355f1#;
   pragma Export (C, u00174, "ada__characters__handlingB");
   u00175 : constant Version_32 := 16#3006d996#;
   pragma Export (C, u00175, "ada__characters__handlingS");
   u00176 : constant Version_32 := 16#7a69aa90#;
   pragma Export (C, u00176, "ada__strings__maps__constantsS");
   u00177 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00177, "gnatS");
   u00178 : constant Version_32 := 16#dbf24c7a#;
   pragma Export (C, u00178, "gnat__string_splitB");
   u00179 : constant Version_32 := 16#73637f33#;
   pragma Export (C, u00179, "gnat__string_splitS");
   u00180 : constant Version_32 := 16#96405724#;
   pragma Export (C, u00180, "statements__statementhandlersB");
   u00181 : constant Version_32 := 16#be9841f7#;
   pragma Export (C, u00181, "statements__statementhandlersS");
   u00182 : constant Version_32 := 16#d068d50a#;
   pragma Export (C, u00182, "statements__assignmentstatementsB");
   u00183 : constant Version_32 := 16#ebcf6ba2#;
   pragma Export (C, u00183, "statements__assignmentstatementsS");
   u00184 : constant Version_32 := 16#41cb81a8#;
   pragma Export (C, u00184, "statements__printstatementsB");
   u00185 : constant Version_32 := 16#e1553d9c#;
   pragma Export (C, u00185, "statements__printstatementsS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.handling%s
   --  ada.characters.latin_1%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_char%s
   --  system.img_char%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.img_real%s
   --  system.io%s
   --  system.io%b
   --  system.machine_code%s
   --  system.atomic_counters%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.standard_library%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.fat_flt%s
   --  system.fat_llf%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.val_char%s
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_real%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_real%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.val_char%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.crtl.runtime%s
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.communication%s
   --  system.communication%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.secondary_stack%s
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  ada.finalization.heap_management%s
   --  ada.finalization.heap_management%b
   --  gnat.string_split%s
   --  gnat.string_split%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.file_control_block%s
   --  ada.streams.stream_io%s
   --  system.file_io%s
   --  system.file_io%b
   --  ada.streams.stream_io%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.float_aux%s
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.float_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  string_vectors%s
   --  string_vectors%b
   --  tokenhandlers%s
   --  tokenhandlers%b
   --  statements%s
   --  statements.assignmentstatements%s
   --  statements.assignmentstatements%b
   --  statements.printstatements%s
   --  statements.printstatements%b
   --  statements.statementhandlers%s
   --  statements.statementhandlers%b
   --  programstatements%s
   --  programstatements%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
