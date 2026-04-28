// --------------- Imports de modules
#import "utils.typ": typst
#import "template.typ": guide, preambule, partie
#show: guide.with(
  [Concevoir et rédiger vos documents avec #typst(size: 2em)],
    "Christophe Dos Santos",
    "un guide sur Typst",
    ("Typst","Guide","Français")
)

// --------------- Contenu
#preambule(
  [
    == Sommaire
    #outline(
      depth: 4,
      title: none
    )
  ]
)

#partie("Introduction",
  complement: [
    #text(size: 12pt, style: "italic")["Le commencement est la partie la plus importante du travail." — Platon]
  ]
)

#include "introduction/presentation.typ"

#partie(
  "Dans le petit bassin",
  complement: [
    #text(size: 12pt, style: "italic")["Le commencement est la partie la plus importante du travail." — Platon]
  ]
)

#include "decouverte/decouverte.typ"
#include "decouverte/packages.typ"

#partie(
  "Dans le grand bain",
  complement: [
    #text(size: 12pt, style: "italic")["Celui qui n'a pas plongé ne connaît pas la profondeur de la mer." – proverbe persan]
  ]
)
#include "bain/fonctions.typ"
#include "bain/positionnement.typ"

#bibliography("bibliographie.yml")
