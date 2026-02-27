#import "../utils.typ" : typst

== Utilisation de packages

=== Le principe
Nous avons à peu près fait le tour des éléments de base fournis par #typst().
Mais il offre bien plus que cela. En effet, comme nous le verrons par la suite, sa richesse nous permet de fabriquer nous mêmes de nouvelles fonctionnalités, des fonctions ou des modèles personnalisés. Et cela donne l’opportunité aux membres de la communauté de partager des packages pour résoudre différents problèmes.

Tous ces packages de la communauté sont disponibles sur Typst Universe @universe

=== Exemple détaillé<codly>

Par exemple, pour afficher le code source, j'ai utilisé un package appelé codly, et pour ce faire en respectant la documentation du package #footnote[que vous retrouverez grâce à Typst Universe @universe], j'ai ajouté les lignes suivantes :

```typst
// Codly
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()

#codly(
  languages: codly-languages,
  number-format: none
)
```

Les deux premières lignes permettent d'importer un package.

```typst
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
```

Donc, un dièse pour signaler l'appel de la fonction _import_ qui reçoit un paramètre sous forme d'une chaîne de caractères et un deuxième paramètre séparé du premier par ":".



Commençons par le premier paramètre. C'est un  chemin vers le package. Examinons le dans le détail :
- *\@\preview* : c'est le nom du namespace dans lequel se trouve pour l'instant tous les packages de la communauté,
- *codly* : c'est le nom du package,
- *1.3.0* : c'est son numéro de version

Après les ":", on peut voir un astérique (\*), il signifie qu'on importe tout ce que contient le package. On pourrait également importer séparément chaque fonction en écrivant leurs noms séparés par des virgules.

La ligne suivante :

```typst
// Codly
#show: codly-init.with()
```
va permettre de remplacer l'affichage standard du code source par celui proposé par _codly_.

Le dernier bloc

```typst
#codly(
  languages: codly-languages,
  number-format: none
)
```

permet d'activer les différents langages reconnus en utilisant ceux qu'on a importé du package _codly-languages_.

=== Explications complémentaires
Je n'ai pas appris comment fonctionne précisément le package précédent, mais j'ai appliqué les recommandations de sa documentation.

Sur Typst Universe, vous trouverez beaucoup de packages très intéressants permettant de :
- mettre en page un livre de fiction (min-book),
- modifier la mise en page avec des formes géométriques (meander),
- d'appliquer différents templates de rapports de stage fournis par des universités ou des écoles d'ingénieur,
- d'afficher des diagrammes de Gantt (gantty),
- de modéliser des atomes,
- ...

Alors n'hésitez pas à consulter les packages disponibles de temps en temps, cela pourrait vous donner des idées.

