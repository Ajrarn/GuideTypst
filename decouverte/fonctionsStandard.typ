#import "../utils.typ": feature,warning,typst, LaTeX, exemple, example, tips

== Fonctions standard
La syntaxe _Markup_ ne suffit pas pour produire des documents riches. Dans ce chapitre, nous allons détailler les fonctions standard usuelles, celles que tout le monde doit connaître.

Avant tout, nous allons devoir appeler des fonctions en leur passant des paramètres. Parfois, ces paramètres sont transmis entre parenthèses, parfois entre crochets, parfois on va nommer le paramètre et parfois pas.

Pour l'instant, je n'entrerais pas dans le détail de la bonne façon de passer ces paramètres #footnote[Il y a tout de même une logique à tout ça.], mais les exemples parleront d'eux-même.

=== Notes de bas de page
Au lieu d'utiliser des parenthèses #footnote[quand par exemple le texte est particulièrement long et risque de rendre l'interruption de la parenthèse trop importante], on peut utiliser des notes de bas de pages :

```typst
Au lieu d'utiliser des parenthèses #footnote[quand par exemple le texte est particulièrement long et risque de rendre l'interruption de la parenthèse trop importante], on peut utiliser des notes de bas de pages :
```

#feature[Premier exemple d'utilisation d'une fonction][À partir de maintenant, nous allons appeler explicitement des fonctions. _footnote_ est une fonction qui accepte un paramètre en entrée de type _content_, le paramètre entre crochets( [ et ]). Nous verrons plus loin pourquoi je précise _explicitement_. Pour que #typst() comprenne que l'on souhaite utiliser une fonction, que ce n'est pas un simple texte, on doit utiliser le préfixe \#.]

L'avantage d'utiliser cette fonction est qu'elle fait pour nous un certain nombre de tâches:
- Écrire le texte de l'expression en bas de la page,
- lui associer un label (que l'on ne connaît pas),
- poser une référence à l'emplacement de la fonction. C'est le 1 en indice, il est cliquable et nous renvoie à la note de bas de page.


=== Images et Figures

==== Images
On commence par insérer simplement une image.
J'utilise une image libre de droits @ramen-source

```typst
#image("../images/Ramen Photo.jpg")
```

qui devient :

#image("../images/Ramen Photo.jpg")

On peut voir que la largeur de la photo est celle des paragraphes, câd toute la largeur disponible dans les marges de la page.
Le texte que j'ai mis pour désigner l'image est un chemin relatif à l'emplacement du fichier source. Ici, j'ai un sous-dossier _images_ dans laquelle se trouve celle-ci, qui se situe dans le même dossier que mon fichier source.

On peut restreindre la largeur en ajoutant un deuxième paramètre :

```typst
#image("../images/Ramen Photo.jpg", width: 70%)
```
qui devient :

#image("../images/Ramen Photo.jpg", width: 70%)

La largeur spécifiée est proportionnelle à la largeur totale#footnote[70% de la largeur du bloc courant, ici l'équivalent d'un paragraphe], mais on aurait pu y écrire une mesure en _cm_ ou en _in_(inches).
On constate également que notre image n'est pas centrée par défaut, elle s'aligne à gauche.

==== Figures

Voyons maintenant comment inclure une image dans une figure :

```typst
#figure(
  image("../images/Ramen Photo.jpg", width: 70%),
  caption: [
    les _Ramen_, un incontournable de la cuisine japonaise.
  ]
)<ramen>
```

On peut voir que :
- le bloc de code commence bien par un *\#*,
- on appelle la fonction _figure_
- le premier paramètre obligatoire de la fonction reçoit une autre fonction, la fonction _image_ (pour laquelle on n'utilise pas de *\#* car cet appel est inclus dans le bloc de code),
- Il y a un deuxième paramètre _caption_ qui accepte une expression (un bloc de texte) entre crochets.


#figure(
  image("../images/Ramen Photo.jpg", width: 70%),
  caption: [
    les _Ramen_, un incontournable de la cuisine japonaise.
  ]
)<ramen>

Le résultat est une figure avec un titre (_caption_) et un numéro séquentiel (chaque figure aura un numéro différent). On peut noter que j'ai également ajouté un label que lon peut référencer (@ramen).

=== Les Tableaux

La syntaxe pour faire des tableaux est assez simple. Voici un exemple pour faire un sirop de citron:

```typst
#table(
  columns: 2,
  [*Ingrédient*], [*Quantité*],
  [Jus de Citron], [250ml],
  [Eau], [500ml], [Sucre], [750g]
)
```

ce qui nous donne :

#table(
  columns: 2,
  [*Ingrédient*], [*Quantité*],
  [Jus de Citron], [250ml],
  [Eau], [500ml], [Sucre], [750g]
)

On appelle la fonction _table_ avec un paramètre nommé _column_ (ici avec deux colonnes), suivi d'une liste d'éléments (séparés par des virgules) qu'il va placer dans les cellules du tableau.
On peut les regrouper par ligne du tableau pour une meilleure lisibilité du code, mais ce n'est pas nécessaire comme le montre la dernière ligne.

On peut également mettre notre tableau dans une figure, comme on l'a fait pour l'image :

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

nous donne le @sirop.

#figure(
  table(
    columns: 2,
    [*Ingrédient*], [*Quantité*],
    [Jus de Citron], [250ml],
    [Eau], [500ml], [Sucre], [750g]
  ),
  caption: [Recette du sirop de Citron]
)<sirop>

#feature[Titre de figure][
 Ce qu'il est intéressant de noter, c'est que la fonction _figure_ fait la différence entre une image et un tableau :
  - pour l'image on peut lire "Fig." suivi d'un numéro, de ". -" et de _caption_ ,
  - pour le tableau "Tableau", suivi d'un numéro suivi de ". -" et de _caption_.
  Elle fait également cette distinction pour le code.
  Et comme elle fait cette distinction, elle utilise des compteurs séparés pour la numérotation.
]




=== Bibliographie

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

=== Du code source
#typst() permet d'afficher du code source en respectant les indentations et surtout sans interpréter le code que l'on souhaite afficher :

#raw(lang: "typst", block: true, "
```typst
#bibliography(\"bibliographie.yml\")
```
".trim())

J'ai repris ici ce qui m'a permis d'afficher le bloc de code concernant la bibliographie. Donc, avant le texte que je veux afficher comme comme code, il y a une première ligne avec trois backticks (\`) suivi du nom du langage et après, on ferme le bloc avec trois backticks.

#feature[codly][Par défaut les blocs de code ne s'affichent pas comme vous le voyez ici. J'utilise un package appelé _codly_ qui permet d'améliorer l'affichage des blocs de code avec notamment la petite pastille à droite pour indiquer le langage. Je vous explique un peu plus loin comment utiliser ce package (cf. @codly).]