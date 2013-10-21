with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use  Ada.Strings.Unbounded;
with Ada.Numerics.Generic_Elementary_Functions;


-- Utilisation d'une petite bibliothèque de gestion des chaînes unbounded
with Ustrings;
use Ustrings;

package body STL is
   
   -- Fonction très simple qui renvoie la même chaine, en ayant supprimé les espaces en préfixe
   function Enleve_Espaces(Chaine : in Ustring) return Ustring is
      
      Nb_Espaces : Integer := 0;
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
	   -- index designe l'action voulu sur la camera
	   if Index=1 then 
	      R:=R + Increment;   
	   elsif Index=3 then 
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

	    
	 end loop;
	 
	 -- Petite réparation qui répare l'éventualité où un chiffre est le dernier carac de la chaine
	 if Pt_Bornes(3).Fin = 0 then
	    Pt_Bornes(3).Fin := Length(Chaine_Tampon);
	 end if;
	 
	 for I in 1..3 loop
	    Vecteur_Reponse(I) := Chaine_Vers_Float(Slice(Chaine_Tampon, Pt_Bornes(I).Debut, Pt_Bornes(I).Fin));
	 end loop;
	 
	 return Vecteur_Reponse;
	 
      end Parser_Vecteur;
      
      -- ####
      
      Nb_Facettes : Natural;
      M : Maillage;
      F : File_Type;
      
      --Utilisation d'une machine à état
      type Etat_Lecture_STL is (Hors_Solide, -- Etat du début, avant de lire "solid"
				Dans_Solide, --Une fois avoir lu la balise "solid"
				Dans_Facette, -- A lu Facet normal, se trouve dans une facette
				Dans_Boucle); -- Après avoir lu "outer loop"
      
      -- Variables servants à la gestion du parsage du fichier ligne par ligne          
      EtatCourant : Etat_Lecture_STL := Hors_Solide;
      -- Le vecteur entrain d'être lu sur une facette
      Vecteur_Courant : Integer range 1..3 := 1;
      Facette_Courante : Natural := 1;
      Ligne : Ustring;
      Facette_Tampon : Facette;
      
   begin
      Put_Line("Début de la récupération des données du fichier STL");
      Nb_Facettes := Nombre_Facettes(Nom_Fichier);
      Put(Nb_Facettes);
      Put_line(" facettes détectées dans le fichier. Récupération des données initiée");
      -- une fois qu'on a le nombre de facettes on connait la taille du maillage
      M := new Tableau_Facette(1..Nb_Facettes);
      
      -- on ouvre de nouveau le fichier pour parcourir les facettes et remplir le maillage
      Open(File => F, Mode => In_File, Name => Nom_Fichier);
      
      --On parse le fichier pour récupérer les vecteurs, puis les facettes, à l'aide d'une machine à état
      while not(End_Of_File(F)) loop
	 Ligne := U(Get_Line(F)); -- on lit une ligne du fichier
	 
	 case EtatCourant is
	    
	    when Hors_Solide =>
	       if Dans_Chaine(Enleve_Espaces(Ligne), "solid") and not(Dans_Chaine(Enleve_Espaces(Ligne), "endsolid")) then
		  EtatCourant := Dans_Solide;
	       end if;
	       
	    when Dans_Solide =>
	       if Dans_Chaine(Enleve_Espaces(Ligne), "facet normal") then
		  EtatCourant := Dans_Facette;
	       elsif Dans_Chaine(Enleve_Espaces(Ligne), "endsolid") then
		  EtatCourant := Hors_Solide;
	       end if;
	       
	    when Dans_Facette =>
	       if Dans_Chaine(Enleve_Espaces(Ligne), "outer loop") then
		  EtatCourant := Dans_Boucle;
	       elsif Dans_Chaine(Enleve_Espaces(Ligne), "endfacet") then
		  EtatCourant := Dans_Solide;
	       end if;
	       
	    when Dans_Boucle =>
	       if Dans_Chaine(Enleve_Espaces(Ligne), "vertex") then
		  
		  -- Stokage des données dans une facette - tampon
		  case Vecteur_Courant is
		     when 1 =>
			Facette_Tampon.P1 := Parser_Vecteur(Ligne);
		     when 2 =>
			Facette_Tampon.P2 := Parser_Vecteur(Ligne);
		     when 3 =>
			Facette_Tampon.P3 := Parser_Vecteur(Ligne);
		     when others => null;
		  end case;
		  
		  if Vecteur_Courant /= 3 then
		     Vecteur_Courant := Vecteur_Courant + 1; -- On change de vecteur pour la prochaine ligne
		  end if;
		  
	       elsif Dans_Chaine(Enleve_Espaces(Ligne), "endloop") then
		  
		  Vecteur_Courant := 1; --on RàZ le compteur
		  M.all(Facette_Courante) := Facette_Tampon; --On copie la facette courante dans le maillage à retourner
		  Facette_Courante := Facette_Courante + 1; -- On incrémente la facette courante pour la prochaine
		  EtatCourant := Dans_Facette; --on sort de la boucle interne à une facette		  
	       end if;
	       	       
	 end case;
	      
      end loop;
      
      Close (F); --fermeture du fichier
      return M;
   end Chargement_ASCII;
   
end;

