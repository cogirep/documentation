#Documentation directive permissions

##Contexte :

Il y a deux directives permissions différentes dans notre application.

La première, nommée "GenericPermissionsDirective", sert à afficher ou non la partie du site sur laquelle on souhaite tester les droits dit 'génériques'.
Ces droits sont par exemple pour les boutons de création et d'autres à venir. En bref tous ce qui ne nécéssite pas d'appartenance à une compagnie. 

La deuxième, nommée "SpecificPermissionsDirective", sert à afficher ou non la partie du site sur laquelle on souhaite tester les droits dit 'spécifiques'. Ces droits sont par exemple pour les boutons d'accès aux fiches détaillées en lecture seule, aux éditions de fiches détaillées, aux suppressions, etc...
En bref, tous ce qui nécéssite d'appartenir à une compagnie et que la donnée appartienne à ma compagnie ou que ma compagnie y ai accès.

##Mise en place :

###GenericPermissionsDirective

Pour la directive générique, il y a un petit prérequis.
Lorsque l'on stock le user dans le local storage, nous stockons tous les droits que l'utilisateur possède peut importe les compagnies sous forme de tableau dans le local storage.
Exemple : Si l'utilisateur fait partie des compagnies A et B, que dans la compagnie A il possède le droit X1 et dans la compagnie B il possède le droit X2, alors le tableau de droit génériques 
contiendra les droits X1 et X2.

Dans le HTML, sur la partie du code que l'on veut afficher ou non en fonction d'une permission, il faut écrire le code suivant :

`
*bmGenericPermissions="['XXX']"`

Remplacer les XXX par le nom de la permission.

###SpecificPermissionsDirective

Pour la directive spécifique, le seul prérequis et d'avoir l'id de la compagnie du template cible.
Exemple : Si je veux accéder à la fiche détaillée d'un utilisateur, il me faut l'id de la compagnie de cet utilisateur.

Dans le HTML, sur la partie du code que l'on veut afficher ou non en fonction d'une permission, il faut écrire le code suivant :

`*bmSpecificPermission="{permissions: ['XXX'], companyId: companyId}"`

Remplacer les XXX par le nom de la permission.

Ces directives vont évoluer dans un futur proche pour gérer plusieurs droits en même temps.

|001|Version Initiale|HENNAERT Lucas|
