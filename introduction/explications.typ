#import "../utils.typ": LaTeX,typst

= Qu'est-ce que c'est ?

== #typst() est un traitement de texte.

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


== #typst() est une application Web
Effectivement les auteurs de #typst() ont créé une application web de qualité@typst-app qui permet d'éditer en ligne les documents et de les générer. Elle propose différents abonnements, gratuits et payants et la possibilité de travailler en collaboration avec d'autres utilisateurs. C'est une façon intelligente de se rémunérer sur un projet Open Source. L'application Web n'est pas Open Source, mais la partie qui génère les documents oui.


== #typst() est un compilateur Open-Source
Le programme qui transforme le code de description du document en PDF est Open Source et gratuit. Vous pouvez le trouver sur Github@typst.

Quand on parle de compilateur, on pense à un programme qui transforme du code source en un autre programme, un exécutable. C'est un livrable autonome. Il n'a pas besoin d'un programme interpréteur #footnote[Comme pour Python par exemple.] pour être utilisable.

#typst() est un compilateur de documents, il transforme du code source en un document autonome, au choix :
- un document PDF #footnote[Avec plusieurs formats de disponibles],
- une image au format _svg_ ou _png_,
- et bientôt en HTML et en ePub.
qui n'a plus besoin du compilateur pour être lu, ni d'un client spécial. Bien sûr il faut un outil qui affiche le PDF ou un navigateur pour le HTML, mais le produit final est autonome de #typst().

== #typst() est un langage
#typst() est également un langage de description de document. Le compilateur reconnaît les instructions de ce langage et exécute les instructions du fichier _.typ _qu'on lui fournit.

Il a sa propre syntaxe qui permet de décrire le document que l'on souhaite obtenir.
C'est principalement cette syntaxe que nous allons découvrir progressivement dans ce document.