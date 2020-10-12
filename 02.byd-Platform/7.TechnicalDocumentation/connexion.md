# Connexion à la plateforme

Le processus d’authentification génère un token de session pour la plateforme. Celui-ci à une durée de validité de 1 heure (non modifiable).
Après authentification, l’utilisateur est redirigé vers le portail de navigation ou directement vers un produit de son choix.
Si l’utilisateur est déjà authentifié lorsqu’il accède au portail, la redirection a lieu automatiquement.

La redirection vers un produit transmet dans l'url 3 paramètres :

- token : le token doit être stocké sur le produit et transmis à chaque requête
- refresh_token : le refresh token doit lui aussi être stocké sur le produit, il permet de rafraîchir le token si celui-ci est expiré
- redirect_uri : url exacte d'où provient l'utilisateur afin de le rediriger sur la bonne page ou ressource.
Afin de naviguer dans l’application web, il est recommandé de stocker ces tokens dans le localstorage de l’application.

|001|Version Initiale|Sixense|
