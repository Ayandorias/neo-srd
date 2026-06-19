#let columns-gutter = (
  gutter: 30pt
)

#let a4-bleed = 0mm
#let a4 = (
  width: 210mm,
  height: 297mm,
  bleed: a4-bleed,
  margin: (
    top: 10mm + a4-bleed,
    bottom: 20mm + a4-bleed,
    inside: 18mm + a4-bleed,
    outside: 16mm + a4-bleed
  )
)


#let use-format(format: a4, body) = {
  set page(
    width: format.width + (2 * format.bleed),
    height: format.height + (2 * format.bleed),
    margin: format.margin
  )
  
  body
}


///////////////////////////////////////////////////////////////////////////////
// Hintergrund der Seite beschreiben 
/////////////////////////////////////////////////////////////////////////////// 
#let background(
  footersign: true, 
  custom-footer: none,
  bg-image: none,
  chapter-sign: none,
  footer-sign: none,
  body) = {
  set page(
    footer: none,
    binding: left,
    // width: constants.net-width + (2 * constants.bleed.get()),
    // height: constants.net-height + (2 * constants.bleed),
    // margin: (standard-margins),
    background: context {
      // 1. Hintergrundbild
      // image(bg-image, width: 100%, height: 100%)
      if bg-image != none {
        bg-image
      }
      
      let page-num = here().page()
      let is-odd = calc.odd(page-num)
      let standard-margins = page.margin
      
      // 2. Footer-Grafik
      if footersign == true {

        let page-num-formatted = counter(page).display()//.display(fmt)
        // 3. Seitenzahl (Positionierung über dem Footer)
        // Wir nutzen wieder place(bottom), damit sie über dem Bild schwebt
        place(
          bottom + if is-odd { right } else { left },
          dx: if is-odd { -2mm } else { 2mm }, // Horizontaler Abstand vom Rand
          dy: 0mm, // Vertikaler Abstand von der Unterkante
          
          block( 
            width: 100% - page.margin.outside,
            height: 2cm,

            if is-odd {
                align(left + horizon, text(size: 1.2em, weight: "bold")[#page-num-formatted #h(5.5cm) N.E.O - Systemreferenzdokument])
            } else {
                align(right + horizon, text(size: 1.2em, weight: "bold")[N.E.O - Systemreferenzdokument #h(5.5cm)  #page-num-formatted])
            }
            
          )
        )

        // // 4. Die Text-Ebene: Kapitel
        // let ch-name = context {
        //   // Prüfe, ob auf der aktuellen Seite ein Kapitel (Level 1) beginnt
        //   let headings-on-page = query(heading.where(level: 1))
        //     .filter(h => h.location().page() == here().page())
          
        //   if headings-on-page.len() > 0 {
        //     // Neues Kapitel auf dieser Seite gefunden
        //     headings-on-page.first().body
        //   } else {
        //     // Kein neues Kapitel auf dieser Seite, nimm das vorherige
        //     let headings-before = query(selector(heading.where(level: 1)).before(here()))
        //     if headings-before.len() > 0 {
        //       headings-before.last().body
        //     } else {
        //       ""
        //     }
        //   }
        // }

        // place(
        //   bottom + center,
        //   dy: 0mm,
        //   block(
        //     width: 14cm,
        //     height: 2cm,
        //     // line(length: 100%, stroke: 2pt + red),
        //     align(center + horizon, text(size: 1.2em, weight: "bold", font: "Controwell")[N.E.O - Systemreferenzdokument])
        //   )
        // ) // place
      } // end footersign

      if custom-footer != none {
        custom-footer
      }
    }, // background
  )
  body
}