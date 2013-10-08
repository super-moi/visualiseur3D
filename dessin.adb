with Interfaces.C;

-- les procedures de ce paquetage sont un brin complexes
-- vous ne devriez normalement pas avoir besoin de les modifier
-- vous pouvez le faire, mais a vos risques et perils

package body Dessin is
	package  C  renames Interfaces.C;

	use Uint8_Ptrs;
	use Uint8_PtrOps;
	use Interfaces;
	use type C.int;

	procedure Fixe_Pixel(X : Pixel_X ; Y : Pixel_Y ; Valeur : Uint8) is
		Pointy : Uint8_PtrOps.Pointer;
	begin
		Pointy := Uint8_PtrOps.Pointer(Pixels);
		Pointy := Pointy + C.ptrdiff_t(C.int(X-1 + (Y-1)*Pitch));
		Uint8_Ptrs.Object_Pointer(Pointy).all := Valeur;
	end Fixe_Pixel;

	procedure Trace_Pixel(X : Pixel_X ; Y : Pixel_Y) is
	begin
		Fixe_Pixel(X, Y, 255);
	end;

end;
