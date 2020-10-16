# Connexion à la plateforme

**Contexte :**

La connexion à la plateforme BEYOND se fait par l'intermédiaire du portail pour tous les produits qui la constituent.

Le portal permet deux types de connexion :
- via les utilisateurs connus de cognito
- via un IDP externe connu


Seuls les utilisateurs connus de la base de données de la plateforme peuvent se connecter.

> La page de connexion du portail peut etre personnalisée avec le logo et une image correspondant au produit à partir du quel l'utilisateur veut se connecter. Cf: document de customisation du portail.

## utilisation

Cette documentation a pour but d'expliquer comment utiliser le portal ; elle est à destination des développeurs des autres produits.

À cet usage, nous avons développé 2 packages (un front-end et un back-end) afin de simplifier l'intégration du processus de connexion de la plate-forme dans les produits

**1 - accès à un produit**

Quand un utilisateur veut accéder à un produit de la plateforme, le produit dois immédiatement vérifier que l'utilisateur est connecté. Pour cela le produit doit vérifier si l'utilisateur possède un token et que celui-ci soit **valide ! ** .

Il existe 3 cas possibles :

- Le token est présent et valide => l’utilisateur peut continuer sa navigation

- Le token est présent mais pas valide => un système de refresh des tokens est présent dans l'application afin de permettre à l’utilisateur de poursuivre sa session

- Pas de token ou impossible de le refresh => déconnexion de l'utilisateur et redirection sur la page d'accueil du portail

> les tokens dans la plateforme ont une durée de 1 heure non modifiable.


Vous trouverez dans les packages des outils pour vous aider dans tous les cas cités plus haut avec leur documentation

>Package front: un authguard vérifiant la présence du token.

>Package Back : le processus de vérification des tokens.

**2 - Redirection sur le portal**

Si l'utilisateur ne dispose pas de token ou que le token ne peux être refresh , le produit doit rediriger l'utilisateur sur le portal comme dit précédemment.

Si l'utilisateur s'authentifie correctement au niveau de la plate-forme, il est possible de rediriger l'utilisateur depuis le portail vers la page du produit gérant l'authentifiction et la gestion des droits utilisateur.

Ce paramètre permet de dire au portail qu'il faut rediriger sur l'url inscrit dans le paramètre une fois que l'utilisateur est connecté.

Exemple :

    https://int-portal.weud-bydkub.eu-de.containers.appdomain.cloud/login?redirect_uri=https:%2F%2Fqa-beyond-monitoring.sixense-group.com%2Flogin

> Après la connexion, l'utilisateur sera redirigé sur monitoring

Note importante : l'usage du paramètre redirect_uri est soumis à la règle suivante ; le produit doit être enregistré dans la plateforme (son url est déclarée dans la base de données de la plate-forme). Dans le cas contraire, le portail ne permettra pas la redirection.

Si l'utilisateur est déjà connecté sur le portail, il sera immédiatement redirigé sur l'URL exacte du produit qu'il avait demandé. Le portail ajoute à la requête le token et le refresh token de l'utilisateur.

**3 - Redirection sur un produit**

Si le paramètre redirect_uri est valorisé avec une URL valide et l'utilisateur authentifié (via un idp externe, via cognito ou bien si l'utilisateur était déjà connecté), le portail va rediriger l'utilisateur vers le produit cible sur l'url de callback /ssoCallback.

Le portail transmet dans l'url 3 paramètres

- **token**: le token doit être stocké sur le produit et transmis à chaque requête
- **refresh_token**: le refresh token doit lui aussi être stocké sur le produit, il permet de rafraîchir le token si celui-ci est expiré
- **redirect_uri**: url exacte d'où provient l'utilisateur afin de le rediriger sur la bonne page ou ressource.

> Le authguard présent dans le packgage front permet d'intégrer le ssoCallback facilement

> un descriptif précis de toutes les interactions lors de la connexion est disponible ici
https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/4.DeploymentDossier/seq_authentication.png

|001|Version Initiale|DELBE Nicolas|
