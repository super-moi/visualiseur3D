
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body Algebre is

   --voir http://en.wikipedia.org/wiki/3D_projection#Perspective_projection
   function Matrice_Rotations_Inverses(Angles : Vecteur) return Matrice is
      Rotation : Matrice(1..3, 1..3);
   begin
     -- a faire
     return Rotation;
   end;

   function Matrice_Rotations(Angles : Vecteur) return Matrice is
      Rotation : Matrice(1..3, 1..3);
   begin
      -- a faire  --fait
      --3rotation a faire: rho, theta, phi
      Rotation:= (
		  (cos(Angles(2))*cos(Angles(3)),sin(Angles(1))*sin(Angles(2))*cos(Angles(3))-cos(Angles(1))*sin(Angles(3)),sin(Angles(1))*sin(Angles(3))+cos(Angles(1))*sin(Angles(2))*cos(Angles(3))),
		  (cos(Angles(2))*sin(Angles(3)),sin(Angles(1))*sin(Angles(2))*sin(Angles(3))+cos(Angles(1))*cos(Angles(3)),cos(Angles(1))*sin(Angles(2))*sin(Angles(3))-sin(Angles(1))*cos(Angles(3))),
		  (-sin(Angles(2)),sin(Angles(1))*cos(Angles(2)),cos(Angles(1))*cos(Angles(2)))
		 );       
      return Rotation;
   end;

   function "*" (X : Matrice ; Y : Vecteur) return Vecteur is
      Z : Vecteur(X'Range(1));
   begin
      --a faire --fait
      for I in 1..3 loop
	 Z  (I) := Y(1) * X(1,I) + Y(2) * X(2,I) + Y(3)*X(3,I);
      end loop;
	         
      return Z;
   end;


   function Projection(A, C, E : Vecteur ; T : Matrice) return Vecteur is
      Resultat : Vecteur(1..2);
      B : Vecteur(1..3);
   begin
      -- a faire --fait
      -- 1) deplacer l'origine (avec E?)
      -- 2) rotations autour des 3 axes
      -- 3) Calcul
      -- A : pt à projeter
      -- C : pt de la camera
      -- E : vecteur pr center la camera au centre de l'ecran
	   
	   
      --1)
      for I in 1..3 loop
	 B(I):= A(I) - C(I);
      end loop;
      
      --2)
      B:="*"(T,B);
      
      --3)
      Resultat(1):= (C(3) / B(3)) * B(1) - C(1);
      Resultat(2):= (C(3) / B(3))* B(2) - C(2);
      
      return Resultat;
   end;

end;
