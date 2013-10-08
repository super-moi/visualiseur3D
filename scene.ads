with STL ; use STL;
with Algebre ; use Algebre;

-- le paquetage Scene permet de stocker tous les objets du systeme
-- l'acces aux differents objets passe alors uniquement par les procedures 
-- et fonctions fournies.

package Scene is
	-- quelques fonctions et procedures permettant d'acceder aux objets :

	-- Position_Camera renvoie les coordonnees courantes
	-- de la camera
	function Position_Camera return Vecteur;

	-- retourne le nombre total de facettes
	function Nombre_De_Facettes return Natural;

	-- Projection_Facette prend en entree un numero de facette (Index_Facette)
	-- et renvoie les coordonnees 2D des projections des 3 points de
	-- la facette correspondante
	procedure Projection_Facette(Index_Facette : Positive ; P1, P2, P3 : out Vecteur);

	-- quelques procedures permettant de mettre a jour les objets :

	-- ajout du maillage dans le systeme (un seul maillage stocke)
	procedure Ajout_Maillage(M : Maillage);

	-- mise a jour des coordonnees de la camera
	-- l'Index indique le numero de la coordonnee a modifier
	-- 1 modifie R
	-- 2 modifie rho
	-- 3 modifie theta
	-- 4 modifie phi
	-- et l'Increment est la valeur a ajouter
	procedure Modification_Coordonnee_Camera(Index : Positive ; Increment : Float);
end;
