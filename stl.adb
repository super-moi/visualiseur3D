with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Strings.Unbounded;
use  Ada.Strings.Unbounded;
with Ada.Numerics.Generic_Elementary_Functions;
use Ada.Numerics.Generic_Elementary_Functions;

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
      -- Ouverture du fichier
      Open(File => F, Mode => In_File, Name => Nom_Fichier);
      -- On compte les facettes en trouvant les "endloop"
      while not(End_Of_File(F)) loop
	 Ligne := U(Get_Line(F));
	 if In_String(Enleve_Espaces(Ligne), "end loop") then --on vire les espaces en préfixe pour accélérer la recherche
	    Nb := Nb +1;
	 end if;
      end loop;
      
      Close(F); -- Fermeture du fichier
      return Nb;
   end;
      
   function Chargement_ASCII(Nom_Fichier : String) return Maillage is
      
      -- #### Fonctions utilisées par chargement_ASCII ####
      
      -- A partir de la ligne d'un vecteur, récupère les 3 valeurs
      function Parser_Vecteur(Ligne : in Ustring) return Vecteur is
	 
	 -- Transforme une chaine en nombre dépendent du type du nombre
	 -- ACHTUNG! Fonction récursive!
	 function Chaine_Vers_Float(Chaine_Nombre: in String) return Float is
	    
	 begin
	    if Dans_Chaine(Chaine_Nombre, "e") then 
	       -- si flottant format scientifique
	       if Chaine_Nombre(Chaine'Length - 2) = '+' then
		  return Float'Value(Chaine_Nombre(1,Chaine'Length - 4)) * (10**Integer'Value(Chaine-Length - 2, Chaine'Length));
	       else
		    return
	       end if;
	    else
	       --entier ou chaine
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
	 Chaine_Tampon := U(Slice(Chaine,6,Length(Chaine_Tampon)));
	 Chaine_Tampon := Enleve_Espaces(Chaine_Tampon);
	 
	 for I in 1..(Length(Chaine_Tampon)) loop
	    if Element(Chaine_Tampon, I) = ' ' then
	       if EtatCour := Dans_Nombre then
		  Pt_Bornes(Pt_Courant).Fin := I - 1;
		  EtatCour := Hors_Nombre;
		  Pt_Courant := Pt_Courant + 1;
	       end if;
	    else
	       if EtatCour := Hors_Nombre then
		  Pt_Bornes(Pt_Courant).Debut := I;
		  EtatCour := Dans_Nombre;
	       end if;
	    end if;
	 end loop;
	 
	 for I in 1..3 loop
	    --Optimisation possible en supprimant Pt_Chaines
	    Pt_Chaines(I) := Slice(Chaine_Tampon, Pt_Bornes(I).Debut, Pt_Bornes(I).Fin);
	    Vecteur_Reponse(I) := Chaine_Vers_Float(Pt_Chaines(I));
	 end loop;
	 
	 return Vecteur_Reponse;
	 
      end;
      
      -- ####
      
      Nb_Facettes : Natural;
      M : Maillage;
      F : File_Type;
      
      --Utilisation d'une machine à état
      type Etat_Lecture_STL is (Facette_Debut, -- A lu Facet normal
		    Facette_Fin, --A Lu le end_loop et end facet
		    Lu_Premier_Vect, -- A lu et enregistré le premier Vect 
		    Lu_Deuxieme_Vect, -- Lu et enregistré le 2ème vect
		    Lu_Troiseme_Vect); -- Lu et enregisté le 3ème vect
      
      EtatCourant : Etat_Lecture_STL := Facette_Debut;
   begin
      
      Nb_Facettes := Nombre_Facettes(Nom_Fichier);
      -- une fois qu'on a le nombre de facettes on connait la taille du maillage
      M := new Tableau_Facette(1..Nb_Facettes);
      
      -- on ouvre de nouveau le fichier pour parcourir les facettes et remplir le maillage
      Open(File => F, Mode => In_File, Name => Nom_Fichier);
      
      --On parse le fichier pour récupérer les vecteurs, puis les facettes.
      while not(End_Of_File(F)) loop
	if 
      end loop;
      
      Close (F); --fermeture du fichier
      return M;
   end;
   
end;

