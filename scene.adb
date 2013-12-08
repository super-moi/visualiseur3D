with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body Scene is

	R : Float := 50.0; -- coordonnee Z initiale de la camera
	Rho : Float := 0.0; -- rotation autour de X
	Theta : Float := 0.0; -- rotation autour de Y
	Phi : Float := 0.0; -- rotation autour de Z

	E : Vecteur(1..3) := (-400.0, -300.0, 400.0); -- position du spectateur
	T : Matrice(1..3, 1..3); -- matrice de rotation

	M : Maillage;
	
	function Retour_Maillage return Maillage is
	begin
	   return M;
	end;
	
	
	procedure Modification_Matrice_Rotation is
	begin
	   
	   T := Matrice_Rotations ((1 => -Rho, 2 => -Theta, 3 => -Phi));
	   
	end Modification_Matrice_Rotation;
	
	procedure Modification_Matrice_Rotation_Inv is
	begin
	   
	   T := Matrice_Rotations_inverses ((1 => Rho, 2 => Theta, 3 => Phi));
	   
	end Modification_Matrice_Rotation_inv;
	

	function Position_Camera return Vecteur is
		Position : Vecteur(1..3);
	begin
	  
	   -- au depart, point camera en (0,0,-R)
	   -- puis on effectue une rotation
	   Modification_Matrice_Rotation;
	   Position := (0.0, 0.0, -R);
	   Position := "*"( T, Position);
	  
	   return Position;
	end;
	
	-- P1,P2,P3 vecteurs passés par référence, on stocke la projection dedans
	-- Danscadre1, ...., Bool passés par référence, on stocke si le point est bien devant la caméra
	procedure Projection_Facette(Index_Facette : Positive ; P1, P2, P3 : out Vecteur; DansCadre1, DansCadre2, DansCadre3 : out Boolean) is
	   Cam : Vecteur(1..3);  
	begin
	  
	  -- index_facette designe la facette selectionnee
	   Cam:=Position_Camera; -- on charge la position de la camera
	   Modification_Matrice_Rotation_Inv;-- permet de rechager une matrice de rotation inverse
					     --l'objet restera au centre de l'ecran
	   
	   -- On vérifie si le point est devant la caméra (Z > 0)
	   DansCadre1 := (M(Index_Facette).P1(3) >= 0.0);
	   DansCadre2 := (M(Index_Facette).P2(3) >= 0.0);
	   DansCadre3 := (M(Index_Facette).P3(3) >= 0.0);
	   
	   -- Petite optimisation: si le point est derrière la caméra, on ne calcule pas sa projection. La fonction qui appelle Projection_Facette le sait aussi, grâce à DansCadre
	   if DansCadre1 then
	      P1 := Projection(M(Index_Facette).P1, Cam, E, T);
	   else
	      P1 := (0.0, 0.0);
	   end if;
	     
	   if DansCadre2 then
	      P2 := Projection(M(Index_Facette).P2, Cam, E, T); 
	   else
	      P2 := (0.0, 0.0);
	   end if;
	   
	   if DansCadre3 then
	      P3 := Projection(M(Index_Facette).P3, Cam, E, T); 
	   else
	      P3 := (0.0, 0.0);
	   end if;
	     
	end Projection_Facette;
	
	
	procedure Ajout_Maillage(Maillage_Param : Maillage) is
	begin
	   -- Explication : cette proc est appellée par visualiseur.adb, et ce module appelle *déjà* chargement_ASCII. On a juste a copier le paramètre en mémoire.sd	  

	   M := new Tableau_Facette(Maillage_Param'Range);
	   
	   M.all := Maillage_Param.all;    	   
	   
	end;

	function Nombre_De_Facettes return Natural is
	begin
	   return M'Length;
	end;
	
	
	procedure Modification_Coordonnee_Camera(Index : Positive ; Increment : Float) is
	  
	begin	 
	   -- index designe l'action voulue sur la camera
	    	 
	   if Index=1 then 
	       R:=R + Increment; 
	   elsif Index=4 then 
	      Phi:= Phi + Increment;	       
	   elsif Index=2 then
	      Rho:= Rho + Increment;	      
	   elsif Index=3 then 
	      Theta:= Theta + Increment;    
	   end if;
	   	 	   
	end Modification_Coordonnee_Camera;
	
	
	function Renvoi_Maillage return Maillage is
	begin
	   return M;
	end;

begin
   --initialisation de la matrice de rotation au lancement du programme  
   Modification_Matrice_Rotation;
end;
