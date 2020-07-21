# Vérification du token

**Contexte:** Lors des échanges entre les différents composants de la plateforme nous avons le besoin de pouvoir verifier si le token reçu est valide ou non.

Après avoir récuperé la clé publique (documentation - public-key) , le package cognito nous permet aussi de valider token et de le déchiffrer

**Utilisation:**

- importer le package dans votre fichier node


    const connectorCognito = require('@sixense/cognito-connector-back');


- appeler la méthode du package 'decodeToken'


    const decodeTokenService = await connectorCognito.decodeToken(publicKey, token);

la méthode prend 2 paramètres:

-publicKey: obligatoire / array : récuperée via la méthode 'getCognitoPublicKey'
-token: obligatoire / string : recuperé depuis le header de la requête


**retour de la méthode:**

- Dans le cas d'un succès la méthode renvoie:


      {
        code: 200,
        decodedToken: {
          sub: 'd3655328-3195-45ad-bc4c-9c6c55233ad2',
          aud: '25enbvfbaqtvb3iet5cppsedf3',
          email_verified: true,
          event_id: '3a8f1275-367f-42d3-82cf-c64be22f524c',
          token_use: 'id',
          auth_time: 1593093641,
          iss: '',
          'cognito:username': '',
          exp: 1593097241,
          iat: 1593093641,
          email: ''
        }
      }

- Dans le cas d'un échec la méthode renvoie l'une des erreurs suivantes:


      { message: 'invalid signature' }

      ou

      { name: 'JsonWebTokenError', message: 'invalid signature' }

la signature du token est invalide , il ne provient pas de la plateforme ou le format du token n'est pas bon


    { name: 'TokenExpiredError', message: 'jwt expired' }

le token a expiré

    { message: 'unknown error' }

le format du token ne doit pas être valide

|001|Version Initiale|DELBE Nicolas|
