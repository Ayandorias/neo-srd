
#import "color-theme.typ": *
#import "version.typ": *

#let title = "N.E.O."
#let subtitle = "Nebenwelten Engine für das Omniversum"

#set align(center)

#v(8em)

#text(size: 32pt, weight: "bold")[#title] \
#v(1em)
#text(size: 18pt)[#subtitle] \
#v(2em)
#text(size: 14pt)[System Referenzdokument (SRD)]

#v(1em)

#text(font: "Controwell", size: 14pt, weight: "bold", fill: secondary.at("700"))[Version:] #app_version \

#v(10fr)

#text(font: "Controwell", size: 24pt, weight: "bold", fill: secondary.at("700"))[Impressum]
// #text(size: 16pt, weight: "bold")[IMPRESSUM]

#v(1em)

#text(font: "Controwell", size: 20pt, weight: "bold", fill: secondary.at("700"))[Author]
#v(0.75fr)
Bruno Pierucki

#v(1em) 

#text(font: "Controwell", size: 24pt, weight: "bold", fill: secondary.at("700"))[Satz und Layout]
#v(0.75fr)
Bruno Pierucki

#v(1em)

#text(font: "Controwell", size: 24pt, weight: "bold", fill: secondary.at("700"))[Lizenz]

#set align(left)
#set par(justify: true)

Das Systemreferenzdokument #app_version („N.E.O. SRD #app_version“) wird unter den Bedingungen der Creative Commons Namensnennung 4.0 International Public License („CC-BY-4.0“) kostenlos zur Verfügung gestellt. 

Die Inhalte dieses Dokuments dürfen auf jede nach CC-BY-4.0 gestattete Weise verwendet werden, sofern folgender Hinweis gegeben wird:

#quote(block: true)[
  _„kompatibel mit der N.E.O. Engine“ oder „N.E.O.-kompatibel“_
]

#set align(center)
#v(1em)

#image("/bilder/by.svg", width: 25%) 

// #v(0.8em)
// #text(font: "Controwell", size: 14pt, weight: "bold", fill: secondary.at("700"))[Erscheinungsdatum:] #datetime.today().display("[day]. [month repr:short] [year]")

#v(1em)

Copyright © since 2026 by Bruno Pierucki

#v(1em)
#pagebreak()