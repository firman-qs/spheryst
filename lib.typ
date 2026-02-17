#import "@preview/equate:0.3.2": *
#import "@preview/i-figured:0.2.4"
#import "@preview/physica:0.9.8": *

// custom macros
#let odif(y, ord: 1) = {
  if ord == 1 {
    [$#math.upright("d")#y$]
  } else {
    [$#math.upright("d")^ord#y$]
  }
}

#let DocType = {
  (
    Homework: "homework",
    Report: "report",
  )
}

#let Lang = {
  (
    Indonesia: "indonesia",
    English: "english",
  )
}

#let template(
  title: [Title of The Document],
  author: [Ezalor],
  id: [875012378123],
  offering: [SU57],
  course: none,
  num_heading: false,
  doc_lang: Lang.English,
  doc_type: DocType.Homework,
  subtitle: [Subtitle for the homework, this currently available only on report. You can leave it blank],
  font_rm: none,
  font_sf: none,
  report_foot: [],
  logo: "figures/um-logo.png",
  body,
) = {
  // variables
  let (eq_label, tab_label, fig_label) = if doc_lang == Lang.English {
    ([Eq.], [Table], [Fig.])
  } else if doc_lang == Lang.Indonesia {
    ([Persamaan.], [Tabel], [Gambar])
  }

  let font_serif = if (font_rm == none) {
    "Libertinus Serif"
  } else {
    font_rm
  }

  let font_sans = if (font_sf == none) {
    "Calibri"
  } else {
    font_sf
  }

  // set rules
  set page(paper: "a4", margin: 3cm)
  set heading(numbering: "1.1.") if num_heading == true
  set figure(supplement: [#fig_label])
  set table(stroke: 0.8pt)
  set math.equation(numbering: "(1.a)", supplement: [#eq_label])

  show heading: set text(size: 12pt, font: font_sans)
  show heading: set block(above: 1.4em, below: 1em)
  show heading.where(level: 1): it => upper(it)

  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set align(left)
  show figure.where(kind: table): set figure(supplement: [#tab_label])
  show: equate.with(breakable: true, sub-numbering: true, number-mode: "label")

  if doc_type == DocType.Homework {
    // fonts
    set text(size: 12pt, font: font_serif)

    align(center)[
      #text(weight: "bold", size: 14pt, font: font_sans)[
        #title
      ]
      #v(1em, weak: true)
      #subtitle
      #v(1em, weak: true)
      #if course != none { [#course#if offering != none { [---Offering: #offering] }] }
      #v(1em, weak: true)
      #if author != none { [#author] }
      #if id != none { [| #id] }
    ]
    v(1em, weak: true)
    line(length: 100%, stroke: 0.7pt)
    v(2em, weak: true)

    set par(justify: true)

    body
  } else if doc_type == DocType.Report {
    set text(size: 12pt, font: font_serif)
    set par(
      leading: 0.7em,
      spacing: 0.7em,
      first-line-indent: (amount: 2em),
      justify: true,
    )

    show heading.where(level: 1): it => {
      if it.numbering == none {
        return [
          #pagebreak()
          #align(center)[#it]
          #v(1em)
        ]
      }

      pagebreak()
      upper[
        #align(center)[
          #set heading(numbering: "1.")
          #let chapter_num = counter(heading).at(it.location()).first()
          #if (doc_lang == Lang.English) { [Chapter] } else if (doc_lang == Lang.Indonesia) { [Bab] } #chapter_num
          #v(0.7em, weak: true)
          #it.body
          #v(1em)
        ]
      ]
    }

    align(center)[
      #upper[#strong[
        #if (doc_lang == Lang.English) {
          [#course Report]
        } else if (doc_lang == Lang.Indonesia) {
          [Makalah #course]
        }

        #title

      ]]
      #subtitle
      #v(1fr)
      #image(logo, width: 3cm)
      #v(1fr)
      #if (doc_lang == Lang.English) {
        [By:]
      } else if (doc_lang == Lang.Indonesia) {
        [Oleh:]
      }

      #author

      #id

      #v(1fr)

      #strong[#upper[
        #report_foot
      ]]
    ]

    pagebreak()
    body
  }
}
