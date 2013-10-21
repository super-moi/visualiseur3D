with Dessin; use Dessin;
with Ligne; use Ligne;
with STL ; use STL;
with Algebre ; use Algebre;

with Scene;

package body Frame is

	procedure Calcul_Image is
	begin
	   -- a faire : calcul des projections, affichage des triangles
	   -- il commencer par remettre a zero l'affichage
	   
	   -- projection
	   for I in M'Range loop
	      Projection_Facettes(I);
	   end loop;
	   
	   --affichage
	   for J in M'Range loop
	      for I in 1..3 loop
		 Trace_Pixel(M(J)i);
	      end loop;
	   end loop;	   
	end;

end Frame;
