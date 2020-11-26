# Accès à un produit

## Accès depuis le portail de navigation

L’application portail met à disposition une page de navigation référençant tous les produits accessibles par l’utilisateur. Celui-ci peut ainsi sélectionner le produit auquel il souhaite accéder.
L’accès à cette page de navigation est le comportement par défaut du portail BEYOND.

Lorsqu’un utilisateur accède à un produit de la plateforme, ce produit vérifie immédiatement si l’utilisateur est connecté et qu’il a le droit d’accès nécessaire.

Pour cela, le produit vérifie, depuis le local storage, que l'utilisateur possède un token valide.

Il y a 3 cas possibles :

- Le token est présent et valide => l’utilisateur peut continuer sa navigation
- Le token est présent mais a expiré => le token est rafraichi afin que l’utilisateur poursuive sa session de manière transparente
- Le token est absent, invalide ou son rafraichissement est impossible => l’utilisateur est déconnecté du produit courant, du portail puis est redirigé sur la page de connexion

Si l'utilisateur ne dispose pas de token ou que le token ne peux être refresh, le produit doit rediriger l'utilisateur sur le portal comme dit précédemment.

> A noter :
Le package Node.js (disponible dans le repository : <https://github.com/sxd-platform/byd-cognito-connector-back>) intègre les fonctionnalités de contrôle du token et de récupération de la clé publique associée au compte Cognito de Beyond Platform.

## Redirection après authentification

Si l'utilisateur s'authentifie correctement au niveau de la plate-forme, il peut être redirigé directement vers la page d’accueil du produit qui l’intéresse. Cette redirection se traduit par un paramètre supplémentaire de redirection dans l’URL du portail.

La valeur transmise via le paramètre redirect_uri doit nécessairement correspondre à un produit déclaré dans BEYOND.
Si le paramètre redirect_uri est valorisé avec une URL valide et que l'utilisateur est authentifié, le portail redirige l'utilisateur vers le produit cible sur l'url de callback /ssoCallback.

Exemple de redirection après connexion vers BEYOND Monitoring :

```html
https://int-portal.weud-bydkub.eu-de.containers.appdomain.cloud/login?redirect_uri=https:%2F%2Fqa-beyond-monitoring.sixense-group.com%2Flogin
```

> A noter :
Le package Angular "AuthGuard" (disponible dans le repository : <https://github.com/sxd-platform/byd-cognito-connector-front>) intègre la fonctionnalité de récupération des informations transmises par le portail, après authentification de l'utilisateur.

## Accès direct

L’utilisateur peut également tenter d’accéder directement à son produit.

Dans cette situation, les cas possibles sont :

- Un token valide est présent dans le local storage de l’application : l’utilisateur accède directement au produit
- Un token expiré est présent dans le local storage de l’application : le token est rafraichi et l’utilisateur poursuit sa navigation vers le produit de manière transparente
- Aucun token valide n’est présent : l’utilisateur doit être redirigé par le produit vers le portail BEYOND pour y être authentifié. Le produit inclut le paramètre redirect_uri dans l’URL du portail.

> A noter :
Le package Angular "AuthGuard" (disponible dans le repository : <https://github.com/sxd-platform/byd-cognito-connector-front>) intègre la fonctionnalité de contrôle de l'authentification (côté front end).

un descriptif précis de toutes les interactions lors de la connexion est disponible [ici](./main/02.byd-Platform/2.SpecificationDossier/images/diagrams/seq_authentication.png).

|001|Version Initiale|Sixense|
