with Dessin; use Dessin;
with Ligne; use Ligne;
with STL ; use STL;
with Algebre ; use Algebre;

with Scene;

package body Frame is
   
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
      -- facette de stockage
      Vect1, Vect2, Vect3 : Vecteur(1..2);
   begin
            
      -- a faire : calcul des projections, affichage des triangles
      -- il commencer par remettre a zero l'affichage
      
      -- projection
      for I in 1..Scene.Nombre_De_Facettes loop
	 Scene.Projection_Facette(I, Vect1, Vect2, Vect3);
	 V1 := Vers_Vecteur_Entier(Vect1); 
	 V2 := Vers_Vecteur_Entier(Vect2);
	 V3 := Vers_Vecteur_Entier(Vect3);
	 
	 Tracer_Segment(V1(1),V1(2), V2(1), V2(2));
	 Tracer_Segment(V1(1),V1(2), V3(1), V3(2));
	 Tracer_Segment(V3(1),V3(2), V2(1), V2(2));
	 
      end loop;	   
   end;
   
end Frame;
