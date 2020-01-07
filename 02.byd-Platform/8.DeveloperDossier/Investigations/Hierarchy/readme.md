# Association

## Investigations sur le stockage des données hiérarchiques

Le postulat est le suivant :

- Nous souhaitons utiliser les associations afin de créer un lien sémantique entre plusieurs données.
- De ce lien peut découler une notion de parenté / hiérarchie

La question soulevée est donc la suivante :

- Comment stocker de manière efficiente les données afin que celles-ci soient manipulables tout en reflétant la notion de hiérarchie entre les différents membres d'une association?

## Vision initiale

Une première réflexion, en mode NoSQL, a abouti à la création du modèle de données suivant :

[Document Mongo - Association hiérarchique V1](./associationV1.json)

Ce document fonctionne en 2 temps:

1. Le champ **_"members"_** liste l'ensemble des membres de l'association sur un même niveau
2. Le champ **_"relationships"_** reprend les membres listés auparavant mais en ajoutant la notion de hiérarchie (**A** a pour enfant **B** qui lui-même est parent de **D** etc.)

Le principal avantage de cette configuration résulte dans le fait de disposer de l'ensemble de la généalogie dès l'obtention du détail d'une association.

A contrario, il s'avèrera compliqué de constituer le document Mongo lors de la création d'une association et, en fonction des besoins, le requêtage de ce document ne sera pas forcément intuitif et/ou performant

## Vision alternative

Il est possible de penser la hiérarchie différemment. Plutôt que de stocker la hiérarchie complète dans un champ dédié, chaque membre de l'association portera son lien direct avec un autre membre, au premier niveau uniquement.

Voici le modèle de données que cela génère :

[Document Mongo - Association hiérarchique V2](./associationV2Bis.json)

Ici, l'avantage résidera dans le fonctionnel et l'exploitation. En effet, pour constituer une hiérarchie, on fonctionnera étape par étape. Pour une donnée ciblée, il est facile de récupérer ses parents et enfants directs.

**Exemple d'un comportement:**

1. On obtient le détail d'une association et seuls les membres "sans parent" sont affichés
2. Au clic sur un membre, une requête est faite pour obtenir ses enfants au premier niveau
3. Au clic sur son enfant, on reproduit le même comportement etc...

Ce comportement permet de gagner en performance en minimisant le traitement nécessaire pour extraire des informations de la base de données et entre dans la philosophie de l'utilisation du NoSQL.

A contrario, il s'avèrera compliqué d'obtenir toute la généalogie en une seule fois.

## Vision alternative - Bis

Le fondement et la philosophie sont similaires à la vision présentée précédemment. Une nuance sera néanmoins portée sur le stockage des informations.

A date, et dans une approche théorique, on peut imaginer la suppression des enfants (champ _"children"_) portés par chaque membre. En effet, la simple présence des parents (champ _"parents"_) suffit à reconsituer une généalogie.

Voici le modèle de données que cela génère :

[Document Mongo - Association hiérarchique V2 Bis](./associationV2.json)

Les constats sont identiques à ceux mentionnés auparavant. Le but ici est uniquement de réduire la quantité de données stockée
