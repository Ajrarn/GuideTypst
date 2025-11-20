// --------------- Imports de modules
#import "template.typ": guide, preambule, partie
#show: guide.with(
    "Guide Typst",
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

#partie(
  "Découverte",
  complement: [
    #text(size: 12pt, style: "italic")[« Le commencement est la partie la plus importante du travail. » — Platon]
  ]
)
#include "decouverte/presentation.typ"
#include "decouverte/redaction.typ"
#include "decouverte/fonctions.typ"
#include "decouverte/redactionAvancee.typ"
#include "decouverte/librairies.typ"

#partie(
  "Dans le grand bain",
  complement: [
    #text(size: 12pt, style: "italic")[« Le commencement est la partie la plus importante du travail. » — Platon]
  ]
)
#include "bain/positionnement.typ"

#bibliography("bibliographie.yml")
