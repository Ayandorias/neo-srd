#import "@local/neo-core:0.1.0" as neo

// #import "components.typ": *
#import "color-theme.typ": *

= Waffen

#for (kategorie, waffenliste) in neo.weapons {
  [== #neo.title-case(kategorie)]
  
  if kategorie == "nahkampfwaffen" {
    table(
      columns: (auto, auto, auto, 1fr, auto),
      align: (left, center, center, left, right), 
      stroke: table-stroke,
      fill: table-fill,
      [*Waffe*], [*Stufe*], [*Attr.*], [*Beschreibung*], [*Kosten*],  //[*Mult.*], 
      
      ..waffenliste.map(waffe => (
        box(
          inset: (y: 0pt),
          align(
            horizon, 
            heading(level: 3, numbering: none)[
              #box(
                inset:(y: -5pt),
                // stroke: 1pt + red, 
                
                  text(font: "Libertinus Serif", size: 10pt, weight: "regular", waffe.n)
                
              )
            ],
          )
        ),
        
        [#waffe.l], [#waffe.attr], [#waffe.d], [#waffe.cost Đ],  
        //[#waffe.mult], 
      )).flatten()
    )
  } else {
    table(
      columns: (auto, auto, auto, auto, 1fr, auto),
      align: (left, center, center, center, left, right),
      stroke: table-stroke,
      fill: table-fill,
      [*Waffe*], [*Stufe*], [*Attr.*], [*Reichweite*], [*Beschreibung*], [*Kosten*],
      ..waffenliste.map(waffe => (
        box(
          inset: (y: 0pt),
          align(
            horizon, 
            heading(level: 3, numbering: none)[
              #box(
                inset:(y: -5pt),
                // stroke: 1pt + red, 
                
                  text(font: "Libertinus Serif", size: 10pt, weight: "regular", waffe.n)
                
              )
            ],
          )
        ),
        
        [#waffe.l], [#waffe.attr],  
        //[#waffe.mult], 
        [#waffe.range], [#waffe.d], [#waffe.cost Đ],  
      )).flatten()
    )
  }
}