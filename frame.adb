with Dessin; use Dessin;
with Ligne; use Ligne;
with STL ; use STL;
with Algebre ; use Algebre;
			    
with Scene;

with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Frame is
   
      procedure Calcul_Image is
      
      type Vecteur_Entier is array(1..2) of Natural;
      
      --Prend un vecteur en float, le renvoie en vecteur_entier
      function Vers_Vecteur_Entier(Vect_Float : Vecteur) return Vecteur_Entier is
      begin  
	 return (1 => Integer(Float'Rounding(Vect_Float(1))),2 => Integer(Float'Rounding(Vect_Float(2)))); 
      end;
      
      --vérifie si le vecteur projeté est bien dans le cadre de l'écran
      function Est_Dans_Cadre(Vecteur_Projection : Vecteur_Entier) return Boolean is
      begin
	 return (Vecteur_Projection(1) > 0 and Vecteur_Projection(1) < SCRW) and (Vecteur_Projection(2) > 0 and Vecteur_Projection(2) < SCRH);
      end;
      
      procedure Print_Vector(Vector : Vecteur_Entier) is
      begin
	 for I in 1..2 loop
	    Put(Vector(I));
	 end loop;
      end;
      
      -- Garde l'info qui indique si un point est tracable ou non
      -- * si sa coord z > 0
      -- * si sa projection est dans le cadre
      Est_Tracable_V1, Est_Tracable_V2, Est_Tracable_V3: Boolean;
      -- vecteur entiers de stockage
      V1, V2, V3 : Vecteur_Entier;
      -- stockage des projection en float
      Vect1, Vect2, Vect3 : Vecteur(1..2);
      
   begin
            
      --Remise à 0 des projections
      for I in 1..SCRW loop
	 for J in 1..SCRH loop
	    Fixe_Pixel(I,J, 0);
	 end loop;
      end loop;
      
      -- projection de chaque chaque facette, puis affichage à l'écran
      
      for I in 1..Scene.Nombre_De_Facettes loop
	 
	 -- calcul des projections
	 Scene.Projection_Facette(I, Vect1, Vect2, Vect3, Est_Tracable_V1, Est_Tracable_V2,Est_Tracable_V3);
	 -- On rend entières les coordonnées du vecteur
	 V1 := Vers_Vecteur_Entier(Vect1); 
	 V2 := Vers_Vecteur_Entier(Vect2);
	 V3 := Vers_Vecteur_Entier(Vect3);
	 
	 -- On vérifie si les points indiqués par les vecteurs sont bien dans le cadre
	 Est_Tracable_V1 := Est_Tracable_V1 and Est_Dans_Cadre(V1);
	 Est_Tracable_V2 := Est_Tracable_V2 and Est_Dans_Cadre(V2);
	 Est_Tracable_V3 := Est_Tracable_V3 and Est_Dans_Cadre(V3);
	 
	 -- Print_Vector(V1); Print_Vector(V2); Print_Vector(V3);
	 
	 -- Si les points sont dans le cadre, on trace d'arête
	 if Est_Tracable_V1 and Est_Tracable_V2 then
	    Tracer_Segment(V1(1),V1(2), V2(1), V2(2));
	 end if;
	 if Est_Tracable_V1 and Est_Tracable_V3 then
	    Tracer_Segment(V1(1),V1(2), V3(1), V3(2));
	 end if;
	 if Est_Tracable_V3 and Est_Tracable_V2 then
	    Tracer_Segment(V3(1),V3(2), V2(1), V2(2));
	 end if;

      end loop;	   
   end;
   
end Frame;
