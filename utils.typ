#import "@preview/frame-it:1.2.0": frames

#let (example, warning, feature, variant, syntax) = frames(
  feature: ("Remarque", rgb("ADD8E6")),
  warning: ("Attention", red.lighten(45%)),
  variant: ("Variant",),
  example: ("Exemple", gray),
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