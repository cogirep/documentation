﻿﻿﻿# Liste des .env
### La liste des .env pour les micros services
> **Note:**
> *Dans le cas D'une BDD Local*
>> chaque micros services doit avoir un .env à la racine du projet pour être fonctionnelle
>
> >Les champs "POSTGRES_USER" et "POSTGRES_PASS" dépendent de ceux que vous avez renseigné à l’installation de postgres
>
> le champs "POSTGRES_BASE" dépend du nom que vous avez donné a votre BDD

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
	APPIDTENANTID=5af721c2-4495-4ad9-bd56-f2253c148329
-----
**byd-all-user:**

	PORT=3000
	POSTGRES_HOST=127.0.0.1
	POSTGRES_PORT=5432
	POSTGRES_BASE=beyond
	POSTGRES_SCHEMA=beyond
	POSTGRES_USER=postgres (par défaut)
	POSTGRES_PASS=admin (par défaut)
	APPIDTENANTID=5af721c2-4495-4ad9-bd56-f2253c148329

