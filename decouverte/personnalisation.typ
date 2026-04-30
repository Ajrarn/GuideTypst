#import "../utils.typ": *

= Personnalisation

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
...


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

Voici ce que j'ai mis pour ce document

```typst 
#set text(
  font: "New Computer Modern",
  lang: "fr"
)
```
J'ai simplement choisi une police de caractère différente de la police par défaut et défini le langage à français.
Il existe beaucoup de propriétés@typs-doc-text que l'on utilisera principalement dans des fonctions utilitaires et plus rarement pour un réglage global, mais je pense que l'on peut s'attarder sur certaines d'entre elles :

#figure(
  table(
    columns: 4,
    [*Propriété*], [*Description*], [*Valeur par défaut*], [*Valeurs possibles*],
    [font], [Police de caractères],["libertinus serif"],[Dans l'application web, la liste des polices est proposée dans l'éditeur. Sur votre système la commande _typst fonts_ vous affiche la liste],
    [lang], [Langage],["en"],[Codes Iso des langages],
    [size], [Taille de police de référence],[11pt],[Une valeur en pt],
    [fill],[Couleur du texte],[luma(0%)],[une description de couleur],
    [weight],[Graisse des caractères],["regular"],["thin", "extralight", "light", "regular", "medium", "semibold", "bold", "extrabold", "black"],
  ),
  caption: [Propriétés importantes de _text_]
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

Mes paragraphes sont justifiés à gauche et à droite. Il y a une indentation pour la première ligne du paragraphe d'une valeur de _2em_#footnote[Deux fois la taille de la police courante]. L'espacement entre le bas d'une ligne de caractère et le haut de la suivante est de _0.52em_. 

== Les titres
== La page