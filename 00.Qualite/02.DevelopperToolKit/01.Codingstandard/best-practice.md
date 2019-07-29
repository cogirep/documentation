# BEST PRACTICES #

## GENERAL ##

- Commenter son code en anglais.

- Faire de la `JsDoc`. [Qu'est ce qu'une JsDoc?](https://fr.wikipedia.org/wiki/JSDoc)

- Modeliser l’application.

- Typer les variables. (Des exceptions pour les classes Cesium pourront être acceptés).

- Tester ses développements.

- Les strings sont rédigés entre simple quotes.

- Les variables privées ne sont pas nommées avec des underscores.

- Chaque `composant`, `service`... est pré-fixé par `byd-xxxxx.monTypeDeFichier.ts`

- Pour executer le linter, écrire la ligne de commande ci-dessous :

```bash
ng lint --format=monFormat > result.monFormat
```

Le resultat est généré dans un fichier result.

- Toujours maintenir le fichier `i18n` à jour.

## GitHub ##

- Prefixer les branches Git par BR-XXX_Resumé_de_la_BR.

- Suivre le modèle GitFlow. [Qu'est ce que GitFlow ?](https://datasift.github.io/gitflow/IntroducingGitFlow.html)

## HTML ##

- Bien indenter le code.

- Mettre les paramètres en colonne mais plutôt qu'en ligne.

- Mettre les paramètres dans l’ordre suivant : attributs HTML (`id`, `class`…), attributs `Angular` (`ngClass`, `ngModel`...), attributs composants (type `input`, `output`…), toujours par ordre alphabétique seule exception pour `id` et `class` des attributs `HTML`.

Exemple :

```html
<input  id="XXX"
        class="XXX"
        type="XXX"
        *ngFor="let XXX of XXX"
        *ngIf="XXX"
        [(Input/Output name)]="XXX">
```

## CSS ##

- Nommage des classes: Toujours commencer par la balise parente la plus haute et nommer en fonction de chaques enfants.

Exemple:

```html
<div class="xxx-container" >
  <div class="xxx-content">
    <div class="xxx-element">
      <span>Coucou</span>
    </div>
  </div>
</div>
```
xxx étant le contexte

- Dans le fichier SCSS, quand plusieurs de vos classes ont le même préfixe, ne pas hésiter à créer un grande classe portant le préfixe qui contient plusieurs petites classes qui seront les suffixes.

Exemple : Dans le cas d’un formulaire, j’ai 3 classes : `form-header-container`,  `from-body-container`, `form-footer-container`.

Alors mon code ressemblera à ça :

```scss
.form {
  &-header-container { … }
  &-body-container { … }
  &-footer-container { … }
}
```

- Si les classes sont dans des containers qui s’imbriquent tel que dans le premier exemple `CSS`, les nommer comme ci dessous.

Exemple : Dans le cas d’un formulaire, j’ai 3 classes : `form-container`,  `form-content`, `form-element`.

```scss
.form-container {
  xxx : xxx;
  xxx : xxx;
  xxx : xxx;
  .form-content {
    xxx : xxx;
    xxx : xxx;
    xxx : xxx;
    .form-element {
      xxx : xxx;
      xxx : xxx;
      xxx : xxx;
    }
  }
}
```

- Ecrire les paramètres `SCSS` dans l’ordre alphabétique.

- Les variables sont dans un fichier de variables.

## TypeScript ##

- Les Imports se font dans l'ordre alphabétique. (Via le nom de la route et non de l'import).

- Pas de déclaration d'attributs après les méthodes dans une `class`.

- Pas de déclaration d'attributs `static` après des attributs d'instance.

- Pas de déclaration d'éléments `private` après des éléments `public`.

- Pas de déclaration d'éléments `private` après des éléments `protected`.

- Pas de déclaration d'éléments `protected` après des éléments `public`.

- Grouper les `Inputs` (Front), juste en dessous de l'`export`, avant la déclaration des variables.

- Grouper les `Outputs` (Front) de la même manière.

- Grouper les `ViewChild` (Front) de la même manière.

- Grouper les setters correspondants aux getters.

- Ne pas écrire de méthodes avant le constructeur.

- Mettre les méthodes de cycle de vie Angular (`NgOnInit`, `NgAfterViewInit`, etc...) avant toutes les autres méthodes dans les `class`.

- Pas de type `any` -> Sauf exception sur Reality les classes Cesium.

- Pas de variables non typés.

## NX Angular ##