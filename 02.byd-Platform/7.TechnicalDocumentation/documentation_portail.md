# Documentation portail

## 1 - Introduction  

Le portail BEYOND est une application web permettant à un utilisateur BEYOND de s’authentifier puis de naviguer entre les produits auxquels il a accès.

Il assure les fonctionnalités suivantes :

- Fédération d’IDentité
- Authentification
- Mot de passe oublié (pour les utilisateurs interne)
- SSO au sein des produits
- Navigation inter-produit
- Adresse de contact
- Mentions légales
- Déconnexion

Cette documentation décrit les étapes permettant d’intégrer un nouveau produit dans la plateforme, en particulier sur la partie authentification :

- Vue d’ensemble
- Configuration de Cognito – Déclaration d’un IdP
- Configuration du portail – Déclaration d’un produit
- Intégration dans le produit - Intégration des composants
- Intégration dans le produit – Gestion des droits fins

## 2 - Vue d'ensemble

La connexion à la plateforme BEYOND se fait par l'intermédiaire du portail pour tous les produits qui la constituent.
Le portal permet la connexion à deux types d’utilisateurs :

- ceux connus de Cognito,
- ceux connus d’un IDP externe reconnu par Cognito.

Seuls les utilisateurs connus de la base de données de la plateforme peuvent se connecter.
La page de connexion du portail peut être personnalisée avec un logo et une image correspondant au produit auquel l'utilisateur veut se connecter.

Le processus type est le suivant :

- Connexion via la page d’authentification du portail [http:// .md]
- Accès à un produit (via le portail, redirection après authentification ou accès direct) <https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/documentation.md>
- Navigation dans le produit [http:// .md]
- Déconnexion <https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/d%C3%A9connexion.md>

La cinématique d’ensemble est illustré dans ce diagramme de séquence :

<https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/2.SpecificationDossier/images/diagrams/seq_authentication.png>

## 3 - Configuration de Cognito – Déclaration d’un IdP

Il existe deux typologies d’utilisateurs pouvant s'authentifier sur la plateforme :

- Des utilisateurs “internes”, gérés dans l’instance Cognito de BEYOND
- Des utilisateurs ”externes”, gérés dans le système (annuaire ou IdP) d’un client, qui se connectent via SSO. Le raccordement se fait via OIDC.

La gestion (CRUD) de compte utilisateurs “internes” se fait dans l’application BEYOND Manager.

Le raccordement d’un nouvel IdP à l’instance Cognito se fait en deux étapes :

- La configuration dans Cognito *[Procédure IT à décrire]*,
- Le référencement de cet IdP dans la table ‘idp’ de la base de données PostgresSQL de BEYOND Portal en lui spécifiant un pattern d'email (regex "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$" ; par exemple : "****@vinci-contruction.com").

Les champs nécessaires pour référencer l'IdP dans la table des IdP sont :

- le nom de la compagnie à laquelle est rattaché l'IdP (compagnie déjà enregistrée au niveau de la plate-forme)
- le pattern d'e-mail reconnu par l'IdP

Ces deux opérations sont assurées par l’IT suite à une demande via le service desk dédié : *[Lien de la demande IT à ajouter]*.

Lors de l’authentification, si le mail de l'utilisateur correspond au pattern déclaré, l’utilisateur sera automatiquement dirigé sur la page d'authentification de l'IdP correspondant.

## 4 - Configuration du portail – Déclaration d’un produit

Pour ajouter un produit à la plate-forme, il faut insérer un enregistrement dans la table "product" de la base de données PostgresSQL de BEYOND Platform.

A noter : la page de connexion du portail est personnalisable avec un logo et une image correspondant au produit auquel l'utilisateur se connecte.

L’insertion en base est réalisée par l’IT suite à une demande via le service desk dédié : *[Lien de la demande IT à ajouter]*.
Les informations à fournir sont les suivantes :

- label : label du produit
- description : description du produit affichée dans le portail
- image : URL de l’image à afficher dans les tuiles du portail
- icon : URL de l’icône à afficher dans les tuiles du portail
- url_app : URL du produit
- open_tab : doit-on ouvrir le produit dans un nouvel onglet (boolean)
- auth_logo : URL du logo pour la personnalisation de la page de connexion
- auth_background_image : URL de l’image de fond pour la personnalisation de la page de connexion

La réponse à cette demande inclura les éléments nécessaires à la communication avec Cognito :

- Region (de l'environnement Cognito ciblé)
- UserPoolId (référence de la base d'utilisateurs internes à Cognito pour Beyond Platform)
- Clef d’API (permettant l'accès aux APIs de beyond Portail utilisées dans le processus d'authentification)

Il est conseillé de stocker ces valeurs dans des variables d'environnements.

### 5 - Intégration dans le produit - Intégration des composants (librairies)

Afin de faciliter l’implémentation décrite dans les documents cités plus haut (cf Vue d’ensemble), des packages sont mis à disposition.

#### Package Back end

Un package Node.js est disponible dans le repository : <https://github.com/sxd-platform/byd-cognito-connector-back>

Il fournit les services suivants :

- Récupération de la clé publique Cognito <https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-back/1.R%C3%A9cup%C3%A9ration%20de%20cl%C3%A9%20public%20du%20service%20Cognito%20de%20Sixense.md>
- Vérification des tokens Cognito <https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-back/2-V%C3%A9rification%20du%20token.md>

#### Package Front end

Un package Angular est disponible dans le repository : <https://github.com/sxd-platform/byd-cognito-connector-front>

Son installation est décrite sur la page : <https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-front/Setup.md>

Il met à disposition :

- Auth guard : service Angular permettant de gérer le contrôle d'accès à une application <https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-front/AuthGuard.md>
- Auth service : service Angular gérant la déconnexion de l’utilisateur <https://github.com/sxd-platform/byd-all-documentation/blob/develop/02.byd-Platform/7.TechnicalDocumentation/cognito-connector-front/AuthService.md>

### 6 - Intégration dans le produit – Gestion des droits fins

La gestion des droits des utilisateurs dans les produits reste à la charge des produits.
Il convient donc pour les produits de gérer leur propre base d’utilisateur permettant de faire le lien entre l’utilisateur authentifié via Cognito et ses droits dans le produit.
Afin, notamment, de faciliter les processus de cycle de vie des utilisateurs et la conformité RGPD, il est recommandé au produit de ne pas dupliquer les informations personnelles des utilisateurs gérés dans Cognito.

|001|Version Initiale|Sixense|
