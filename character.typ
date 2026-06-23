#import "@local/neo-core:0.1.0" as neo

#import "color-theme.typ": *
#import "components.typ": *

= Charaktergenerierung
Folgende Schritte werden zu Charaktergenerierung benötigt.
Di einzelenn Punkten werden weitere unten jeweils genauer beschrieben.

*1. Profession auswählen:* Jeder Charakter hat ein bestimmtes Alter erreicht und somit auch eine Profession erlernt. 

*2. Kultur auswählen:* Jeder Charakter hat einen Geburtsort und gehört womit einer bestimmten Kultur an.

*3. Attribute:* Jede Fertigkeit, die ein Charakter im Spiel einsetzt ist mit einem der sieben Attribute verknüpft.

*4. Vor- und Nachteile:* Vor- und Nachteile verleiehen jedem Charakter eine eigene Persönlichkeit.

*5. Grundwerte:* Anhand der Attribute werden die Grundwerte des Charakters berechnet.

*6. Fertigkeiten:* Anhand der Vorgeschichte werden die Fertigkeiten des Charakters ausgewählt.

== Profession auswählen
In der Tabelle Professionen sind einige Beispiele aufgeführt an denen man sich orientieren kann. Wenn ein individueller Charakter erstellt werden soll, dann kann dieser Schritt übersprungen werden.

=== Professionen
#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: table-stroke,
  fill: table-fill,
  [*Profession*],[*Beschreibung*],
  ..neo.professionen.map(item => (
    [#item.name], 
    [#item.desc],
  )).flatten()
)

== Kultur auswählen
In der Tabelle über die Kulturen kann ausgewählt werden aus welchem Bereich der Welt der Charakter kommt.

=== Kulturen
#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: table-stroke,
  fill: table-fill,
  [*Kultur*], [*Beschreibung*],
  ..neo.culture.map(item => (
    [#item.name], 
    [#item.desc],
  )).flatten()
)

== Attribute
Jeder Charakter verfügt über sieben Attribute, die beim erstellen des Charakters festgelegt werden. 
Diese werden in Körperliche Attribute und geistige Attribute unterteilt.

#table(
  columns: (auto, 1fr),
  stroke: table-stroke,
  fill: table-fill,
  align: (left, left),
  ..neo.attribute-desc
)

==== Attributswerte
Jedes Attribut beginnt mit einem Basiswert von 6. Es können weitere 28 Punkte auf die sieben Attribute aufgeteilt werden. Dabei muss beachtet werden, dass kein Attribut über den Wert von 12 gesteigert wird.

== Vor- und Nachteile
Um den Charakter zu individualisieren können Vor- und Nachteile eingesetzt werden. Hierbei t, dass für jede eingesetzte Stufe bei den Vorteilen zwei Stufen bei den Nachteilen eingesetzt werden müssen.

==== Einschränkung
Jeder Charakter kann max. 9 Stufen an Vorteilen haben. Dafür müssen dann aber Nachteile in einer Gesamthöhe von 18 Stufen ausgewählt werden.

==== Erzeugen
Vor- und Nachteile können während des Charakterlebens hinzugefügt werden. Diese werden entweder durch den Spielleiter vergeben oder in Rücksprache mit diesem getroffen.

== Abgeleiteten Grundwerte

=== #neo.gls-long("ks") (#neo.gls-short("ks"))

Die #neo.gls-short("ks") gibt an, welchee Potenzial der Charakter besitzt. Jeder magiebegabte Charakter hat zu beginn der Charaktergenerierung eine #neo.gls-short("ks") von 1.

=== #neo.gls-long("bwr") (#neo.gls-short("bwr"))
Um sicherzustellen ,dass sich ein Charakter in einem bestimmten Rahmen bewegt wird für jeden Charakter der Bewegungsradius berechnet. 
Der Quotient der Formel:

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.bwr.f)
)

gibt an, wieviele Hex-Felder ein Charakter in der Lage sich fort zu bewegen.



=== #neo.gls-long("rkt") (#neo.gls-short("rkt"))
Die Reaktion bezieht sich immer auf die aktuelle Kampffertigkeit die eingesetzt wird.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.rkt.f)
)

Der Verteidiger zwingt dem Angreifer einen Malus in Höhe seiner #neo.gls-short("rkt") auf den #neo.gls-short("ew") des Angriffs auf.

=== Psychische Resistenz
#table(
  columns: (auto, 1fr),
  stroke: table-stroke,
  fill: table-fill, //(x, y) => if y == 0 { gray.at("300") } else if calc.even(y) { gray.at("100") } else { white },
  align: (center + horizon, left),
  ..neo.psych-res
)

=== Physische Resistenz
#table(
  columns: (auto, 1fr),
  stroke: table-stroke,
  fill: table-fill, //(x, y) => if y == 0 { gray.at("300") } else if calc.even(y) { gray.at("100") } else { white },
  align: (center + horizon, left),
  ..neo.phys-res
)

== Gesundheitszustand

=== #neo.gls-long("gem")
Die Geistige Ermüdung stellt die maximale mentale Belastbarkeit des Charakters dar. Dieser Pool gibt an, wie viel geistige Kraft, Willensstärke und absolute Konzentration ein Charakter aufbringen kann, um magische Energien zu formen, bevor sein Verstand erschöpft ist.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.gem.f )
)

=== Menschlichkeit und Wahnsinn

Der Verlust von Menschlichkeit (z. B. durch grausame Taten) und der Verfall in den Wahnsinn (z. B. durch traumatische Erlebnisse) werden unter  Geistiger Stabilität zusammengefasst. 

Die Geistige Stabilität ist direkt an die GEM gekoppelt. Jeder Punkt der geistigen Stabilität verringet automatisch die GEM um einen Punkt. 

=== Nachteile
Die geistige Stabilität und die Nachteile eines Charakters beeinflussen sich gegenseitig:

Bei der Charaktergenerierung können Nachteile Einfluss auf die Geistige Stabilität haben. 

Wird im Verlauf des Charakterlebens die geistige Stabilität beeinträchtigt, kann der Spielleiter dem Charakter einen passenden Nachteil zuweisen.

=== Geistige Regeneration
Der Verlust von geistiger Stabilität kann geheilt werden. Wenn sich der Charakter mental erholt, kann der Spielleiter die Regeneration erlauben. 












=== Lebensenergie
Jeder Charakter besitzt über die gleiche Höhe an Lebensenergie. Diese ist in drei Bereiche unterteilt.

#action(neo.gls("erm") + " (30Pkt): ", "Repräsentiert die akute Belastungsfähigkeit und das Ausweichpotenzial.")
#action(neo.gls("sch") + " (10Pkt): ", "Markiert die erste Phase der physischen Substanzverletzung.")
#action(neo.gls("tra") + " (5Pkt): ", "Kritischer Systemausfall. Mit Erreichen des Kapazitätsmaximums tritt die biologische oder mechanische Exitus-Phase ein.")

=== #neo.gls-long("ulw") (#neo.gls-short("ulw"))

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.ulw.f)
)

== Fertigkeiten auswählen
Nachdem die grundlegenden Informationen des Charakters aufgeschrieben sind, werden im nächsten Schritt die Fertigkeiten ausgewählt.
Bei der Auswahl der Profession und der Kultur sind bereits einige Fertigkeiten angegeben, die zur Orientierung des Charakters dienen.

Die Anzahl an Fertigkeiten, die einem Charakter zur Verfügung stehen liegt bei:

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.fa.f)
)

Nachdem die Fertigkeiten ausgewählt wurden, kann der Charakter individualisiert werden. Hier stehen ihm 

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.fp.f)
)

zur Verfügung die frei auf die Fertigkeiten aufgeteilt werden können. Das einzige Limit liegt bei einem max. #neo.gls-short("fw") von 4.

== Erfahrene Charaktere

Falls gewünscht kann der Einstig auch mit einem Erfahreneren Charakter gestartet werden. Hierfür vergibt der Spielleiter zu Beginn eine Gewisse Anzahl an Fertigkeitspunkten, die auf die Fertigkeiten aufgeteilt werden können. Hierfür wird die ganz normale Steigerung durchgeführt.

#table(
  columns: (auto, auto, 1fr),
  stroke: table-stroke,
  fill: table-fill, //(x, y) => if y == 0 { gray.at("300") } else if calc.even(y) { gray.at("100") } else { white },
  align: (center + horizon, center + horizon, left),
  ..neo.level-desc
)

Anschließend sucht der Spielleiter sich die nötigen#neo.gls("ep") aus der folgenden Tabelle.

#text(size: 12pt, weight: "bold", "Allgemeine Modifikatoren")
#v(-6pt)
#table(
  columns: (1fr, auto, auto),
  stroke: table-stroke,
  fill: table-fill, //(x, y) => if y == 0 { gray.at("300") } else if calc.even(y) { gray.at("100") } else { white },
  align: (left, center, center),
  ..neo.level
)


== Zeitrechnung
Die Ausgestaltung von Kalendern, planetaren Zyklen und Feiertagen obliegt vollständig dem jeweiligen Setting. Steht ein spezifisches Kalendersystem zur Verfügung, wird in diesem Schritt der exakte Geburtstag des Protagonisten ermittelt (beispielsweise durch einen Wurf mit 2W12 für den Monat und 3W12 für den Tag) und im Protagonistenbuch dokumentiert. Fehlt eine solche zeitliche Struktur, wird dieser Schritt übersprungen.



= Fertigkeitssystem
== Kalkulation des Gesamtfertigkeitswerts (GFW)
== Unerfahrenheits-Malus
== Attributssteigerung
Attribute werden bei der Charaktererstellung festgelegt und können nicht mit Erfahrungspunkten gesteigert werden. Stattdessen wachsen sie durch die regelmäßige Nutzung der entsprechenden Fertigkeiten. Dabei werden nur die Fertigkeiten berücksichtigt, die auf demselben Basisattribut beruhen. Erreichen diese Fertigkeiten bestimmte Schwellenwerte, erhöht sich das zugehörige Basisattribut automatisch um einen Punkt. Ein Attribut kann auf diesem Weg maximal um vier Punkte über den Startwert hinauswachsen.

Die Schwellenwerte für die Steigerung sind wie folgt gestaffelt:

#text(size: 11pt, weight: "bold", "Stufe 1")\
Drei Fertigkeien mit einem #neo.gls("fw") von 6.

#text(size: 11pt, weight: "bold", "Stufe 2")\
Fünf Fertigkeiten mit einem #neo.gls("fw") von 6 oder drei Fertigkeiten mit einem #neo.gls("fw") von 7.

#text(size: 11pt, weight: "bold", "Stufe 3")\
Fünf Fertigkeiten mit einem #neo.gls("fw") von 7.

#text(size: 11pt, weight: "bold", "Stufe 4")\
Fünf Fertigkeiten mit einem #neo.gls("fw") von 9.

Fertigkeiten, die auf zwei Basisattributen beruhen, zählen für beide Attribute gleichzeitig.

=== Besonderheit bei Intelligenz

Die Intelligenz ist nicht von der Anzahl der Fertigkeiten oder deren #neo.gls("fw") abhängig. Stattdessen ist die Intelligenz abhängig von der Gesamterfahrung, die ein Charakter gesammelt hat. Bei Erreichen bestimmter Erfahrungsstufen oder der entsprechenden Menge an #neo.gls("ep") erhöht sich die Intelligenz automatisch.

#table(
  columns: (1fr, 1fr, 1fr),
  stroke: table-stroke,
  fill: table-fill, //(x, y) => if y == 0 { gray.at("300") } else if calc.even(y) { gray.at("100") } else { white },
  align: (center,),
  ..neo.int-level
)

== Steigerung der Fertigkeiten
Jede Fertigkeit besitzt eine Trainingsstufe. Mit dessen Hilfe wird ermittelt wie hoch die Anzahl an Erfahrungspunkten ist, die eingesetzt werden müssen um die Fertigkeit um einen Punkt zu steigern.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.epf.f)
)


= Professionen

#for prof in neo.professionen [

  #render_profession(prof)

]

= Kulturen

#for culture in neo.culture [
  #render_profession(culture)
]


