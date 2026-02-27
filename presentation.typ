#import "./utils.typ": feature,LaTeX,typst, exemple

== Introduction

Si vous avez trouvé ce document, c'est que vous avez sûrement une petite idée de ce qu'est #typst(). Mais nous allons tout de même passer en revue ce qui pourrait le définir.

=== Qu'estce que c'est ?

==== #typst() est un traitement de texte.

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


==== #typst() est une application Web
Effectivement les auteurs de #typst() ont créé une application web de qualité@typst-app qui permet d'éditer en ligne les documents et de les générer. Elle propose différents abonnements, gratuits et payants et la possibilité de travailler en collaboration avec d'autres utilisateurs. C'est une façon intelligente de se rémunérer sur un projet Open Source. L'application Web n'est pas Open Source, mais la partie gui génère les documents oui.


==== #typst() est un compilateur Open-Source
Le programme qui transforme le code de description du document en PDF #footnote[mais cela peut aussi être en image ou en HTML] est Open Source et gratuite. Vous pouvez la trouver sur Github@typst.
Quand on parle de compilateur, on pense à un programme qui transforme du code source en un autre programme, un exécutable. C'est un livrable autonome. Il n'a pas besoin de compilateur #footnote[On parle alors d'interpréteur.] pour être utilisable.

#typst() est un compilateur de documents, il transforme du code source en un document autonome, au choix :
- un document PDF
- une image au format _svg_ ou _png_
- une page web (en HTML)
qui n'a plus besoin du compilateur pour être lu, ni d'un client spécial. Bien sûr il faut un outil qui affiche le PDF ou un navigateur pour le HTML, mais le produit final est autonome de #typst().

==== #typst() est un langage
#typst() est également un langage de description de document. Le compilateur reconnaît les instructions de ce langage et exécute les instructions du fichier _.typ _qu'on lui fournit.

Il a sa propre syntaxe qui permet de décrire le document que l'on souhaite obtenir.
C'est principalement cette syntaxe que nous allons découvrir progressivement dans ce document.

=== Conventions sur ce document

#exemple[Mais avant cela, voyons un peu les outils que l'on trouve sur ce document.
Commençons par un exemple de code :]

```typst
Mais avant cela, voyons un peu les outils que l'on trouve sur ce document.
Commençons par un exemple de code :
```

Ce qu'il y a au dessus est un bloc de code qui sert à illustrer la syntaxe.
Je vais d'ailleurs faire souvent ce que l'on voit au-dessus, à savoir mettre le code dans la boîte de code et en dehors pour que l'on puisse voir le résultat. Mais je mettrais en vert le résultat du code, comme on peut le voir ici#footnote[Ce ne sera pas systématique, je ferais cette distinction des exemples quand cela sera vraiment nécessaire.].
Dans la boîte de code, celui-ci n'est pas interprété par le compilateur, ainsi, on peut voir la syntaxe et pas le résultat#footnote[car ce document est rédigé avec #typst()].
Ce que l'on peut voir de la boîte, est qu'elle affiche à droite le langage qui est mis en valeur et les lignes de code en alternance de couleurs.
Pour éviter que cela déborde, on peut voir deux lignes de texte dans la première partie grise, mais en réalité, j'ai vraiment écrit une seule ligne.

Le deuxième outil, ce sont aussi des boîtes de texte pour attirer ton attention, comme celle-ci :

#feature[Première Remarque][Une petite remarque dans une boîte en couleur.]

Quand je penserai à faire remarquer un concept important, j'utiliserai ce genre de boîte.

=== Petite explication sur la structure du document

Ce ouvrage est structuré comme suit :

- La première partie permet de découvrir les premiers éléments de langage indispensables. En particulier la syntaxe du mode _Markup_(cf. @modesSyntaxiques).
- La deuxième partie couvre partiellement le mode _Code_ dans l'optique de vous aider à personnaliser vos documents #footnote[Numérotation des titres, tailles de police, marges, ...].
- La dernière partie explore le code plus en profondeur.

De par sa construction, qui se veut progressive, il y aura des répétitions, mais j'espère que cela vous permettra de mieux comprendre #typst().

=== Réglages pour commencer

Je vais considérer que vous utilisez l'application en ligne sans trop expliquer comment elle fonctionne pour l'instant.
Comme nous allons écrire des documents en français, je vous conseille de mettre la ligne suivante au tout début de votre document systématiquement :

```typst
#set text(lang: "fr")
```
Cette petite ligne informe le compilateur que votre document est en français. Ce qui lui permet de traduire automatiquement les termes qu'il ajoute.
Cela permet également à l'application web de vous aider avec l'orthographe. C'est un appel à une fonction, je vous expliquera plus loin comment cela fonctionne(cf. @fonctions).

