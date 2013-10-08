
with SDL.Types; use SDL.Types;

package Dessin is

	SCRW : Constant := 800; -- largeur constante de l'ecran
	SCRH : Constant := 600; -- hauteur constante de l'ecran
	subtype Pixel_X is Integer range 1..SCRW; -- type coordonnee X d'un pixel
	subtype Pixel_Y is Integer range 1..SCRH; -- type coordonnee Y d'un pixel

	-- les deux variables suivantes ne vous sont pas utiles, vous pouvez les ignorer
	Pixels : Uint8_Ptrs.Object_Pointer;
	Pitch : Natural;

	procedure Fixe_Pixel(X : Pixel_X ; Y : Pixel_Y ; Valeur : Uint8); -- met la valeur du pixel X Y a Valeur
	procedure Trace_Pixel(X : Pixel_X ; Y : Pixel_Y); -- met la valeur du pixel en position X Y a 255

end;
