-- Step Counter using microBBC              -- 
-- Made by Narashiman P                     --
-- Visit Hackster.io for complete project   --

with LSM303AGR; use LSM303AGR;
with MicroBit.Display;
with MicroBit.Display.Symbols;
with MicroBit.Accelerometer;
with MicroBit.Console;
with MicroBit.Time;

use MicroBit;

procedure Main is
   --  type Arr_Type is array (Integer range <>) of Integer;
   --  A1 : Arr_Type (1 .. 10);
   --  Bufindex : Integer;

   -- Bufindex := 0;
   StepCounter : Integer;
   DataX : Axis_Data;
   x : Integer;
   y : Integer ;
   Data : LSM303AGR.All_Axes_Data;

   Threshold : constant := 30;
begin

   x := 0;
   y := 0;
   StepCounter := 0;
   loop

      --  Read the accelerometer data
      Data := Accelerometer.Data;

      --  Print the data on the serial port for datalogging and debugging.

      console.Put_Line (Data.X'Img & "," &
                        Data.Y'Img & "," &
                        Data.Z'Img);
      if  (Data.X - DataX) > Threshold then
         StepCounter := StepCounter + 1;
         if StepCounter rem 1000 = 0 then
            Display.Set(x,y);
            y := y + 1;
         elsif StepCounter rem 200 = 0 then
            Display.Set(x,y);
            x := x + 1 ;
         end if;
      end if;
      DataX := Data.X;

      --  Do nothing for 100 milliseconds
      Time.Sleep (100);

   end loop;
end Main;
