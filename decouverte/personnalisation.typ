#import "../utils.typ": *
#import "../template.typ": primary-color, accent-color

= Set Rules

On va maintenant voir comment personnaliser nos documents avec les _set rules_ et les _element_functions_.

== Derrière le _Markup_

Le _Markup_ nous apporte le confort de ne pas utiliser des fonctions en permanence pour écrire notre texte, mais ce qu'il fait au fond, c'est utiliser des fonctions natives de #typst(). Par exemple :

#example[Texte en fonction][
  ```typst
  Mon texte avec de l'_italique_ et du *gras*. 
  
  #text[Mon texte avec de l']#text(style: "italic")[italique]#text[ et du ]#text(weight: "bold")[gras]#text[.]
  ```
][
  Mon texte avec de l'_italique_ et du *gras*. 
  
  #text[Mon texte avec de l']#text(style: "italic")[italique]#text[ et du ]#text(weight: "bold")[gras]#text[.]
]

Ces deux lignes de code produisent le même résultat, Et la deuxième est très difficile à lire. Pourtant c'est bien ce qui se passe derrière le rideau : Le _Markup_ est transformé en du code équivalent.

_text_ est une fonction particulière, c'est une _element function_, il y en a d'autres, et c'est en manipulant ces fonctions que l'on va pouvoir personnaliser notre document :

/ text : pour le texte d'une manière générale
/ par : pour les paragraphes
/ page : pour la page
/ list : pour les listes

Donc, si on peut modifier les réglages d'une de ses fonctions, on sait que cela s'appliquera à l'ensemble du document et c'est tout l'intérêt d'utiliser un traitement de texte comme #typst(). On peut réaliser une mise en page basée sur des règles qui s'appliquent partout.

#pagebreak()

== Des réglages avec les _set rules_

La fonction _set_ est très puissante, elle permet d'affecter une valeur à une _element function_ jusqu'à nouvel ordre.
Expliquons là avec un exemple.

#example[set rules][
  ```typst
  #text[Texte en noir]
  #set text(fill:blue)
  #text[Texte en bleu]
  #text[Texte en bleu aussi]
  #set text(fill:red)
  #text[Texte en rouge]

  #set text(fill:black)
  Texte en noir,
  #set text(fill:blue)
  Texte en bleu,
  Texte en bleu aussi,
  #set text(fill:red)
  Texte en rouge
  ```
][
  #text[Texte en noir,]
  #set text(fill:blue)
  #text[Texte en bleu,]
  #text[Texte en bleu aussi,]
  #set text(fill:red)
  #text[Texte en rouge]

  #set text(fill:black)
  Texte en noir,
  #set text(fill:blue)
  Texte en bleu,
  Texte en bleu aussi,
  #set text(fill:red)
  Texte en rouge
]

J'ai utilisé la fonction _text_ de #typst() qui affiche du texte#footnote[Elle fait partie des _element function_ fournies par #typst(). C'est elle qui est appelée pour tout affichage de texte, même quand nous, nous écrivons en mode _Markup_]. Pour les deux textes en bleu, je ne voulais pas écrire :
```typst 
#text(fill:blue)[Texte en bleu]
#text(fill:blue)[Texte en bleu aussi]
```
J'ai donc fixé la valeur pour les appels successifs avec la fonction _set_ et en donnant à _fill_ la valeur _blue_.

#tips[Les propriétés conservent le même réglage jusqu'à nouvel ordre][
  Dans l'exemple précédent, le code a été exécuté dans un bloc, ce qui a limité la portée des changements au bloc lui même. Si j'avais écrit :
  ```typst
  #set text(fill:red)
  ```
  en dehors d'un bloc, *TOUT* le texte du document après cette ligne serait devenue rouge. Donc, n'utilisez _set_ que pour des propriétés que vous souhaitez apporter au document dans son ensemble. Pour colorer le texte, on pourra faire autrement.
]

Nous allons maintenant explorer quelques _element function_ avec leurs paramètres, mais pas de manière exhaustive. Pour tout explorer en détail, je conseille de parcourir la documentation officielle @typst-documentation.

== Le texte

Voici ce que j'ai mis pour ce document :

```typst 
#set text(
  font: "New Computer Modern",
  lang: "fr"
)
```
J'ai simplement choisi une police de caractère différente de la police par défaut et défini le langage à français.
Il existe beaucoup de propriétés@typs-doc-text que l'on utilisera principalement dans des fonctions utilitaires et plus rarement pour un réglage global, mais je pense que l'on peut s'attarder sur certaines d'entre elles :

#my-table(
  columns: 4,
  caption: [Propriétés importantes de _text_],

  table.cell(text(fill: white, weight: "bold")[Propriété]),
    table.cell(text(fill: white, weight: "bold")[Description]),
    table.cell(text(fill: white, weight: "bold")[Valeur par défaut]),
    table.cell(text(fill: white, weight: "bold")[Valeurs possibles]),

    // Lignes de données
    [font], [Police de caractères], ["libertinus serif"],
    [Dans l'application web, la liste des polices est proposée dans l'éditeur. Sur votre système la commande _typst fonts_ vous affiche la liste],

    [lang], [Langage], ["en"], [Codes ISO des langages],

    [size], [Taille de police de référence], [11pt], [Une valeur en pt],

    [fill], [Couleur du texte], [luma(0%)], [Une description de couleur],

    [weight], [Graisse des caractères], ["regular"],
    ["thin", "extralight", "light", "regular", "medium", "semibold", "bold", "extrabold", "black"],
)



== Les paragraphes

Voici ce que j'ai mis ici :
```typst
#set par(
  justify: true,
  first-line-indent: (amount: 2em, all: true),
  leading: 0.52em,
)
```

Mes paragraphes sont justifiés à gauche et à droite. Il y a une indentation pour la première ligne du paragraphe d'une valeur de _2em_#footnote[Deux fois la taille de la police courante]. L'espacement entre le bas d'une ligne de caractère et le haut de la suivante est de _0.52em_. Pour des réglages plus subtils, je vous invite à lire la documentation officielle @typs-doc-par.

#tips[Indentation et Titres][
  Quand on modifie l'indentation de la première ligne d'un paragraphe, elle s'applique également aux titres.
  Donc, vous devrez certainement re-spécifier cette valeur dans le rendu des titres.
]

== Les titres



== Les listes à puces
== Les énumérations
== Les descriptions

== Les Tableaux

Le code de l'exemple suivant est celui utilisé dans ce document. La seule chose qui chance c'est la couleur de base.

#example[Set Rule pour un tableau][
  ```typst
  #let my-color = green.darken(40%)

  #set table(
    fill: (col, row) => {
      if row == 0 { my-color }
      else if calc.odd(row) { my-color.lighten(80%) }
      else { white }
    },
    stroke: (paint: my-color.lighten(60%), thickness: 0.5pt),
    inset: (x: 6pt, y: 6pt),
    align: (col, row) => if row == 0 { center } else { left }
  )

  // show rule
  #show table.cell: set text(size:0.9em)
  #show table.cell.where(y: 0): set text(weight: "bold", fill: white)

  #table(
    columns: 2,
    table.header[Ingrédient][Quantité],
    [Jus de Citron], [250ml],
    [Eau], [500ml], [Sucre], [750g]
  )
  ```
][
  #let my-color = green.darken(40%)

  #set table(
    fill: (col, row) => {
      if row == 0 { my-color }
      else if calc.odd(row) { my-color.lighten(80%) }
      else { white }
    },
    stroke: (paint: my-color.lighten(60%), thickness: 0.5pt),
    inset: (x: 6pt, y: 6pt),
    align: (col, row) => if row == 0 { center } else { left }
  )

  // show rule
  #show table.cell: set text(size:0.9em)
  #show table.cell.where(y: 0): set text(weight: "bold", fill: white)

  #table(
    columns: 2,
    table.header[Ingrédient][Quantité],
    [Jus de Citron], [250ml],
    [Eau], [500ml], [Sucre], [750g]
  )
]















== La page

Ces réglages son également très importants, on va pouvoir définir la taille du papier, son orientation, les marges, etc.

Voici mes propres réglages :

```typst
#set page(
  paper: "a4",
  margin: (inside: 2.5cm, outside: 1.5cm, y: 2cm),
  numbering: "1"
)
```

/ paper : détermine la taille du papier,
/ margin : permet de configurer les marges,
/ numbering: définit le type de numérotation

== Le document

Il en reste un qui est invisible, mais qui reste important, c'est le document lui-même.

Sur celui-ci, nous allons simplement poser des méta-données qui seront dans le PDF lui-même. Propriétés utiles notamment en terme d'accessibilité.

```typst
#set document(
  title: [Mon Titre],
  author: "Moi",
  description: [C'est ou ouvrage qui parle de moi.],
  keywords: ("moi","ma vie", "mes succès"),
  date: auto,
)
```
