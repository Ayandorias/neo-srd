#import "components.typ": *

== Rüstung
#table(
  columns: (auto, 50pt, 1fr, 60pt, 80pt, auto),
  align: (left, center, left, center, center, right),
  stroke: table-stroke,
  fill: table-fill,
  [*Ausrüstung*], [*#neo.gls("rs")*], [*Zonen*], [*Gweicht*], [*BWR-Mod.*], [*Kosten*],
  ..neo.clothing.map(item => (
    box(
      inset: (y: 0pt),
      align(
        horizon, 
        heading(level: 3, numbering: none)[
          #box(
            inset:(y: -5pt),
            // stroke: 1pt + red, 
            
              text(font: "Libertinus Serif", size: 10pt, weight: "regular", item.n)
            
          )
        ],
      )
    ),
    str(item.rs), 
    item.zonen,  
    item.w,
    str(item.malus),
    [#item.cost Đ],
  )).flatten()
)