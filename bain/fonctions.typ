#import "../utils.typ": feature,typst, oe, OE

== Modes de compilation
Avant d'expliquer comment personnaliser les titres, la numérotation, les marges, etc, il me semble indispensable d'expliquer comment écrire et utiliser des fonctions. Car cette personnalisation est liée à la façon dont le document est construit avec des fonctions. Et pour commencer, je vais expliquer une notion avec mes termes, parce qu'il ne me semble pas les avoir trouvé sur la documentation officielle.

Donc, voici les termes en question _Mode de Compilation_, _Mode Content_ et _Mode Code_.

Le compilateur de #typst() comprend deux façons d'écrire du code :
- La première, c'est celle que l'on a majoritairement vue jusqu'à présent et qui consiste à écrire du texte avec quelques règles pour que ce texte soit mis en page. J'appelle le mode qui permet de faire ce travail, le _Mode Content_.
- La deuxième concerne tout ce que l'on peut faire par programmation comme :
  - manipuler des variables
  - faire des tests
  - faire des boucles
  - manipuler des collections de données
  - ...
  J'appelle le mode qui permet de compiler ce code, le _Mode Code_

Par défaut #typst() comprend le _Mode Content_ et il faut lui spécifier quand passer en _Mode Code_. Si on ne le fait pas, il va considérer ce code comme du texte et l'afficher dans le document résultant.

On l'a déjà vu, mais il vaut mieux le redire, pour entrer dans le mode code, on va utiliser caractère *\#*. Tout ce qui suit ce caractère est compilé comme du code jusqu'à :
- la fin de la ligne,
- qu'on force la terminaison du mode avec le caractère *\\*,
- qu'on ferme des parenthèses de l'instruction de code.

Mais on peut également avoir du code qui se poursuit sur plusieurs lignes s'il est entre parenthèses ou entre accolades :

```typst
#let toto = (
  ...
)

#let titi = {
  ...
}
```

Dans le _Mode Code_, on peut repasser en _Mode Content_ en utilisant des crochets :

```typst
#let tata = {
  let ab = [
    *Bonjour* en gras #typst()
  ]
}
```

#feature[\# ou pas \#][Pas la peine d'écrire des \# à chaque ligne, tant qu'on est dans le _Mode Code_, #typst() comprend le langage en question, par contre, dans l'exemple précédent, _ab_ contient un _content_ illustré par les crochets et à l'intérieur de ce _content_ il faut utiliser le \# pour appeler du code.]

== Des constantes

=== Exemple simple

Nous allons commencer par deux petites constantes toutes simples. Je ne sais pas comment taper avec mon clavier le e dans l'o. Je sais le copier coller d'un texte qui le contient. Donc, je vais écrire deux constantes pour faire cela en minuscule et en majuscule.

```typst
// Constante pour œ minuscule
#let oe = [œ]

// Constante pour Œ majuscule
#let OE = [Œ]

Ce qui nous permet de voir la différence entre oeuvre et #oe\uvre ou Oeuf et #OE\uf.
```
Ce qui nous permet de voir la différence entre oeuvre et #oe\uvre ou Oeuf et #OE\uf.

On commence notre ligne de code avec un \# ensuite, on voit le mot-clé _let_ qui nous permet de déclarer une constante. Notre première constante s'appelle _oe_. Le symbole = permet de lui affecter une valeur et cette valeur est de type content (entourée de crochets) qui contient le caractère que j'ai copié et collé ici. J'ai fait la même chose pour la constante _OE_.

Ensuite, on peut voir comment je les appelle. Donc, dans mon texte je mets le \# pour pouvoir utiliser du code, suivi du nom de la constante que je souhaite utiliser, suivi du caractère \\ qui permet de terminer la partie code et de revenir au mode texte.

#feature[code caché][On ne voit pas dans notre document s'afficher les instructions let oe = ... . Quand on est dans un bloc de code, on exécute les instructions sans les afficher. Par contre, comme on exécute les instructions, faire appel à une constante équivaut à dire, affiches moi la valeur de la constante oe dans notre exemple].

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

À l'instar de Python ou de Javascript, on ne spécifie pas le type de données, il va le deviner grâce à l'inférence de type.
Voici quelques exemples reprenant les types mentionnés dans l'ordre :

```typst
#let modeBrouillon = true
#let taille = 215
#let titre = "Mon super titre"
#let sousTitre = [Avec un mot en _italique_]
#let longueur = 72pt
#let portion = 10%
```

=== Zoom sur le type _content_
C'est le type le plus important de #typst(). Quand on écrit un document, on est par défaut dans un _content_.


== Des fonctions
=== Une fonction sans paramètre

Reprenons l'exemple précédent en utilisant cette fois-ci une fonction
```typst
// Syntaxe rigoureuse
#let oe_func() = {[œ]}
// Syntaxe raccourcie
#let oe_func() = [œ]

#oe_func()uvre
```

#let oe_func() = {[œ]}

#oe_func()uvre

La syntaxe est pratiquement la même à une différence près, les parenthèses. Quand on met des parenthèse après le nom de la constante, on signale à #typst() que cette constante contient une fonction...Mais on fait exactement la même chose avec le = et le content ?...Pas tout à fait. Dans notre cas, la fonction renverra toujours la même valeur, donc on peut écrire directement la valeur de retour



