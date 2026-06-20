#import "@local/neo-core:0.1.0" as neo

#import "color-theme.typ": *

#let action(titel, inhalt) = {
  // Definition der Farben je nach Modus
  let titel-farbe = amber.at("600")
  let inhalt-farbe = gray.at("900")
  
  block(
    width: 100%,
    {
      pad(
        // left: 10pt, 
        // right: 10pt,
        align(left, {
          text(size: 10pt, font: "Controwell", tracking: 1pt, fill: titel-farbe, titel) 
          h(5pt)
          text(fill: inhalt-farbe, inhalt)
        })
      )
    }
  )
}

#let description(desc, dark: false) = {
  // Definition der Textfarbe je nach Modus
  let text-farbe = if dark { gray.at("900") } else { amber.at("900")  }
  
  block(
    pad(
      // left: 10pt, 
      // right: 10pt,
      text(fill: text-farbe, style: "italic", desc)
    )
  )
}

#let header(inhalt) = {
  block(
    width: 100%,
    height: 16pt,
    fill: gray.at("100"),
    radius: 0pt,
    stroke: (0.8pt + gray.at("400")),
    align(center, heading(level: 3, numbering: none)[#inhalt])
  )
}

#let range(arr) = [
  #arr.first() - #arr.last()
]


#let render_magic(magic) = [
  #align(left, heading(level: 2, numbering: none)[#magic.name])

  #for essenz in magic.essenz [
    #header(essenz.n)
    #description(essenz.d)
    #action("Basisattribut:", essenz.attr)
    #action("Stufe:", str(essenz.l))
    #action("Trainingsstufe:", str(essenz.t))
  ]
]

#let render_profession(prof) = [
  === #prof.name

  #prof.desc

  *_Attribute mit einem Minimalwert_*
  #table(
    columns: (1.5fr, 1fr),
    stroke: table-stroke,
    fill: table-fill,
    align: (left + horizon, center + horizon),
    [*Attribut*], [*Min.*],
    ..for attr in prof.min-attr {
      (attr.attr, str(attr.min))
    },
  )

  #if "max-attr" in prof [
    *_Attribute mit einem Maximalwert_*
    #table(
      columns: (1.5fr, 1fr),
      stroke: table-stroke,
      fill: table-fill,
      align: (left + horizon, center + horizon),
      [*Attribut*], [*Max.*],
      ..for attr in prof.max-attr {
        (attr.attr, str(attr.max))
      },
    )
  ]

  #action("Mögliche Tugenden:", prof.pros.join(", "))
  #action("Mögliche Nachteil:", prof.cons.join(", "))
  #action("Typische Fertigkeiten:", prof.skills.join(", "))

  #if "look" in prof [
    #table(
      columns: (auto, 1fr),
      align: (left, left),
      stroke: table-stroke,
      fill: table-fill,
      ..prof.look
    )
  ]
]

#let render_skill(skill) = {
  header(skill.n)
  description(skill.d)
  action("Basisattribut:", skill.attr)
  action("Stufe:", str(skill.l))
  action("Trainingsstufe:", str(skill.t))
}

#let render_traits(trait,
font_size: 12pt) = {
  block(
    width: 100%,
    header(trait.n)
  )

  if trait.desc != none {
    description(trait.desc)
    pad(align(center, v(5pt) + line(length: 30%, stroke: 0.5pt + gray.at("700")) + v(5pt)))
  }
  
  if trait.s != none {
    action("Stufe:")[#range(trait.s)]
  }

  if "e" in trait [
    #action("Ertrag:", str(trait.e))
  ]

  if "k" in trait [
    #action("Kosten:", str(trait.k))
  ]

  if trait.a != none {
   action("Gegensatz:")[#trait.a.join(", ")]
  }

  if trait.regel != none {
    action("Regelanpassung:")[#trait.regel]
  }

  if "kat" in trait [
    #action("Kategorie:", trait.kat)
  ]
    v(1.5em)
}

#let render_weapon(weapon) = {
  header(weapon.n)

  description(weapon.d)
}



