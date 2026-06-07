#import "../utils.typ": typst, LaTeX, exemple, example, tips

= Modes syntaxiques<modesSyntaxiques>
 #typst() gère trois syntaxes différentes que l'on va appeler modes syntaxiques :

/ Markup : Par défaut un document _.typ_ contient un _content_#footnote[J'emploie ce terme en anglais à dessein, c'est un type de données officiel de #typst() dont le contenu est décrit en _Markup_.] dont le langage est le _Markup_. C'est tout simplement du texte dans lequel certains caractères signifient quelque chose en terme de mise en page.
/ Math : C'est celui permet de faire les rendus des formules mathématiques.
/ Code : C'est celui qui va nous permettre d'écrire du code personnalisé.

== Passer d'un mode à l'autre

Comme dit plus haut le mode par défaut est le mode _Markup_. On va donc devoir entrer et sortir des deux autres modes avec une syntaxe de ce mode.

=== Vers le mode _Math_

A l'instar de #LaTeX, #typst() permet de rédiger et de mettre en valeur des formules mathématiques(cf. @formuleLigne).

#example(label:<formuleLigne>)[Formule au sein d'une ligne][
  ```typst
  La formule de la surface d'un cercle $S = pi r^2$ tient aisément dans cette ligne.
  ```
][
  La formule de la surface d'un cercle $S = pi r^2$ tient aisément dans cette ligne.
]

Ici, le caractère \$ permet d'entrer dans le mode _Math_, mais également d'en sortir.

On peut également souhaiter que la formule soit isolée dans sa propre ligne, auquel cas on va utiliser des espaces en plus des \$ #footnote[un espace après le premier \$, et un espace avant le dernier \$.] (cf. @formulePar).

#example(label: <formulePar>)[Formule dans un paragraphe][
  ```typst
  La formule de la surface d'un cercle : $ S = pi r^2 $ préfère être dans un paragraphe.
  ```
][
  La formule de la surface d'un cercle : $ S = pi r^2 $ préfère être dans un paragraphe.
]

=== Vers le mode _Code_

Il suffit d'utiliser le caractère \# pour entrer dans le mode _Code_. Quand l'instruction est terminée, il revient automatiquement au mode _Markup_.

Tant que l'instruction n'est pas terminée, on reste en mode _Code_ et il n'est donc pas nécessaire d'utiliser le caractère \# pour tous les appels de fonction inclus dans cette instruction.

#tips[Du _Code_ dans du _Markup_ dans du _Code_][Mais il y a une petite subtilité, dans le mode _Code_, on va parfois manipuler des _Content_, ils seront matérialisés par des crochets (\[ \]). Dans ce cas, à l'intérieur des crochets, on devra à nouveau utiliser le \# pour exécuter une fonction.]

== Afficher des caractères réservés

Et oui, on doit pouvoir également afficher des \$ ou des \# ou tous les autres caractères qui ont une signification(cf. @exCaracsSpec) :

#example(label:<exCaracsSpec>)[Caractères spéciaux][
  ```typst
  Affichons des \#, des \$ ou des \[ ou même des \\.
  ```
][
  Affichons des \#, des \$ ou des \[ ou même des \\.
]

Le caractère \\ est ce que l'on appelle un caractère d'échappement, il permet de dire à #typst() que l'on ne veut pas qu'il interprète le caractère suivant, mais qu'il l'affiche.