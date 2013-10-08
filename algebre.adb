
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body Algebre is

	--voir http://en.wikipedia.org/wiki/3D_projection#Perspective_projection
	function Matrice_Rotations(Angles : Vecteur) return Matrice is
		Rotation : Matrice(1..3, 1..3);
	begin
		-- a faire
		return Rotation;
	end;

	function Matrice_Rotations_Inverses(Angles : Vecteur) return Matrice is
		Rotation : Matrice(1..3, 1..3);
	begin
		-- a faire
		return Rotation;
	end;

	function "*" (X : Matrice ; Y : Vecteur) return Vecteur is
		Z : Vecteur(X'Range(1));
	begin
		-- a faire
		return Z;
	end;


	function Projection(A, C, E : Vecteur ; T : Matrice) return Vecteur is
		Resultat : Vecteur(1..2);
	begin
		-- a faire
		return Resultat;
	end;

end;
