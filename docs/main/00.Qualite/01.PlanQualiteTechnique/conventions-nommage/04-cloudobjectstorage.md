# Convention de nommage

## Cloud Object Storage

### Bucket

Le nommage des dépots de code doit correspondre à la convention suivante

>**platform-module-suffixe**

où
**platform**: Correspond à l'acronyme de la plate-forme
**module**: Correspond au module de la plate-forme
**suffixe**: Suffixe libre permettant un qualification fine de l'objet.

Les contraintes syntaxiques de l'identifiant sont :

- Aucun caractère accentué
- Aucun caractère spécial
- La casse des caractères est en minuscule
- Le caractère de séparation des éléments de l'identifiant est - (minus)
- Les 3 éléments sont requis (platform-module-suffixe) et ne peuvent être nuls ni ne contenir de caractère - (minus)
- L'élément suffixe peut contenir le caractère . (dot) à l'intérieur

Exemple:
**byd-df-datamodel**: est le dépôt de code du modèle de données de la datafactory

Acronymes autorisés :

|Categorie|**Acronyme**|Description|
|---|:---:|---|
|platform|byd|Plateforme Beyond|
|module|all|Commun à tous les composants de la plateforme |
|module|df|Datafactory|
|module|rea|reality|
|component|datamodel|Le modèle de données|
|component|XXX||
