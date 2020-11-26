# Utilisation de la ged

Url de l'instance de nuxeo: https://dev-nuxeo.beyond.online/nuxeo/login.jsp?requestedUrl=ui%2F

## 1 - Compte pour se connecter à nuxeo

Vous disposez d'un compte déjà créé pour vous connecter sur nuxeo
login: qa / mdp: qa
(compte classique)

si besoin de créer d'autres utilisateurs, il faudra passer par le compte admin
login: Administrator / mdp: Administrator

## 2 - Création d'un utilisateur et d'un groupe dans nuxeo

Pour créer un utilisateur ou un groupe dans nuxeo, il faut obligatoirement être connecté en tant qu'administrateur.

Dans le menu de gauche, cliquez sur l'icône  administration

![](assets/admin-icon.png)

Dans le volet qui vient de s'afficher, cliquez sur `utilisateurs & groupes`

Dans la nouvelle page qui vient de s'afficher, vous pouvez voir les utilisateurs et les groupes existants.

Pour en créer un nouveau, cliquez sur le bouton `nouveau`.

Il vous proposera de créer un utilisateur ou un groupe.

Il faut savoir que les documents peuvent être liés à un groupe, et il faudra que l'utilisateur soit membre de celui-ci pour pouvoir voir le voir

Il existe déjà un groupe : `sixense`


## 3 - documents

Nous avons ajouté 2 documents sur nuxeo :

    logo sixense / 57a052af-8e72-4ca2-95dd-101c9bcb92cb
    Image Beyond monitoring / dff345fe-59e4-47a5-a761-3126b09581a0

Apres avoir ajouté un document sur nuxeo, il est possible de récupérer son uid en appuyant sur le bouton `Partager` en haut  

Vous allez obtenir une url de ce type:

> https://dev-nuxeo.beyond.online/nuxeo/ui/#!/doc/dff345fe-59e4-47a5-a761-3126b09581a0

L'uid du document se trouve après le `/doc/`

## 4 - enrichissement type document

Un enrichissement de type document est présent sur QA , il s'appelle "**enrichissement Ged**"
il dispose des bons champs afin de faire fonctionner la ged.

il est toujours possible d'en créer d'autres via l'api des templates d'enrichissements en veillant à respecter les propriétés suivantes et en spécifiante le beyondType à `document`  

    uid: string

    title: string

    connector: string

## 5 - les connectors

Un connecteur est un ensemble de données qui permet de se connecter à une instance de GED.

Il existe sur QA 2 connectors, ils ont été créés et paramétrés pour fonctionner directement avec l'instance nuxeo de dev pour l'environnement de QA (url de redirection après la connexion , login  ...)

    nuxeoqa
    Beyond-QA

Il est possible de créer d’autres connecteurs ou de modifier les connecteurs existants via les APIs du micro service de la GED.

<span style="color: #ff0000"> /!\ </span>Nous ne recommandons pas de modifier le nom d'un connecteur si des enrichissements y sont liés.

<span style="color: #ff0000"> /!\ </span> Le clientId doit être créé aussi dans Nuxeo

Documentation Nuxeo pour créer un client
> https://doc.nuxeo.com/nxdoc/using-oauth2/#using-the-rest-api

lien du swagger du micro service GED
> https://github.com/sxd-platform/byd-all-ged/blob/develop/swagger.yml

## 6 - Comment associer un document de la GED à une donnée de la plateforme

Pour associer un document de la ged à une donnée, il suffit de créer un enrichissement de type `document` à celle-ci.

Pour cela, il faut se rendre sur la fiche détaillée de la donnée dans la page data de `reality` et choisir l'action  `Enrich`.

Sélectionner un enrichissement de type `document` et de remplir correctement les champs associés

    uid: string // uid du doc dans GED
    title: string // Nom du document
    connector: string // clientId d'un connecteur déclaré
