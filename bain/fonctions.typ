#import "../utils.typ": feature,typst, oe, OE, exemple

== Modes syntaxiques<modesSyntaxiques>
Avant d'expliquer comment personnaliser les titres, la numérotation, les marges, etc, il me semble indispensable d'expliquer comment écrire et utiliser des fonctions. Car cette personnalisation est liée à la façon dont le document est construit avec des fonctions. Et pour commencer, nous allons d'abord évoquer les modes syntaxiques. Il y en a trois :

- *_Markup_* : ce mode est celui que l'on a vu principalement jusqu'à présent et qui permet de valoriser les titres, mettre en gras, en italique, etc.
- *_Math_* : C'est celui permet de faire les rendus des formules mathématiques.
- *_Code_* : C'est celui qui va nous permettre d'écrire du code personnalisé.

Par défaut #typst() comprend le _Mode Markup_ et il faut lui spécifier quand passer en _Mode Code_. Si on ne le fait pas, il va considérer ce code comme du texte et l'afficher dans le document résultant.

On l'a déjà vu, mais il vaut mieux le redire, pour entrer dans le mode code, on va utiliser le caractère "*\#*" suivi d'une instruction ou d'une variable#footnote[Que l'on terminera par le caractère \\ pour revenir dans la même ligne au mode _Markup_] . Tout ce qui suit ce caractère est compilé comme du code jusqu'à ce l'instruction soit complète. Cela peut être la fin de la ligne si cela ne nécessite qu'une ligne ou quand toutes les accolades, parenthèses et crochets ouvrant aient leur équivalent fermant.

Voici deux exemples de code qui comprennent plusieurs lignes :

```typst
#let toto = (
  ...
)

#let titi = {
  ...
}
```

Dans le _Mode Code_, on peut repasser en _Mode Markup_ en utilisant des crochets#footnote[Les crochets permettent de définir un content qui est écrit en mode _Markup_.] :

```typst
#let tata = {
  let ab = [
    *Bonjour* en gras #typst()
  ]
}
```

#feature[\# ou pas \#][Pas la peine d'écrire des \# à chaque ligne, tant qu'on est dans le _Mode Code_, #typst() comprend le langage en question, par contre, dans l'exemple précédent, _ab_ contient un _content_ illustré par les crochets et à l'intérieur de ce _content_ il faut utiliser le \# pour appeler à nouveau du code.]

== Des variables

=== Exemple simple

Nous allons commencer par deux petites constantes toutes simples. Je ne sais pas comment taper avec mon clavier le e dans l'o, mais je sais le copier coller d'un texte qui le contient. Pour m'éviter de faire ces manipulations, je vais écrire deux variables pour faire cela en minuscule et en majuscule.

```typst
// Variable pour œ minuscule
#let oe = [œ]

// Variable pour Œ majuscule
#let OE = [Œ]

Ce qui nous permet de voir la différence entre oeuvre et #oe\uvre ou Oeuf et #OE\uf.
```
#exemple[Ce qui nous permet de voir la différence entre oeuvre et #oe\uvre ou Oeuf et #OE\uf.]

On commence notre ligne de code avec un \# ensuite, on voit le mot-clé _let_ qui nous permet de déclarer une variable. Notre première variable s'appelle _oe_. Le symbole = permet de lui affecter une valeur et cette valeur est de type content (entourée de crochets) qui contient le caractère que j'ai copié et collé ici. J'ai fait la même chose pour la variable _OE_.

Ensuite, on peut voir comment je les appelle. Donc, dans mon texte je mets le \# pour pouvoir utiliser du code, suivi du nom de la variable que je souhaite utiliser, suivi du caractère \\ qui permet de terminer la partie code et de revenir au mode _Markup_.

#feature[code caché][On ne voit pas dans notre document s'afficher les instructions let oe = ... . Quand on est dans un bloc de code, on exécute les instructions sans les afficher. Par contre, comme on exécute les instructions, faire appel à une variable équivaut à dire, affiches moi la valeur de la variable _oe_ dans notre exemple].

=== Les types de données
Comme #typst() s'apparente à un langage de programmation, il permet de manipuler des données, et pour qu'on ne s'emmêle pas trop les pinceaux, il les traite différemment en fonction de ce qu'elles représentent.
Voyons les principaux, ceux qu'on a besoin de connaître tout de suite :
- *_bool_* : le type booléen. Ce type ne peut contenir que deux valeurs _true_ et _false_ (respectivement _vrai_ et _faux_).
- *_int_* : le type entier. C'est un nombre sans valeur décimale. Il pourra servir pour des calculs.
- *_string_* : la chaîne de caractère. Ce type contient des caractères(des lettres, des chiffres, ...), pour le reconnaître, on entoure cette chaîne de guillemets (\"). Ce texte ne sera pas interprété par _Typst_.
- *_content_*: du contenu. Cette fois-ci le texte de ce type sera interprété, il sera transformé en titre, en gras, ... . un content est généralement entouré de crochets(\[ et \]).
- *_length_* : une mesure. On va surtout l'utiliser pour le style du document, la taille de police ... . Il y a plusieurs unités possibles :
 - Points: 72pt;
 - Millimètres: 254mm;
 - Centimètres: 2.54cm;
 - Inches (Pouces): 1in;
 - Taille relative à la taille de police standard: 2.5em;
- *_relative_* : une taille relative à une autre(qui sera déduite de celle qu'on veut dimensionner), on l'exprimera en pourcentage.
- *_color_* : une définition de couleur

À l'instar de Python ou de Javascript, on ne spécifie pas le type de données, il va le deviner grâce à l'inférence de type.
Voici quelques exemples reprenant les types mentionnés dans l'ordre :

```typst
#let modeBrouillon = true
#let taille = 215
#let titre = "Mon super titre"
#let sousTitre = [Avec un mot en _italique_]
#let longueur = 72pt
#let portion = 10%
#let couleurTitre1 = rgb("#3d9970")
```

=== Zoom sur le type _content_
C'est le type le plus important de #typst(). Quand on écrit un document, on est par défaut dans un _content_.


== Des fonctions<fonctions>
=== Fonction sans paramètre

Reprenons l'exemple précédent en utilisant cette fois-ci une fonction
```typst
// Syntaxe très explicite
#let oe() = {
  return [œ]
}

// Syntaxe explicite
#let oe() = {[œ]}

// Syntaxe raccourcie
#let oe() = [œ]

#oe()uvre
```

#let oe() = {
  return [œ]
}

#exemple[#oe()uvre]

La syntaxe est pratiquement la même à une différence près, les parenthèses. Quand on met des parenthèses après le nom de la constante, on signale à #typst() que cette constante contient une fonction.

Le code de notre fonction est normalement entouré par des accolades, c'est ce que l'on voit dans les deux exemples de syntaxe explicites.

On peut voir dans mon premier exemple, l'usage du mot clé _return_ devant le content. Comme ce code n'utilise pas de code conditionnel (_if_, _else_, ...), il est ici superflu car par défaut une fonction renvoie sa dernière instruction#footnote[qui peut être simplement une valeur.]. Dans ce cas, le mot clé _return_ est facultatif, comme l'illustre la deuxième fonction explicite.

Enfin, si comme ici il n'y a qu'une seule instruction qui est une valeur, les accolades sont aussi facultatives.

#feature[variable ou fonction ?][L'exemple qui a été mis ici renvoie une constante. Dans ce cas là, il vaut mieux préférer l'usage d'une variable, la syntaxe sera également plus facile à utiliser sans les parenthèses.]

=== Fonction avec un paramètre
==== Paramètre obligatoire

On commence simplement avec la fonction qui me sert à illustrer les exemples :

```typst
// Mise en valeur des exemples
#let exemple(body) = {
  text(fill:olive,body)
}
```

Elle reçoit un paramètre appelé _body_#footnote[Cela fait référence au _body_ du HTML qui fait lui-même référence au corps du texte.]. Ce paramètre est lui même passé à une fonction native de #typst() qui permet d'afficher du texte en lui donnant des options. Ici on affecte à l'option _fill_ la valeur _olive_ qui est une variable connue du compilateur contenant un code couleur _vert olive_.

On peut maintenant l'utiliser en lui donnant une valeur pour la variable _body_ :

```typst
// On utilise des paramètres pour une chaine de caractères
#exemple("Une chaine de caractères") ou un content :

// Les parenthèses sont facultatives pour les content, les crochets suffisent
#exemple[
Une liste de valeur :
  - élément 1
  - *élément 2*
]
```

#exemple("Une chaîne de caractères") ou un content :

#exemple[
Une liste de valeur :
  - élément 1
  - *élément 2*
]

=== Paramètre optionnel

Voyons maintenant la fonction que j'utilise pour afficher #typst(). Je voulais une fonction qui me permette d'afficher le nom du produit avec la police et la couleur utilisée sur le site web. Par contre, je souhaitais pouvoir modifier la taille de la police indépendamment de la taille courante. J'ai donc rajouté un paramètre de taille avec une valeur par défaut :

```typst 
// logo typst
#let typst(size: none) = {
  let content = text(
    font: "Linux Libertine",
    fill: rgb("#239dad"),
    weight: "semibold",
    [typst]
  )

  if size != none {
    text(size: size, content)
  } else {
    content
  }
}
```

Je peux donc appeler la fonction de deux manières différentes, avec ou sans le paramètre :
```typst 
// Sans paramètre, mais avec les parenthèses
#typst()
// Avec le paramètre
#typst(size:1.5em)
```

#feature[Paramètre nommé][Quand un paramètre a une valeur par défaut, on doit systématiquement l'utiliser avec son nom suivi de "*:*" suivi de sa valeur. Dans l'exemple précédent, il n'y a qu'un seul paramètre et pourtant je ne peux pas transmettre uniquement la valeur. Cela correspond aux _options_ que j'avais mentionné pour la fonction _text_.]

=== plusieurs paramètres

Je vais essayer d'illustrer plusieurs cas de figures avec des paramètres de types différents. Je ne vais pas montrer les exemples ici, juste le code source.

```typst
// Deux paramètres de type content
#let deux(body1,body2) = {
  text(body1)
  linebreak()
  text(body2)
}

// On peut les appeler comme cela, sans parenthèses
#deux[test1][test2]
```


== Des réglages avec les _set rules_


La fonction _set_ est très puissante, elle permet d'affecter une valeur à une _element function_ jusqu'à nouvel ordre.
Expliquons là avec un exemple.

```typst
#text[Texte en noir]
#set text(fill:blue)
#text[Texte en bleu]
#text[Texte en bleu aussi]
#set text(fill:red)
#text[Texte en rouge]
#set text(fill:black)
```

#text[Texte en noir]
#set text(fill:blue)
#text[Texte en bleu]
#text[Texte en bleu aussi]
#set text(fill:red)
#text[Texte en rouge]
#set text(fill:luma(0%))

J'ai utilisé la fonction _text_ de #typst() qui affiche du texte#footnote[Elle fait partie des _element function_ fournies par #typst(). C'est elle qui est appelée pour tout affichage de texte, même quand nous, nous écrivons en mode _Markup_]. Pour les deux textes en bleu, je ne voulais pas écrire :
```typst 
#text(fill:blue)[Texte en bleu]
#text(fill:blue)[Texte en bleu aussi]
```
J'ai donc fixé la valeur pour les appels successifs avec la fonction _set_ et en donnant à _fill_ la valeur _blue_.

#feature[la fonction _text_][Vous avez certainement remarqué que j'ai fini mon code en mettant la valeur _fill_ à _luma(0%)_ #footnote[qui est noir]. Pourquoi ais-je fait cela ?
En réalité, je lui ai remis sa valeur par défaut et je l'ai fait pour une bonne raison. *TOUT* le texte que l'on écrit avec le _Markup_ devient un appel de cette fonction. Donc, si je ne l'avais pas remis à _luma(0%)_, tout le reste de mon document serait écrit en rouge.]

Cette fonction _set_ va nous permettre de personnaliser entièrement notre document en l'appliquant aux _element functions_ qui sont exécutées lors de la compilation du _Markup_.

On peut l'appliquer à :
- *_page_* pour définir les marges, ou les règles liées à chaque page,
- *_par_* pour toutes les règles des paragraphes,
- *_headings_* pour les titres,
- *_text_* que vous venons de voir,
- ...

Nous allons maintenant en explorer quelques uns, mais pas de manière exhaustive. Pour tout explorer en détail, je conseille de parcourir la documentation officielle @typst-documentation.

=== Le texte

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




=== Les paragraphes

Voici ce que j'ai mis ici :
```typst
#set par(
  justify: true,
  first-line-indent: (amount: 2em, all: true),
  leading: 0.52em,
)
```

Mes paragraphes sont justifiés à gauche et à droite. Il y a une indentation pour la première ligne du paragraphe d'une valeur de _2em_#footnote[Deux fois la taille de la police courante]. L'espacement entre le bas d'une ligne de caractère et le haut de la suivante est de _0.52em_. 

=== Les titres
=== La page

