with Interfaces.C;
with Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with GNAT.OS_Lib; use GNAT.OS_Lib;
with SDL.Quit;
with SDL.Error;
with SDL.Types; use SDL.Types;
with SDL.Timer;
with SDL.Events;
with SDL.Video;
with SDL.Keyboard;
with SDL.Keysym;

with Dessin; use Dessin;
with Frame; use Frame;
with STL; use STL;
with Scene;

with Ada.Command_line; use Ada.Command_Line;

procedure Visualiseur is

	--  ======================================
	package  Vd renames SDL.Video;
	package  It renames Interfaces;
	use type It.Unsigned_32;
	package  C  renames Interfaces.C;
	use type C.int;
	use type C.size_t;
	use type C.unsigned;
	use type C.C_float;
	package  CL renames Ada.Command_Line;
	package  Er renames SDL.Error;
	package  Ev renames SDL.Events;
	use type Ev.Event_Type;
	package  T  renames SDL.Timer;
	use type Vd.Surface_Flags;
	use type Vd.Surface_ptr;
	use Vd.Color_PtrOps;

	screen : Vd.Surface_ptr;
	vidflags : Vd.Surface_Flags := 0;

	cmap : Vd.Colors_Array (0..255);
	use Uint8_Ptrs;
	use Uint8_PtrOps;
	use Interfaces;
	use type C.int;

begin

	-- on commence par charger le maillage
	if Argument_Count /= 1 then
		Put_Line(Standard_Error, "usage : " & Command_Name & " file.stl");
		New_Line(Standard_Error);
		Set_Exit_Status(Failure);
		return;
	end if;
	Scene.Ajout_Maillage(Chargement_ASCII(Argument(1)));


	-- on continue en initialisant l'affichage
	for I in cmap'Range loop
		cmap(I) := (Uint8(I), 0, 0, 0);
	end loop;

	if SDL.Init (SDL.INIT_VIDEO) < 0 then
		Put ("erreur lors de l'initialisation de SDL");
	end if;
	SDL.Quit.atexit (SDL.SDL_Quit'Access);
	--vidflags := vidflags or Vd.FULLSCREEN;

	-- on travaille ici en 8bits/pixel
	screen := Vd.SetVideoMode (SCRW, SCRH, 8, vidflags or Vd.HWPALETTE);
	if screen = null then
		Put_Line ("erreur lors du choix de la resolution  " & Integer'Image (SCRW) & " " &
		Integer'Image (SCRH) & " " & Er.Get_Error);
		GNAT.OS_Lib.OS_Exit (1);
	end if;

	Pixels := Uint8_Ptrs.To_Pointer(screen.pixels);
	Pitch := Natural(screen.Pitch);


	Vd.SetPalette (screen, Vd.PHYSPAL, cmap, C.int(cmap'First), C.int(cmap'Length));

	if
		-- on active l'auto-repetition des touches, pour une interface plus sympa
		SDL.Keyboard.EnableKeyRepeat (the_delay => 50,
		interval  => 50) /= 0
	then
		Ada.Text_IO.Put_Line
			(File => Ada.Text_IO.Standard_Error,
			Item => "SDL.Events.Enable_Key_Repeat: echoue!");
	end if;

	-- demarrage de la boucle principale
	-- on gere les entrees/sorties
	-- puis reaffiche l'objet
	loop
		declare
			e : aliased Ev.Event;
		begin

			--  A small event loop
			while Ev.PollEvent (e'Access) /= 0 loop

				--handle all different keys
				if e.the_type = Ev.KEYDOWN then
					case e.key.keysym.sym is
							-- on quitte sur la touche 'echappement'
						when SDL.Keysym.K_ESCAPE =>
							GNAT.OS_Lib.OS_Exit (0);
							-- les fleches permettent de tourner de 0.1 radian
						when SDL.Keysym.K_LEFT =>
							Scene.Modification_Coordonnee_Camera(3, -0.1);
						when SDL.Keysym.K_RIGHT =>
							Scene.Modification_Coordonnee_Camera(3, 0.1);
						when SDL.Keysym.K_UP =>
							Scene.Modification_Coordonnee_Camera(2, 0.1);
						when SDL.Keysym.K_DOWN =>
							Scene.Modification_Coordonnee_Camera(2, -0.1);
						when SDL.Keysym.K_H =>
							Scene.Modification_Coordonnee_Camera(4, 0.1);
						when SDL.Keysym.K_L =>
							Scene.Modification_Coordonnee_Camera(4, -0.1);
							-- page up et down permettent d'avance / reculer
						when SDL.Keysym.K_PAGEUP =>
							Scene.Modification_Coordonnee_Camera(1, 5.0);
						when SDL.Keysym.K_PAGEDOWN =>
							Scene.Modification_Coordonnee_Camera(1, -5.0);
						when others =>
							null;
					end case;
				end if;

				-- un clic quitte
				if (e.the_type = Ev.QUIT)
					or (e.the_type = Ev.MOUSEBUTTONDOWN) then
					GNAT.OS_Lib.OS_Exit (0);
				end if;
			end loop;

			if Vd.LockSurface(screen) < 0 then
				Put("erreur lors du lock de la surface");
			end if;
			Calcul_Image;
			Vd.UnlockSurface(screen);
			Vd.Flip (screen); -- dessin a l'ecran

		end;
	end loop;
end;
