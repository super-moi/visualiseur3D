package Algebre is
	-- nous definissons deux types de donnees permettant de stocker
	-- des vecteurs (2d et 3d)
	-- ainsi que des matrices
	type Vecteur is array(Positive range<>) of Float;
	type Matrice is array(Positive range<>, Positive range<>) of Float;

	-- nous definissons maintenant 2 fonctions realisons les calculs de 3D
	-- pour plus de details, voir la documentation fournie ou
	-- see http://en.wikipedia.org/wiki/3D_projection#Perspective_projection

	-- la fonction Matrice_Rotations renvoie la matrice realisant
	-- les 3 rotations suivantes (dans l'ordre) :
	-- une rotation d'Angles(1) autour de l'axe X
	-- suivie d'une rotation d'Angles(2) autour de l'axe Y
	-- suivie d'une rotation d'Angles(3) autour de l'axe Z
	function Matrice_Rotations(Angles : Vecteur) return Matrice;	

	-- la fonction Matrice_Rotations_Inverses renvoie la matrice realisant
	-- les 3 rotations suivantes (dans l'ordre) :
	-- une rotation d'Angles(3) autour de l'axe Z
	-- suivie d'une rotation d'Angles(2) autour de l'axe Y
	-- suivie d'une rotation d'Angles(1) autour de l'axe X
	function Matrice_Rotations_Inverses(Angles : Vecteur) return Matrice;

	-- produit matrice vecteur
	function "*" (X : Matrice ; Y : Vecteur) return Vecteur;

	-- la fonction Projection calcule les coordonnees 2D (sur l'ecran) d'un point
	-- de la scene 3D
	-- elle utilise les arguments suivants :
	-- A : le point a projeter
	-- C : le point ou se trouve la camera
	-- E : la position du spectateur par rapport a l'ecran
	-- T : la matrice de rotation
	function Projection(A, C, E : Vecteur ; T : Matrice) return Vecteur;
end;
