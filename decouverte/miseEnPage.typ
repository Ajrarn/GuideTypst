#import "../utils.typ": feature

== Mise en Page

=== Avant goùt
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

#feature[Est-ce qu'on peut modifier ainsi tous les paramètres de ces fonctions ?][
Non. Mais pour connaître ceux que l'on peut manipuler, il faut aller voir la documentation, comme ici @ref-document.
Ceux pour lesquels on voit l'attribut settable sont modifiables
]

Voici les autres réglages appliqués à ce document :
```typst
#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
  numbering: "1"
)
#set par(
  justify: true,
  leading: 0.52em,
)
#set heading(numbering: "1.")
```

=== Personnalisation dans le détail

==== Document

la fonction document a les paramètres suivants :

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Propriété*], [*Valeurs acceptées*], [*Valeur par défaut*],
  ),
  [*title*], [_none_ ou _content_], [_none_],
  [*author*], [_string_ ou _array_], [()],
  [*description*], [_none_ ou _content_], [_none_],
  [*keywords*], [_string_ ou _array_], [()],
  [*title*], [_none_ ou _auto_ ou _datetime_], [_auto_],
)

que l'on peut définir comme on l'a vu :

```typst
#set document(
  title: "Guide Typst",
  author: "Christophe Dos Santos",
  description: "Un petit guide en français sur l'utilisation de Typst",
  keywords: ("Typst","Guide","Français")
)
```

#feature[_array_ ?][
On peut voir ici un nouveau type de données, le type _array_. C'est une liste d'un type de données particulier, ici notre liste contiendra des _string_.
On peut voir la syntaxe permettant de définir une liste pour le paramètre _keywords_. La liste est définie par des parenthèse contenant ses éléments séparés par des virgules.
]