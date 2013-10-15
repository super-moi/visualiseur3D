visualiseur3D
=============

Projet de visualiseur 3D

J'ai un peu regardé la structure du visualiseur.adb, et voilà comme s'articulent les packages:
- Visualiseur, dans son code, appelle un élement de scene.adb (with Scene;)
	-> scene appelle algebre.adb et stl.adb
		-> stl gère la lecture et interprétation du fichier STL en Projet
		-> algèbre gère les calculs géométriques matriciels
		

dans stl.adb c'est le gros du travail à faire je pense.
