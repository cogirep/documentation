# Investigation info à la connexion #

## Première investigation : Changer les Promises pour des Observables ##

- Pour cette investigation, j'ai donc enlevé les await des appels et changé les Promises en Observables.
 
 Cette méthode n'a pas aboutie, le router navigate vers le portail se faisait toujours au même moment qu'avec les Promises.

## Deuxième investigation : Renvoyer les promises en asObservable() ##

- Cette méthode n'est pas concluante non plus, elle entraine beaucoup de messages de mauvaises pratiques de la part du linter.

## Troisième investigation : Changer le setTokenInSession ##

-   J'ai supprimé la logique existante sur le handleLoginCallback pour la remplacer par une nouvelle logique qui correspond au dev récent.

-   Ensuite, j'ai souscris au getAccountWithToken, dans le next, je stock le user dans le localStorage puis je navigue vers le portail.

-   Une fois sur le portail, le problème n'est plus la car le user à été stocké avant de naviguer vers portail.

## Conclusion ##

La troisième investigation à porté ses fruits, c'est une façon viable et plus légère de régler le problème de récupération d'info
à la connexion.

|001|Version Initiale|HENNAERT Lucas|
