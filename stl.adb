
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Strings.Unbounded;
use  Ada.Strings.Unbounded;

-- Utilisation d'une petite bibliothèque de gestion des chaînes unbounded
with Ustrings;
use Ustrings;

package body STL is
   
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
      -- a faire : compter les facettes (p.ex. chercher les "endloop")...
      
      -- Bloc pouvant être optimisé en virant les espaces avant la ligne
      while not(End_Of_File(F)) loop
	 Ligne := U(Get_Line(F));
	 if In_String(Ligne, "end loop") then
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
   begin
      Nb_Facettes := Nombre_Facettes(Nom_Fichier);
      -- une fois qu'on a le nombre de facettes on connait la taille du maillage
	 M := new Tableau_Facette(1..Nb_Facettes);
	 -- on ouvre de nouveau le fichier pour parcourir les facettes
	 -- et remplir le maillage
	 Open(File => F, Mode => In_File, Name => Nom_Fichier);
	 -- a faire...
	 Close (F);
	 return M;
   end;
   
end;

