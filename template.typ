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
    margin: (x: 1.8cm, y: 1.5cm),
    numbering: "1"
  )

  set par(
    justify: true,
    leading: 0.52em,
  )

  set heading(numbering: "1.1 -")

  show heading.where(depth: 1): body => {
    pagebreak(weak: true)
    body
  }

  // -------------- Page de Titre
  align(center, text(17pt)[
    *#titre*
  ])

  align(center, text(13pt)[
    *#description*
  ])

  align(center, text(13pt)[
    *#auteur*
  ])

  body
}