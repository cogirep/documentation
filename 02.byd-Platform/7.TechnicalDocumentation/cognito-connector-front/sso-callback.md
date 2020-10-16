# SSO Callback

Le `SSO Callback` est un composant requis par toutes les applications front intégrant la stratégie d'authentification de BEYOND avec la redirection via le Portail et Cognito

Une fois l’authentification effectuée, l'utilisateur est redirigé vers la route `/ssoCallback` du produit cible.

Il transmet sur cette URL, via des paramètres, le token et le refresh token de l’utilisateur qui vient de se connecter.

### Implémentation

L’implémentation du SSO Callback se fait en deux étapes:

- l’implémentation de la route
- la création du composant

#### app-routing.module.ts

```typescript
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home.component';
import { CallbackComponent } from './callback.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'ssoCallback', component: CallbackComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
```

#### callback.component.ts
```typescript
import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { environment } from '../../../../environments/environment';
import { PermissionService } from '../../services/permissions/permission.service';

@Component({
  template: '<div class="loading"><sds-loader></sds-loader></div>',
  styles: ['.loading { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); }'],
})
export class CallbackComponent {

  constructor(private permissionService: PermissionService,
              private router: Router,
              private route: ActivatedRoute) {
    if (router.url.indexOf('/externalRedirect') === -1) {
      route.queryParams.subscribe({
        next: (params) => {
          if (params.redirect_uri &&
            params.token &&
            params.refresh_token) {
            localStorage.setItem('refresh_token', params.refresh_token);
            localStorage.setItem('access_token_authentication', params.token);
            localStorage.setItem('access_token', params.token);
            // retrieve user right to add in user
            this.permissionService.getAccountWithToken().subscribe((response) => {
              localStorage.setItem('user', JSON.stringify(response.data));
              this.router.navigate(['/']);
            });
          } else {
            this.router.navigate(['/externalRedirect', { externalUrl: `${environment.portal}login${environment.sso_redirect}` }]);
          }
        },
        error: () => {
          this.router.navigate(['/externalRedirect', { externalUrl: `${environment.portal}login${environment.sso_redirect}` }]);
        },
      });
    }
  }

}
```

| 001 | Version Initiale | SIXENSE |
