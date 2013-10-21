with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Text_IO;
use Ada.Text_IO;



package body Scene is

	R : Float := 50.0; -- coordonnee Z initiale de la camera
	Rho : Float := 0.0; -- rotation autour de X
	Theta : Float := 0.0; -- rotation autour de Y
	Phi : Float := 0.0; -- rotation autour de Z

	E : Vecteur(1..3) := (-400.0, -300.0, 400.0); -- position du spectateur
	T : Matrice(1..3, 1..3); -- matrice de rotation

	M : Maillage;

	procedure Modification_Matrice_Rotation is
	begin
	   
	   T := Matrice_Rotations ((1 => -Rho, 2 => -Theta, 3 => -Phi));
	   
	end Modification_Matrice_Rotation;
	

	function Position_Camera return Vecteur is
		Position : Vecteur(1..3);
	begin
	   -- a faire
	   -- ? au depart, point camera en (0,0,-R) (R>0)
	   
	   return Position;
	end;
	

	procedure Projection_Facette(Index_Facette : Positive ; P1, P2, P3 : out Vecteur) is
	begin
	   -- index_facette designe la facette selectionnee
	   P1 := Projection(M(Index_Facette).P1, Position_Camera, Centre_Repere , Matrice_Rotation); 
	   P2 := Projection(M(Index_Facette).P2, Position_Camera, Centre_Repere , Matrice_Rotation); 
	   P3 := Projection(M(Index_Facette).P3, Position_Camera, Centre_Repere , Matrice_Rotation); 
	   
	end Projection_Facette;
	
	
	procedure Ajout_Maillage(M_Param : Maillage) is
	begin
	   -- Explication : cette proc est appellée par visualiseur.adb, et ce module appelle *déjà* chargement_ASCII. On a juste a copier le paramètre en mémoire.
	   -- Pour l'instant je copie TOUT le contenu du tableau, pas juste le pointeur. On verra ce que ca donne dans le reste, sinon on fait
	   -- M := M_Param
	  	 	      	   
	   M.all := M_Param.all;    	   
	   
	   null;
	end;

	function Nombre_De_Facettes return Natural is
	begin
	   return Maillage'Length;
	end;
	
	
	procedure Modification_Coordonnee_Camera(Index : Positive ; Increment : Float) is
	begin
	   -- a faire
	   -- index = 2, 3 ou 4
	   -- '3' pr tourner autour l'axe z
	   -- '2' pr tourner autour l'axe x
	   -- '4' pr le zoom
	   -- pb: rotation du repere de l'ordi ou de l'image???
	   -- on va dire ds l'ordi
	   
	   if Index=3 then 
	      Phi:= Phi + Increment; --en radian	       
	   elsif Index=2 then
	      Rho:= Rho + Increment;	      
	   elsif Index=4 then 
	      R:= R + Increment;    
	   end if;
	   
	end Modification_Coordonnee_Camera;

begin
   --initialisation de la matrice de rotation au lancement du programme  
   Modification_Matrice_Rotation;
end;
