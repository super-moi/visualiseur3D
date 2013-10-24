with Algebre;use Algebre;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Test_Proj is
  -- type Vecteur is array (1..3) of Float;
  -- type matrice is array (1..3,1..3) of Float;
   
   Y: Vecteur(1..3);
   A : Matrice(1..3,1..3); 
begin
   
   A:= ((1.0,-1.0,0.0),(5.0,1.0,0.0),(0.0,0.0,1.0));
   Y:= (1.0,2.0,1.0);

   Y:="*"(A,Y);  
   for I in 1..3 loop
      Put(Y(I));   
   end loop;
   
   
end;
