# Investigation flux OGC
 
## Problème #1
 
Certains flux retournaient une erreur de CORB.
 
Après investigation il s’agissait de paramètres manquant dans la requête faite au geoserveur.
 
Un nouveau composant Angular limitant l’affichage des données au format image.
Il est possible d’afficher un message d’erreur si le format du retour n’est pas correct.
 
## Problème #2
 
Seules les 5 premières données de contexte s’affichaient sur la carte.
 
Après investigation le back ne retournait que les 5 premières données de contexte.
 
Les données de contextes ne sont plus appelées au lancement de l’application mais à l’ouverture du drawer.
Elles sont ajoutées à cesium au clic sur le bouton « visualiser »
