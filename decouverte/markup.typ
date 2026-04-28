#import "../utils.typ": feature,warning,typst, LaTeX, exemple, example, tips

== Markup

La syntaxe que nous allons voir maintenant est celle des _content_ : le _Markup_


=== Les Paragraphes

Un simple texte sans saut de ligne apparaît comme un paragraphe.
Le texte est par défaut en mode justifié, c'est à dire qu'il constitue un seul bloc qui prend toute la largeur disponible, aligné à gauche et à droite.

Il suffit d'insérer une ligne vide pour écrire un nouveau paragraphe. On peut aller à la ligne entre les phrases de notre paragraphe, mais c'est vraiment la ligne vide qui fait la séparation.

=== L'Emphase - Valoriser le texte
Il existe deux niveaux d'emphase(valorisation du texte), qui par défaut seront:
- _emphase_
- *gras*

Du texte entouré d'underscore(\_) pour l'emphase, du texte entouré d'astérisques(\*) pour le gras.

Pour bien comprendre ce qu'est l'emphase, voici un exemple avec du texte normal et du texte en italique.

#example[Emphase][
  ```typst
  Texte normal avec une _emphase_ et du *gras*

  #text(style: "italic")[Texte en italique avec une _emphase_ et du *gras*]
  ```
][
  Texte normal avec une _emphase_ et du *gras*

  #text(style: "italic")[Texte en italique avec une _emphase_ et du *gras*]
]

Quand le texte global est normal, l'emphase met les mots sélectionnés en italique. Quand le texte global est en italique, les mots sélectionnés sont en normal. L'emphase sert à mettre l'accent sur une suite de mots, un accent léger.

Pour accentuer davantage, on peut utiliser le gras qui ne change pas le style du texte.


=== Les titres

#example[Niveau de titres][
  ```typst
  = Dans le petit bassin
  ...
  == Markup
  ...
  === Les titres
  ```
][
  Ici exceptionnellement je ne pourrais pas illustrer l'exemple, mais cela correspond à la structure menant à cette section. On voit le titre de la partie, du chapitre et de la section
]

Le symbole *\=* suivi d'un espace est utilisé pour dire : Le reste de la ligne est un titre.
On peut utiliser plusieurs \= comme on peut le voir. Moins il y a de \= et plus le titre est important,
Avec le décalage des titres et sous-titres (dans le code), on discerne le plan.

#tips[La numérotation des titres][
  Comme on peut le voir, il n'y a aucun numéro dans le code et pourtant, les titres sont numérotés dans le document.
  Je décris la structure de mon document, je ne m'amuse pas à numéroter tous les titres.
  Je fais confiance à #typst() pour appliquer la numérotation suivant une règle que je lui donnerais.
]

=== Listes sans numérotation ou listes à puces

La liste sans numérotation se fait en commençant une ligne par un tiret(\-) suivi d'un espace.

#example[Liste à puce][
  ```typst
- premier item
- deuxième item 
  ```
][
  - premier item
- deuxième item
]


=== Listes avec numérotation ou énumerations

Pour obtenir une liste numérotée, on va plutôt utiliser des plus(\+):

#example[Énumérations][
  ```typst
  + premier item
  + deuxième item
  ```
][
  + premier item
  + deuxième item
]

Là encore, on ne numérote pas nous même, c'est automatique.

=== Listes de descriptions

On commence la ligne par un \/ suivi d'un espace, du titre de la description, suivi de : et enfin de la description.

#example[Liste de descriptions][
  ```typst
/ Description 1: première description
/ Terme 2: description du deuxième terme 
  ```
][
  / Description 1: première description
  / Terme 2: description du deuxième terme
]

=== Listes imbriquées

Pour imbriquer des listes, qui peuvent avoir plusieurs niveaux il faut utiliser, soit une tabulation, soit des espaces #footnote[essayez d'avoir le même nombre pour tous les éléments d'un même niveau].

#example[Listes imbriquées][
  ```typst
  - premier parent
      - premier enfant du premier parent
      - deuxième enfant du premier parent
  - deuxième parent
      + premier enfant du deuxième parent
      + deuxième enfant du deuxième parent
 ```
][
  - premier parent
      - premier enfant du premier parent
      - deuxième enfant du premier parent
  - deuxième parent
      + premier enfant du deuxième parent
      + deuxième enfant du deuxième parent
]


=== Labels et références<labelsReferences>

Dans notre texte, on peut faire mention d'une partie du document, d'une figure, d'un annexe, d'un élément de bibliographie, etc.
Pour ce faire, nous allons avoir besoin d'un moyen de poser une un marque-page que l'on va appeler un label et nous allons le référencer ailleurs.

#example[Labels et Références][
  ```typst
  == Labels et références<labelsReferences>
  ...
  J'ai justement utilisé cette technique pour référencer le titre de ce chapitre(cf. @labelsReferences).
  ```
][
  J'ai justement utilisé cette technique pour référencer le titre de cette section(cf. @labelsReferences).
]

Nous devons donc d'abord poser un label#footnote[une étiquette] à la partie du document qui nous intéresse.
Pour cela, on utilise les symboles \< et \> pour entourer le nom de notre label.

Ensuite, on va faire référence à ce label dans notre texte en utilisant \@ suivi du nom utilisé précédemment. #typst() mettra automatiquement un libellé associé au niveau du titre#footnote[comme Chapitre, Section] ou Figure si je référence une figure.

#tips[Où poser des labels ?][On ne peut poser des labels que sur des éléments numérotés comme les titre des chapitres, section, figures, etc.]
