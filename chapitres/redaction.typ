#import "../utils.typ": feature
= Les bases de la Rédaction

Le plus important dans le document, c'est sa structure et son contenu. Nous allons donc commencer par cela.
Dans cette première partie, nous n'allons voir que la syntaxe la plus simple, celle qui ne nécessite pas beaucoup d'explications.

== Les titres
=== sous-titres

Un bon document est un document structuré, avec un plan, et cela commence par avoir des titres à des niveaux différents.

```typst
= Les bases de la Rédaction
...
== Les titres
=== sous-titres
```

Ce code correspond aux premiers éléments de ce plan, sans le texte que j'ai remplacé par ... .
Le symbole *\=* suivi d'un espace est utilisé pour dire : Tout ce qui suit est un titre.
On peut utiliser plusieurs \= comme on peut le voir. Moins il y a de \= et plus le titre est important, il est le parent des titres avec un \= de plus dans le document, jusqu'à ce qu'un autre soit du même niveau que lui.
Avec le décalage des titres et sous-titres (dans le code), on discerne le plan.

#feature[Et la numérotation des titres ?][
En effet, comme tu peux le voir, il n'y a aucun numéro dans le code et pourtant, les titres sont numérotés dans le document.
Je décris la structure de mon document, je ne m'amuse pas à numéroter tous les titres, pour pouvoir réorganiser mon document sans penser à cela.
Je fais confiance à _Typst_ pour appliquer la numérotation suivant une règle que je lui donnerais.
]

== Les Paragraphes

Un simple texte sans saut de ligne apparait comme un paragraphe.
Le texte est par défaut en mode justifié, c'est à dire qu'il constitue un seul bloc qui prend toute la largeur disponible, aligné à gauche et à droite.

Il suffit d'insérer une ligne vide pour écrire un nouveau paragraphe. On peut aller à la ligne entre les phrases de notre paragraphe, mais c'est vraiment la ligne vide qui fait la séparation.

== L'Emphase - Valoriser le texte
Il existe deux niveaux d'emphase(valorisation du texte), qui par défaut seront:
- _italique_
- *gras*

Pour appliquer ces niveaux d'emphase, on va utiliser cela :
```typst
- _italique_
- *gras*
```
Du texte entouré d'underscore(\_) pour le premier niveau, du texte entouré d'astérisques(\*) pour le niveau supérieur.

== Les listes
On peut aussi utiliser des listes pour séparer des idées.

=== Sans numérotation

La liste sans numérotation se fait en commençant une ligne par un tiret(\-):
```typst
- premier item
- deuxième item
```

qui devient :

- premier item
- deuxième item

=== Avec numérotation

Pour obtenir une liste numérotée, on va plutôt utiliser des plus(\+):
```typst
+ premier item
+ deuxième item
```

qui devient :

+ premier item
+ deuxième item

=== Listes imbriquées

Pour imbriquer des listes, qui peuvent avoir plusieurs niveaux il faut utiliser, soit une tabulation, soit des espaces(essayez d'avoir le même nombre pour tous les éléments d'un même niveau).

```typst
- premier parent
    - premier enfant du premier parent
    - deuxième enfant du premier parent
- deuxième parent
 + premier enfant du premier parent
 + deuxième enfant du premier parent
 ```

qui devient :

- premier parent
    - premier enfant du premier parent
    - deuxième enfant du premier parent
- deuxième parent
 + premier enfant du premier parent
 + deuxième enfant du premier parent


== Labels et références<labelsReferences>

Dans notre texte, on peut faire mention d'une partie du document, d'une figure, d'un annexe, d'un élément de bibliographie, etc.
Pour ce faire, nous allons avoir besoin d'un moyen de référencer ces éléments, ainsi qu'un moyen d'y accéder.
J'ai justement utilisé cette technique pour référencer le titre de cette section(@labelsReferences). Voici le code :

```typst
== Labels et références<labelsReferences>

...

J'ai justement utilisé cette technique pour référencer le titre de cette section(@labelsReferences).
```

Nous devons donc d'abord poser un label (une étiquette) à la partie du document qui nous intéresse.
Pour cela, on utilise les chevrons (symboles \< et \>) pour entourer le nom de notre label.

Ensuite, on va créer une référence à ce label dans notre texte en utilisant \@ suivi du nom utilisé précédemment. Typst mettra automatiquement un libellé associé au niveau du titre(comme Chapitre, Section) ou Figure si je référence une figure.

On ne peut poser des labels que sur des éléments numérotés comme les titre des chapitres, section, figures, etc.