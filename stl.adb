with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Strings.Unbounded;
use  Ada.Strings.Unbounded;

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
	
      end loop;
      
      Close (F); --fermeture du fichier
      return M;
   end;
   
end;

