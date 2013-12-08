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
      
   begin
      
      -- On compte le nombre d'espaces en préfixe
      for I in 1..(Length(Chaine)) loop
	 if Element(Chaine,I) = ' ' then
	    Nb_Espaces := Nb_Espaces + 1;
	 else
	    exit;
	 end if;
      end loop;
      
      -- Puis on retourne la tranche qui ne contient plus les espaces
      return U(Slice(Chaine, Nb_Espaces + 1, Length(Chaine)));
      
   end;
   
   
   -- Indique par un booléen si une chaine Motif est contenue dans Chaine_Recherche
   function Dans_Chaine(Chaine_Recherche: in Ustring; Motif: in String ) return Boolean is
      
      Reponse : Boolean := False;
      
   begin
      
      -- On coupe la chaine de recherche sur un intervalle de la longueur du motif, et on regarde si cette "tranche" correspond au motif.
      for I in 1..(Length(Chaine_Recherche) - Motif'Length + 1) loop
	 if Slice(Chaine_Recherche, I, Motif'Length + I - 1) = Motif then
	    Reponse := True;
	    exit;
	 end if;
      end loop;
      
      return Reponse;
      
   end;
   
   function Nombre_Facettes(Nom_Fichier : String) return Natural is
      
      Ligne : UString; -- chaine non bornée
      F : File_Type;
      Nb : Natural := 0;
      
   begin
      Put_Line("Début du compte des facettes dans le fichier..");
      
      -- Ouverture du fichier
      Open(File => F, Mode => In_File, Name => Nom_Fichier);
      -- On compte les facettes en trouvant les "endloop"
      while not(End_Of_File(F)) loop
	 Ligne := U(Get_Line(F));
	 if Dans_Chaine(Enleve_Espaces(Ligne), "endloop") then --on vire les espaces en préfixe pour accélérer la recherche
	    Nb := Nb +1;
	 end if;
      end loop;
      
      Close(F); -- Fermeture du fichier
      return Nb;
   end Nombre_Facettes;
      
   function Chargement_ASCII(Nom_Fichier : String) return Maillage is
      
      -- #### Fonctions utilisées par chargement_ASCII ####
      
      -- A partir de la ligne d'un vecteur, récupère les 3 valeurs
      function Parser_Vecteur(Ligne : in Ustring) return Vecteur is
	 
	 -- Transforme une chaine en nombre dépendent du type du nombre
	 function Chaine_Vers_Float(Chaine_Nombre: in String) return Float is
	    
	 begin
	    	    
	    if Dans_Chaine(U(Chaine_Nombre), "e") then 
	       -- si flottant format scientifique
	       if Chaine_Nombre(Chaine_Nombre'Length - 2) = '+' then
		  return Float'Value(Chaine_Nombre(1..Chaine_Nombre'Length - 4)) * Float(10**Integer'Value(Chaine_Nombre(Chaine_Nombre'Length - 2..Chaine_Nombre'Length)));
	       else
		  return Float'Value(Chaine_Nombre(1..Chaine_Nombre'Length - 4)) * Float(10**( - Integer'Value(Chaine_Nombre(Chaine_Nombre'Length - 2..Chaine_Nombre'Length))));
	       end if;
	    else
	       --entier ou float normal 
	       return Float'Value(Chaine_Nombre); --conversion en float
	    end if;
	    
	 end Chaine_Vers_Float;
	 
	 
	 type Etat is (Hors_Nombre, Dans_Nombre) ;
	 
	 	 Chaine_Tampon : Ustring;
	 EtatCour : Etat := Hors_Nombre;
	 --indique le point courant au fur et a mesure de la lecture
	 Pt_Courant : Natural := 1; 
	 type Bornes_Point is record
	    Debut, Fin : Natural;
	 end record;
	 
	 --indique les bornes de l'écriture des pts dans la chaine
	 Pt_Bornes: array(1..3) of Bornes_Point; 
	     
	 Vecteur_Reponse : Vecteur(1..3);
	 
      begin
	 -- On enlève les espaces et le mot "vertex
	 Chaine_Tampon := Enleve_Espaces(Ligne);
	 Chaine_Tampon := U(Slice(Chaine_Tampon,7,Length(Chaine_Tampon)));
	 Chaine_Tampon := Enleve_Espaces(Chaine_Tampon);
	 
	 for I in 1..(Length(Chaine_Tampon)) loop
	    	    
	    if Element(Chaine_Tampon, I) = ' ' then
	       if EtatCour = Dans_Nombre then
		  Pt_Bornes(Pt_Courant).Fin := I - 1;
		  EtatCour := Hors_Nombre;
		  Pt_Courant := Pt_Courant + 1;
	       end if;
	    else --caractère normal (chiffre, lettre)
	       if EtatCour = Hors_Nombre then
		  Pt_Bornes(Pt_Courant).Debut := I;
		  EtatCour := Dans_Nombre;
	       end if;
	    end if;
	    
	 end loop;
	 
	 -- Petite réparation qui répare l'éventualité où un chiffre est le dernier carac de la chaine
	 if Pt_Bornes(3).Fin = 0 then
	    Pt_Bornes(3).Fin := Length(Chaine_Tampon);
	 end if;
	 
	 for I in 1..3 loop
	    Vecteur_Reponse(I) := Float'Value(Slice(Chaine_Tampon, Pt_Bornes(I).Debut, Pt_Bornes(I).Fin));
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
      Put_line(Integer'Image(Nb_Facettes) & " facettes détectées dans le fichier. Récupération des données initiée");
      
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
      Put_Line("Fin de la récupération des données du fichier STL " & Nom_Fichier);
      return M;
   end Chargement_ASCII;
   
end;

