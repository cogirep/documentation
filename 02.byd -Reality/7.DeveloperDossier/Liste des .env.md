﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿# Liste des .env
### La listes des .env pour les micros services (et pour le frontend)
> **Note:** 
> Chaque micros services doit avoir un .env à la racine du projet pour être fonctionnelle 
> 
> *Dans le cas D'une BDD Local*
> 
> 
> >Les champs "POSTGRES_USER" et "POSTGRES_PASS" dépendent de ceux que vous avez renseigné à l’installation de postgres 
> 
>
> >le champs "POSTGRES_BASE" dépend du nom que vous avez donné a votre BDD

-----
**byd-all-sso:**

	PORT=2999
	AUTH_URL=http://localhost:2999
	FRONTEND_URL=http://localhost:4200
	POSTGRES_HOST=127.0.0.1
	POSTGRES_PORT=5432
	POSTGRES_BASE=beyond
	POSTGRES_SCHEMA=beyond
	POSTGRES_USER=postgres (par défaut)
	POSTGRES_PASS=admin (par défaut)
	APPIDTENANTID=afe69514-2c70-4db4-aa79-58eb1a4f1546
-----
**byd-all-user:**

	PORT=3000
	POSTGRES_HOST=127.0.0.1
	POSTGRES_PORT=5432
	POSTGRES_BASE=beyond
	POSTGRES_SCHEMA=beyond
	POSTGRES_USER=postgres (par défaut)
	POSTGRES_PASS=admin (par défaut)
	APPIDTENANTID=afe69514-2c70-4db4-aa79-58eb1a4f1546
	MJ_APIKEY_PUBLIC=(attente clés du client)
	MJ_APIKEY_PRIVATE=(attente clés du client)
	APPIDAPIKEY=2MzgKPuEqiWAaGGlUr5dDvmWWL5oJohrK3x2CiqjHS8l
	IBMCLOUDURL=https://iam.cloud.ibm.com/
----
**byd-rea-frontend**

Le baseApiUrl est configuré avec le bouchon de DF qui contient les données à afficher sur la carte.
permissionApiUrl correspond au micro service byd-all-user
ssoUrl correspond au micro service byd-all-sso

	export const environment = {
	  production: false,
	  baseApiUrl : 'https://idcard.beyond-sandbox.par01.containers.appdomain.cloud/',  
	  permissionApiUrl: 'http://localhost:3000/',
	  apiVersion : 'api/v0/',
	  permissionApiVersion: 'api/v1',
	  ssoUrl: 'http://localhost:2999/'
	};
	
----
**byd-df-frontend**

Le fichier src/app/assets/environment/app-config.json est à configuré avec les variables suivantes :

	{
	  "ENVIRONMENT": "local",
	  "PRODUCTION": false,
	  "DATA_FACTORY_API_URL" : "https://idcard.beyond-sandbox.par01.containers.appdomain.cloud/api/v0",
	  "PERMISSION_API_URL": "http://localhost:3000/api/v1",
	  "SSO_URL": "http://localhost:2999",
	  "SSO_REDIRECT": "?redirect=LOCAL"
	}

- DATA_FACTORY_API_URL : @ du MS byd-df-idcard
- PERMISSION_API_URL = @ du MS byd-all-user
- SSO_URL = @ du MS byd-all-sso
- SSO_REDIRECT = query param du code de l'application. ex : redirect=LOCAL (redirige vers localhost:4200),
				redirect=REALITY (redirige vers l'environnement distant de REALITY), redirect=DATAFACTORY (redirige vers l'environnement distant de DATAFACTORY)
				
---