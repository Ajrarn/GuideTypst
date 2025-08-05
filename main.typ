
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
  feature: ("Remarque", rgb("ADD8E6")),
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
#set document(
  title: "Guide Typst",
  author: "Christophe Dos Santos",
  description: "Un petit guide en français sur l'utilisation de Typst",
  keywords: ("Typst","Guide","Français")
)

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

#set heading(numbering: "1.1 -")

#show heading.where(depth: 1): body => {
  pagebreak(weak: true)
  body
}


// --------------- Contenu
= Présentation

Typst est un traitement de texte, mais pas un de ceux que l'on connait habituellement.
Tout le monde connaît les traitements de texte _Wysiwig_ (What You See Is What You Get : Ce que vous voyez est ce que vous obtenez) comme _Word_, _Writer_, _Pages_.
Mais il existe une autre approche: _Wysiwym_ (What You See Is What You Mean : Ce que vous voyez est ce que vous voulez dire) dont le plus connu dans le monde universitaire et scientifique est LaTeX.


Typst est également un langage de programmation un peu particulier. Il ne permet pas de créer un programme, mais un document dans l'un des formats suivants :
- un document PDF
- une image au format _svg_ ou _png_
- une page web (en HTML)

Et comme tous les langages, il a sa propre syntaxe qui permet de décrire le document que l'on souhaite obtenir.
C'est cette syntaxe que nous allons décrouvrir progressivement.

Nous allons commencer par les concepts les plus simples, les quelque choses à savoir pour commencer à rédiger des documents.
Mais avant cela, voyons un peu les outils que l'on trouve sur ce document.
Commençons par un exemple de code :

```typst
Nous allons commencer par les concepts les plus simples, les quelque choses à savoir pour commencer à rédiger des documents.
Mais avant cela, voyons un peu les outils que l'on trouve sur ce document.
Commençons par un exemple de code :
```

Ce qu'il y a au dessus est un bloc de code qui sert à illuster la syntaxe.
Je vais d'ailleurs faire souvent ce que l'on voit au-dessus, à savoir mettre le code dans la boîte de code et en dehors pour que lon puisse voir le résultat.
Dans la boîte de code, celui-ci n'est pas interprété par le compilateur (le programme qui transforme le code en document), ainsi, on peut voir la syntaxe.
On verra plus tard comment faire la même chose. Ce que l'on peut voir de la boîte, est qu'elle affiche à gauche le langage qui est mis en valeur et les lignes de code en alternance de couleurs.
Pou éviter que cela déborde, on peut voir deux lignes de texte dans la première partie grise, mais en réalité, j'ai vraiment écrit une seule ligne. C'est la seule transformation autorisée ici.

Le deuxième outil, ce sont aussi des boîtes de texte pour attirer ton attention, comme celle-ci :

#feature[Première Remarque][Une petite remarque dans une boîte en couleur.]

Quand je penserai à faire remarquer un concept important, j'utiliserai ce genre de boîte.

J'ai choisi une approche plutôt didactique. On va découvrir les concepts du plus simple au plus compliqué.
Du coup, les sujets risquent de s'entrecroiser.
Je commence bien évidemment par les outils pour écrire le document, et cela restera le fil directeur, mais cela sera interrompu par des explcations conceptuelles qui devraient permettre de garder une bonne compéhension.

= Les bases de la Rédaction

Le plus important dans le document, c'est sa structure et son contenu. Nous allons donc commencer par cela.
Dans cette première partie, nous n'allons voir que la syntaxe la plus simple, celle qui ne nécessite pas beaucoup d'explications.

== Les titres
=== sous-titres

Un bon document est un document structuré, avec un plan, et cela commence par avoir des titre à des niveaux différents.

```typst
= Les bases de la Rédaction
...
== Les titres
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


= Introduction aux fonctions
Pour aller un peu plus loin, on va devoir évoquer les fonctions et les types de données. En effet, on va devoir utiliser des fonctions pour insérer des images, mettre des notes de bas de page, ... .
Et pour comprendre comment appeler ces fonctions, nous devons connaître les types de données qu'elles attendent.

== Les types de données
Comme _Typst_ est un langage de programmation, il permet de manipuler des données, et pour qu'on ne s'emmêle pas trop les pinceaux, il les traite différemment en fonction de ce qu'elles représentent.
Voyons les principaux, ceux qu'on a besoin de connaître tout de suite :
- *_bool_* : le type booléen. Ce type ne peut contenir que deux valeurs _true_ et _false_ (respectivement _vrai_ et _faux_).
- *_int_* : le type entier. C'est un nombre sans valeur décimale. Il pourra servir pour des calculs.
- *_string_* : la chaîne de caractère. Ce type contient des caractères(des lettres, des chiffres, ...), pour le reconnaitre, on entoure cette chaîne de guillemets (\"). Ce texte ne sera pas interprété par _Typst_.
- *_content_*: du contenu. Cette fois-ci le texte de ce type sera interprété, il sera transformé en titre, en gras, ... .
- *_length_* : une mesure. On va surtout l'utiliser pour le style du document, la taille de police ... . Il y a plusieurs unités possibles :
 - Points: 72pt
 - Millimètres: 254mm
 - Centimètres: 2.54cm
 - Inches (Pouces): 1in
 - Taille relative à la taille de police standard: 2.5em
- *_relative_* : une taille relative à une autre(qui sera déduite de celle qu'on veut dimensionner), on l'exprimera en pourcentage.

== Les fonctions

Une fonction, c'est une portion de code qui attend des paramètres(nommés, avec leur type de données) en entrée et qui a une valeur de sortie dans un type de données également.
Très souvent nos fonctions retourneront un _content_.
Elle a un nom et une définition des paramètres en entrée, cet ensemble s'appelle une signature.

Nous allons mainteant voir différents appels de fonction pour comprendre comment faire l'appel en fonction de la signature de la fonction.

```typst
// Avec un paramètre positionnel (ici de type string)
#image("images/Ramen Photo Overleaf.jpg")
```

Les appels commencent par un *\#*.
Ensuite, on a le nom de la fonction et suivant le cas, on va avoir des paramètres en entrée (on pourrait aussi ne pas en avoir).
Par défaut, on va mettre les paramètres d'entrée entre parenthèses comme on peut le voir sur c premier exemple, on voit également que le paramètre attendu est de type _string_ car il a été écrit entre guillements(\").
Enfin, on ne donne pas le nom du paramètre, c'est l'approche positionnelle. Le premier paramètre attendu est de type _string_. S'il y a d'autres paramètres, ils ont une valeur par défaut, ce qui nous permet de les ignorer.

```typst
// Deux paramètres positionnels de type content
#list([A], [B])
```
Cette fois-ci, les deux premiers paramètres attendus sont des _content_, chacun d'entre eux est donc entre crochets(\[ \]).

```typst
// Un paramètre positionnel, un paramètre nommé
#image("images/Ramen Photo.jpg", width: 70%)
```
On voit à nouveau notre fonction _image_. De toute évidence, elle peut recevoir d'autres paramètres (qui ont une valeur par défaut) et _width_ n'est probablement pas le deuxième paramètre.
Plutôt que d'utiliser uniquement l'approche positionnelle, qui nous obligerait à renseigner tous les paramètres jusqu'à celui qui nous intéresse, on va utiliser l'approche nommée.
En mettant _width :_ suivi de sa valeur (ici de type _relative_), on va viser précisément ce paramètre. Quant au premier, qui est obligatoire, il n'as pas de nom ici.

```typst
// Argument nommé et content
#enum(start: 2)[A][B]
```

Maintenant, nous voyons un changement dans la syntaxe. _start_ est mis entre parenthèses, mais les deux _content_ suivants n'y sont pas.
Quand les derniers paramètres d'une fonction sont des _content_, on peut les écrire après les parenthèses.

```typst
// Version sans parenthèses.
#list[A][B]
```
Ici, on n'utilise même pas les parenthèses, car tous les paramètres sont optionnels à l'exception des derniers qui sont des _content_.
A noter que c'est exactement le même appel que le premier exemple, mais avec une syntaxe plus légère.

= Rédaction Avancée

== Notes de bas de page
Au lieu d'utiliser des parenthèses #footnote[quand par exemple le texte est particulièrement long et risque de rendre l'interruption de la parenthèse trop importante], on peut utiliser des notes de bas de pages :

```typst
Au lieu d'utiliser des parenthèses #footnote[quand par exemple le texte est particulièrement long et risque de rendre l'interruption de la parenthèse trop importante], on peut utiliser des notes de bas de pages :
```

L'avantage d'utiliser cette fonction est qu'elle fait pour nous un certain nombre de tâches:
- Ecrire le texte de l'expression en bas de la page,
- lui associer un label (que l'on ne connait pas),
- poser une référence à l'emplacement de la fonction.



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

== Les Tableaux

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

caption: [code],
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


== Bibliographie

Pour ajouter une bibliographie, il faut tout d'abord la rédiger. Pour cela, le format préféré de Typst est le format Hayagriva @hayagriva, mais vous pouvez également utiliser le format bib de LaTeX.
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



= Mise en Page

== Avant goùt
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
  numbering: "1"
)
#set par(
  justify: true,
  leading: 0.52em,
)
#set heading(numbering: "1.")
```

== Personnalisation dans le détail

=== Document

la fonction document a les paramètres suivants :

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Propriété*], [*Valeurs acceptées*], [*Valeur par défaut*],
  ),
  [*title*], [_none_ ou _expression_], [_none_],
  [*author*], [chaîne ou tableau de chaîne], [()],
  [*description*], [_none_ ou _expression_], [_none_],
  [*keywords*], [chaîne ou tableau de chaîne], [()],
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



#bibliography("bibliographie.yml")







