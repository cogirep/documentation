# Documentation Transformation

## Liste des transformations

Voici un tableau exhaustif des transformations actuellement proposées sur la Plateforme (via le module Data) et les prérequis pour chacune d'entre elles :

| Transformation | Input | Requis| Marqueur|
|:---|:---|:---| :--|
| **Visualisation Model3D** | Dossier ZIP | Fichier tileset.json + x fichiers en '.b3dm' | Oui
| **Visualisation Orthoimage** | Dossier ZIP | X fichiers en '.tif', '.aux', '.xml'... | Uniquement si longitude et latitude disponibles
| **Visualisation Nuage de points** | Dossier ZIP | Fichier tileset.json + x fichiers en '.pnts' | Oui
| **Visualisation Geojson Reality** | Fichier en '.geojson'| Uniquement si longitude et latitude disponibles
| **Visualisation KML Reality** | Fichier en '.kml' || Uniquement si longitude et latitude disponibles
| **Transformation Model3D Reality** | Dossier ZIP | Fichier en '.dae' | Oui
| **Transformation Orthoimage Reality** | Dossier ZIP | Fichier en '.tif' ou '.tiff' ou '.png' ou '.jpg' ou '.jpeg' | Uniquement si longitude et latitude disponibles
| **Transformation Ifc Reality** | Fichier en '.ifc' || Oui
| **Nuage de points** | Fichier en '.las' ou '.laz || Oui

<br/>

## Limite

Actuellement, et compte tenu des infrastructures disponibles, une taille maximale de 1Go est préconisée lors de l'import du fichier/dossier. <br/>
En effet, n'ayant pas connaissance du taux de compression des différentes archives, la taille de 1Go permet d'assurer le fonctionnement des différentes transformations

**Cas particulier** Tout import de fichier devra être réalisé depuis l'interface de la Plateforme. En effet, après quelques tests d'upload direct dans le COS pour des fichiers dépassant la limite recommandée, l'interface ne permet pas d'upload les fichiers tout en respectant la nomenclature utilisée sur le projet, à savoir : `{beyondId}/{revisionId}/{fichier}` (le caractère `/` étant prohibé).

<br/>

## Evolutions

### Transformations enchaînées

Le fonctionnement actuel permet de traiter une transformation, c'est-à-dire partir d'un format pour en obtenir un autre exploitable par le module Globe.

Néanmoins, nous pourrions imaginer un fonctionnement de transformations dites "enchaînées". Ce concept permettrait, à partir d'un fichier source, de demander plusieurs transformations via un système "d'étapes".

Pour être réalisable, il faut bien sûr que les enchainements soient possibles. Il sera donc nécessaire de répertorier (en base de données) le fonctionnement de chaque transformation (quel input pour quel output). <br/>
A partir de cette liste, et par un phénomène de rebonds, il sera possible de vérifier quelle transformation peut être la suite logique d'une autre. 

<br/>

![Chained Transformation Diagram](../assets/chainedTransfo.png)

<br/>

### Transformation a posteriori

Actuellement, la demande de transformation s'effectue lors de l'import d'un fichier. En fonction des besoins métier, il pourrait être intéressant de proposer une transformation a posteriori.

Il serait alors possible, à partir d'un atome déjà existant, de demander une transformation.

Cela nécessitera quelques travaux de refactorisation pour permettre de réaliser des demandes de transformations en dehors du processus d'import qui, à date, est le seul élément déclencheur (envoi d'une demande auprès de RabbitMQ)

## Résolution nécessaire

- Nous avons pu constater que l'utilisation de la transformation "Visualisation Orthoimage" génère un comportement inattendu. <br/> 
En effet, lors de l'upload des fichiers issus de la transformation sur le COS, le stream se coupe avec pour seul message `stream closed` <br/>
Il serait nécessaire de vérifier les paramètres utilisés avec MinIO pour éventuellement augmenter le délai avant un timeout. Ceci n'est qu'une piste qui sera nécessaire de vérifier avant de plus amples recherches. <br/>
**Contournement** : Si cette situation se concrétisait, il serait alors nécessaire de relancer entièrement le microservice `decompress` avant d'envoyer de nouvelles demandes de visualisation

