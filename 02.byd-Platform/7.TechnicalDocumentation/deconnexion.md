# Déconnexion

## Contexte

La déconnexion de la plateforme se fait en deux étapes :

- Déconnexion du produit
- Déconnexion du portail

## Déconnexion d'un produit

Pour déconnecter l'utilisateur d'un produit il faut supprimer sa session et toutes ses informations stockées dans le navigateur.
En fonction du produit et des choix d’implémentation, la méthode de déconnexion peut varier.
Par exemple, dans le cas de BEYOND Reality, il est nécessaire de vider le local storage du navigateur.

## Déconnexion du portail

Une fois déconnecté d'un produit, le produit doit rediriger l’utilisateur sur le endpoint /disconnect du portail.
Ce endpoint permet de :

- supprimer les informations de connexion sur le portail,
- révoquer tous les "refresh_token" de l'utilisateur,
- rediriger l’utilisateur vers la page de connexion (en positionnant le paramètre redirect_uri).

Attention, les tokens en cours sur les autres applications ne sont pas révoqués (durée maximale de une heure) et l’utilisateur reste connecté sur ces applications. 
La déconnexion complète de la plateforme BEYOND ne sera effective qu’après expiration de ceux-ci.

|001|Version Initiale|Sixense|