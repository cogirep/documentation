# Suppression d'utilisateur
**Contexte:**
les utilisateurs plateforme sont supprimés par les administrateurs de la plateforme sur le module **Beyond Manager**.

la suppression d'un utilisateur implique sa suppression dans notre BDD mais aussi dans cognito

## Api cognito
Dans la plateforme nous avons choisi d'utiliser l'api cognito  "**adminDeleteUser**" pour la suppression d'utilisateur.

**prérequis**:
- Utilisation du package **aws-sdk** (version: **2.660.0**) pour appeler les apis cognito
- Récuperation des "**developer credentials**". Ils sont requis afin d'utiliser l'api et pour la configuration du package aws-sdk
>ils sont à recuperer sur AWS (accessKeyId et secretAccessKey)
- La configuration de cognito doit autoriser l'utilisation de cette api
> le détail de la configuration cognito sera présente dans la doc IT sur cognito.

**corps de la requête**:

    {
      UserPoolId: process.env.AWS_USERPOOLID,
      Username: providerId
    }

**UserPoolId**: userPoolId de l'application

**Username**: id de l'utilisateur dans cognito
> ce n'est pas l'email mais bien le champ Username (dans notre bdd => providerId)

___

**Réponse de l'api**:

en cas de succès: cognito retourne un body vide

___

**Erreurs connues**:

    {
     message: 'Missing region in config',
     code: 'ConfigError',
     time: 2020-05-14T13:48:23.664Z
    }

les erreurs liées à une mauvaise configuration du package aws-sdk

---

Toutes les autres erreurs possibles sont retrouvables sur la documentation officielle de Cognito

https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminDeleteUser.html

|001|Version Initiale|DELBE Nicolas|
