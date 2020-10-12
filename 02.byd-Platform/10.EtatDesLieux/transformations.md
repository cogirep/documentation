# Documentation Transformation

## Liste des transformations

Voici un tableau exhaustif des transformations actuellement proposées sur la Plateforme (via le module Data) et les prérequis pour chacune d'entre elles :

| Transformation | Input | Requis|
|:---|:---|:---|
| **Visualisartion Model3D** | Dossier ZIP | Fichier tileset.json + x fichiers en '.b3dm' |
| **Visualisation Orthoimage** | Dossier ZIP | X fichiers en '.tif', '.aux', '.xml'...
| **Visualisation Nuage de points** | Dossier ZIP | Fichier tileset.json + x fichiers en '.pnts' |
| **Visualisation Geojson Reality** | Fichier en '.geojson'|
| **Visualisation KML Reality** | Fichier en '.kml' ||
| **Transformation Model3D Reality** | Dossier ZIP | Fichier en '.dae'
| **Transformation Orthoimage Reality** | Dossier ZIP | Fichier en '.tif' ou '.tiff' ou '.png' ou '.jpg' ou '.jpeg'
| **Transformation Ifc Reality** | Fichier en '.ifc' ||
| **Nuage de points** | Fichier en '.las' ou '.laz ||

<br/>

## Limite

Actuellement, et compte-tenu des infrastructures disponibles, une taille maximale de 1Go est préconisée lors de l'import du fichier/dossier. <br/>
En effet, n'ayant pas connaissance du taux de compression des différentes archives, la taille de 1Go permet d'assurer le fonctionnement des différentes transformations 