#import "../utils.typ": tips, example, typst

= Conventions sur ce document


Avant d'entrer dans le vif du sujet, je vais détailler les outils utilisés dans le présent document, ainsi que la structure de celui-ci. Ce n'est pas un chapitre indispensable, mais comme le dirait *Talleyrand* :

#text(font: "Allura", size: 18pt)[Si cela va sans le dire, cela ira encore mieux en le disant.]


== Exemple de code

#example[Exemple de Code][
  ```typst
Je ne connais pas la peur, car la peur tue l'esprit. La peur est la petite mort qui conduit à l'oblitération totale.
J'affronterai ma peur. Je lui permettrai de passer sur moi, au travers de moi.
Et lorsqu'elle sera passée, je tournerai mon oeil intérieur sur son chemin. Et là où elle sera passée, il n'y aura plus rien. Rien que moi.
    ```
][
  Je ne connais pas la peur, car la peur tue l'esprit. La peur est la petite mort qui conduit à l'oblitération totale.
      J'affronterai ma peur. Je lui permettrai de passer sur moi, au travers de moi.
      Et lorsqu'elle sera passée, je tournerai mon oeil intérieur sur son chemin. Et là où elle sera passée, il n'y aura plus rien. Rien que moi.
]

Cette boîte permet de visualiser le code en haut et son exécution en bas. Ce premier exemple ne contient que du texte#footnote[Une citation de Dune de Frank Herbert.] sans mise en page, donc rien d'extraordinaire pour l'instant.

Néanmoins, dans la partie code on peut voir dans l'ordre:
- plusieurs lignes dans un bloc gris, avec une pastille #typst() à droite,
- une ligne dans un bloc blanc,
- plusieurs lignes dans un bloc gris.

La pastille permet d'identifier le langage. Normalement, dans cet ouvrage, il devrait être principalement question de #typst().

Les blocs qui se succèdent représentent des lignes de code. On voit le premier bloc gris sur deux lignes. En réalité dans le code, l'ensemble est écrit sur la même ligne. Pour éviter de déborder à droite #typst() va à la ligne, mais il reste en gris pour nous signaler que c'est la même ligne de code.

== Astuce

#tips[Première astuce][
  ```typst
  #set text(lang:"fr")
  ```
  Cette petite ligne à mettre au tout début d'un document permet d'activer le français.
]

Cette boite permet de mettre en valeurs des astuces, et celle qui y figure est vraiment pratique.

== Plan du document

Ce ouvrage est structuré comme suit :

- Une introduction, dont fait partie ce chapitre, avec quelques explications sur l'utilisation de l'application en ligne, ainsi que des explications sur la manière d'utiliser Typst sur son propre système, hors ligne.
- La première partie permet de découvrir les premiers éléments de langage indispensables. En particulier la syntaxe du mode _Markup_(cf. @modesSyntaxiques), elle abordera également un peu de code, le minimum à connaître pour personnaliser son projet et utiliser des packages fournis par la communcauté.
- La deuxième partie a pour objectif de vous aider à créer vos propres packages et pourquoi pas à les partager avec la communauté.