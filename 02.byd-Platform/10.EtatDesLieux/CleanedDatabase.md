# Nettoyage de la base de données (MongoDB)

## Contenu de la base

Avant d'expliquer la procédure permettant de purger la base de données, voici un rappel des différents éléments qui la compose :

<br/>

| Collections | Détails | 
|:---|:---|
| **association** | Informations liées à l'association entre différents atomes 
| **connector** | Informations liées aux connecteurs utilisés pour les instances GED | 
| **enrichment** | Contient les enrichissements liés à un atome | 
| **enrichmentTemplate** | Contient les templates à partir desquels les enrichissements peuvent être créés
| **idcards** | Informations liées à chaque atome |

<br/>

## Nettoyer la base

Plusieurs atomes de la plateforme sont liés à un ou plusieurs fichiers. Ces derniers sont stockés dans le COS.

Dès lors, afin d'effectuer un nettoyage "propre" de la base de données, il est conseillé de supprimer les données depuis l'interface de la plateforme.<br/>En effet, en utilisant cette méthode, l'ensemble des données présentent dans la base de données et dans le COS seront supprimées.

Une fois cette manipulation réalisée, si des données venaient à persister dans la base de données, il sera alors possible de les supprimer directement, notamment grâce à l'interface proposée par l'outil `Compass` (interface base de données MongoDB)


**ATTENTION** : En cas de manipulation directe de la base de données, et pour le bon fonctionnement de la plateforme, il est essentiel de ne pas supprimer les templates d'enrichissements suivants : `Cesium`, `Reality_ContextData`, `MODELGRAPHIC`, `Diagramme Cesium`, ainsi que tous ceux ayant un label commençant par `ExternalData` (ces derniers étant utilisés dans le cadre du menu "Ouvrir avec")