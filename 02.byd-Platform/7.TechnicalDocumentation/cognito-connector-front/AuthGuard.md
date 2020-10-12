# AuthGuard

## Contexte

Le AuthGuard Angular est un service indiquant au routeur s’il doit autoriser ou non la navigation vers une route selon certains critères.

- Si l’utilisateur est authentifié (un token valide est disponible dans le local storage), il est redirigé vers la page demandée.
- Si l’utilisateur n’est pas authentifié (le token du local storage est invalide ou inexistant), alors les données en local storage sont supprimées et il est redirigé vers la page de connexion du portail.

![](AuthGuard.png)

## Usage

CognitoConnectorModule.forRoot(environment, AuthService)

La méthode prend deux paramètres :

- environment : variables d’environnement contenant les URLs des différents environnements
- AuthService : Service d’authentification

## Exemple

- app.module.ts

```javascript
    // ...
    import { CognitoConnectorModule } from 'cognito-connector';
    import { environment } from '../environments/environment';
    import { AuthService } from './shared/services/auth/auth.service';

    @NgModule({
      declarations: [
        // ...
      ],
      imports: [
        CognitoConnectorModule.forRoot(environment, AuthService),
      ],
      providers: [
        // ...
      ]
    })
    export class AppModule {}
```

- app-routing.module.ts

```javascript
    // ...
    const routes: Routes = [
      {
        path: 'home',
        component: HomeComponent,
        canActivate: [AuthGuard]
      },
    ];
    
    @NgModule({
      imports: [RouterModule.forRoot(routes)],
      exports: [RouterModule],
    })
    export class AppRoutingModule {}
```

|001|Version Initiale|Sixense|
