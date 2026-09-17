// ============================================================
// ST201 ASSIGNMENT — TYPST TEMPLATE
// ============================================================

// ------------------------------------------------------------
// ST201 colour palette
// ------------------------------------------------------------

#let st201-teal = rgb("#153638")
#let st201-dark = rgb("#263638")
#let st201-grey = rgb("#667477")
#let st201-light = rgb("#F4F6F6")
#let st201-rule = rgb("#D9DEDF")

// ------------------------------------------------------------
// Utility: small caps / labels
// ------------------------------------------------------------

#let label(text) = [
  #text(
    size: 8.5pt,
    weight: "semibold",
    fill: st201-teal,
    tracking: 0.7pt,
  )[#text]
]

// ------------------------------------------------------------
// Assignment metadata
// ------------------------------------------------------------

#let assignment-meta(text) = block(
  fill: st201-light,
  stroke: (left: 2pt + st201-teal),
  inset: (x: 10pt, y: 8pt),
  radius: 2pt,
  width: 100%,
  text(size: 9pt, fill: st201-dark)[#text],
)

// ------------------------------------------------------------
// Main article function
// ------------------------------------------------------------

#let article(
  title: none,
  subtitle: none,
  authors: none,
  description: none,
  date: none,

  paper: "a4",
  margin: (
    left: 2.5cm,
    right: 2.5cm,
    top: 2.2cm,
    bottom: 2.2cm,
  ),

  font: "New Computer Modern",
  mathfont: "New Computer Modern Math",
  codefont: "IBM Plex Mono",
  fontsize: 10.5pt,
  linestretch: 1.15,

  linkcolor: "#356B70",
  sectionnumbering: none,

  toc: false,

  doc,
) = {

  // ----------------------------------------------------------
  // Document metadata
  // ----------------------------------------------------------

  set document(
    title: title,
  )

  // ----------------------------------------------------------
  // Page
  // ----------------------------------------------------------

  set page(
    paper: paper,
    margin: margin,

    numbering: "1",

    header: context [
      #grid(
        columns: (1fr, auto),
        align: (left, right),

        [
          #text(
            size: 8pt,
            weight: "semibold",
            fill: st201-teal,
            tracking: 0.5pt,
          )[ST201 · DATA ANALYSIS]
        ],

        [
          #text(
            size: 8pt,
            fill: st201-grey,
          )[PRACTICE QUESTIONS]
        ],
      )

      #v(3pt)

      #line(
        length: 100%,
        stroke: 0.5pt + st201-rule,
      )
    ],

    footer: context [
      #grid(
        columns: (1fr, auto),

        [
          #text(
            size: 7.5pt,
            fill: st201-grey,
          )[ST201 · Data Analysis]
        ],

        [
          #text(
            size: 7.5pt,
            fill: st201-grey,
          )[
            #counter(page).display()
          ]
        ],
      )
    ],
  )

  // ----------------------------------------------------------
  // Global typography
  // ----------------------------------------------------------

  set text(
    font: font,
    size: fontsize,
    fill: st201-dark,
  )

  set par(
    leading: 0.72em,
    spacing: 0.75em,
    justify: false,
  )

  // ----------------------------------------------------------
  // Links
  // ----------------------------------------------------------

    show link: this => {
    if type(this.dest) != label {
        text(this, fill: rgb(linkcolor.replace("\\#", "#")))
    } else {
        text(this, fill: rgb("#0000CC"))
    }
  }

  // ----------------------------------------------------------
  // Headings
  // ----------------------------------------------------------

  show heading.where(level: 1): it => block(
    above: 1em,
    below: 0.5em,
  )[
    #text(
      size: 15pt,
      weight: "bold",
      fill: st201-teal,
    )[
      #it.body
    ]

    #v(-0.35cm)

    #line(
      length: 100%,
      stroke: 0.7pt + st201-rule,
    )
  ]


  show heading.where(level: 2): it => block(
    above: 1.4em,
    below: 0.55em,
  )[
    #text(
      size: 12pt,
      weight: "bold",
      fill: st201-dark,
    )[
      #it.body
    ]
  ]

  show heading.where(level: 3): it => block(
    above: 1em,
    below: 0.4em,
  )[
    #text(
      size: 10.5pt,
      weight: "semibold",
      fill: st201-teal,
    )[
      #it.body
    ]
  ]

  // ----------------------------------------------------------
  // Code blocks
  // ----------------------------------------------------------

  show raw.where(block: true): it => block(
    fill: st201-light,
    stroke: 0.5pt + st201-rule,
    radius: 3pt,
    inset: 9pt,
    width: 100%,
    above: 0.7em,
    below: 0.9em,
  )[
    #set text(
      font: codefont,
      size: 8.5pt,
    )

    #it
  ]

  // ----------------------------------------------------------
  // Block quotes
  // ----------------------------------------------------------

  show quote: it => block(
    fill: st201-light,
    stroke: (left: 2pt + st201-teal),
    inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
    radius: 2pt,
  )[
    #it
  ]

  // ----------------------------------------------------------
  // Tables
  // ----------------------------------------------------------

  show table: set table(
    stroke: (x: none, y: 0.4pt + st201-rule),
    inset: 6pt,
  )

  // ----------------------------------------------------------
  // Title block
  // ----------------------------------------------------------

    v(1fr)

    align(center)[
      #text(
        size: 20pt,
        weight: "bold",
        fill: st201-dark,
      )[
        #title
      ]
    ]

    if description != none [
      #v(1pt)

      #align(left)[#text(
        size:10pt,
        fill: st201-grey

      )[
        #description
      ]
    ]
  ]

  v(1cm)

 text[Student name: #box(height: -1pt)[#line(length: 25%, stroke: 0.5pt + st201-grey)]]

 v(0.5cm)

 text[Student number: #box(height: -1pt)[#line(length: 25%, stroke: 0.5pt + st201-grey)]]

  v(1fr)

  // ----------------------------------------------------------
  // Content
  // ----------------------------------------------------------

  doc
}
