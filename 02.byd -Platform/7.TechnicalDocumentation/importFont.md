# IMPORT D'UNE FONT

_Voici les étapes à suivre pour importer une font sur le projet._

* Aller sur le site Google font _(ou sur <b>n’importe quel site</b> distribuant des font open source.)_ 
	* https://fonts.google.com/
* Chercher la font qui nous intéresse, _dans notre cas <b>Open Sans</b>_: 
	* https://fonts.google.com/specimen/Open+Sans

* Sur la page cliquer sur __select this font__
* Cliquer sur __Family selected__ en bas à droite.
* Sélectionner les paramètres de la font qui vous intéresse. 
	`Dans notre cas : Regular 400 et Semi-bold 600.`

* Une fois le paramétrage effectué, sélectionner soit:
	* L’import standard
	* L’import CSS

* Dans notre cas nous utilisons __l’import standard__. <br>
Dans __un projet Angular__ il faut ajouter cet import dans `src/index.html` et de coller le lien généré.

* Voici le lien en question (dans notre cas).

```html
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600&display=swap" rel="stylesheet">
```

* Retournez sur le site google font et dans la section `Family selected` il vous suffira de récupérer le code dans `specify in CSS` et de le coller dans le fichier de CSS global de votre application dans l'élément BODY. 

```css
body {
  margin: 0;
  font-family: ‘Open-Sans’, sans-serif;
  color: #25414f;
}
```

<h3 style="color:red"> Attention </h3>

__Il y a des cas particuliers ou la font-family est à ajouter à la main pour qu’elle soit prise en compte. <br> Par exemple: le bouton. Pensez donc bien à vérifier que la font est correcte lorsque vous développez un nouveau composant.__