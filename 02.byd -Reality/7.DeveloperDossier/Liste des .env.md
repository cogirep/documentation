﻿# Liste des .env
### La liste des .env pour les micros services
> **Note:** Chaque micro service doit avoir un .env à la racine du projet pour être fonctionnel
-----
**byd-all-sso:**

	PORT=2999
	AUTH_URL=http://localhost:2999
	FRONTEND_URL=http://localhost:4200
	POSTGRES_HOST=127.0.0.1
	POSTGRES_PORT=5432
	POSTGRES_BASE=beyond
	POSTGRES_SCHEMA=beyond
	POSTGRES_USER=postgres (par default)
	POSTGRES_PASS=admin (par default)
	APPIDTENANTID=5af721c2-4495-4ad9-bd56-f2253c148329
-----
**byd-all-user:**

	PORT=3000
	POSTGRES_HOST=127.0.0.1
	POSTGRES_PORT=5432
	POSTGRES_BASE=beyond
	POSTGRES_SCHEMA=beyond
	POSTGRES_USER=postgres (par default)
	POSTGRES_PASS=admin (par default)
	APPIDTENANTID=5af721c2-4495-4ad9-bd56-f2253c148329

