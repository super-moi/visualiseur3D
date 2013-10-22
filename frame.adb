with Dessin; use Dessin;
with Ligne; use Ligne;
with STL ; use STL;
with Algebre ; use Algebre;

with Scene;

package body Frame is
   
   
   M : Maillage;  
   
   procedure Calcul_Image is
      
      type Vecteur_Entier is array(1..2) of Natural;
      
      --Prend un vecteur en float, le renvoie en vecteur_entier
      function Vers_Vecteur_Entier(Vect_Float : Vecteur) return Vecteur_Entier is
	-- Resultat : Vecteur_Entier;
      begin
	 return (1 => Integer(Float'Rounding(Vect_Float(1))),2 => Integer(Float'Rounding(Vect_Float(2)))); 
      end;
      
      -- vecteur entiers de stockage
      V1, V2, V3 : Vecteur_Entier;
      
   begin
      
      -- a faire : calcul des projections, affichage des triangles
      -- il commencer par remettre a zero l'affichage
      
      -- projection
      for I in M'Range loop
	 Scene.Projection_Facette(I, M(I).P1, M(I).P2, M(I).P3);
      end loop;
      
      --affichage
      for I in M'Range loop
	 V1 := Vers_Vecteur_Entier(M(I).P1); 
	 V2 := Vers_Vecteur_Entier(M(I).P2);
	 V3 := Vers_Vecteur_Entier(M(I).P3);
	 
	 Tracer_Segment(V1(1),V1(2), V2(1), V2(2));
	 Tracer_Segment(V1(1),V1(2), V3(1), V3(2));
	 Tracer_Segment(V3(1),V3(2), V2(1), V2(2));
	 
      end loop;	   
   end;
   
end Frame;
