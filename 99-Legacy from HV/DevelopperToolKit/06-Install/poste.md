# Poste du développeur [Working process]

## Prérequi

- Git
- Terminal
- Compte IBM Cloud (seulement pour les déploiements)
- ~~MongoDB~~
- Postgres (installation local)

## Installation
### NodeJS

Le projet utilise la dernière version LTS (v8.12.0 à l'heure de cette rédaction)

Vous pouvez installer NodeJS depuis le [site officiel](https://nodejs.org/en/)

Mais si vous avez besoin d'avoir plusieurs versions différentes de NodeJS, il y a [NVM](https://github.com/creationix/nvm) (Node Version Manager)

### Packages NodeJS

Toutes les informations sont détaillées  dans les fichiers `README.md`.

**En global**

- Angular CLI
- Nodemon

```bash
npm install -g @angular/cli nodemon
```

**En local**

Pour le front

```bash
cd frontend 
npm i
```

Pour le back

```bash
cd backend 
npm i
```

### IDE

Sur le projet nous avons fait le choix d'utiliser [WebStorm](https://www.jetbrains.com/webstorm/), pour bénéficier de certaine fonctionnalité permettant de codé efficacement.

Mais pour les nouveaux, [VS Code](https://code.visualstudio.com/) peut être utiliser.

### Outillage

[Working process]

- ESLint / TSLint
  - AirBnB