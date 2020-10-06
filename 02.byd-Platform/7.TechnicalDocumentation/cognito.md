# Documentation portail

## 1 - Introduction  

Beyond Platform est la solution permettant d’accéder aux différents produits de Sixense répondant à un ensemble de problématiques métier du BTP.

Le portail est l’application web permettant à un utilisateur de la plateforme d’accéder à différents produits (selon le contexte du client).

C’est au travers du portail qu’un utilisateur de la plateforme est authentifié.

Cette documentation a pour but de préciser les étapes permettant d’intégrer un produit dans la plateforme pour la partie authentification des utilisateurs:

- Configuration de Cognito (ajout d’un fournisseur d’identité - IdP - d’un client)

- Intégration des composants (packages) Front End Angular et Back End Node.js fournis par la plateforme aux produits

- Configuration du produit dans la plateforme

## 2- Gestion des utilisateurs au niveau de Cognito

Il existe deux manières de s'authentifier sur la plateforme:

- Avec un compte utilisateur “interne”, c’est-à-dire géré dans l’instance Cognito de Beyond Platform

- Via SSO, en intégrant au niveau de Cognito un IdP “externe” (celui dans lequel le client gère les identifiants de ses utilisateurs, intégrable via OIDC).

La création de compte utilisateurs “internes” se fait au moyen du module d’administration de la plateforme (Beyond Manager).

Pour l’ajout d’un nouvel IdP, il faut faire la demande IT XXX et une mise à jour de la configuration du portail

> https://sixense-platform-solutions.atlassian.net/servicedesk/customer/portal/4/group/27

Une fois cognito configuré, il faut ajouter le nouvel IdP dans la table idp de notre bdd postgres et lui spécifier un pattern d'email (regex).

> @steven proccess à définir

Si le mail de l'utilisateur correspond au pattern de l'IdP externe celui-ci sera automatiquement dirigé sur la page d'authentification de l'IdP en question.

## 3 - Connexion et déconnexion d’un utilisateur au sein de la plateforme”

La documentation technique sur la connexion à un produit se trouve ici
> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/documentation.md

le processus de déconnexion de la plateforme est retrouvable sur cette documentation technique.

> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/d%C3%A9connexion.md

Le diagramme de séquence spécifiant toutes les interactions entre le portail et les différents éléments de la plateforme est disponible sur ce lien.

> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/2.SpecificationDossier/images/diagrams/seq_authentication.png

( la documentation sera à update avec la connexion partagée)

## 4 - Composants d’intégration de l’authentification BEYOND Platform mis à disposition des produits

Afin de simplifier l'implémentation dans les applications back-end, nous avons développé un package Nodejs.

> repository: https://github.com/sxd-platform/byd-cognito-connector-back

Celui-ci comprend:

- La récupération de la clé publique cognito
>https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-back/1.R%C3%A9cup%C3%A9ration%20de%20cl%C3%A9%20public%20du%20service%20Cognito%20de%20Sixense.md

- La vérification des tokens cognito :
> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-back/2-V%C3%A9rification%20du%20token.md


Afin de simplifier l'implémentation dans les applications front-end , nous avons développé un package angular.

> repository: https://github.com/sxd-platform/byd-cognito-connector-front

Celui-ci comprend :

- Auth guard: permettant de gérer la sécurité et l'accès aux pages
> documentation: https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-front/AuthGuard.md

- Auth service :
> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-front/AuthService.md

- La documentation d'installation :
> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-front/Setup.md

### 5 - Intégration d’un produit dans le portail de la plateforme

Pour ajouter un produit au portail il faut ajouter le produit en question à la table product de notre BDD postgres .

Ll nous faudra les champs suivants pour ajouter le produit:

    - label: label du produit
    - descripion: description du produit
    - image: image à afficher dans les tuiles du portail
    - icon: icône à afficher dans les tuiles du portail
    - url_app: URL du produit
    - open_tab: doit-on ouvrir le produit dans un nouvel onglet (boolean)
    - auth_logo: logo pour la page de connexion
    - auth_background_image: image de fond pour la page de connexion

> @steven proccess à définir pour l'ajout en bdd

La page de connexion du portail peut etre customisé avec le logo et une image correspondant au produit dont l'utilisateur provient (cf: document de customisation du portail.)

> doc à faire

|001|Version Initiale|DELBE Nicolas|
