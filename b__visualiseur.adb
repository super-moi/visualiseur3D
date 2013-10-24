pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__visualiseur.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__visualiseur.adb");

with System.Restrictions;

package body ada_main is
   pragma Warnings (Off);

   procedure Do_Finalize;
   pragma Import (C, Do_Finalize, "system__standard_library__adafinal");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   procedure adainit is
      E013 : Boolean; pragma Import (Ada, E013, "system__soft_links_E");
      E127 : Boolean; pragma Import (Ada, E127, "system__fat_flt_E");
      E123 : Boolean; pragma Import (Ada, E123, "system__fat_llf_E");
      E019 : Boolean; pragma Import (Ada, E019, "system__exception_table_E");
      E074 : Boolean; pragma Import (Ada, E074, "ada__io_exceptions_E");
      E118 : Boolean; pragma Import (Ada, E118, "ada__numerics_E");
      E149 : Boolean; pragma Import (Ada, E149, "ada__strings_E");
      E155 : Boolean; pragma Import (Ada, E155, "ada__strings__maps_E");
      E049 : Boolean; pragma Import (Ada, E049, "ada__tags_E");
      E058 : Boolean; pragma Import (Ada, E058, "ada__streams_E");
      E076 : Boolean; pragma Import (Ada, E076, "interfaces__c_E");
      E078 : Boolean; pragma Import (Ada, E078, "interfaces__c__strings_E");
      E009 : Boolean; pragma Import (Ada, E009, "system__secondary_stack_E");
      E067 : Boolean; pragma Import (Ada, E067, "system__finalization_root_E");
      E069 : Boolean; pragma Import (Ada, E069, "system__finalization_implementation_E");
      E065 : Boolean; pragma Import (Ada, E065, "ada__finalization_E");
      E151 : Boolean; pragma Import (Ada, E151, "ada__strings__unbounded_E");
      E086 : Boolean; pragma Import (Ada, E086, "ada__finalization__list_controller_E");
      E084 : Boolean; pragma Import (Ada, E084, "system__file_control_block_E");
      E063 : Boolean; pragma Import (Ada, E063, "system__file_io_E");
      E081 : Boolean; pragma Import (Ada, E081, "system__os_lib_E");
      E057 : Boolean; pragma Import (Ada, E057, "ada__text_io_E");
      E117 : Boolean; pragma Import (Ada, E117, "algebre_E");
      E115 : Boolean; pragma Import (Ada, E115, "frame_E");
      E129 : Boolean; pragma Import (Ada, E129, "ligne_E");
      E172 : Boolean; pragma Import (Ada, E172, "sdl__error_E");
      E148 : Boolean; pragma Import (Ada, E148, "stl_E");
      E131 : Boolean; pragma Import (Ada, E131, "scene_E");
      E111 : Boolean; pragma Import (Ada, E111, "sdl__types_E");
      E108 : Boolean; pragma Import (Ada, E108, "dessin_E");
      E178 : Boolean; pragma Import (Ada, E178, "sdl__keyboard_E");
      E186 : Boolean; pragma Import (Ada, E186, "sdl__mutex_E");
      E188 : Boolean; pragma Import (Ada, E188, "sdl__rwops_E");
      E183 : Boolean; pragma Import (Ada, E183, "sdl__video_E");
      E181 : Boolean; pragma Import (Ada, E181, "sdl__mouse_E");
      E174 : Boolean; pragma Import (Ada, E174, "sdl__events_E");
      E167 : Boolean; pragma Import (Ada, E167, "ustrings_E");

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
   begin
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False),
         Value => (0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, True, True, False, False, False, False, 
           True, False, True, True, True, False, False, False, 
           False, False, True, True, False, True, True, True, 
           True, True, True, False, True, True, False, True, 
           False, False, True, False, False, True, False, False, 
           False, True, False, False, True, False, False, False, 
           False, False, False, False, False, True, True, True, 
           False, False, True, False, True, True, False, True, 
           True, False, False, False, False, False, False, False, 
           False),
         Count => (0, 0, 0, 0, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, False));
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

      System.Fat_Flt'Elab_Spec;
      E127 := True;
      System.Fat_Llf'Elab_Spec;
      E123 := True;
      System.Exception_Table'Elab_Body;
      E019 := True;
      Ada.Io_Exceptions'Elab_Spec;
      E074 := True;
      Ada.Numerics'Elab_Spec;
      E118 := True;
      Ada.Strings'Elab_Spec;
      E149 := True;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E058 := True;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      E078 := True;
      E076 := True;
      Ada.Tags'Elab_Body;
      E049 := True;
      E155 := True;
      System.Soft_Links'Elab_Body;
      E013 := True;
      System.Secondary_Stack'Elab_Body;
      E009 := True;
      System.Finalization_Root'Elab_Spec;
      E067 := True;
      System.Finalization_Implementation'Elab_Spec;
      System.Finalization_Implementation'Elab_Body;
      E069 := True;
      Ada.Finalization'Elab_Spec;
      E065 := True;
      Ada.Strings.Unbounded'Elab_Spec;
      E151 := True;
      Ada.Finalization.List_Controller'Elab_Spec;
      E086 := True;
      System.File_Control_Block'Elab_Spec;
      E084 := True;
      System.Os_Lib'Elab_Body;
      E081 := True;
      System.File_Io'Elab_Body;
      E063 := True;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E057 := True;
      E117 := True;
      E172 := True;
      Scene'Elab_Body;
      E131 := True;
      SDL.TYPES'ELAB_SPEC;
      E111 := True;
      E108 := True;
      E129 := True;
      E115 := True;
      E178 := True;
      E186 := True;
      E188 := True;
      SDL.VIDEO'ELAB_SPEC;
      SDL.VIDEO'ELAB_BODY;
      E183 := True;
      E181 := True;
      E174 := True;
      E167 := True;
      E148 := True;
   end adainit;

   procedure adafinal is
   begin
      Do_Finalize;
   end adafinal;

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure initialize (Addr : System.Address);
      pragma Import (C, initialize, "__gnat_initialize");

      procedure finalize;
      pragma Import (C, finalize, "__gnat_finalize");

      procedure Ada_Main_Program;
      pragma Import (Ada, Ada_Main_Program, "_ada_visualiseur");

      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Break_Start;
      Ada_Main_Program;
      Do_Finalize;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/thomas/visualiseur3D/algebre.o
   --   /home/thomas/visualiseur3D/scene.o
   --   /home/thomas/visualiseur3D/dessin.o
   --   /home/thomas/visualiseur3D/ligne.o
   --   /home/thomas/visualiseur3D/frame.o
   --   /home/thomas/visualiseur3D/visualiseur.o
   --   /home/thomas/visualiseur3D/ustrings.o
   --   /home/thomas/visualiseur3D/stl.o
   --   -L/home/thomas/visualiseur3D/
   --   -L/home/thomas/Téléchargements/adasdl_alpha20120723a/Thin/AdaSDL/lib/
   --   -L/usr/lib/gcc/x86_64-linux-gnu/4.6/adalib/
   --   -shared
   --   -lgnat-4.6
--  END Object file/option list   

end ada_main;
