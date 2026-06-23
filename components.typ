#import "@local/neo-core:0.1.0" as neo

#import "color-theme.typ": *

// #import "weapons.typ": weapons
// #import "skills.typ": skills
// #import "magic-skills.typ": magic-skills

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

#let arr_range(arr) = [
  #arr.first() - #arr.last()
]


#let render_magic(magic) = [
  #align(left, heading(level: 2, numbering: none)[#magic.name])

  #for essenz in magic.fokus [
    #header(essenz.n)
    #description(essenz.d)
    #action("Basisattribut:", essenz.attr)
    #action("Stufe:", str(essenz.l))
    #action("Trainingsstufe:", str(essenz.t))
  ]
]

#let render_manifestations(manifs) = {
  for (key, man) in manifs {
    // Ausgabe der Basisdaten
    [=== #man.name]
    description([#man.desc])
    action("Komplexität:", [#man.stufe])
    action("Zauberdauer:", [#man.zauberdauer])
    if "zmod" in man {
      man.zmod
    }

    
    if "modifikator" in man {
      action("Modifikator", [#man.modifikator])
    }

    // Prüfung und Generierung der einfachen Tabelle
    if "mod_data" in man {
      parbreak()
      table(
        columns: (1fr, 1fr),
        align: (center, center),
        stroke: table-stroke,
        fill: table-fill,
        ..man.mod_data.flatten()
      )
    }

    v(0em) // Abstand zur nächsten Manifestation
  }
}


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

  #action("Positive Eigenschaften:", prof.pros.join(", "))
  #action("Negative Eigenschaften:", prof.cons.join(", "))
  #action("Empfohlene Fertigkeiten:", prof.skills.join(", "))

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

#let render_resonanzen(resos) = {
  for (key, res) in resos {
    [=== #res.name]
    description(res.desc)
    action("Zauberdauer:", res.zauberdauer)
    

    if "reichweite_text" in res {
      action("Reichweite:", res.reichweite_text)
    }

    if "rinhalt_ref" in res {
      parbreak()
      table(
        columns: (1fr, 1fr),
        align: center,
        stroke: table-stroke,
        fill: table-fill,
        ..res.rinhalt_ref.flatten()
      )
    }

    if "modifikator" in res {
      action("Modifikator:", res.modifikator)
    }

    v(1em)
  }
}

#let render_skill(skill) = {
  header(skill.n)
  description(skill.d)
  action("Basisattribut:", skill.attr)
  action("Komplexität:", str(skill.l))
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
    action("Stufe:")[#arr_range(trait.s)]
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



















#let get-weapon(target-id) = {
  let all = neo.weapons.nahkampfwaffen + neo.weapons.distanzwaffen + neo.weapons.fernkampfwaffen
  return all.find(w => w.id == target-id)
}

#let get-skill(target-id) = {
  let all = neo.skills.combat + neo.skills.handwerk + neo.skills.natur + neo.skills.sozial + neo.skills.technik + neo.skills.survival
  return all.find(s => s.id == target-id)
}

#let get-magic-skill(target-id) = {
  let all = ()
  for dom in neo.magic-skills { all = all + dom.fokus }
  return all.find(s => s.id == target-id)
}

#let render-npc(npc) = {
  let attr-val(idx, key) = str(npc.at(key).at(idx))

  let magic-str() = {
    let sk-ids = npc.magic_skills
    let result = ()
    
    for i in range(sk-ids.len()) {
      let current-id = sk-ids.at(i)
      let sk = get-magic-skill(current-id)
      if sk != none {
        let value
        let item = [*#sk.n*  (Attr: #sk.attr, Stufe: #sk.l, FW: #npc.magic_fw.at(0).at(i) / #npc.magic_fw.at(1).at(i) / #npc.magic_fw.at(2).at(i))]
        result += (item,)
      } else {
        // Fallback: ID nicht gefunden
        let item = [ID nicht gefunden: #current-id]
        result += (item,)
      }
    }
    return result
  }

  // Helper für Mundane Skills (über ID)
  let skills-str() = {
    let sk-list = npc.skills
    let result = ()
    for i in range(sk-list.len()) {
      let pair = sk-list.at(i)
      let sk = get-skill(pair) // pair.at(0) ist die ID
      if sk != none {
        let item = [*#sk.n* (#sk.attr, Stufe #sk.l) — FW: #npc.skills_fw.at(0).at(i) / #npc.skills_fw.at(1).at(i) / #npc.skills_fw.at(2).at(i)]
        result += (item,)
      } else {
        let item = [ID nicht gefunden: #pair.at(0)]
        result += (item,)
      }
    }
    return result
  }

  // Helper für Waffen (über ID)
  let weapons-str() = {
    let w-ids = npc.weapons
    let result = ()
    for wid in w-ids {
      let w = get-weapon(wid) // wid ist die ID
      if w != none {
        let item = [*#w.n* (#w.attr, Waffenstufe #w.l)]
        result += (item,)
      } else {
        let item = [ID nicht gefunden: #wid]
        result += (item,)
      }
    }
    return result
  }

  // Content-Arrays zusammenbauen
  let magic-content() = {
    let items = magic-str()
    // for i in range(items.len()){
    //   items.at(i)
    // }
    
    if items.len() == 0 { return [alsdjfasdj—] }
    return items.reduce((a, b) => [#a \ #b])
  }

  let skills-content() = {
    let items = skills-str()
    if items.len() == 0 { return [—] }
    return items.reduce((a, b) => [#a \ #b])
  }

  let weapons-content() = {
    let items = weapons-str()
    if items.len() == 0 { return [—] }
    return items.reduce((a, b) => [#a \ #b])
  }

  box(
    width: 100%,
    height: 20pt, 
    inset: (left: 5pt),
    fill: gray.at("100"),
    block(
      height: 100%,
      // Vertikal zentrieren:
      align(center, 
        // Horizontal linksbündig innerhalb des zentrierten Blocks:
        block(
          width: 100%,
          align(left,
            heading(level: 3, numbering: none)[#npc.name]
          )
        )
      )
    )
  )

  description(npc.desc)
  action([Attribute], [])

  [
    #set text(size: 9pt)
    #table(
      columns: (25pt, 17pt, 17pt, 17pt, 25pt, 17pt, 17pt, 17pt, 25pt, 17pt, 17pt, 17pt),
      align: (center),
      stroke: table-stroke,
      fill: table-fill-headerless,
      gutter: (0pt, 0pt, 0pt, 3pt, 0pt, 0pt, 0pt, 3pt, 0pt, 0pt, 0pt),
      [#neo.gls("mus")], align(center)[#attr-val(0, "attr_mus")], align(center)[#attr-val(1, "attr_mus")], align(center)[#attr-val(2, "attr_mus")],
      [#neo.gls("ges")], align(center)[#attr-val(0, "attr_ges")], align(center)[#attr-val(1, "attr_ges")], align(center)[#attr-val(2, "attr_ges")],
      [#neo.gls("kon")], align(center)[#attr-val(0, "attr_kon")], align(center)[#attr-val(1, "attr_kon")], align(center)[#attr-val(2, "attr_kon")],
      [#neo.gls("int")], align(center)[#attr-val(0, "attr_int")], align(center)[#attr-val(1, "attr_int")], align(center)[#attr-val(2, "attr_int")],
      [#neo.gls("inu")], align(center)[#attr-val(0, "attr_inu")], align(center)[#attr-val(1, "attr_inu")], align(center)[#attr-val(2, "attr_inu")],
      [#neo.gls("ers")], align(center)[#attr-val(0, "attr_ers")], align(center)[#attr-val(1, "attr_ers")], align(center)[#attr-val(2, "attr_ers")],
      [#neo.gls("wil")], align(center)[#attr-val(0, "attr_wil")], align(center)[#attr-val(1, "attr_wil")], align(center)[#attr-val(2, "attr_wil")],

      ..if "ks" in npc { 
        ([#neo.gls-short("ks")], 
        align(center)[#attr-val(0, "ks")], 
        align(center)[#attr-val(1, "ks")], 
        align(center)[#attr-val(2, "ks")], )
      } else {
        ([],[],[],[],)
      },
        //[#neo.gls-short("ks")], align(center)[#attr-val(0, "ks")], align(center)[#attr-val(1, "ks")], align(center)[#attr-val(2, "ks")],
      

      [#neo.gls-short("bwr")], align(center)[#calc.floor((npc.attr_mus.at(0) + npc.attr_ges.at(0)) / 4)], align(center)[#calc.floor((npc.attr_mus.at(1) + npc.attr_ges.at(1)) / 4)], align(center)[#calc.floor((npc.attr_mus.at(2) + npc.attr_ges.at(2)) / 4)],
    )

    #table(
      columns: (1fr, 20pt, 20pt, 20pt, 1fr, 20pt, 20pt, 20pt),
      align: (center),
      stroke: table-stroke,
      fill: table-fill-headerless,
      gutter: (0pt, 0pt, 0pt, 5pt, 0pt, 0pt, 0pt),
      [Physische Resistenz], align(center)[#if npc.attr_kon.at(0) >= 13 {3} else if npc.attr_kon.at(0) == 12 {2} else if npc.attr_kon.at(0) == 11 {1} else {0}], align(center)[#if npc.attr_kon.at(1) >= 13 {3} else if npc.attr_kon.at(1) == 12 {2} else if npc.attr_kon.at(1) == 11 {1} else {0}], align(center)[#if npc.attr_kon.at(2) >= 13 {3} else if npc.attr_kon.at(2) == 12 {2} else if npc.attr_kon.at(2) == 11 {1} else {0}],
      [Psychische Resistenz], align(center)[#if npc.attr_wil.at(0) >= 13 {3} else if npc.attr_wil.at(0) == 12 {2} else if npc.attr_wil.at(0) == 11 {1} else {0}], align(center)[#if npc.attr_wil.at(1) >= 13 {3} else if npc.attr_wil.at(1) == 12 {2} else if npc.attr_wil.at(1) == 11 {1} else {0}], align(center)[#if npc.attr_wil.at(2) >= 13 {3} else if npc.attr_wil.at(2) == 12 {2} else if npc.attr_wil.at(2) == 11 {1} else {0}],
    )
  ]

  if "magic_domain" in npc [
    #action("Domäne", [#npc.magic_domain / #npc.magic_domain / #npc.magic_domain])
    #action("Fokusse", "")
    #magic-content() 
  ]

  action("Mundane Skills", "")
  skills-content()

  action("Waffen", "")
  weapons-content()
  action("Kampfdoktrin", "")
  npc.tactic.at(0) 
  v(0.1em)
  npc.tactic.at(1)
  v(0.1em)
  npc.tactic.at(2)
}


















// // ═══════════════════════════════════════════════════════════════
// // 2. HELPER FUNKTIONEN (Lösen die Strings aus deinen Dictionaries)
// // ═══════════════════════════════════════════════════════════════
// #let get-weapon(name) = {
//   let all = neo.weapons.nahkampfwaffen + neo.weapons.distanzwaffen + neo.weapons.fernkampfwaffen
//   return all.find(w => w.n == name)
// }

// #let get-skill(name) = {
//   let all = neo.skills.combat + neo.skills.handwerk + neo.skills.natur + neo.skills.sozial + neo.skills.technik + neo.skills.survival
//   return all.find(s => s.n == name)
// }

// #let get-magic-skill(name) = {
//   let all = ()
//   for dom in neo.magic-skills { all = all + dom.fokus }
//   return all.find(s => s.n == name)
// }

// // ═══════════════════════════════════════════════════════════════
// // 3. DIE RENDER FUNKTION (Baut die EINE konsolidierte Tabelle)
// // ═══════════════════════════════════════════════════════════════
// #let render-npc(npc) = {
//   // Helper für Attribute
//   let attr-val(idx, key) = str(npc.at(key).at(idx))

//   // Helper für Magie-Skills
//   let magic-str(idx) = {
//     let sk-names = npc.magic_skills.at(idx)
//     let fws = npc.magic_fw.at(idx)
//     let result = ()
//     for i in range(sk-names.len()) {
//       let sk = get-magic-skill(sk-names.at(i))
//       let name = if sk != none { sk.n } else { sk-names.at(i) }
//       result.push(name + " (FW " + str(fws.at(i)) + ")")
//     }
//     return result.join(", ")
//   }

//   // Helper für Mundane Skills
//   let skills-str(idx) = {
//     let sk-list = npc.skills.at(idx)
//     let result = ()
//     for pair in sk-list {
//       let sk = get-skill(pair.at(0))
//       let name = if sk != none { sk.n } else { pair.at(0) }
//       result.push(name + " (FW " + str(pair.at(1)) + ")")
//     }
//     return result.join(", ")
//   }

//   // Helper für Waffen
//   let weapons-str(idx) = {
//     let w-names = npc.weapons.at(idx)
//     let result = ()
//     for wn in w-names {
//       let w = get-weapon(wn)
//       let name = if w != none { w.n } else { wn }
//       let stufe = if w != none { str(w.l) } else { "?" }
//       result.push(name + " (Stufe " + stufe + ")")
//     }
//     return result.join(", ")
//   }

//   // Die finale Tabelle
//   table(
//     columns: (1.5fr, 1fr, 1fr, 1fr),
//     inset: 8pt,
//     stroke: 0.5pt + luma(180),
//     fill: (_, y) => if y == 0 { luma(230) },
    
//     table.header(
//       align(left)[*Parameter*],
//       align(center)[*#npc.rang.at(0)\ (Stufe #npc.stufen.at(0))*],
//       align(center)[*#npc.rang.at(1)\ (Stufe #npc.stufen.at(1))*],
//       align(center)[*#npc.rang.at(2)\ (Stufe #npc.stufen.at(2))*]
//     ),
    
//     // Header Name & Desc
//     table.hline(stroke: 1pt),
//     table.cell(colspan: 4, align(left)[
//       *#npc.name* \
//       #text(size: 0.9em, fill: luma(80),npc.desc)
//     ]),

//     // ATTRIBUTE
//     table.hline(stroke: 1pt),
//     table.cell(colspan: 4, align(left, text(weight: "bold", "Attribute"))),
//     [Muskelkraft], align(center)[#attr-val(0, "attr_mus")], align(center)[#attr-val(1, "attr_mus")], align(center)[#attr-val(2, "attr_mus")],
//     [Geschick], align(center)[#attr-val(0, "attr_ges")], align(center)[#attr-val(1, "attr_ges")], align(center)[#attr-val(2, "attr_ges")],
//     [Konstitution], align(center)[#attr-val(0, "attr_kon")], align(center)[#attr-val(1, "attr_kon")], align(center)[#attr-val(2, "attr_kon")],
//     [Intelligenz], align(center)[#attr-val(0, "attr_int")], align(center)[#attr-val(1, "attr_int")], align(center)[#attr-val(2, "attr_int")],
//     [Intuition], align(center)[#attr-val(0, "attr_inu")], align(center)[#attr-val(1, "attr_inu")], align(center)[#attr-val(2, "attr_inu")],
//     [Erscheinung], align(center)[#attr-val(0, "attr_ers")], align(center)[#attr-val(1, "attr_ers")], align(center)[#attr-val(2, "attr_ers")],
//     [Willenskraft], align(center)[#attr-val(0, "attr_wil")], align(center)[#attr-val(1, "attr_wil")], align(center)[#attr-val(2, "attr_wil")],
    
//     // ARKANE PARAMETER
//     table.hline(stroke: 1pt),
//     table.cell(colspan: 4, align(left, text(weight: "bold", "Arkane Parameter"))),
//     [Domäne], [#npc.magic_domain], [#npc.magic_domain], [#npc.magic_domain],
//     [Kristall-Fokus], [#npc.magic_focus], [#npc.magic_focus], [#npc.magic_focus],
//     [Arkane Stufe (AS)], align(center)[#npc.ks.at(0)], align(center)[#npc.ks.at(1)], align(center)[#npc.ks.at(2)],
//     [Fokusse & FW], [#magic-str(0)], [#magic-str(1)], [#magic-str(2)],
    
//     // FERTIGKEITEN & AUSRÜSTUNG
//     table.hline(stroke: 1pt),
//     table.cell(colspan: 4, align(left, text(weight: "bold", "Fertigkeiten & Ausrüstung"))),
//     [Mundane Skills], [#skills-str(0)], [#skills-str(1)], [#skills-str(2)],
//     [Waffen], [#weapons-str(0)], [#weapons-str(1)], [#weapons-str(2)],
    
//     // TAKTIK
//     table.hline(stroke: 1pt),
//     table.cell(colspan: 4, align(left, text(weight: "bold", "Taktik & Verhalten"))),
//     [Kampfdoktrin], [#npc.tactic.at(0)], [#npc.tactic.at(1)], [#npc.tactic.at(2)],
//   )
// }