#import "@preview/frame-it:1.2.0": frames, divide
#import "@preview/showybox:2.0.4": showybox
#let divide = divide

#let (example, warning, feature, variant, syntax) = frames(
  feature: ("Remarque", rgb("ADD8E6")),
  warning: ("Attention", red.lighten(45%)),
  variant: ("Variant",),
  example: ("Exemple", blue.lighten(10%)),
  syntax: ("Syntax",),
)

#let LaTeX = {
  let A = (
    offset: (
      x: -0.33em,
      y: -0.3em,
    ),
    size: 0.7em,
  )
  let T = (
    x_offset: -0.12em
  )
  let E = (
    x_offset: -0.2em,
    y_offset: 0.23em,
    size: 1em
  )
  let X = (
    x_offset: -0.1em
  )
  [L#h(A.offset.x)#text(size: A.size, baseline: A.offset.y)[A]#h(T.x_offset)T#h(E.x_offset)#text(size: E.size, baseline: E.y_offset)[E]#h(X.x_offset)X]
}

// logo typst
#let typst(size: none) = {
  let content = text(
    font: "Linux Libertine",
    fill: rgb("#239dad"),
    weight: "semibold",
    [typst]
  )

  if size != none {
    text(size: size, content)
  } else {
    content
  }
}

// Constante pour œ minuscule
#let oe = [œ]

// Constante pour Œ majuscule
#let OE = [Œ]

// Mise en valeur des exemples
#let exemple(body) = {
  text(fill:olive,body)
}

#let example(title, code, result) = {
  figure(
    kind: "example",
    supplement: [Exemple],
    caption: [#title],
    showybox(
      width: 90%,
      title-style: (
        boxed-style: (
          anchor: (x: center, y: horizon),
          radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt),
        )
      ),
      frame: (
        title-color: blue.lighten(20%),
        footer-color: white,
        border-color: blue.darken(20%),
        radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt)
      ),
      footer-style: (
        color: black
      ),
      title: [*#title*],
      footer: [
        #result
      ]
    )[
      #code
    ]
  )
}

#let tips(title, body) = {
  figure(
    kind: "tips",
    supplement: [Astuce],
    caption: [#title],
    showybox(
      width: 90%,
      title-style: (
        boxed-style: (
          anchor: (x: center, y: horizon),
          radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt),
        )
      ),
      frame: (
        title-color: green.lighten(20%),
        footer-color: white,
        border-color: green.darken(20%),
        radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt)
      ),
      title: [*#title*],
    )[
      #body
    ]
  )
}