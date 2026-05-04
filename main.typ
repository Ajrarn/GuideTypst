// --------------- Imports de modules
#import "utils.typ": typst
#import "template.typ": guide, my-outline, part, citation-block
#show: guide.with(
  [Concevoir et rédiger vos documents avec #typst(size: 2em)],
    "Christophe Dos Santos",
    "un guide sur Typst",
    ("Typst","Guide","Français")
)

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
