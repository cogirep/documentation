# Déconnexion de la plateforme

**Contexte:**

La déconnexion de la plateforme se fait en deux étapes.
- la déconnexion du produit
- Redirection sur le endpoint **/disconnect** du portail

## La déconnexion d'un produit

Pour déconnecter l'utilisateur d'un produit il suffit de supprimer sa session et toutes les informations de l'utilisateur du client.

Il faudra par exemple pour REALITY , uniquement clear le local storage du client afin de supprimer toutes les informations de l'utilisateur et ses données de navigation.

Selon les produits et les choix pris, la méthode peux être différente d'un produit à l'autre.

## Déconnexion du portail

une fois l'utilisateur déconnecté d'un produit, il faut le rediriger sur le endpoint /disconnect du portail.

Ce endpoint a pour but de supprimer les informations de connexion sur le portail, mais aussi de révoquer tous les "refresh_token" de l'utilisateur en question.

Il sera donc, une fois que "id_token" expiré sur les autres applications, automatiquement déconnecter entièrement de la plateforme beyond.

> Un "id_token" à une durée maximale d'une heure, pendant ce laps de temps, il est encore connecté sur les autres produits.
