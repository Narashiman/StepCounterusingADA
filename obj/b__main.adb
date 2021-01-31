pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E76 : Short_Integer; pragma Import (Ada, E76, "cortex_m__nvic_E");
   E04 : Short_Integer; pragma Import (Ada, E04, "lsm303agr_E");
   E70 : Short_Integer; pragma Import (Ada, E70, "nrf__events_E");
   E22 : Short_Integer; pragma Import (Ada, E22, "nrf__gpio_E");
   E72 : Short_Integer; pragma Import (Ada, E72, "nrf__interrupts_E");
   E30 : Short_Integer; pragma Import (Ada, E30, "nrf__rtc_E");
   E33 : Short_Integer; pragma Import (Ada, E33, "nrf__spi_master_E");
   E55 : Short_Integer; pragma Import (Ada, E55, "nrf__tasks_E");
   E53 : Short_Integer; pragma Import (Ada, E53, "nrf__clock_E");
   E37 : Short_Integer; pragma Import (Ada, E37, "nrf__timers_E");
   E40 : Short_Integer; pragma Import (Ada, E40, "nrf__twi_E");
   E43 : Short_Integer; pragma Import (Ada, E43, "nrf__uart_E");
   E20 : Short_Integer; pragma Import (Ada, E20, "nrf__device_E");
   E85 : Short_Integer; pragma Import (Ada, E85, "microbit__console_E");
   E83 : Short_Integer; pragma Import (Ada, E83, "microbit__i2c_E");
   E51 : Short_Integer; pragma Import (Ada, E51, "microbit__time_E");
   E49 : Short_Integer; pragma Import (Ada, E49, "microbit__display_E");
   E81 : Short_Integer; pragma Import (Ada, E81, "microbit__display__symbols_E");
   E47 : Short_Integer; pragma Import (Ada, E47, "microbit__accelerometer_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      null;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      E76 := E76 + 1;
      E04 := E04 + 1;
      E70 := E70 + 1;
      E22 := E22 + 1;
      Nrf.Interrupts'Elab_Body;
      E72 := E72 + 1;
      E30 := E30 + 1;
      E33 := E33 + 1;
      E55 := E55 + 1;
      E53 := E53 + 1;
      E37 := E37 + 1;
      E40 := E40 + 1;
      E43 := E43 + 1;
      Nrf.Device'Elab_Spec;
      E20 := E20 + 1;
      Microbit.Console'Elab_Body;
      E85 := E85 + 1;
      E83 := E83 + 1;
      Microbit.Time'Elab_Body;
      E51 := E51 + 1;
      Microbit.Display'Elab_Body;
      E49 := E49 + 1;
      E81 := E81 + 1;
      Microbit.Accelerometer'Elab_Body;
      E47 := E47 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/narashiman/workspace/ada/Ada_Drivers_Library/examples/MicroBit/StepCounter/obj/main.o
   --   -L/home/narashiman/workspace/ada/Ada_Drivers_Library/examples/MicroBit/StepCounter/obj/
   --   -L/home/narashiman/workspace/ada/Ada_Drivers_Library/examples/MicroBit/StepCounter/obj/
   --   -L/home/narashiman/workspace/ada/Ada_Drivers_Library/boards/MicroBit/obj/zfp_lib_Debug/
   --   -L/home/narashiman/Apps/GNAT/2020-arm-elf/arm-eabi/lib/gnat/zfp-cortex-m0/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
