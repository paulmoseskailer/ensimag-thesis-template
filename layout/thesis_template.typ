#import "/layout/titlepage.typ": *
#import "/layout/acknowledgement.typ": *
#import "/layout/abstract.typ": *
#import "/utils/print_page_break.typ": *
#import "/layout/fonts.typ": *

#let thesis(
  title: "",
  titleFrench: "",
  degree: "",
  program: "",
  specialization: "",
  supervisor: "",
  author: "",
  startDate: datetime,
  submissionDate: datetime,
  presentationDate: datetime,
  abstract_en: "",
  acknowledgement_content: "",
  abstract_fr: "",
  is_print: false,
  body,
) = {
  titlepage(
    title: title,
    titleFrench: titleFrench,
    degree: degree,
    program: program,
    specialization: specialization,
    supervisor: supervisor,
    author: author,
    startDate: startDate,
    submissionDate: submissionDate,
    presentationDate: presentationDate
  )

  print_page_break(print: is_print, to: "even")

  print_page_break(print: is_print)

  set page(
    margin: (left: 40mm, right: 40mm, top: 30mm, bottom: 30mm),
    numbering: none,
    number-align: center,
  )
  
  abstract(lang: "en")[#abstract_en]
  acknowledgement()[#acknowledgement_content]
  abstract(lang: "fr")[#abstract_fr]

  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: none,
    number-align: center,
  )

  set text(
    font: fonts.body, 
    size: 12pt, 
    lang: "en"
  )
  
  show math.equation: set text(weight: 400)

  // --- Headings ---
  show heading: set block(below: 0.85em, above: 1.75em)
  show heading: set text(font: fonts.body)
  set heading(numbering: "1.1")
  // Reference first-level headings as "chapters"
  show ref: it => {
    let el = it.element
    if el != none and el.func() == heading and el.level == 1 {
      link(
        el.location(),
        [Chapter #numbering(
          el.numbering,
          ..counter(heading).at(el.location())
        )]
      )
    } else {
      it
    }
  }

  // --- Paragraphs ---
  set par(leading: 1em)

  // --- Citations ---
  set cite(style: "alphanumeric")

  // --- Figures ---
  show figure: set text(size: 0.85em)
  
  // --- Table of Contents ---
  show outline.entry.where(level: 1): it => {
    v(15pt, weak: true)
    strong(it)
  }
  outline(
    title: {
      text(font: fonts.body, 1.5em, weight: 700, "Contents")
      v(15mm)
    },
    indent: 2em
  )
  
  
  v(2.4fr)
  pagebreak()


    // Main body. Reset page numbering.
  set page(numbering: "1")
  counter(page).update(1)
  set par(justify: true, first-line-indent: 2em)

  body

  // List of figures.
  pagebreak()
  heading(numbering: none)[List of Figures]
  outline(
    title:"",
    target: figure.where(kind: image),
  )

  // List of tables.
  pagebreak()
  heading(numbering: none)[List of Tables]
  outline(
    title: "",
    target: figure.where(kind: table)
  )

  // Appendix.
  pagebreak()
  heading(numbering: none)[Appendix A: Supplementary Material]
  include("/layout/appendix.typ")

  pagebreak()
  bibliography("/thesis.bib")
}
