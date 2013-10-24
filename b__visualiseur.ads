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
                    "GNAT Version: 4.6" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_visualiseur" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure Break_Start;
   pragma Import (C, Break_Start, "__gnat_break_start");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#e9e7c90e#;
   pragma Export (C, u00001, "visualiseurB");
   u00002 : constant Version_32 := 16#ba46b2cd#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#1e2e640d#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#e4a307eb#;
   pragma Export (C, u00005, "ada__command_lineB");
   u00006 : constant Version_32 := 16#df5044bd#;
   pragma Export (C, u00006, "ada__command_lineS");
   u00007 : constant Version_32 := 16#23e1f70b#;
   pragma Export (C, u00007, "systemS");
   u00008 : constant Version_32 := 16#72905399#;
   pragma Export (C, u00008, "system__secondary_stackB");
   u00009 : constant Version_32 := 16#378fd0a5#;
   pragma Export (C, u00009, "system__secondary_stackS");
   u00010 : constant Version_32 := 16#0d2b82ae#;
   pragma Export (C, u00010, "system__parametersB");
   u00011 : constant Version_32 := 16#bfbc74f1#;
   pragma Export (C, u00011, "system__parametersS");
   u00012 : constant Version_32 := 16#30ec78bc#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#e2ebe502#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#9229643d#;
   pragma Export (C, u00014, "ada__exceptionsB");
   u00015 : constant Version_32 := 16#e3df9d67#;
   pragma Export (C, u00015, "ada__exceptionsS");
   u00016 : constant Version_32 := 16#95643e9a#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerB");
   u00017 : constant Version_32 := 16#03cf4fc2#;
   pragma Export (C, u00017, "ada__exceptions__last_chance_handlerS");
   u00018 : constant Version_32 := 16#a7343537#;
   pragma Export (C, u00018, "system__exception_tableB");
   u00019 : constant Version_32 := 16#8120f83b#;
   pragma Export (C, u00019, "system__exception_tableS");
   u00020 : constant Version_32 := 16#ff3fa16b#;
   pragma Export (C, u00020, "system__htableB");
   u00021 : constant Version_32 := 16#cc3e5bd4#;
   pragma Export (C, u00021, "system__htableS");
   u00022 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00022, "system__string_hashB");
   u00023 : constant Version_32 := 16#057d2f9f#;
   pragma Export (C, u00023, "system__string_hashS");
   u00024 : constant Version_32 := 16#6a8a6a74#;
   pragma Export (C, u00024, "system__exceptionsB");
   u00025 : constant Version_32 := 16#86f01d0a#;
   pragma Export (C, u00025, "system__exceptionsS");
   u00026 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00026, "system__img_intB");
   u00027 : constant Version_32 := 16#213a17c9#;
   pragma Export (C, u00027, "system__img_intS");
   u00028 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00028, "system__storage_elementsB");
   u00029 : constant Version_32 := 16#d92c8a93#;
   pragma Export (C, u00029, "system__storage_elementsS");
   u00030 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00030, "system__tracebackB");
   u00031 : constant Version_32 := 16#4266237e#;
   pragma Export (C, u00031, "system__tracebackS");
   u00032 : constant Version_32 := 16#4900ab7d#;
   pragma Export (C, u00032, "system__unsigned_typesS");
   u00033 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00033, "system__wch_conB");
   u00034 : constant Version_32 := 16#9c0ad936#;
   pragma Export (C, u00034, "system__wch_conS");
   u00035 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00035, "system__wch_stwB");
   u00036 : constant Version_32 := 16#b11bf537#;
   pragma Export (C, u00036, "system__wch_stwS");
   u00037 : constant Version_32 := 16#5d4d477e#;
   pragma Export (C, u00037, "system__wch_cnvB");
   u00038 : constant Version_32 := 16#82f45fe0#;
   pragma Export (C, u00038, "system__wch_cnvS");
   u00039 : constant Version_32 := 16#f77d8799#;
   pragma Export (C, u00039, "interfacesS");
   u00040 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00040, "system__wch_jisB");
   u00041 : constant Version_32 := 16#d686c4f4#;
   pragma Export (C, u00041, "system__wch_jisS");
   u00042 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00042, "system__traceback_entriesB");
   u00043 : constant Version_32 := 16#71c0194a#;
   pragma Export (C, u00043, "system__traceback_entriesS");
   u00044 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00044, "system__stack_checkingB");
   u00045 : constant Version_32 := 16#80434b27#;
   pragma Export (C, u00045, "system__stack_checkingS");
   u00046 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00046, "ada__integer_text_ioB");
   u00047 : constant Version_32 := 16#f1daf268#;
   pragma Export (C, u00047, "ada__integer_text_ioS");
   u00048 : constant Version_32 := 16#07116dec#;
   pragma Export (C, u00048, "ada__tagsB");
   u00049 : constant Version_32 := 16#21b957c3#;
   pragma Export (C, u00049, "ada__tagsS");
   u00050 : constant Version_32 := 16#68f8d5f8#;
   pragma Export (C, u00050, "system__val_lluB");
   u00051 : constant Version_32 := 16#33f2fc0f#;
   pragma Export (C, u00051, "system__val_lluS");
   u00052 : constant Version_32 := 16#46a1f7a9#;
   pragma Export (C, u00052, "system__val_utilB");
   u00053 : constant Version_32 := 16#284c6214#;
   pragma Export (C, u00053, "system__val_utilS");
   u00054 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00054, "system__case_utilB");
   u00055 : constant Version_32 := 16#8efd9783#;
   pragma Export (C, u00055, "system__case_utilS");
   u00056 : constant Version_32 := 16#7a8f4ce5#;
   pragma Export (C, u00056, "ada__text_ioB");
   u00057 : constant Version_32 := 16#78993766#;
   pragma Export (C, u00057, "ada__text_ioS");
   u00058 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00058, "ada__streamsS");
   u00059 : constant Version_32 := 16#7a48d8b1#;
   pragma Export (C, u00059, "interfaces__c_streamsB");
   u00060 : constant Version_32 := 16#40dd1af2#;
   pragma Export (C, u00060, "interfaces__c_streamsS");
   u00061 : constant Version_32 := 16#13cbc5a8#;
   pragma Export (C, u00061, "system__crtlS");
   u00062 : constant Version_32 := 16#5efa797c#;
   pragma Export (C, u00062, "system__file_ioB");
   u00063 : constant Version_32 := 16#2e96f0e6#;
   pragma Export (C, u00063, "system__file_ioS");
   u00064 : constant Version_32 := 16#7cc77cc0#;
   pragma Export (C, u00064, "ada__finalizationB");
   u00065 : constant Version_32 := 16#01acb175#;
   pragma Export (C, u00065, "ada__finalizationS");
   u00066 : constant Version_32 := 16#01cb6d81#;
   pragma Export (C, u00066, "system__finalization_rootB");
   u00067 : constant Version_32 := 16#2d16f6f3#;
   pragma Export (C, u00067, "system__finalization_rootS");
   u00068 : constant Version_32 := 16#dbb36d26#;
   pragma Export (C, u00068, "system__finalization_implementationB");
   u00069 : constant Version_32 := 16#bdfa5ab4#;
   pragma Export (C, u00069, "system__finalization_implementationS");
   u00070 : constant Version_32 := 16#386436bc#;
   pragma Export (C, u00070, "system__restrictionsB");
   u00071 : constant Version_32 := 16#db039e46#;
   pragma Export (C, u00071, "system__restrictionsS");
   u00072 : constant Version_32 := 16#a6e358bc#;
   pragma Export (C, u00072, "system__stream_attributesB");
   u00073 : constant Version_32 := 16#e89b4b3f#;
   pragma Export (C, u00073, "system__stream_attributesS");
   u00074 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00074, "ada__io_exceptionsS");
   u00075 : constant Version_32 := 16#a2230cb9#;
   pragma Export (C, u00075, "interfaces__cB");
   u00076 : constant Version_32 := 16#ebbc3ca7#;
   pragma Export (C, u00076, "interfaces__cS");
   u00077 : constant Version_32 := 16#7401caa7#;
   pragma Export (C, u00077, "interfaces__c__stringsB");
   u00078 : constant Version_32 := 16#739e0600#;
   pragma Export (C, u00078, "interfaces__c__stringsS");
   u00079 : constant Version_32 := 16#621b06ef#;
   pragma Export (C, u00079, "system__crtl__runtimeS");
   u00080 : constant Version_32 := 16#f74220e8#;
   pragma Export (C, u00080, "system__os_libB");
   u00081 : constant Version_32 := 16#a6d80a38#;
   pragma Export (C, u00081, "system__os_libS");
   u00082 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00082, "system__stringsB");
   u00083 : constant Version_32 := 16#940bbdcf#;
   pragma Export (C, u00083, "system__stringsS");
   u00084 : constant Version_32 := 16#fcde1931#;
   pragma Export (C, u00084, "system__file_control_blockS");
   u00085 : constant Version_32 := 16#b90c86f6#;
   pragma Export (C, u00085, "ada__finalization__list_controllerB");
   u00086 : constant Version_32 := 16#b97dfd74#;
   pragma Export (C, u00086, "ada__finalization__list_controllerS");
   u00087 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00087, "ada__text_io__integer_auxB");
   u00088 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00088, "ada__text_io__integer_auxS");
   u00089 : constant Version_32 := 16#515dc0e3#;
   pragma Export (C, u00089, "ada__text_io__generic_auxB");
   u00090 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00090, "ada__text_io__generic_auxS");
   u00091 : constant Version_32 := 16#ef6c8032#;
   pragma Export (C, u00091, "system__img_biuB");
   u00092 : constant Version_32 := 16#8f222330#;
   pragma Export (C, u00092, "system__img_biuS");
   u00093 : constant Version_32 := 16#10618bf9#;
   pragma Export (C, u00093, "system__img_llbB");
   u00094 : constant Version_32 := 16#cee533ce#;
   pragma Export (C, u00094, "system__img_llbS");
   u00095 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00095, "system__img_lliB");
   u00096 : constant Version_32 := 16#32aea2da#;
   pragma Export (C, u00096, "system__img_lliS");
   u00097 : constant Version_32 := 16#f931f062#;
   pragma Export (C, u00097, "system__img_llwB");
   u00098 : constant Version_32 := 16#67891058#;
   pragma Export (C, u00098, "system__img_llwS");
   u00099 : constant Version_32 := 16#b532ff4e#;
   pragma Export (C, u00099, "system__img_wiuB");
   u00100 : constant Version_32 := 16#e163a4a2#;
   pragma Export (C, u00100, "system__img_wiuS");
   u00101 : constant Version_32 := 16#7993dbbd#;
   pragma Export (C, u00101, "system__val_intB");
   u00102 : constant Version_32 := 16#6b44dd34#;
   pragma Export (C, u00102, "system__val_intS");
   u00103 : constant Version_32 := 16#e6965fe6#;
   pragma Export (C, u00103, "system__val_unsB");
   u00104 : constant Version_32 := 16#59a84646#;
   pragma Export (C, u00104, "system__val_unsS");
   u00105 : constant Version_32 := 16#936e9286#;
   pragma Export (C, u00105, "system__val_lliB");
   u00106 : constant Version_32 := 16#b9c511ab#;
   pragma Export (C, u00106, "system__val_lliS");
   u00107 : constant Version_32 := 16#bbd3b565#;
   pragma Export (C, u00107, "dessinB");
   u00108 : constant Version_32 := 16#cae0225e#;
   pragma Export (C, u00108, "dessinS");
   u00109 : constant Version_32 := 16#fd95dbe2#;
   pragma Export (C, u00109, "sdlS");
   u00110 : constant Version_32 := 16#b7a30c7a#;
   pragma Export (C, u00110, "sdl__typesB");
   u00111 : constant Version_32 := 16#3cb9da3f#;
   pragma Export (C, u00111, "sdl__typesS");
   u00112 : constant Version_32 := 16#bd108911#;
   pragma Export (C, u00112, "interfaces__c__extensionsS");
   u00113 : constant Version_32 := 16#f1a23117#;
   pragma Export (C, u00113, "uintn_ptropsS");
   u00114 : constant Version_32 := 16#e084fd2a#;
   pragma Export (C, u00114, "frameB");
   u00115 : constant Version_32 := 16#4f3cdfda#;
   pragma Export (C, u00115, "frameS");
   u00116 : constant Version_32 := 16#74b267fa#;
   pragma Export (C, u00116, "algebreB");
   u00117 : constant Version_32 := 16#4e7a543a#;
   pragma Export (C, u00117, "algebreS");
   u00118 : constant Version_32 := 16#84ad4a42#;
   pragma Export (C, u00118, "ada__numericsS");
   u00119 : constant Version_32 := 16#03e83d1c#;
   pragma Export (C, u00119, "ada__numerics__elementary_functionsB");
   u00120 : constant Version_32 := 16#ffcae4af#;
   pragma Export (C, u00120, "ada__numerics__elementary_functionsS");
   u00121 : constant Version_32 := 16#0ba8581c#;
   pragma Export (C, u00121, "ada__numerics__auxB");
   u00122 : constant Version_32 := 16#9f6e24ed#;
   pragma Export (C, u00122, "ada__numerics__auxS");
   u00123 : constant Version_32 := 16#fcda293b#;
   pragma Export (C, u00123, "system__fat_llfS");
   u00124 : constant Version_32 := 16#19fe2194#;
   pragma Export (C, u00124, "system__machine_codeS");
   u00125 : constant Version_32 := 16#0be1b996#;
   pragma Export (C, u00125, "system__exn_llfB");
   u00126 : constant Version_32 := 16#a265e9e4#;
   pragma Export (C, u00126, "system__exn_llfS");
   u00127 : constant Version_32 := 16#a0388edc#;
   pragma Export (C, u00127, "system__fat_fltS");
   u00128 : constant Version_32 := 16#70d263a5#;
   pragma Export (C, u00128, "ligneB");
   u00129 : constant Version_32 := 16#f63fac93#;
   pragma Export (C, u00129, "ligneS");
   u00130 : constant Version_32 := 16#632bf408#;
   pragma Export (C, u00130, "sceneB");
   u00131 : constant Version_32 := 16#cf131f45#;
   pragma Export (C, u00131, "sceneS");
   u00132 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00132, "ada__float_text_ioB");
   u00133 : constant Version_32 := 16#e61b3c6c#;
   pragma Export (C, u00133, "ada__float_text_ioS");
   u00134 : constant Version_32 := 16#d5f9759f#;
   pragma Export (C, u00134, "ada__text_io__float_auxB");
   u00135 : constant Version_32 := 16#f854caf5#;
   pragma Export (C, u00135, "ada__text_io__float_auxS");
   u00136 : constant Version_32 := 16#0f54972d#;
   pragma Export (C, u00136, "system__img_realB");
   u00137 : constant Version_32 := 16#e449a6e9#;
   pragma Export (C, u00137, "system__img_realS");
   u00138 : constant Version_32 := 16#06417083#;
   pragma Export (C, u00138, "system__img_lluB");
   u00139 : constant Version_32 := 16#00c9abbe#;
   pragma Export (C, u00139, "system__img_lluS");
   u00140 : constant Version_32 := 16#194ccd7b#;
   pragma Export (C, u00140, "system__img_unsB");
   u00141 : constant Version_32 := 16#d6f4978a#;
   pragma Export (C, u00141, "system__img_unsS");
   u00142 : constant Version_32 := 16#7391917c#;
   pragma Export (C, u00142, "system__powten_tableS");
   u00143 : constant Version_32 := 16#90617b06#;
   pragma Export (C, u00143, "system__val_realB");
   u00144 : constant Version_32 := 16#ddc8801a#;
   pragma Export (C, u00144, "system__val_realS");
   u00145 : constant Version_32 := 16#39591e91#;
   pragma Export (C, u00145, "system__concat_2B");
   u00146 : constant Version_32 := 16#d83105f7#;
   pragma Export (C, u00146, "system__concat_2S");
   u00147 : constant Version_32 := 16#459e1ed1#;
   pragma Export (C, u00147, "stlB");
   u00148 : constant Version_32 := 16#46265d92#;
   pragma Export (C, u00148, "stlS");
   u00149 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00149, "ada__stringsS");
   u00150 : constant Version_32 := 16#33d0a981#;
   pragma Export (C, u00150, "ada__strings__unboundedB");
   u00151 : constant Version_32 := 16#f805faca#;
   pragma Export (C, u00151, "ada__strings__unboundedS");
   u00152 : constant Version_32 := 16#c8b98bb0#;
   pragma Export (C, u00152, "ada__strings__searchB");
   u00153 : constant Version_32 := 16#b5a8c1d6#;
   pragma Export (C, u00153, "ada__strings__searchS");
   u00154 : constant Version_32 := 16#96e9c1e7#;
   pragma Export (C, u00154, "ada__strings__mapsB");
   u00155 : constant Version_32 := 16#24318e4c#;
   pragma Export (C, u00155, "ada__strings__mapsS");
   u00156 : constant Version_32 := 16#b71e6964#;
   pragma Export (C, u00156, "system__bit_opsB");
   u00157 : constant Version_32 := 16#c30e4013#;
   pragma Export (C, u00157, "system__bit_opsS");
   u00158 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00158, "ada__charactersS");
   u00159 : constant Version_32 := 16#051b1b7b#;
   pragma Export (C, u00159, "ada__characters__latin_1S");
   u00160 : constant Version_32 := 16#c4857ee1#;
   pragma Export (C, u00160, "system__compare_array_unsigned_8B");
   u00161 : constant Version_32 := 16#f9da01c6#;
   pragma Export (C, u00161, "system__compare_array_unsigned_8S");
   u00162 : constant Version_32 := 16#9d3d925a#;
   pragma Export (C, u00162, "system__address_operationsB");
   u00163 : constant Version_32 := 16#e39f1e9c#;
   pragma Export (C, u00163, "system__address_operationsS");
   u00164 : constant Version_32 := 16#951168da#;
   pragma Export (C, u00164, "system__exp_lliB");
   u00165 : constant Version_32 := 16#9981d691#;
   pragma Export (C, u00165, "system__exp_lliS");
   u00166 : constant Version_32 := 16#33bb95f4#;
   pragma Export (C, u00166, "ustringsB");
   u00167 : constant Version_32 := 16#4fbc70a8#;
   pragma Export (C, u00167, "ustringsS");
   u00168 : constant Version_32 := 16#7dbbd31d#;
   pragma Export (C, u00168, "text_ioS");
   u00169 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00169, "gnatS");
   u00170 : constant Version_32 := 16#10f589ff#;
   pragma Export (C, u00170, "gnat__os_libS");
   u00171 : constant Version_32 := 16#3c157e62#;
   pragma Export (C, u00171, "sdl__errorB");
   u00172 : constant Version_32 := 16#564db430#;
   pragma Export (C, u00172, "sdl__errorS");
   u00173 : constant Version_32 := 16#7322aba7#;
   pragma Export (C, u00173, "sdl__eventsB");
   u00174 : constant Version_32 := 16#c97d7514#;
   pragma Export (C, u00174, "sdl__eventsS");
   u00175 : constant Version_32 := 16#e95f122a#;
   pragma Export (C, u00175, "sdl__activeS");
   u00176 : constant Version_32 := 16#0376be56#;
   pragma Export (C, u00176, "sdl__joystickS");
   u00177 : constant Version_32 := 16#1400b4b2#;
   pragma Export (C, u00177, "sdl__keyboardB");
   u00178 : constant Version_32 := 16#5ad89e14#;
   pragma Export (C, u00178, "sdl__keyboardS");
   u00179 : constant Version_32 := 16#c844e859#;
   pragma Export (C, u00179, "sdl__keysymS");
   u00180 : constant Version_32 := 16#dc887efa#;
   pragma Export (C, u00180, "sdl__mouseB");
   u00181 : constant Version_32 := 16#16c20879#;
   pragma Export (C, u00181, "sdl__mouseS");
   u00182 : constant Version_32 := 16#c51ff6c7#;
   pragma Export (C, u00182, "sdl__videoB");
   u00183 : constant Version_32 := 16#f2019c11#;
   pragma Export (C, u00183, "sdl__videoS");
   u00184 : constant Version_32 := 16#93fb047f#;
   pragma Export (C, u00184, "lib_cS");
   u00185 : constant Version_32 := 16#bdf43a60#;
   pragma Export (C, u00185, "sdl__mutexB");
   u00186 : constant Version_32 := 16#d761bf77#;
   pragma Export (C, u00186, "sdl__mutexS");
   u00187 : constant Version_32 := 16#2fe45b60#;
   pragma Export (C, u00187, "sdl__rwopsB");
   u00188 : constant Version_32 := 16#829ae2a0#;
   pragma Export (C, u00188, "sdl__rwopsS");
   u00189 : constant Version_32 := 16#980f94fb#;
   pragma Export (C, u00189, "sdl__quitS");
   u00190 : constant Version_32 := 16#aab7d58f#;
   pragma Export (C, u00190, "sdl__timerS");
   u00191 : constant Version_32 := 16#ae97ef6c#;
   pragma Export (C, u00191, "system__concat_3B");
   u00192 : constant Version_32 := 16#55cbf561#;
   pragma Export (C, u00192, "system__concat_3S");
   u00193 : constant Version_32 := 16#c9fdc962#;
   pragma Export (C, u00193, "system__concat_6B");
   u00194 : constant Version_32 := 16#e42b021f#;
   pragma Export (C, u00194, "system__concat_6S");
   u00195 : constant Version_32 := 16#def1dd00#;
   pragma Export (C, u00195, "system__concat_5B");
   u00196 : constant Version_32 := 16#33d839aa#;
   pragma Export (C, u00196, "system__concat_5S");
   u00197 : constant Version_32 := 16#3493e6c0#;
   pragma Export (C, u00197, "system__concat_4B");
   u00198 : constant Version_32 := 16#21be14b5#;
   pragma Export (C, u00198, "system__concat_4S");
   u00199 : constant Version_32 := 16#0936cab5#;
   pragma Export (C, u00199, "system__memoryB");
   u00200 : constant Version_32 := 16#e96a4b1e#;
   pragma Export (C, u00200, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  ada.command_line%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.exp_lli%s
   --  system.exp_lli%b
   --  system.htable%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.img_real%s
   --  system.machine_code%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.restrictions%s
   --  system.restrictions%b
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
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  ada.numerics.aux%s
   --  ada.numerics.aux%b
   --  ada.numerics.elementary_functions%s
   --  ada.numerics.elementary_functions%b
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.crtl.runtime%s
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  interfaces.c.extensions%s
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.secondary_stack%s
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  ada.command_line%b
   --  system.secondary_stack%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  system.finalization_implementation%s
   --  system.finalization_implementation%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  ada.finalization.list_controller%s
   --  ada.finalization.list_controller%b
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.file_io%b
   --  gnat.os_lib%s
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
   --  text_io%s
   --  algebre%s
   --  algebre%b
   --  frame%s
   --  lib_c%s
   --  ligne%s
   --  sdl%s
   --  sdl.error%s
   --  sdl.error%b
   --  sdl.keysym%s
   --  sdl.quit%s
   --  stl%s
   --  scene%s
   --  scene%b
   --  uintn_ptrops%s
   --  sdl.types%s
   --  sdl.types%b
   --  dessin%s
   --  dessin%b
   --  ligne%b
   --  frame%b
   --  sdl.active%s
   --  sdl.joystick%s
   --  sdl.keyboard%s
   --  sdl.keyboard%b
   --  sdl.mutex%s
   --  sdl.mutex%b
   --  sdl.rwops%s
   --  sdl.rwops%b
   --  sdl.timer%s
   --  sdl.video%s
   --  sdl.video%b
   --  sdl.mouse%s
   --  sdl.mouse%b
   --  sdl.events%s
   --  sdl.events%b
   --  visualiseur%b
   --  ustrings%s
   --  ustrings%b
   --  stl%b
   --  END ELABORATION ORDER

end ada_main;
