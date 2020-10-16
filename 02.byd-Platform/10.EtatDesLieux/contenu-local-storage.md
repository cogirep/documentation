# Contenu du local storage dans les applications #

## Reality ##

Dans l'application `Reality`, le localStorage contient les éléments suivants :

 - `access_token_authentication` : ID_token provenant de cognito. Token retourné par cognito pour attester de notre authentification.
 - `refresh_token` : Token provenant de cognito. Permet de raffraichir le token d'authentification quand celui ci est expiré.
 - `user` : Objet contenant les informations de l'utilisateur actuellement connecté à la plateforme.
 - `options` : Objet contenant les informations sur les options de Reality selectionnées par l'utilisateur courant.
 Par exemple : Affichage des labels, affichage de l'altitude du terrain, le nombre d'éléments par tableaux.
 - `access_token` : ID_token provenant de cognito. Token retourné par cognito pour attester de notre authentification.

## Portal ##

Dans l'application `Portal`, le localStorage contient les éléments suivants :

 - `access_token_authentication` : ID_token provenant de cognito. Token retourné par cognito pour attester de notre authentification.
 - `refresh_token` : Token provenant de cognito. Permet de raffraichir le token d'authentification quand celui ci est expiré.
 - `user` : Objet contenant les informations de l'utilisateur actuellement connecté à la plateforme.
 - `access_token` : ID_token provenant de cognito. Token retourné par cognito pour attester de notre authentification.

 
## Manager ##

Dans l'application `Manager`, le localStorage contient les éléments suivants :

 - `access_token_authentication` : ID_token provenant de cognito. Token retourné par cognito pour attester de notre authentification.
 - `refresh_token` : Token provenant de cognito. Permet de raffraichir le token d'authentification quand celui ci est expiré.
 - `user` : Objet contenant les informations de l'utilisateur actuellement connecté à la plateforme.
 - `options` : Objet contenant les informations sur les options de Manager selectionnées par l'utilisateur courant.
 Par exemple : Le nombre d'éléments par tableaux.
 - `access_token` : ID_token provenant de cognito. Token retourné par cognito pour attester de notre authentification.
 - `generic_permissions` : Tableau contenant toutes les permissions génériques de l'utilisateur.

|Version 001|IBM|
