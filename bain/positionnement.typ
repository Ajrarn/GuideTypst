== Des boites pour commencer
```typst
#rect(
  fill: red,
  inset: 8pt,
  radius: 4pt,
  [Une petite boite],
)
```

#rect(
  fill: red,
  inset: 8pt,
  radius: 4pt,
  [Une petite boite],
)

== grid

#set rect(
  inset: 8pt,
  fill: rgb("e4e5ea"),
  width: 100%,
)

#grid(
  columns: (1fr, 1fr),
  rows: (auto, 60pt),
  gutter: 3pt,
  rect[Fixed width, auto height],
  rect[Fixed width, auto height],
  rect[Fixed width, auto height],
  rect[Fixed width, auto height],

)

// Composant : swot-card
// title   : titre de la case (ex "Forces")
// base    : couleur du bloc (ex "#DFF0D8")
// header  : couleur du bandeau supérieur (ex "#3C763D")
// content : contenu (peut être un bloc de texte)
#let swot-card(title, base, header, content) = {
  // boîte extérieure carrée / rectangulaire
  box(
    width: 100%,        // s'adapte à la colonne de la grid
    height: 6.2cm,      // ajuste la hauteur comme tu veux
    radius: 6pt,
    stroke: none,
    fill: base     // accepte hex ou "rgb(...)" ; on passe base en string hex
  )[
    // Bandeau d'entête (foncé)
    #box(
      width: 100%,
      height: 1.1cm,
      radius: 6pt, // arrondir uniquement en haut
      inset: 6pt,
      stroke: none,
      fill: header
    )[
      // Titre centré et en blanc
      #set text(fill: white, weight: "bold", size: 11pt)
      #align(center)[#title]
    ]

    // Contenu : corps avec un petit padding
    // on utilise v() pour laisser un petit espace entre header et contenu
    #v(6pt)
    #box(
      width: 70%, // laisse marge intérieure
      inset: 6pt,
      radius: 6pt, // coins arrondis en bas
      stroke: none,
      fill: none // ou on peut laisser `none` pour garder la base visible
    )[
      // Remet le style du texte à la normale pour le corps
      #set text(fill: black, size: 10pt)
      #align(left)[#content]
    ]
  ]
}

#swot-card("essai",rgb("#E8F5E9"),rgb("#2E7D32"),[test])

// Données pour chaque quadrant
#let swot = (
  ( title: "Forces",        base: rgb("#E8F5E9"), header: rgb("#2E7D32"), content: [Liste des points forts...] ),
  ( title: "Faiblesses",    base: rgb("#FFEBEE"), header: rgb("#C62828"), content: [Points faibles...] ),
  ( title: "Opportunités",  base: rgb("#E3F2FD"), header: rgb("#1565C0"), content: [Possibilités / ouvertures...] ),
  ( title: "Menaces",       base: rgb("#FFF3E0"), header: rgb("#EF6C00"), content: [Risques / menaces...] )
)

// Grid 2x2 : 2 colonnes, gutter contrôlé
#grid(
  columns: 2,
  column-gutter: 12pt,
  row-gutter: 12pt,
  // on "map" la liste swot pour créer les cartes dans l'ordre
  ..swot.map(s => swot-card(s.title, s.base, s.header, s.content))
)
