# Convention de nommage

## Cluster Kubernetes

**STATUS** : Brouillon,  (07/2019)

|Date|Statut du document|Description|
|---|:---:|---|
|2019-07|BROUILLON|A valider par les équipes de la Direction Technique|


### Nom

Le nommage des clusters orchestrés Kubernetes doit correspondre à la convention suivante

**platform-environment**

où 
**platform**: Correspond à l'acronyme de la plate-forme
**environment**: Correspond à l'environnement ou au type d'environnements ciblé par le cluster.


Les contraintes syntaxiques de l'identifiant sont :

- Aucun caractère accentué
- Aucun caractère spécial
- La casse des caractères est en minuscule
- Le caractère de séparation des éléments de l'identifiant est - (minus)
- Les 3 éléments sont requis (platform-composant-nom) et ne peuvent être nuls ni ne contenir de caractère - (minus)

Exemple:
**byd-dev**: est le cluster portant les environnements de developpement.
ou
**byd-nonproductive**: est le cluster portant l'ensemble des environnements de non productifs de la plteforme beyond.

Acronymes autorisés :

|Categorie|**Acronyme**|Description|
|---|:---:|---|
|platform|byd|Plateforme Beyond|
|environnement|dev|Environnement de developpement|
|environnement|sbx|Environnement de 'bac à sable'|
|environnement|int|Environnement d'intégration |
|environnement|intext|Environnement d'intégration pour les tiers externes|
|environnement|uat|Environnement de recette utilisateur|
|environnement|pre|Environnement de pré-production|
|environnement|prod|Environnement de production|
|environnement|nonproductive|Environnements non productifs|
|environnement|productive|Environnements productifs|

## Objets Kubernetes
Les conventions suivantes seront appliquées
https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names