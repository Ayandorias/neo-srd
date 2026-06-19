#import "@local/neo-core:0.1.0" as neo
#import "doc-properties.typ" as srd
#import "color-theme.typ": *
#import "components.typ": *

#colbreak()
#columns(2, ..srd.columns-gutter)[
= Kleidung und Rüstungen

In der folgenden Tabelle sind die wichtigsten Kleidungs- und Rüstungsgegenstände aufgelistet. Es wird das Gewicht, sowie die Kosten für solch einen Gegenstand mit angegeben.Zusätzlich dazu stehen folgen de informationen zur Verfügung.
#colbreak()
#action([#neo.gls("rs")], "Gibt an, wie gut das Kleidungs- bzw. Rüstungsgewand gegen äußere Gewalteinwirkung standhält.")
#action("Zonen", "Gibt an an welcher Körperregion der Gegenstand schutz bietet.")
#action("BWR-Mod:", [Gibt an um wieviel der #neo.gls("bwr") gesenkt wird.])
]

== Rüstung
#table(
  columns: (auto, 50pt, 1fr, 60pt, 80pt, auto),
  align: (left, center, left, center, center, right),
  stroke: table-stroke,
  fill: table-fill,
  [*Ausrüstung*], [*#neo.gls("rs")*], [*Zonen*], [*Gweicht*], [*BWR-Mod.*], [*Kosten*],
  ..neo.clothing.map(item => (
    [#item.n], 
    str(item.rs), 
    item.zonen,  
    item.w,
    str(item.malus),
    [#item.cost Đ],
  )).flatten()
)
