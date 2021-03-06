# Création d'utilisateur
**Contexte:** un utilisateur plateforme est un utilisateur qui est connu à la fois de cognito mais aussi de la plateforme.
les utilisateurs plateforme sont créés par les administrateurs de la plateforme sur le module **Beyond Manager**.

## Api cognito
Cognito propose plusieurs solutions pour la création d'utilisateurs .
Dans la plateforme nous avons choisi d'utiliser l'api "**adminCreateUser**".
elle permet de valider les utilisateurs automatiquement sans avoir à les activer 1 par 1 dans l'ihm cognito.

**prérequis**:
- Utilisation du package **aws-sdk** (version: **2.660.0**) pour appeler les apis cognito
- Récuperation des "**developer credentials**". Ils sont requis afin d'utiliser l'api et pour la configuration du package aws-sdk
>ils sont à recuperer sur AWS (accessKeyId et secretAccessKey)
- La configuration de cognito doit autoriser l'utilisation de cette api
> le détail de la configuration cognito sera présente dans la doc IT sur cognito.

**corps de la requête**:


	{  
	  UserPoolId: "userPoolId de l'application",  
	  Username: email de l'utilisateur,  
	  DesiredDeliveryMediums: ['EMAIL'],  
	  TemporaryPassword: "mot de passe temporaire de l'utilisateur (il est généré aléatoirement), ce champs n'est pas obligatoire, on peux l'enlever pour donner la main à cognito pour sa création ,  
	  UserAttributes: [   (attribut de l'utilisateur défini dans la config cognito)
	                    {  
	                      Name: 'email',  
	                      Value: email  
	                    },  
	                    {  
	                      Name: 'email_verified', (nous permet d'automatiquement valider le compte)
	                      Value: 'true'  
	                    }  
	  ]  
	};
**Réponse de l'api**:

	{
	  User: {
	    Username: 'f5b9c355-6d06-40aa-82a6-bdf2f27164e2',
	    Attributes: [ [Object], [Object], [Object] ],
	    UserCreateDate: 2020-05-11T13:31:51.256Z,
	    UserLastModifiedDate: 2020-05-11T13:31:51.256Z,
	    Enabled: true,
	    UserStatus: 'FORCE_CHANGE_PASSWORD'
	  }
	}

un email est envoyé à l'utilisateur suite à sa création dans cognito afin de lui transmettre son mot de passe temporaire.

La configuration de cette email est possible dans la configuration de cognito.


Une fois la création de l'utilisateur correcte , il faut enregistrer dans nos BDD le champs **Username** pour faire le mapping entre la plateforme et cognito.

Les utilisateurs sont créés sous le statut "**FORCE_CHANGE_PASSWORD**" , cela signifie qu'ils seront contraints de changer leur mot de passe temporaire (reçu par email) pour un nouveau mot de passe personnel.

**Erreurs connues**:

	{
	 message: 'An account with the given email already exists.',
	 code: 'UsernameExistsException',
	 time: 2020-05-14T13:34:55.278Z,
	 requestId: '6b87cd59-441f-423b-bf9f-e6f336c424f5',
	 statusCode: 400,
	 retryable: false,
	 retryDelay: 87.86385801533108
	}

Dans ce cas l'utilisateur est déjà connu de cognito.


Cela peut arriver quand l'utilisateur a déjà créé dans un autre environnement et puisque nous utilisons le même **userPool** pour tous les environnements cela génere une erreur

La solution est de chercher l'utilisateur dans cognito (via l'api **listUsers**) et de le sauvegarder dans notre BDD avec son Username.

---
	{
	 message: 'Missing region in config',
	 code: 'ConfigError',
	 time: 2020-05-14T13:48:23.664Z
	}

les erreurs liées à une mauvaise configuration du package **aws-sdk**

---

Toutes les autres erreurs possibles sont retrouvables sur la documentation officielle de Cognito


https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminCreateUser.html

|001|Version Initiale|DELBE Nicolas|
