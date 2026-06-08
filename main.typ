// --------------- Imports de modules
#import "utils.typ": typst, apply-oe
#import "template.typ": guide, my-outline, part, citation-block



#show: guide.with(
  [
    Concevoir et rédiger vos documents avec
  
    #typst(size: 1.5em)
  ],
  "Christophe Dos Santos",
  "",
  ("Typst","Guide","Français")
)

#align(center)[
    Ce guide est mis à disposition selon les termes de la\
    #link("https://creativecommons.org/licenses/by-sa/4.0/deed.fr")[
      Licence Creative Commons Attribution – Partage dans les Mêmes Conditions 4.0 International
    ].
    #image("assets/Creative Commons BY-SA.svg", width: 3cm)
  
    Le code source est disponible sous licence MIT.

]

#show: apply-oe


// --------------- Contenu
#my-outline

#part[Introduction]
#include "introduction/main.typ"

#part(complement: [
  #citation-block[Le commencement est la partie la plus importante du travail.][Platon]
])[Dans le petit bassin]
#include "decouverte/main.typ"

#part(complement: [
  #citation-block[Celui qui n'a pas plongé ne connaît pas la profondeur de la mer.][proverbe persan]
])[Dans le grand bain] 
#include "bain/fonctions.typ"
#include "bain/positionnement.typ"

#bibliography("bibliographie.yml")
