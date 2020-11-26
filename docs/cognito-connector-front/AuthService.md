# AuthService

AuthService est un service Angular gérant la session de l’utilisateur.

## Méthodes

###logout
Cette méthode est appelée lorsqu’on souhaite déconnecter l’utilisateur.
Elle vide le local storage de l’application et redirige l’utilisateur vers le end point `/disconnect` du portail.
> Le type de retour de la méthode est void.

Le processus complet de la déconnexion est disponible [à cette adresse](./../deconnexion.md)


#### Implémentation

```typescript
import {AuthService} from '@sixense/cognito-connector';

@Component({
  template: '<button (click)="logout()">Logout</button>',
})
export class HomeComponent {

    constructor(private authService: AuthService) {}

    public logout(): void {
      this.authService.logout();
    }

}
```

| 001 | Version Initiale | SIXENSE |
