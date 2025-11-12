#import "../utils.typ": feature
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

Nous allons maintenant voir différents appels de fonction pour comprendre comment faire l'appel en fonction de la signature de la fonction.

```typst
// Avec un paramètre positionnel (ici de type string)
#image("images/Ramen Photo Overleaf.jpg")
```

Les appels commencent par un *\#*.
Ensuite, on a le nom de la fonction et suivant le cas, on va avoir des paramètres en entrée (on pourrait aussi ne pas en avoir).
Par défaut, on va mettre les paramètres d'entrée entre parenthèses comme on peut le voir sur ce premier exemple, on voit également que le paramètre attendu est de type _string_ car il a été écrit entre guillemets(\").
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
En mettant _width :_ suivi de sa valeur (ici de type _relative_), on va viser précisément ce paramètre. Quant au premier, qui est obligatoire, on ne le nomme pas explicitement quand on appelle la fonction.

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