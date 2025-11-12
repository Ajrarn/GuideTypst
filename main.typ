
// --------------- Imports de modules
#import "template.typ": guide
#show: guide.with(
    "Guide Typst",
    "Christophe Dos Santos",
    "un guide sur Typst",
    ("Typst","Guide","Français")
)

#import "utils.typ": feature, example, variant, syntax


// --------------- Contenu
#include "./chapitres/presentation.typ"
#include "./chapitres/redaction.typ"
#include "chapitres/fonctions.typ"
#include "chapitres/redactionAvancee.typ"

#bibliography("bibliographie.yml")







