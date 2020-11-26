# Récuperation des utilisateurs
**Contexte:**
il est possible de récuperer la liste de tous les utilisateurs présent dans cognito.


## Api cognito
Nous avons utilisé l'api cognito "**listUsers**" pour récupérer les utilisateurs.


**prérequis**:
- Utilisation du package **aws-sdk** (version: **2.660.0**) pour appeler les apis cognito
- Récuperation des "**developer credentials**". Ils sont requis afin d'utiliser l'api et pour la configuration du package aws-sdk
>ils sont à recuperer sur AWS (accessKeyId et secretAccessKey)
- La configuration de cognito doit autoriser l'utilisation de cette api
> le détail de la configuration cognito sera présente dans la doc IT sur cognito.

**corps de la requête**:

    {
      "AttributesToGet": [ "string" ],
      "Filter": "string",
      "Limit": number,
      "PaginationToken": "string",
      "UserPoolId": "string"
    }

**AttributesToGet**: attributs que l'on souhaite récuperer. (non requis)

**Filter**: filtre sur les utilisateurs. (non requis)
example: `Filter: email = test@test.com`

**Limit**: nombre maximum de résultat.

**PaginationToken**: token de pagination (non requis)

**UserPoolId**: userPoolId de l'application
___

**Réponse de l'api**:

    {
      Users: [
        {
          Username: '7f82d8b5-4c15-62a6-bc10-e960bd5aafce',
          Attributes: [Array],
          UserCreateDate: 2020-05-18T08:33:18.593Z,
          UserLastModifiedDate: 2020-05-18T08:33:18.593Z,
          Enabled: true,
          UserStatus: 'FORCE_CHANGE_PASSWORD'
        }
      ]
    }

> retour de l'api avec un filtre sur l'email

___

Toutes les erreurs possibles sont retrouvables sur la documentation officielle de Cognito

https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ListUsers.html

|001|Version Initiale|DELBE Nicolas|
