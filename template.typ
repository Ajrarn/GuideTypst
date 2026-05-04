#let primary-color = rgb("#008080") 
#let accent-color = primary-color.lighten(80%)
// Créer un compteur spécifique pour les parties
#let part-counter = counter("parties")

#let guide(
    titre,
    auteur,
    description,
    motsCles,
    body) = {

  // Codly
  import "@preview/codly:1.3.0": *
  import "@preview/codly-languages:0.1.1": *
  show: codly-init.with()

  codly(
  	languages: codly-languages,
  	number-format: none
  )

  // Frame-it
  import "@preview/frame-it:1.2.0": *
  show: frame-style(styles.boxy)

  // Réglages globaux
  set document(
    title: titre,
    author: auteur,
    description: description,
    keywords: motsCles
  )

  set text(
    font: "New Computer Modern",
    lang: "fr"
  )

  set page(
    paper: "a4",
    margin: (inside: 2.5cm, outside: 1.5cm, y: 2cm),
    numbering: "1"
  )

  set par(
    justify: true,
    first-line-indent: (amount: 2em, all: true),
    leading: 0.52em,
  )

 
  // --------------------------------------------------
  // STYLE DES TITRES
  // --------------------------------------------------
  show heading: it => {
    // Si pas de numérotation (ex: bibliographie), style minimal
  if it.numbering == none {
    // v(1.5em)
    // text(size: 1.6em, weight: "bold", fill: primary-color)[#it.body]
    // v(0.8em)
    pagebreak(weak: true)
      v(3em)
      set par(first-line-indent: 0em)  // annule l'indentation ici
        h(2em)
        text(font: "Allura", size: 3.2em, weight: "bold", fill: primary-color, it.body)
        v(-1.2em)
        line(length: 100%, stroke: 1pt + primary-color)
        v(4em)
    return
  }
  
  let levels = counter(heading).at(it.location())
    let levels = counter(heading).at(it.location())
    if it.level == 1 {
      pagebreak(weak: true)
      v(3em)
      set par(first-line-indent: 0em)  // annule l'indentation ici
      block(width: 100%, {
        let chap-num = levels.at(0)
        if chap-num > 0 {
          place(left, dx: -10pt, dy: -35pt)[
            #text(
              // font: "Allura",
              font: "DejaVu Serif",
              size: 9em,
              fill: accent-color,
              weight: "black"
            )[#chap-num]
          ]
        }
        h(2em)
        text(font: "Allura", size: 3.2em, weight: "bold", fill: primary-color, it.body)
        v(-1.2em)
        line(length: 100%, stroke: 1pt + primary-color)
      })
      v(4em)
    }
    else if it.level == 2 {
      v(2em)
      let section-num = numbering("1.1", levels.at(0), levels.at(1))
      stack(
        dir: ltr,
        spacing: 1em,
        rect(fill: primary-color, radius: 2pt, inset: 0.5em)[
          #text(fill: white, weight: "black", font: "Crimson Pro")[#section-num]
        ],
        align(
          horizon,
          text(size: 1.4em, weight: "bold", fill: primary-color.darken(20%), it.body)
        )
      )
      v(0.8em)
    }
    else if it.level == 3 {
      set par(first-line-indent: 0em)  // annule l'indentation ici
      v(2em)
      text(size: 1.1em, weight: "bold", fill: primary-color)[
        #it.body
        #h(0.5em)
        #box(width: 1fr, line(length: 100%, stroke: 0.5pt + primary-color.lighten(50%)))
      ]
      v(0.5em)
    }
  }
  
  set heading(numbering: "1")
 
  // On masque le titre quand ce sont des examples ou des tips
  show figure.caption: it => {
    if it.kind == "example" or it.kind == "tips" {
      it.supplement
      [ ]
      context it.counter.display(it.numbering)
    } else {
      it  // comportement par défaut pour les vraies figures
    }
  }

  show ref: it => context {
  if it.element != none and it.element.func() == heading {
    let h = it.element
    let nums = counter(heading).at(h.location())
    let level = h.depth

    let num-str = if level == 1 {
      numbering("I", nums.at(0))
    } else if level == 2 {
      numbering("1", nums.at(1))
    } else if level == 3 {
      numbering("1.1", nums.at(1), nums.at(2))
    } else {
      numbering("1.1.1", ..nums.slice(1))
    }

    let supplement = if level == 1 { [Partie] }
      else if level == 2 { [Chapitre] }
      else if level == 3 { [Section] }
      else { [Sous-section] }

    let current-page = here().page()
    let target-page = h.location().page()
    let diff = target-page - current-page
    let page-info = if diff == 0 {
        none
      } else if diff == 1 {
        if calc.rem(current-page, 2) == 0 { [, page ci-contre] }
        else { [, page suivante] }
      } else if diff == -1 {
        if calc.rem(current-page, 2) == 1 { [, page ci-contre] }
        else { [, page précédente] }
      } else {
        [, page #target-page]
      }

    [#supplement~#num-str#page-info]

  } else if it.element != none {
    // Référence non-heading : comportement original
    let current-page = here().page()
    let target-page = it.element.location().page()
    let diff = target-page - current-page
    let page-info = if diff == 0 { none }
      else if diff == 1 {
        if calc.rem(current-page, 2) == 0 { [, page ci-contre] }
        else { [, page suivante] }
      } else if diff == -1 {
        if calc.rem(current-page, 2) == 1 { [, page ci-contre] }
        else { [, page précédente] }
      } else { [, page #target-page] }
    [#it#page-info]
  } else {
    it
  }
}

  // List style
  set list(indent: 3em)
  // -------------- Page de Titre
  page(margin: (top: 35mm, bottom: 33mm, left: 2cm, right: 2cm))[
      #set text(size: 20pt)
      #align(center)[
        #v(1fr)
        #text(size: 1.5em)[
          #titre
        ]
        #v(1fr)
        #description
        #v(1fr)
        #auteur
    ]
  ]

  // Table Style
  // set rule
  set table(
    fill: (col, row) => {
      if row == 0 { primary-color }
      else if calc.odd(row) { accent-color }
      else { white }
    },
    stroke: (paint: primary-color.lighten(40%), thickness: 0.5pt),
    inset: (x: 6pt, y: 6pt),
    align: (col, row) => if row == 0 { center } else { left }
  )

  // show rule
  show table.cell: set text(size:0.9em)
  show table.cell.where(y: 0): set text(weight: "bold", fill: white)

  
  // Document body
  body
}

// --------------------------------------------------
// FONCTION PARTIE
// --------------------------------------------------
#let part(title, complement: none) = context {
  part-counter.step()
  let num = part-counter.get().first()
  pagebreak(weak: true)

  [#metadata((num: num, title: title)) <part-anchor>]

  // page de titre
  v(30%)
  align(center)[
    #text(
      font: "TeX Gyre Adventor",
      size: 0.9em,
      weight: "light",
      tracking: 0.3em,
      fill: primary-color
    )[
      #smallcaps([Partie]) #numbering("I", num)
    ]
    #v(0.5em)
    #block(
      stroke: (y: 1.5pt + primary-color),
      inset: (top: 1.5em, bottom: 1.5em),
      width: 80%
    )[
      #text(
        font: "TeX Gyre Adventor",
        size: 3em,
        weight: "bold"
      )[
        #title
      ]
    ]
  ]
  v(1fr)
  if complement != none [
    #complement
  ]
  v(1fr)
  pagebreak()
}

// --------------------------------------------------
// SOMMAIRE CUSTOM
// --------------------------------------------------
#let my-outline = context {
  heading(outlined: false, numbering: none)[Sommaire]
  
  // On collecte toutes les entrées : parties et headings
  // let parts = query(figure.where(kind: "part"))
  let parts = query(<part-anchor>)
  // el.value contient le dict (num, title)
  let headings = query(heading.where(outlined: true))

  // On fusionne et trie par position dans le document
  let all-entries = (
    parts.map(e => (kind: "part", el: e)) +
    headings.map(e => (kind: "heading", el: e))
  ).sorted(key: e => e.el.location().position().y.pt() + e.el.location().page() * 100000)

 
  pad(left: 12%, right: 17%)[
    #for entry in all-entries {
      let el = entry.el
      let loc = el.location()
      let page-num = loc.page()

      if entry.kind == "part" {
        let part-num = entry.el.value.num
        let part-title = entry.el.value.title
        v(0.8em)
        link(loc)[
          #grid(
            columns: (1fr, auto),
            text(weight: "bold", fill: primary-color, size: 1.1em)[
              #smallcaps("Partie") #numbering("I", part-num) — #part-title
            ],
            text(fill: primary-color, weight: "bold")[#page-num]
          )
        ]
        v(0.3em)
      } else {
        let lvl = el.level
        let indent = (lvl - 1) * 1.5em
        let body = el.body
        let nums = counter(heading).at(loc)
        let num-str = if lvl == 1 {
          numbering("1", nums.at(0))
        } else if lvl == 2 {
          numbering("1.1", nums.at(0), nums.at(1))
        } else {
          none
        }
        link(loc)[
          #pad(left: indent)[
            #grid(
              columns: (1fr, auto),
              gutter: 0.5em,
              text(size: if lvl == 1 { 1em } else { 0.9em })[
                #if num-str != none { text(fill: primary-color, weight: "bold")[#num-str #h(0.5em)] }
                #body
              ],
              text(size: 0.9em)[#page-num]
            )
          ]
        ]
      }
    }
  ]
}

#let citation-block(offset: 0em, content, author) = {
  v(offset)
  align(center + horizon)[
    #line(length: 30%, stroke: 0.5pt + primary-color.lighten(20%))
    #v(0.6em)
    #text(size: 1.3em, style: "italic")[#content]
    #v(0.6em)
    #text(size: 0.85em, fill: primary-color)[#author]
    #v(0.4em)
    #line(length: 30%, stroke: 0.5pt + primary-color.darken(20%))
  ]
}
