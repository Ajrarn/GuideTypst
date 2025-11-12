#import "../utils.typ": feature

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

Nous allons commencer par les concepts les plus simples, les choses à savoir pour commencer à rédiger des documents.

Mais avant cela, voyons un peu les outils que l'on trouve sur ce document.
Commençons par un exemple de code :

```typst
Nous allons commencer par les concepts les plus simples, les quelque choses à savoir pour commencer à rédiger des documents.

Mais avant cela, voyons un peu les outils que l'on trouve sur ce document.
Commençons par un exemple de code :
```

Ce qu'il y a au dessus est un bloc de code qui sert à illuster la syntaxe.
Je vais d'ailleurs faire souvent ce que l'on voit au-dessus, à savoir mettre le code dans la boîte de code et en dehors pour que l'on puisse voir le résultat.
Dans la boîte de code, celui-ci n'est pas interprété par le compilateur (le programme qui transforme le code en document), ainsi, on peut voir la syntaxe.
On verra plus tard comment faire la même chose. Ce que l'on peut voir de la boîte, est qu'elle affiche à gauche le langage qui est mis en valeur et les lignes de code en alternance de couleurs.
Pour éviter que cela déborde, on peut voir deux lignes de texte dans la première partie grise, mais en réalité, j'ai vraiment écrit une seule ligne. C'est la seule transformation autorisée ici.

Le deuxième outil, ce sont aussi des boîtes de texte pour attirer ton attention, comme celle-ci :

#feature[Première Remarque][Une petite remarque dans une boîte en couleur.]

Quand je penserai à faire remarquer un concept important, j'utiliserai ce genre de boîte.

J'ai choisi une approche plutôt didactique. On va découvrir les concepts du plus simple au plus compliqué.
Du coup, les sujets risquent de s'entrecroiser.
Je commence bien évidemment par les outils pour écrire le document, et cela restera le fil directeur, mais cela sera interrompu par des explications conceptuelles qui devraient permettre de garder une bonne compréhension.
