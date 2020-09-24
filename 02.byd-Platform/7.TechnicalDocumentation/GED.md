# Gestion électronique des documents

**1- Contexte:**

Le terme GED (ou EDMS pour Electronic Document Management System) désigne la gestion informatisée de contenus documentaires. Beyond, comme toutes plateformes de gestion et suivi de chantiers, s'appuie entre autres sur des documents informatisés pour décrire les travaux et leur avancement.

Plusieurs fournisseurs de GED existent sur le marché (Nuxéo, Sharepoint... etc). Beyond a pour but de s'adapter à toute instance de ces GED et de pouvoir en rajouter au besoin des projets avec un minimum d'administration pour ensuite permettre à l'utilisateur final d'associer à un élément (idcard) un ou plusieurs documents des instances de GED configurées sur la plateforme.

**2 - Connexion aux GED**

Les instances des GED étant les propriétés des clients finaux, Beyond en tant que plateforme ne peut pas y accéder librement pour en lister, afficher ou renommer des documents. La connexion à une GED d'un client s'effectue au moyen des identifiants des utilisateurs finaux (pas d'utilisation de "compte technique") au travers d'un client-id de Beyond à priori déclaré sur l'instance en question.

Le protocole utilisé dans le cadre du projet Beyond est OAuth2 qui permet d'autoriser un site web ou application à utiliser l'API d'une autre application pour le compte d'un utilisateur. Ainsi l'utilisateur final peut déléguer son autorisation d'utiliser la GED à la plateforme Beyond.

Ce protocole est bien répandu sur le marché, la plupart des GED aujourd'hui sont compatibles avec OAuth2, dont Nuxeo qui est le premier fournisseur de GED à être intégré sur la plateforme Beyond.

**3 - Diagramme de séquence**

Afin de pouvoir gérer ces appels particuliers de Beyond vers les GED de manière sécurisée, l'utilisateur doit saisir ses identifiants propres à l'instance de la GED sur un formulaire dédié à cela sur l'instance de GED. L'instance de GED doit être configurée de telle sorte à rediriger l'utilisateur vers la plateforme BEYOND avec le code d'authentification une fois le processus d'authentification de l'utilisateur terminé. Ce code est ensuite échangé contre un token avec une durée de validité et échangeable avec un refresh token à expiration. Ci-dessous le diagramme décrivant le séquencement des appels depuis l'utilisateur jusqu'à la GED:

![Diagramme de séquence](./diagrams/GED_seqDiag.png)

Une fois le jeton de connexion récupéré, on le stocke dans un cache REDIS en fixant un TTL identique à la durée avant expiration du jeton

**4 - Modèle de donnée**

***4.1 - Les documents***

Les documents sont des enrichissements ayant la particularité d'avoir un champ supplémentaire "beyondType" qui vaut "document". Ces enrichissements sont issus du template technique suivant non modifiable par les administrateurs:

```js
{
    uid: "string", //Identifiant unique du document dans l'instance de GED
    title: "string", //Titre du document propre à Beyond
    connector: "string" //Identifiant unique du connecteur (décrit en 4-2)
}
```

***4.1 - Les connecteurs***

Un connecteur est un ensemble de données qui permettent de se connecter à une instance de GED. Un connecteur représente donc une instance de GED et est donc référencé dans chaque document. Les connecteurs sont stockés dans une table MongoDB et contiennent les champs suivants:

```js
{
    id: "string", //Identifiant unique de l'instance de GED
    product: "string", //Type de GED, nuxeo par exemple
    company: "string", //Compagnie de rattachement de la GED
    "client_id": "string", //Nom du client Beyond comme déclaré dans la GED
    baseUrl: "string", //L’URL de base de l’instance de GED, utilisée pour l’affichage des documents
    authorizationEndpoint: "string", //L’URL du serveur d’autorisation oauth2 de la GED
    tokenEndpoint: "string" //L’URL du serveur de génération des tokens de la GED
}
```
