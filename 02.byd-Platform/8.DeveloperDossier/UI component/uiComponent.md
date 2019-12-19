# UI component

  [![NPM Version][npm-image]][npm-url]

## Installation de l'UI component

Ajout de l’URL de la librairie NPM Sixense

* Installer npmrc : `npm i -g npmrc`
* Créer une configuration *Sixense* : `npmrc -c sixense`
* Vérifier si la configuration a bien été crée : `npmrc` (si sixense ne s’affiche pas répéter l’étape précédente)
* Ajouter l’URL de la librairie : `npm config set //registry.npmjs.org/:_authToken=d9c25f52-69ef-41b8-acc9-aa95d1e23f78`

## Installation du package

```bash
npm i @sixense/design-system
```

## Mise à jour du package

```bash
npm update @sixense/design-system
```

## Procédure de déploiement de l'UI component

Voici les 3 étapes à suivre avant de demander le déploiement :

1. Vérifier les erreurs du linter avec : `ng lint sixense-design-system`
2. Verifier si la librairie compile correctement avec : `ng build sixense-design-system`
3. Mettre à jour la version du package avec : `standard-version -r [patch/minor/major]`

## Développement local

Il est possible de tester l'UI component sur un projet sans pour autant le déployer, voici les étapes à suivre afin d’y arriver :

* Depuis la racine de l'UI component, se rendre dans le dossier `/dist/sixense-design-system`
* Exécuter la commande `npm link`
* Se rendre ensuite à la racine du projet cible
* Si l'UI component est déjà installé, le supprimer avec `rm -rf node_modules/@sixense`
* Exécuter la commande `npm link @sixense/design-system`
* (Re)démarrer le serveur avec `ng serve`

Pour que le projet cible se mette à jour en même temps que l'UI component, exécuter la commande `ng build @sixense/design-system` depuis la racine de l'UI component.

## Collaborateurs

L'UI component construit conjointement par les équipes Sixense et IBM.

* **Stéphanie Duchemin** -  *Senior UX Designer, Sixense*
* **Geoffrey Buchard** - *UI/UX Designer, IBM*
* **Gianni Polito** - *Lead Designer, IBM*
* **Geoffrey Kuik** - *Développeur web & mobile, IBM*
* **Dominique Parsis** - *Team Leader, IBM*
* **Lucas Hennaert** - *Développeur web, IBM*
