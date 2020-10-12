# AuthService

## Contexte

AuthService est un service Angular gérant la session de l’utilisateur.
Il n’intègre pour le moment que la déconnexion (logout), mais sera complété par la suite avec les méthodes du AuthService des différentes applications.

## Usage

```javascript
logout()
```

Redirige l'utilisateur vers la page de déconnexion de Beyond Portal qui vide le local storage et redirige vers la page de connexion.

Retour :

```javascript
void
```

|001|Version Initiale|Sixense|
