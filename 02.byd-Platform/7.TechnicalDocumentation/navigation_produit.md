# Navigation dans le produit

Lors de la navigation de l’utilisateur dans l’application, le token de celui-ci peut arriver à expiration.

Dans ce cas, le produit doit tenter d'obtenir un refresh_token Cognito auprès du portail de Beyond.

- Si c'est possible, alors le produit met à jour le token dans le localstorage du client,
- Si ce n'est pas possible (l'utilisateur a été déconnecté par ailleurs), alors le localstorage du navigateur de l'utilisateur doit être vidé et l'utilisateur redirigé vers la page de connexion du portail.

> A noter :
La récupération du refresh token se fait dans le code applicatif du produit au moyen de l'API "/token" (POST) mise à disposition des produits par le portail.
Le descriptid (Swagger) de l'API est disponible ici : <https://github.com/sxd-platform/byd-all-sso/blob/53cb539c663c682f0d4a33cab82ce1ec30664b16/docs/swagger.yaml#L397>

|001|Version Initiale|Sixense|
