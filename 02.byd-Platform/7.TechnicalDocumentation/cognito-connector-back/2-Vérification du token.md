# Vérification du token

## Contexte

Lors des échanges entre les différents composants de la plateforme, il faut s’assurer de la validité du token reçu.
Le package back end permet de valider ce token et de le déchiffrer.

## Usage

- Importer le package dans votre fichier Node du module qui assure l’authentification

```javascript
const connectorCognito = require('@sixense/cognito-connector-back');
```

- Appeler la méthode du package 'decodeToken'

```javascript
const decodeTokenService = await connectorCognito.decodeToken(publicKey, token);
```

La méthode prend 2 paramètres :

- publicKey : obligatoire / array, récupérée via la méthode 'getCognitoPublicKey'
- token : obligatoire / string : récupéré depuis le header de la requête

En cas de succès, la méthode renvoie :

```javascript
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
```

En cas d'échec, la méthode renvoie l'une des erreurs suivantes :

- Si la signature du token est invalide, si le token ne provient pas de la plateforme ou si son format n’est pas le bon :

```javascript
{ message: 'invalid signature' }
```

ou

```javascript
{ name: 'JsonWebTokenError', message: 'invalid signature' }
```

- Si le token est expiré :

```javascript
{ name: 'TokenExpiredError', message: 'jwt expired' }
```

- Si une autre erreur a lieu :

```javascript
{ message: 'unknown error' }
```

|001|Version Initiale|Sixense|
