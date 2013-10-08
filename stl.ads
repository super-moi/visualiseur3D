with Algebre;
use Algebre;

package STL is

	-- nous avons besoin de stocker un ensemble de facettes
	-- il nous faut donc definir les quelques structures suivantes
	type Facette is record
		P1, P2, P3 : Vecteur(1..3);
	end record;

	type Tableau_Facette is array(positive range<>) of Facette;

	type Maillage is access Tableau_Facette;

	-- charge un fichier STL au format ASCII
	function Chargement_ASCII(Nom_Fichier : String) return Maillage;

end;
