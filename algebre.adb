
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body Algebre is

   --voir http://en.wikipedia.org/wiki/3D_projection#Perspective_projection
   function Matrice_Rotations_Inverses(Angles : Vecteur) return Matrice is
      Rotation : Matrice(1..3, 1..3);
   begin
      --3 rotaions phi, theta et rho
     
        Rotation:= (
		   (cos(angles(3))*cos(angles(2)), sin(angles(3))*cos(angles(1))+cos(angles(3))*sin(angles(2))*sin(angles(1)), sin(angles(3))*sin(angles(1))-cos(angles(3))*sin(angles(2))*cos(angles(1))),
		  (-sin(angles(3))*cos(angles(2)), cos(angles(3))*cos(angles(1))-sin(angles(1))*sin(angles(3))*sin(angles(2)), cos(angles(3))*sin(angles(1))+cos(angles(1))*sin(angles(3))*sin(angles(2))),
		  (sin(angles(2)), -cos(angles(2))*sin(angles(1)), cos(angles(2))*cos(angles(1)))
		  );   

     return Rotation;
    end;

   function Matrice_Rotations(Angles : Vecteur) return Matrice is
      Rotation : Matrice(1..3, 1..3);
   begin
      
      --3 rotations a faire: rho, theta, phi
         
      Rotation:= (
		  (Cos(Angles(2))*Cos(Angles(3)), Cos(Angles(2))*Sin(Angles(3)), -Sin(Angles(2))),
		  (Sin(Angles(1))*Sin(Angles(2))*Cos(Angles(3))-Cos(Angles(1))*Sin(Angles(3)),Sin(Angles(1))*Sin(Angles(2))*sin(Angles(3))+Cos(Angles(1))*Cos(Angles(3)), Sin(Angles(1))*cos(Angles(2))),
		  (Cos(Angles(1))*Sin(Angles(2))*Cos(Angles(3))+Sin(Angles(1))*Sin(Angles(3)), Cos(Angles(1))*Sin(Angles(2))*sin(Angles(3))-Sin(Angles(1))*Cos(Angles(3)), Cos(Angles(1))*Cos(Angles(2)))
				     );
      
      return Rotation;
   end;

   function "*" (X : Matrice ; Y : Vecteur) return Vecteur is
      Z : Vecteur(X'Range(1));
   begin
      
      --multiplication d'une matrice et d'un vecteur      
      for I in 1..3 loop
	 Z  (I) := Y(1) * X(I,1) + Y(2) * X(I,2) + Y(3) * X(I,3);
      end loop;
	         
      return Z;
   end;


   function Projection(A, C, E : Vecteur ; T : Matrice) return Vecteur is
      Resultat : Vecteur(1..2);
      D : Vecteur(1..3);
   begin
    
      -- origine au centre de l'écran
      for I in 1..3 loop
	 D(I):= A(I) - C(I);	 
      end loop;
          
      -- effectuer la rotation
      D:="*"(T,D);
      
      -- puis projection
      --on affiche pas les point pr dz<0
      if D(3)>0.0 then 
      Resultat(1):= (E(3) / D(3)) * D(1) - E(1);
      Resultat(2):= (E(3) / D(3)) * D(2) - E(2);
      else 
	 Resultat(1):=0.0;
	 Resultat(2):=0.0;
      end if;
      
            
      return Resultat;
   end;

end;
