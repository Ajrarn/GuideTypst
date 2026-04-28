#import "../utils.typ": feature,LaTeX,typst, example, tips

== Qu'est-ce que c'est ?

=== #typst() est un traitement de texte.

Mais il ne ressemble pas du tout aux logiciels de cette catégorie les plus répandus :
- Word (Microsoft),
- Writer (LibreOffice),
- Pages (MacOs),
- Docs (Google).
Car dans le monde très fermé des traitements de texte, il y a deux philosophies qui s'opposent :
- _Wysiwig_ (What You See Is What You Get, Ce que vous voyez est ce que vous obtenez) dont font partie ceux qu'on vient de citer.
- _Wysiwym_ (What You See Is What You Mean, Ce que vous voyez est ce que vous signifiez) dont le plus connu dans le monde universitaire et scientifique est #LaTeX. \

Dans le premier cas, il n'y a pas, ou très peu de différences entre ce que vous voyez à l'écran et ce que vous imprimez, ce sont des éditeurs graphiques. Dans le deuxième cas, vous décrivez votre document dans un langage et le programme se charge de transcrire votre description en document imprimable.

Il y a beaucoup de différences entre ces deux type de traitement de texte, et je ne vais pas m'amuser à faire une comparaison objective des avantages et inconvénients de chacun, car sans aucun doute, je préfère la seconde approche. Je la trouve :
- plus robuste #footnote[c'est du code]
- plus consistante #footnote[une règle s'applique partout sans exception]
- plus transparente #footnote[il n'y a rien de caché dans le code]


=== #typst() est une application Web
Effectivement les auteurs de #typst() ont créé une application web de qualité@typst-app qui permet d'éditer en ligne les documents et de les générer. Elle propose différents abonnements, gratuits et payants et la possibilité de travailler en collaboration avec d'autres utilisateurs. C'est une façon intelligente de se rémunérer sur un projet Open Source. L'application Web n'est pas Open Source, mais la partie qui génère les documents oui.


=== #typst() est un compilateur Open-Source
Le programme qui transforme le code de description du document en PDF #footnote[mais cela peut aussi être en image ou en HTML] est Open Source et gratuit. Vous pouvez le trouver sur Github@typst.
Quand on parle de compilateur, on pense à un programme qui transforme du code source en un autre programme, un exécutable. C'est un livrable autonome. Il n'a pas besoin de compilateur #footnote[On parle alors d'interpréteur.] pour être utilisable.

#typst() est un compilateur de documents, il transforme du code source en un document autonome, au choix :
- un document PDF #footnote[avec plusieurs formats de disponibles],
- une image au format _svg_ ou _png_,
- et bientôt en HTML et en ePub.
qui n'a plus besoin du compilateur pour être lu, ni d'un client spécial. Bien sûr il faut un outil qui affiche le PDF ou un navigateur pour le HTML, mais le produit final est autonome de #typst().

=== #typst() est un langage
#typst() est également un langage de description de document. Le compilateur reconnaît les instructions de ce langage et exécute les instructions du fichier _.typ _qu'on lui fournit.

Il a sa propre syntaxe qui permet de décrire le document que l'on souhaite obtenir.
C'est principalement cette syntaxe que nous allons découvrir progressivement dans ce document.

== Conventions sur ce document


=== Exemple de code

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

Cette boîte permet de visualiser le code en haut et son exécution en bas. Ce premier exemple ne contient que du texte sans mise en page, donc rien d'extraordinaire pour l'instant.

Néanmoins, dans la partie code on peut voir dans l'ordre:
- plusieurs lignes dans un bloc gris, avec une pastille #typst() à droite,
- une ligne dans un bloc blanc,
- plusieurs lignes dans un bloc gris.

La pastille permet d'identifier le langage. Normalement, dans cet ouvrage, il devrait être principalement question de #typst().

Les blocs qui se succèdent représentent des lignes de code. On voit le premier bloc gris sur deux lignes. En réalité dans le code, l'ensemble est écrit sur la même ligne. Pour éviter de déborder à droite #typst() va à la ligne, mais il reste en gris pour nous signaler que c'est la même ligne.

=== Astuce

#tips[Première astuce][
  ```typst
  #set text(lang:"fr")
  ```
  Cette petite ligne à mettre au tout début d'un document permet d'activer le français.
]

Cette boite permet de mettre en valeurs des astuces, et celle qui y figure est vraiment pratique.

=== Plan du document

Ce ouvrage est structuré comme suit :

- La première partie permet de découvrir les premiers éléments de langage indispensables. En particulier la syntaxe du mode _Markup_(cf. @modesSyntaxiques), elle abordera également un peu de code, le minimum à connaître pour un utilisateur de packages.
- La deuxième partie a pour objectif de vous aider à créer vos propres packages et pourquoi pas à les partager avec la communauté.
