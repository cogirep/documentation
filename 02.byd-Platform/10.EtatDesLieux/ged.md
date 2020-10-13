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

Dans le volet qui viens de s'afficher, cliquez sur `utilisateurs & groupes`

Dans la nouvelle page qui vient de s'afficher, vous pouvez voir les utilisateurs et les groupes existants.

Pour en créer un nouveau, cliquez sur le bouton `nouveau`.

Il vous proposera de créer un utilisateur ou un groupe.

Il faut savoir que les documents peuvent être lié à un groupe, et il faudra que l'utilisateur soit membre de celui-ci pour pouvoir voir le voir

Il existe déjà un groupe : `sixense`


## 3 - documents

Nous avons ajouté 2 documents sur nuxeo :

    logo sixense / 57a052af-8e72-4ca2-95dd-101c9bcb92cb
    Image Beyond monitoring / dff345fe-59e4-47a5-a761-3126b09581a0

Apres avoir ajouté un document sur nuxeo , il est possible de récupérer  son uid en appuyant sur le bouton `Partager` en haut  

Vous allez obtenir une url de ce type:

> https://dev-nuxeo.beyond.online/nuxeo/ui/#!/doc/dff345fe-59e4-47a5-a761-3126b09581a0

L'uid du document se trouve après  le `/doc/`

## 4 - enrichissement type document

Un enrichissement de type document est présent sur QA , il s'appelle "**enrichissement Ged**"
il dispose des bons champs afin de faire fonctionner la ged.

il est toujours possible d'en créer d'autres via l'api des templates d'enrichissements mais merci de respecter les propriétés suivantes:

    uid: string

    title: string

    connector: string

## 5 - les connectors

Il existe sur QA 2 connectors

    nuxeoqa
    Beyond-QA

Ils sont paramétrés afin de fonctionner correctement avec QA (url de redirection, login etc)
