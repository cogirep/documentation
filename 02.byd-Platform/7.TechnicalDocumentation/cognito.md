# Documentation portail

## 1 - Introduction  

Cette documentation à pour but d'expliquer comment utiliser le portail de la plateforme et de rediriger sur les documentations techniques plus detaillées pour l'ensemble des points.

## 2- La connexion à la plateforme

Il existe deux manières de s'authentifier à la plateforme soit via un utilisateur connu de cognito, soit par un idp externe.

la documentation technique sur la connexion à un produit se trouve ici
> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/documentation.md

le diagramme de séquence spécifiant toutes les interactions entre le portail et les différents éléments de la plateforme est disponible sur ce lien.

> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/2.SpecificationDossier/images/diagrams/seq_authentication.png

Il est possible d'ajouter de nouveau idp externe. Pour cela il faut faire une demande à l'it afin que celui-ci soit configurer dans cognito.

> https://sixense-platform-solutions.atlassian.net/servicedesk/customer/portal/4/group/27

Une fois cognito configurer, il faut ajouter le nouveau idp dans la table idp de notre bdd postgres et lui spécifier un pattern d'email (regex).

> @steven proccess à définir

Si le mail de l'utilisateur correspond au pattern de l'idp externe celui-ci sera automatiquement redirigé sur la page d'authentification de l'idp en question.

## 3 - La déconnexion à la plateforme

le processus de déconnexion de la plateforme est retrouvable sur cette documentation technique.

> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/d%C3%A9connexion.md

( la documentation sera à update avec la connexion partagée)

### 4 - Connector back-end

Afin de simplifier l'implémentation dans les applications back-end, nous avons développé un package Nodejs.

> repository: https://github.com/sxd-platform/byd-cognito-connector-back

celui-ci comprend:

- La récupération de la clé publique cognito
>https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-back/1.R%C3%A9cup%C3%A9ration%20de%20cl%C3%A9%20public%20du%20service%20Cognito%20de%20Sixense.md

- La vérification des tokens cognito :
> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-back/2-V%C3%A9rification%20du%20token.md

### 5 - Connector front-end

Afin de simplifier l'implémentation dans les applications front-end , nous avons développé un package angular.

> repository: https://github.com/sxd-platform/byd-cognito-connector-front

celui-ci comprend :

- auth guard: permettant de gérer la sécurité et l'accès aux pages
> documentation: https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-front/AuthGuard.md

- auth service :
> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-front/AuthService.md

- la documentation d'installation
> https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-front/Setup.md

### 6 - Ajout d'un nouveau produit au portail

Pour ajouter un produit au portail il faut ajouter le produit en question à la table products de notre BDD postgres .

il nous faudra les champs suivants pour ajouter le produit:

    - label: label du produit
    - descripion: description du produit
    - image: image à afficher dans les tuiles du portail
    - icon: icône à afficher dans les tuiles du portail
    - url_app: URL du produit
    - open_tab: doit-on ouvrir le produit dans un nouvel onglet (boolean)
    - auth_logo: logo pour la page de connexion
    - auth_background_image: image de fond pour la page de connexion

> @steven proccess à définir pour l'ajout en bdd

|001|Version Initiale|DELBE Nicolas|
