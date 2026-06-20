#import "@local/neo-core:0.1.0" as neo

#import "doc-properties.typ" as srd
#import "color-theme.typ": *
#import "version.typ": *


#let chapter-font = (
    size: 16pt, 
    font: "Controwell", 
    fill: amber.at("700")
)
#let section-font = (
  size: 14pt, 
  font: "Controwell",
  fill: amber.at("800")
)

#let subsection-font = (
  size: 12pt, 
  font: "Controwell",
  fill: gray.at("800")//color.amber.at("800")
)

#let subsubsection-font = (
  size: 11pt, 
  font: "Controwell",
  fill: gray.at("800")//color.amber.at("800")
)

#let toc-config(body) = {
  // set list(marker: sym.arrow) // Oder ein beliebiges Zeichen wie "•" oder "‣"
  // Setzten der Standard Farbe für den Text.
  set text(lang: "de", size: 9.5pt, font: "New Computer Modern", fill: primary-color)

  // Verhalten für Kapitel Überschrift.
  show heading.where(level: 1): it => { 
    if it.numbering == none {
      return block(width: 100%)[
        #v(1em)
        // #text(..chapter-font)[#it.body]
        #align(center, text(size: 20pt, font: "Controwell", it.body))
        #v(1em) 
      ]
    }

    // Ansonsten: Spezielles Kapitel-Design
    set text(size: 9pt, weight: "regular") 
    block(width: 100%)[
      #v(0.5em)
      #text(..chapter-font)[#it.body]
      #line(length: 100%, stroke: 2pt + amber.at("700"))
    ]
  }

  show heading.where(level: 2): it => {
    v(1em)
    block(width: 100%)[
      #text(..section-font)[#it.body]
      #v(-0.6em)
      #line(length: 100%, stroke: 1pt + amber.at("800"))
      #v(0.5em)]
  }

  show heading.where(level: 3): it => {
    v(.5em)
    text(..subsection-font, fill: section-color)[#it.body]
    v(-4pt)
  }


  // Global alle Überschriften ab Ebene 4 von der Nummerierung befreien
  show heading.where(level: 4): it => {
    v(.25em)
    text(..subsubsection-font, fill: section-color)[#it.body]
    v(-2pt)
  }
  //set heading(numbering: none)
  show heading.where(level: 5): set heading(numbering: none)

  body
  
}


/////////////////////////////////////////////////////////////////////////
//      Beginn des Dokumentes
///////////////////////////////////////////////////////////////////////// 

#show: srd.use-format//.with(format: srd.a4)

#show: neo.make-glossary
#neo.register-glossary(neo.glossary)

#show: toc-config
#let title = "N.E.O."
#let subtitle = "Nebenwelten Engine für das Omniversum"

#set document(title: title + " - " + subtitle)
#set text(font: "Libertinus Serif", size: 10pt, lang: "de")
#set heading(numbering: "1.1.")

#show: srd.background

#include "impressum.typ"

#show outline.entry: it => {
  let target = it.element
  if target.func() == heading {
    context {
      let page_num = counter(page).at(target.location()).at(0)
      
      // Einrücken basierend auf der Ebene (Level)
      let indent_size = if target.level > 2 { 0.75em } else { 0em }//(target.level - 1) * 1.5em
      let text_size = if target.level == 1 {
        (size: 11pt, fill: amber.at("800"), weight: "bold") 
      } else {
        (size: 10pt, fill: gray.at("600")) 
      }
      set text(text_size.size, text_size.fill)

      // let text_fill = if(target.level)
      

      pad(left: indent_size)[
        #link(target.location())[
          #if target.level == 1 {
            v(1.5em)
          }
          #text(weight: "bold")[#target.body] #h(1fr) #page_num
          // #if target.level == 2 {
            #v(0.25em)
          // }
          #if target.level == 1 {
            v(0.25em)
          }
        ]
      ]
      v(0.5em, weak: true) // Vertikaler Abstand zwischen den Zeilen
    }
  } else {
    it
  }
}
#{
  // show heading: set heading(numbering: none)
  set outline.entry(fill: none)
  v(5em)
  align(center, text(size: 20pt, font: "Controwell", "Inhaltsverzeichnis"))
  columns(3)[
    #outline(title: none, depth: 3)
  ]
}

// --- KAPITELSTRUKTUR ---
// #set page(numbering: "1")
// #counter(page).update(1)
// --- KAPITELSTRUKTUR ---
#pagebreak()

#columns(2, ..srd.columns-gutter)[

#include "kernmechanik.typ"
#include "magie.typ"
#include "character.typ"

]


#include "clothing.typ"

#include "weapons.typ"

#columns(2, ..srd.columns-gutter)[
= Spezies
#include "gegner.typ"
#include "tiere.typ"
#include "traits.typ"
#include "skills.typ"



== Matrix für Befähigungen
== Universelle Referenzbeispiele
== Richtlinien zur Erstellung
// ]

// -- Begin Abkürzungsverzeichnis
// #pagebreak()
// #align(center, heading(level: 1, numbering: none)[Glossar])
= Glossar
// #columns()[
  #neo.print-glossary(neo.glossary, disable-back-references: true)
]