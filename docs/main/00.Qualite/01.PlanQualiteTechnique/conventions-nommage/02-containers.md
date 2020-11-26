# Convention de nommage

## Docker containers

### Noms

Le nommage des conteneurs docker doit correspondre à la convention suivante

>**platform-module-component**

où

- **platform**: Correspond à l'acronyme de la plate-forme
- **module**: Correspond au module de la plate-forme
- **component**: Correspond au nom de l'objet

Les contraintes syntaxiques de l'identifiant sont :

- Aucun caractère accentué
- Aucun caractère spécial
- La casse des caractères est en minuscule
- Le caractère de séparation des éléments de l'identifiant est - (minus)
- Les 3 éléments sont requis (platform-module-component) et ne peuvent être nuls ni ne contenir de caractère - (minus)

Exemple:
**byd-df-datafeeder**: est le conteneur contenant le module d'ingestion des données pour la plateforme

Acronymes autorisés :

|Categorie|**Acronyme**|Description|
|---|:---:|---|
|platform|byd|Plateforme Beyond|
|module|all|Commun à tous les composants de la plateforme |
|module|df|Datafactory|
|module|rea|reality|
|component|XXX||

## Docker containers Registry

### Namespace

Les espaces de nommage du registre de conteneur devront être alignés sur les noms des clusters afin de permettre un segmentation des conteneurs montés sur les plateformes.

### Repository

Un dépot de conteneur sera créé par composant.
