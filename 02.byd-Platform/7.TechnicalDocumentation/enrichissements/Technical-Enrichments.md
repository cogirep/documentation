# Enrichissements techniques #

## Définition ##

Un enrichissement Technique, est un enrichissement dont le `beyondType` vaut `technical`. Cet enrichissement a pour vocation
de donner toutes les infos requises par certaines fonctionnalitées des produits pour fonctionner correctement.

Exemple : L'enrichissement technique `Cesium`, sert à afficher correctement une donnée (Marqueur, batiment, nuages de points, etc...) sur la carte.

Les enrichissements techniques ne sont pas modifiables via l'interface graphique de Reality cepandant, il est possible de les modifier via les APIs.

## Liste des enrichissements ##

 - `Cesium` : L'enrichissement Cesium, sert à donner les infos qui concernes Cesium (Marqueurs, batiments, etc..).
 - `MODELGRAPHIC` : Cet enrichissement sert à donner les infos concernant le bon affichage des modeles graphiques.
 - `Diagramme Cesium` : Cet enrichissement sert à donner les infos concernant le bon affichage des diagrammes cesium.
 
 ## Contenu de l'enrichissement Cesium ## 
 
    {
        modelType : string; // Type de la donnée (ORTHOIMAGE, POINTCLOUD, 3DMODEL, MODELGRAPHIC, GEOJSON, KML).
        humanGeoreferenced : boolean; // True si la donnée a été modifier avec le Location Editor.
        tilesetPath: string; // URL du COS.
        displayBucket: string; // Nom du bucket dans lequel est la donnée.
        modelMatrix: Object; // Contient la matrice modifié pour bien raplacer le batiment à sa création.
        icon?: string; // Nom de l'icône associé à la donnée.
    }
    
 ## Contenu de l'enrichissement MODELGRAPHIC ##
 
    {
        size: number; // Taille du modèle graphique.
        color: string; // Couleur du modèle graphique.
        outlineColor: string; // Couleur du contour du modèle graphique.
        outlineSize: number; // Taille du contour du modèle graphique.
        showDistance: number // Distance à laquelle le modèle graphique s'affiche.
        type: string; // Type de modèle graphique (Points, polygone, line, etc..).
        geometry: Object; // Contient les coordonnées et le système de référencement du modèle graphique.
    }

 ## Contenu de l'enrichissement Diagramme Cesium ##
 
    {
        size: number; // Taille du diagramme cesium.
        diagramType: 'stackedColumn' | 'circle'; // type du diagramme cesium. 
        data: {
               type: Array; // données du diagramme.
               items: {
                        type: Object;
                        properties: {
                                     label: string; // Titre de la donnée.
                                     value: number; // Valeur de la donnée.
                                     color: string; // Couleur associée à la donnée.
                                    }
                      }
              }
        longitude: number; // Longitude du diagramme cesium.
        latitude: number; // Latitude du diagramme cesium.
        
    }

|001|Version Initiale|HENNAERT Lucas|DELBE Nicolas|
