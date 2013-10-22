with Dessin; use Dessin;
with Ligne; use Ligne;
with STL ; use STL;
with Algebre ; use Algebre;

with Scene;

package body Frame is
   
   M : Maillage := Scene.Renvoi_Maillage;   
   procedure Calcul_Image is
   begin
      -- a faire : calcul des projections, affichage des triangles
      -- il commencer par remettre a zero l'affichage
      
      -- projection
      for I in M'Range loop
	 Scene.Projection_Facette(I);
      end loop;
      
      --affichage
      for J in M'Range loop
	 Trace_Pixel(M(J).P1,M(J).P2);
	 Trace_Pixel(M(J).P3,M(J).P2);
	 Trace_Pixel(M(J).P3,M(J).P1);
      end loop;	   
   end;
   
end Frame;
