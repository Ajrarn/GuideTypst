#import "../utils.typ": feature,warning,typst, LaTeX, exemple, example, tips

= Fonctions standard
La syntaxe _Markup_ ne suffit pas pour produire des documents riches. Dans ce chapitre, nous allons détailler les fonctions standard usuelles, celles que tout le monde doit connaître.

Avant tout, nous allons devoir appeler des fonctions en leur passant des paramètres. Parfois, ces paramètres sont transmis entre parenthèses, parfois entre crochets, parfois on va nommer le paramètre et parfois pas.

Pour l'instant, je n'entrerais pas dans le détail de la bonne façon de passer ces paramètres #footnote[Il y a tout de même une logique à tout ça.], mais les exemples parleront d'eux-même.

== Notes de bas de page

Notre toute première fonction _footnote_ permet d'écrire des notes de bas de page :

#example[Note de bas de page][
  ```typst
  Au lieu d'utiliser des parenthèses #footnote[quand par exemple le texte est particulièrement long et risque de rendre l'interruption de la parenthèse trop importante], on peut utiliser des notes de bas de pages.
  ```
][
  Au lieu d'utiliser des parenthèses #footnote[quand par exemple le texte est particulièrement long et risque de rendre l'interruption de la parenthèse trop importante], on peut utiliser des notes de bas de pages.

  Pour visualiser la note en question, il faut la retrouver en dehors de ce bloc, au bas de la page.
]

Dans cet exemple, on rentre dans le mode _Code_ avec le \#, on appelle la fonction _footnote_ et cette fonction reçoit en paramètre un _content_ (entre crochets).

L'avantage d'utiliser cette fonction est qu'elle fait pour nous un certain nombre de tâches:
- Écrire le texte de l'expression en bas de la page,
- lui associer un label (que l'on ne connaît pas),
- poser une référence à l'emplacement de la fonction. C'est le nombre en indice, il est cliquable et nous renvoie à la note de bas de page.

Les notes de bas de page ont leur propre numérotation qui par défaut court sur tout le document.

== Images
On commence par insérer simplement une image.
J'utilise une image libre de droits @ramen-source.

#example[Image][
```typst
#image("../images/Ramen Photo.jpg")
```
][
#image("../images/Ramen Photo.jpg")
]

Le texte que j'ai mis pour désigner l'image est un chemin relatif à l'emplacement du fichier source. Ici, j'ai un sous-dossier _images_ dans laquelle se trouve celle-ci.

L'image prend tout l'espace disponible, par défaut elle prendra toute la largeur du paragraphe courant, mais on peut restreindre sa largeur :

#example[Image moins large][
  ```typst
  #image("../images/Ramen Photo.jpg", width: 70%)
  ```
][
  #image("../images/Ramen Photo.jpg", width: 70%)
]

La largeur spécifiée _witdh_ est proportionnelle à la largeur totale#footnote[70% de la largeur du bloc courant], mais on aurait pu y écrire une mesure en _cm_ ou en _in_(inches).
On constate également que notre image n'est pas centrée par défaut, elle s'aligne à gauche.

#tips[Paramètres][
  Si on regarde de plus près le passage de paramètre, ici les paramètres sont entre parenthèses, ce ne sont pas des _content_.

  Le premier paramètre n'a pas de nom et le second oui. Pour faire simple, le premier est obligatoire, sans cette valeur, on ne peut pas afficher d'image, le deuxième _width_ fait partie d'un ensemble de paramètres optionnels. Donc, au lieu d'avoir une fonction avec une dizaine de paramètres qu'on n'utilise jamais, c'est plus pratique de les nommer quand on en a besoin.
]

== Tableaux

La syntaxe pour faire des tableaux est assez simple. Voici un exemple pour faire un sirop de citron :

#example[Tableau][
  ```typst
  #table(
    columns: 2,
    [*Ingrédient*], [*Quantité*],
    [Jus de Citron], [250ml],
    [Eau], [500ml], [Sucre], [750g]
  )
  ```
][
  #table(
    columns: 2,
    [*Ingrédient*], [*Quantité*],
    [Jus de Citron], [250ml],
    [Eau], [500ml], [Sucre], [750g]
  )
]

On appelle la fonction _table_ avec un paramètre nommé _column_ (ici avec deux colonnes), suivi d'une liste d'éléments (séparés par des virgules) qu'il va placer dans les cellules du tableau.
On peut les regrouper par ligne du tableau pour une meilleure lisibilité du code, mais ce n'est pas nécessaire comme le montre la dernière ligne.

== Flottants

Quand on rédige un gros document, on va parfois inclure des objets volumineux, un gros tableau, un graphique qui prend toute une page, etc.

Il est d'usage de rendre ces objets flottants #footnote[On laisse le soin à #typst() de le positionner au meilleur endroit possible.]. Mais d'une manière générale, même s'ils ne sont pas si grands, c'est bien d'utiliser des flottants.

Ces flottants gagnent également la possibilité d'être numérotés et donc de porter une référence.
On pourra ensuite faire un index des images, des tableaux, ... mais surtout utiliser un label dans notre texte puisque l'on n'est pas sûr de l'emplacement final du flottant.

Pour information, les blocs _Exemple_ et _Astuce_ sont des flottants.

Donc, la fonction idéale pour cela est _figure_ :

#example[Image dans une figure][
  ```typst
  Ce texte est écrit avant la figure et pourtant il apparaît après.
  #figure(
    image("../images/Ramen Photo.jpg", width: 70%),
    caption: [
      les _Ramen_, un incontournable de la cuisine japonaise.
    ],
    placement: top
  )<ramen>
  ```
][
  Ce texte est écrit avant la figure et pourtant il apparaît après.
  #figure(
    image("../images/Ramen Photo.jpg", width: 70%),
    caption: [
      les _Ramen_, un incontournable de la cuisine japonaise.
    ],
    placement: top
  )<ramen>
]



On peut voir que :
- le code commence bien par un *\#*,
- on appelle la fonction _figure_
- le premier paramètre obligatoire de la fonction reçoit une autre fonction, la fonction _image_ (pour laquelle on n'utilise pas de *\#* car cet appel est inclus dans le bloc de code),
- Il y a un deuxième paramètre _caption_ qui accepte une expression (un bloc de texte) entre crochets.
- Et j'ai rajouté ici la propriété _placement_ avec la valeur _top_ pour visualiser le côté flottant.


Le résultat est une figure avec un titre (_caption_) et un numéro séquentiel (chaque figure aura un numéro différent). On peut noter que j'ai également ajouté un label que l'on peut référencer (@ramen).

Concernant le positionnement, la propriété _placement_ joue un rôle :
- Si je ne spécifie rien, il va juste positionner le flottant en essayant de conserver l'ensemble sur la même page. Donc s'il n'y a plus assez de place, la figure ira à la page suivante.
- Si je met la valeur _top_, il va mettre la figure en haut du bloc courant#footnote[La page habituellement.].
- Si je met la valeur _bottom_, il va mettre la figure en bas du bloc courant.

Regardons maintenant un tableau dans une figure :


#example[Tableau dans une figure][
  ```typst
#figure(
  table(
    columns: 2,
    [*Ingrédient*], [*Quantité*],
    [Jus de Citron], [250ml],
    [Eau], [500ml], [Sucre], [750g]
  ),
  caption: [Recette du sirop de Citron]
)
```
][
  #figure(
  table(
    columns: 2,
    [*Ingrédient*], [*Quantité*],
    [Jus de Citron], [250ml],
    [Eau], [500ml], [Sucre], [750g]
  ),
  caption: [Recette du sirop de Citron]
)<sirop>
]



Ce qu'il est intéressant de noter, c'est que la fonction _figure_ fait la différence entre une image et un tableau :
- pour l'image on peut lire "Fig." suivi d'un numéro, de ". -" et de _caption_ ,
- pour le tableau "Tableau", suivi d'un numéro suivi de ". -" et de _caption_.
Elle fait également cette distinction pour le code.
Et comme elle fait cette distinction, elle utilise des compteurs séparés pour la numérotation.

Dernier point à savoir, on peut ajouter des nouveaux types "reconnus" par la fonction _figure_, en l'occurrence _Remarque_ et _Exemple_ sont des types personnalisé, avec leur propre numérotation, mais on verra cela plus loin.



== Bibliographie

Pour ajouter une bibliographie, il faut tout d'abord la rédiger. Pour cela, le format préféré de #typst() est le format _Hayagriva_@hayagriva, mais vous pouvez également utiliser le format _bib_ de #LaTeX.
J'ai donc préparé un fichier appelé bibliographie.yml et qui contient pour l'instant :

#figure(
    caption: [bibliographie.yml],
    ```yaml
    ramen-source:
      type: Web
      title: White Scoop on White Ceramic Bowl
      author: Quang Anh Ha Nguyen
      url: https://www.pexels.com/photo/white-scoop-on-white-ceramic-bowl-884600/
    haragriva:
      type: Web
      title: Hayagriva
      author: Typst
      url: https://github.com/typst/hayagriva/blob/main/docs/file-format.md
    ```
)

A la fin de mon document, je vais afficher ma bibliographie :

```typst
#bibliography("bibliographie.yml")
```

Et je peux ensuite utiliser les entrées de celle-ci comme référence :

```typst
@hayagriva
```
Pour qu'apparaisse un numéro entre crochets référençant l'objet mentionné (livre, article, url, ...)

== Du code source
#typst() permet d'afficher du code source en respectant les indentations et surtout sans interpréter le code que l'on souhaite afficher :

#raw(lang: "typst", block: true, "
```typst
#bibliography(\"bibliographie.yml\")
```
".trim())

J'ai repris ici ce qui m'a permis d'afficher le bloc de code concernant la bibliographie. Donc, avant le texte que je veux afficher comme comme code, il y a une première ligne avec trois backticks (\`) suivi du nom du langage et après, on ferme le bloc avec trois backticks.

#tips[codly][Par défaut les blocs de code ne s'affichent pas comme vous le voyez ici. J'utilise un package appelé _codly_ qui permet d'améliorer l'affichage des blocs de code avec notamment la petite pastille à droite pour indiquer le langage. Je vous explique un peu plus loin comment utiliser ce package (cf. @codly).]