// Créer un compteur spécifique pour les parties
#let compteur-parties = counter("parties")

#let guide(
    titre,
    auteur,
    description,
    motsCles,
    body) = {

  // Très important, informer Typst que notre document est en français
  set text(lang: "fr")

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
    first-line-indent: (amount: 2em, all: true),
    leading: 0.52em,
  )



  set heading(numbering: (..nums) => {
    let nums = nums.pos()
    if nums.len() == 1 {
      // Niveau 1 = parties (numérotation en chiffres romains)
      numbering("I", nums.at(0))
    } else if nums.len() == 2 {
      // Niveau 2 = chapitres (numérotation simple : 1, 2, 3...)
      // On ignore le niveau 1 et on numérote indépendamment
      numbering("1", nums.at(1))
    } else if nums.len() == 3 {
      // Niveau 3 = sections (numérotation : 1.1, 1.2...)
      numbering("1.1", nums.at(1), nums.at(2))
    } else {
      // Niveau 4+ = sous-sections (numérotation : 1.1.1...)
      numbering("1.1.1", ..nums.slice(1))
    }
  })


  show heading.where(level: 1): it => {
    // Ne rien afficher, l'affichage est géré par la fonction partie()
    // Le heading sert uniquement pour la structure du document et le sommaire
  }

  show heading.where(level: 2): it => {
    pagebreak(to: "odd", weak: true)
    v(2cm)

    if it.numbering != none {
      // Utiliser context ici aussi
      context {
        let counts = counter(heading).at(here())
        if counts.len() >= 2 {
          align(center)[
            #text(size: 14pt)[Chapitre #counts.at(1)]
            #v(1.5em)
            #text(size: 18pt, weight: "bold")[#it.body]
          ]
        }
      }
    } else {
      align(center)[
        #text(size: 18pt, weight: "bold")[#it.body]
      ]
    }

    v(2cm)
  }

  // Personnalisation des références pour avoir la page ou se trouve le label
  show ref: it => context {
    if it.element != none {
      let current-page = here().page()
      let target-page = it.element.location().page()
      let diff = target-page - current-page

      let page-info = if diff == 0 {
          // Même page : pas d'indication
          none
        } else if diff == 1 {
          if calc.rem(current-page,2) == 0 {
            [, page ci-contre]
          } else {
            // Page suivante (mais pas même double-page)
            [, page suivante]
          }
        } else if diff == -1 {
          if calc.rem(current-page,2) == 1 {
            [, page ci-contre]
          } else {
            // Page précédente (mais pas même double-page)
            [, page précédente]
          }
        } else {
          // Écart plus grand
          [, page #target-page]
        }

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

  body
}

// preambule function to be used in the document
#let preambule(body) = [
  // règle locale : pour les headings dans ce bloc, on règle heading(numbering: none)
  #show heading: set heading(numbering: none)

  // contenu du préambule
  #body
]


// Fonction qui va affficher la page de séparation de partie avec complément
#let partie(titre, complement: none) = {
  pagebreak(to: "odd", weak: true)
  v(1fr)
  align(center)[
    #text(size: 24pt, weight: "bold")[
      PARTIE
      #context {
        let compteurs = counter(heading).at(here())
        // Afficher le prochain numéro de partie (qui sera incrémenté juste après)
        numbering("I", compteurs.at(0, default: 0) + 1)
      }
    ]
    #v(0.5em)
    #text(size: 20pt, weight: "bold")[#titre]
    #v(2em)
    #if complement != none [
      #complement
    ]
  ]
  v(1fr)

  // Sauvegarder la valeur actuelle du compteur de chapitres (niveau 2)
  context {
    let compteurs = counter(heading).at(here())
    let chapitre-actuel = if compteurs.len() >= 2 { compteurs.at(1) } else { 0 }

    // Créer un heading de niveau 1
    show heading: none
    heading(level: 1)[#titre]

    // Restaurer le compteur de chapitres
    context {
      let nouveaux-compteurs = counter(heading).at(here())
      counter(heading).update((nouveaux-compteurs.at(0), chapitre-actuel))
    }
  }

  pagebreak()
}