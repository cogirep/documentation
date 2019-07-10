# Convention de nommage

## Docker containers

### Nom

Le nommage des conteneurs docker doit correspondre à la convention suivante

**platform-module-component**

où 
**platform**: Correspond à l'acronyme de la plate-forme
**module**: Correspond au module de la plate-forme
**component**: Correspond au nom de l'objet


Les contraintes syntaxiques de l'identifiant sont :

- Aucun caractère accentué
- Aucun caractère spécial
- La casse des caractères est en minuscule
- Le caractère de séparation des éléments de l'identifiant est - (minus)
- Les 3 éléments sont requis (platform-composant-nom) et ne peuvent être nuls ni ne contenir de caractère - (minus)

Exemple:
**byd-all-activitytracker**: est le conteneur contenant le module de suivi des utilisateurs

Acronymes autorisés :

|Categorie|**Acronyme**|Description|
|---|:---:|---|
|platform|byd|Plateforme Beyond|
|module|all|Commun à tous les composants de la plateforme |
|module|df|Datafactory|
|module|rea|reality|
|component|activitytracker|Le composant de suivi de l'activité des utilisateurs|
|component|XXX||
