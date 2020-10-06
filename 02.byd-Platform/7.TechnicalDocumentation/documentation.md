# Connexion à la plateforme

**Contexte :**

La connexion à la plateforme BEYOND ce fait par l'intermédiaire du portail pour tous les produits qui la constituent.

Le portal permet deux types de connexion :
- via les utilisateurs connus de cognito
- via un IDP externe connu


Seuls les utilisateurs connus de la bdd de la plateforme peuvent se connecter.

> La page de connexion du portail peut être customisé avec le logo et une image correspondant au produit dont l'utilisateur provient cf : document de customisation du portail.

## utilisation

Cette documentation a pour but d'expliquer comment utiliser le portal pour les développeurs des autres produits

À cet usage, nous avons développé 2 packages (un front-end et un back-end) afin de vous simplifier l'intégration de notre processus de connexion dans votre produit.

**1 - accès à un produit**

Quand un utilisateur veut accéder à un produit de la plateforme, le produit dois immédiatement vérifier que l'utilisateur est connecté. Pour cela le produit doit vérifier si l'utilisateur possède un token et que celui-ci soit **valide ! ** .

Il existe 3 cas possible :

- Le token est présent et valide => l’utilisateur peut continuer sa navigation

- Le token est présent mais pas valide => un système de refresh des tokens est présent dans l'application afin de permettre à l’utilisateur de poursuivre leur session

- Pas de token ou impossible de le refresh => déconnexion de l'utilisateur et redirection sur le portail

> les tokens dans la plateforme ont une durée de 1 heure non modifiable.


Vous trouverez dans les packages des outils pour vous aider dans tous les cas cités plus haut avec leur documentation

>Package front: un authguard vérifiant la présence du token.

>Package Back : le processus de vérification des tokens.

**2 - Redirection sur le portal**

Si l'utilisateur ne dispose pas de token ou que le token ne peux être refresh , le produit doit rediriger l'utilisateur sur le portal comme dis précédemment.

Il est possible de mettre dans l'URL du portail un paramètre **redirect_uri** .

Ce paramètre permet de dire au portail qu'il faut rediriger sur l'url inscrit dans le paramètre une fois que l'utilisateur est connecté.

Exemple :

    https://int-portal.weud-bydkub.eu-de.containers.appdomain.cloud/login?redirect_uri=https:%2F%2Fqa-beyond-monitoring.sixense-group.com%2Flogin

> Après la connexion, l'utilisateur sera redirigé sur monitoring

Le redirect_uri est soumis à quelques règles, le produit doit être connu de la plateforme et son url enregistré dans notre BDD, sinon le portail ne permettra pas la redirection.

Si l'utilisateur est déjà connecter sur le portail, l'utilisateur sera redirigé immédiatement sur le produit avec son token , son refresh token et l'url exacte que l'utilisateur voulais accéder.

**3 - Redirection sur un produit**

Si le paramètre redirect_uri est remplie et valide et la connexion de l'utilisateur validé (idp externe, utilisateur cognito ou utilisateur déjà connecter), le portail va rediriger l'utilisateur dans le produit cible sur une url de callback **/ssoCallback**.

Le portail transmet dans l'url 3 paramètres

- **token**: le token doit être stocké sur le produit et transmis à chaque requête
- **refresh_token**: le refresh token doit lui aussi être stocké sur le produit, il permet de refresh le token quand celui-ci est expiré
- **redirect_uri**: url exacte d'où provient l'utilisateur afin de le rediriger sur la bonne page ou ressource.

> Le authguard présent dans le packgage front permet d'intégrer le ssoCallback facilement

> un descriptif précis de toutes les interactions lors de la connexion peut être retrouver ici
https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/4.DeploymentDossier/seq_authentication.png

|001|Version Initiale|DELBE Nicolas|
