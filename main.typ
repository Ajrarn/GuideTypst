
// --------------- Imports de modules
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()

#codly(
	languages: codly-languages,
	number-format: none
)

#import "@preview/frame-it:1.2.0": *

#let (example, feature, variant, syntax) = frames(
  feature: ("Fonctionnalité", rgb("ADD8E6")),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  example: ("Exemple", gray),
  // You can add as many as you want
  syntax: ("Syntax",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)

// --------------- Personnalisation du document
#set text(
  font: "New Computer Modern",
  lang: "fr"
)

#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
  numbering: "1"
)

#set par(
  justify: true,
  leading: 0.52em,
)

#set heading(numbering: "1.1.1")


// --------------- Contenu

= Rédaction

== Paragraphes

Un simple texte sans saut de ligne apparait comme un paragraphe.
Le texte est par défaut en mode justifié, câd qu'il constitue un seul bloc qui prend toute la largeur disponible, aligné à gauche et à droite.

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

== Des listes
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


== Notes de bas de page
Au lieu d'utiliser des parenthèses #footnote[quand par exemple le texte est particulièrement long et risque de rendre l'interruption de la parenthèse trop importante], on peut utiliser des notes de bas de pages :

```typst
Au lieu d'utiliser des parenthèses #footnote[quand par exemple le texte est particulièrement long et risque de rendre l'interruption de la parenthèse trop importante], on peut utiliser des notes de bas de pages :
```

#feature[Fonctions][
  Cette instruction introduit un nouveau concept, l'usage d'une *fonction* :
    - *\#* signifie que l'on commence un bloc de code
    - ensuite il y a le nom de la fonction appelée, ici _footnote_.
    - On peut remarquer également qu'il y a une expression entre crochets (\[ et \])
]

L'avantage d'utiliser cette fonction est qu'elle fait pour nous un certain nombre de tâches:
- Ecrire le texte de l'expression en bas de la page,
- lui associer un label (que l'on ne connait pas),
- poser une référence à l'emplacement de la fonction.

#feature[Qu'est-ce qu'une expression ?][
  C'est un bloc de texte contenant des instructions, comme par exemple des mots avec emphase, des appels de fonction, etc...
    L'expression sera évaluée, transformée. Elle n'est pas figée comme  une chaîne de caractères.
]


== Images et Figures

=== Images
On commence par insérer simplement une image.
J'utilise une image libre de droits @ramen-source

```typst
#image("images/Ramen Photo Overleaf.jpg")
```

qui devient :

#image("images/Ramen Photo.jpg")

On peut voir que la largeur de la photo est celle des paragraphes, câd toute la largeur disponible dans les marges de la page.
Le texte que j'ai mis pour désigner l'image est un chemin relatif au fichier source. Ici, j'ai un sous-dosssier images dans laquelle se trouve celle-ci.

On peut restreindre la largeur en ajoutant un deuxième paramètre :

```typst
#image("images/Ramen Photo.jpg", width: 70%)
```
qui devient :

#image("images/Ramen Photo.jpg", width: 70%)

La largeur spécifiée est proportionnelle à la largeur totale (70% de cette dernière), mais on aurait pu y écrire une mesure en _cm_ ou en _in_(inches).
On constate également que notre image n'est pas centrée par défaut, elle s'aligne à gauche.

#feature[Fonctions bis][
  On utilise encore une *fonction* cette fois-ci, c'est la fonction _image_.
    - entre parenthèses les paramètres qu'elle accepte. On peut remarquer également qu'il y a :
     - un paramètre nommé _width_ qui est optionnel,
     - le premier paramètre qui n'est pas nommé et qui n'est pas optionnel,
     - enfin le premier paramètre reçoit une chaine de caractères, elle est donc entourée de guillemets.
]

#feature[Parenthèses ou crochets ?][
  C'est à n'y rien comprendre pour _footnote_ on utilise des crochets, pour _image_ des parenthèses.
    Les crochets sont utilisés quand le paramètre attendu est une expression, sinon on utilise des parenthèses.
]

=== Figures

Voyons maintenant comment inclure une image dans une figure :

```typst
#figure(
  image("images/Ramen Photo.jpg", width: 70%),
  caption: [
    les _Ramen_, un incontournable de la cuisine japonaise.
  ]
)
```

On peut voir que :
- le bloc de code commence bien par un *\#*,
- on appelle la fonction _figure_
- le premier paramètre obligatoire de la fonction reçoit une autre fonction, la fonction _image_ (pour laquelle on n'utilise pas de *\#* car cet appel est inclus dans le bloc de code),
- Il y a un deuxième paramètre _caption_ qui accepte une expression (un bloc de texte) entre crochets.


#figure(
  image("images/Ramen Photo.jpg", width: 70%),
  caption: [
    les _Ramen_, un incontournable de la cuisine japonaise.
  ]
)<ramen>

Le résultat est une figure avec un titre (_caption_) et un numéro séquentiel (chaque figure aura un numéro différent). On peut noter que j'ai également ajouté un label que lon peut référencer (@ramen).

== Bibliographie

Pour ajouter une bibliographie, il faut tout d'abord la rédiger. Pour cela, le format préféré de Typst est le format Hayagriva @hayagriva, mais vous pouvez également utiliser le format bib de LaTeX.
J'ai donc préparé un fichier appelé bibliographie.yml et qui contient pour l'instant :

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

A la fin de mon document, je vais mettre ma bibliographie :

```typst
#bibliography("bibliographie.yml")
```

Et je peux ensuite utiliser les entrées de celle-ci comme référence :

```typst
@hayagriva
```
Pour qu'apparaisse un numéro de référence entre crochets référençant l'objet mentionné (livre, article, url, ...)

== Formules Mathématiques

A l'instar de LaTeX, Typst permet de rédiger et de mettre en valeur des formules mathématiques.

Mettons par exemple la formule de la surface d'un cercle $S = pi r^2$ :

```typst
Mettons par exemple la formule de la surface d'un cercle $S = pi r^2$ :
```

Dans cet exemple, la formule est appliquée en ligne, elle fait partie du paragraphe en cours.
Si on veut la séparer, il suffit d'encadrer la formule d'espaces entre les \$. $ S = pi r^2 $ Comme on peut le voir ici :

```typst
Si on veut la séparer, il suffit d'encadrer la formule d'espaces entre les \$. $ S = pi r^2 $ Comme on peut le voir ici:
```

= Mise en Page

== Premier aperçu
```typst
#text(font: "Times New Roman")[
  Un petit peu de texte pour lequel on change la police pour la mettre en _Times New Roman_.
]
```

nous donne ceci :

#text(font: "Times New Roman")[
  Un petit peu de texte pour lequel on change la police pour la mettre en _Times New Roman_.
]

Le problème de cette approche est qu'elle nous oblige à écrire cela pour tout notre texte, ou inclure tout le document dans l'appel de la fonction _text_.

On peut résoudre ce problème comme ceci:

```typst
#set text(
  font: "New Computer Modern",
  lang: "fr"
)
```
Je l'ai utilisé pour cet ouvrage. La fonction _set_ permet d'appliquer à la fonction _text_ des valeurs par défaut, ici la valeur de font (police de caractères en anglais), ainsi que la langue du texte en français.
Ce qui fait qu'à chaque fois que Typst fait appel à la fonction _text_, il applique le paramètre fourni comme on peut le voir dans l'exemple précédent et s'il n'y en a pas, il utilise le paramètre par défaut.

#feature[Mais pourquoi cela s'applique à tout le document ?][
  Effectivement, je n'ai pas écrit d'appel à _text_ en dehors de l'exemple.
  Mais cette fonction est appelée à chaque fois que _Typst_ souhaite transformer une expression _texte_ en objet du document produit.
  Et c'est le cas pour tous les types d'objets, ils ont tous des fonctions associées :
  - _heading_ pour les titres,
  - _page_ pour les pages,
  - _par_ pour les paragraphes,
  - ...
]

Voici les autres réglages appliqués à ce document :
```typst
#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
)
#set par(
  justify: true,
  leading: 0.52em,
)
#set heading(numbering: "1.1.1")
```


#bibliography("bibliographie.yml")







