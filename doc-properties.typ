#import "color-theme.typ": *
#import "version.typ": *

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
    footer: context {
      let page_num = here().page()
      line(length: 100%, stroke: 1pt + gray.at("400"))
      if calc.even(page_num) {
        // Gerade Seite: Links (außen) die Seitenzahl, rechts (innen) der Name
        grid(
          columns: (auto, 1fr),
          align(left)[*#page_num*],
          align(right)[N.E.O. - Systemreferenzdokument (#app_version)]
        )
      } else {
        // Ungerade Seite: Links (innen) der Name, rechts (außen) die Seitenzahl
        grid(
          columns: (1fr, auto),
          align(left)[N.E.O. - Systemreferenzdokument (#app_version)],
          align(right)[*#page_num*]
        )
      }
    },
  )
  body
}