#import "@local/neo-core:0.1.0" as neo

#import "color-theme.typ": *
#import "components.typ": *

= Kernmechanik

== Das 2W12-System
Um das Gelingen einer Aktion zu prüfen werden zwei zwölfseitige Würfel (2W12) geworfen. Durch die Normalverteilung bei zwei Würfeln liegt die Wahrscheinlichkeit von mittleren Ergebnissen höher als niedrige bzw. hohe Würfelwürfe.
Diese Art von Würfen werden bei Proben auf die Fertigkeiten, beim Kampf oder beim Weben von Arkanen Formeln eingesetzt.

=== Vergleichende Probe
Eine vergleichende Probe dient der Feststellung eines Erfolgs. Das Gesamtergebnis des Wurfs wird mit dem #neo.gls("ew") verglichen. Hierfür werden folgende Schritte durchlaufen.


#action([1. #neo.gls("gfw") ermitteln],[Zuerst wird der #neo.gls("gfw") ermittelt. Dieser besteht aus #neo.gls("ba") und #neo.gls("fw")])

#action([2.  #neo.gls-long("ew") berechnen],[Anwendung verschiedener Modifikatoren])


// #text(weight: "bold", "1. " + neo.gls-long("ew") + ":") Als erstes wird berechnet welcher Wert durch den Würfelwurf unterboten werden soll. Hierfür kommen verschiedene Modifikatoren sowie die Einzusetztende Fertigkeit zum Einsatz.

// - *Basisattribut ermitteln:*
//   Jeder Fertigkeit wird einem Attribut zugeordnet. Dieser kann Situationsbedingt vom Spielleiter angepasst werden.
// - *Situationsbedinge Modifikatoren:*
//   Je nach Situation kann der Spielleiter den #neo.gls("ew") durch Modifikatoren erleichtern oder erschweren. Hierunter fallen Wetter, sichtverhältnis, Stress etc. 
// - *#neo.gls("fw"):*
//   Der Wert den der Charakter in der Fertigketi besitzt, auf die die Probe abgelegt werden soll.

#action("2. Würfelwurf:", [Das Ergebnis des Wurfes wird mit dem zu erreichendem Zeilwert verglichen. Ist der Würfelwurf kleiner oder gleich dem #neo.gls("ew"), so ist die Probe gelungen, andernfalls ist sie missglückt.])

=== #neo.gls-long("gfw")
Der #neo.gls("gfw") ist die Basis für jede Probe im Spiel. Als erstes wird der #neo.gls-long("unm") im Bezug zum #neo.gls("fw") berechnet.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.unm.f)
)

#v(1em)
#description("Hinweis für Kampffertigkeiten: Bei Fertigkeiten wie Fernkampf oder Bewaffneter Nahkampf entspricht die Stufe in dieser Formel immer der Waffenstufe der aktuell geführten Waffe.")
#v(1em)

Sollte der #neo.gls("unm") unter 0 sinken, dann wird der Modifikator bei der Probe missachtet.

Anschließend wird der #neo.gls("gfw") mittels des #neo.gls-short("unm") ermittelt.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.gfw.f)
)



=== #neo.gls-long("ew") berechnen
Um den #neo.gls-long("ew") (#neo.gls-short("ew"))zu berechnen werden die notwendigen Modifikatoren auf den #neo.gls("gfw") angewendet.
Folgende Modifikatoren können auf den #neo.gls("gfw") angewendet werden.

#text(size: 11pt, weight: "bold", "Allgemeine Modifikatoren")
#v(-6pt)
#table(
  columns: (auto, 1fr),
  stroke: table-stroke,
  fill: table-fill,
  align: (left, left),
  ..neo.mod_list
)

Die Modifikatoren beeinflussen direkt den #neo.gls("ew") einer Probe. Ein positiver Modifikator erhöht den #neo.gls("ew") und steigert die Erfolgswahrscheinlichkeit. Ein negativer Modifikator senkt den Schwellenwert und erschwert das Gelingen der Handlung. 

#text(size: 11pt, weight: "bold", "Pos. & Neg. Modifikatoren")
#v(-6pt)
#table(
  columns: (1fr, auto),
  stroke: table-stroke,
  fill: table-fill,
  align: (left, center),
  ..neo.visibility
)

=== Kritischer Erfolg / Patzer

Bei der Probe werden zwei Würfelergebnisse besonders hervor gehoben. ist das Ergebnis des Wurfes eine 2 (beide Würfel zeigen eine 1), selbst wenn der modifizierte Einsatzwert (EW) $<2$ ist.

Ist das Ergebnis des Wurfes jedoch eine 24 (beide Würfel zeigen eine 12) ist die Probe missglückt, selbst wenn der modifizierte Einsatzwert (EW) $>24$ ist. 


= Kampf
Beim Erkunden der Welt begegnen den Charakteren Kreaturen und Personen die nicht immer freundlich gesinnt sind. In solchen Situationen entscheidet ein Kampf über das Weiterkommen der Charaktere.

== Die Abwicklung
Wenn zwei Parteien sich zum Kampf gegeüberstehen benötigt man ein System welches das Chaos aus dem ganzen nimmt. Das Kampfsystem wird in Kampfrunden zu je sechs Sekunden unterteilt. In dieser Zeit hat jeder Charakter die Möglichkeiten zu agieren. In welcher Reihenfolge welcher Charakter zu welcher Zeit agiert wird die Initiative festgelegt. Im Spiel agieren immer alle Charaktere einer Fraktion gleichzeitig. 
Erst wenn alle Spieler Ihren Zug gemacht haben beginnt die nächste Kampfrunde oder beendet den Kampf.

Ein Kampf folgt folgender Abwicklung.

// === Gefechtsordnung
// Ein Kampf wird in aufeinanderfolgenden Intervallen, den sogenannten Kampfrunden, abgewickelt. Jede Sekunde entscheidet über den Erfolg der Mission. Zögern wird als Pflichtverletzung gewertet.

#action("1. Initiativprotokoll", [Vor Beginn des Kampfes wird die Priorität festgelegt, wer in dem Kampf den ersten Zug machen kann. ])
// #pad(left: 10pt)[
//   #action("1.1. Der Überfall", [Der Überfall ist eine Besonderheit des Kampfes. Hier hat die angreifende Fraktion einen ersten Angriff. Erst nachdem dieser ausgeführt wurde, wird die Gruppeninitiative für den regulären Kampf festgelegt.])
// ]

#action("2. Kampfhandlung", [Nachdem die Initiative ermittelt wurde führt die Gruppe die an der Reihe ist ihre Kampfhandlung aus. ])

#action("3. Schadensregulierung", [Nachdem alle Kampfrunden durchgeführt sind, wird der Schaden für diese Kampfrunde ermittelt.])


== Initiativprotokoll
Die Inititative legt fest, wer den Kampf beginnt. Die jeweiligen Fraktionen die sich im Kampf gegenüberstehen werden als Einheit gesehen und handeln gleichzeitig. Beide Fraktionen würfeln mit 2W12. Die Fraktion mit dem niedrigeren Würfelwurf erhält die Initiative und handelt zuerst.

=== Hinterhalt 
Bei einem Hinterhalt erhält die initiierende Gruppe einen ersten Angriff. Erst nach Abschluss dieser Kampfrunde wird die Initiative für den Kampf ausgewürfelt. hierdurch kann es vorkommen, dass die Gruppe, die den Hinterhalt ausgeführt hat einen weiteren Angriff erhält.


== Kampfhandlung
Jeder Charakter ist bei seinen Handlung und der Zeit limitiert. Die
Koordination der Bewegungen und Aktion wird bei jeder Runde neu ermittelt.

=== Aktionsauswahl

Innerhalb einer Aktionsphase stehen dem Charakter verschiedene Handlungen zur Verfügung, die er innerhalb einer Kampfphase von sechs Sekunden ausführen kann.
Hierfür wird die Kampfphase in drei Segmente zu je zwei Sekunden unterteilt.

Innerhalb dieser Zeit können folgende Aktionen ausgeführt werden. 
#action("Einfachheit", "")
Jedes der drei Segmente wird für eine #neo.gls("ehdlg") genutzt. Dies erlaubt die maximale Anzahl bei geringer Einzeltiefe. Es können auch mehrere Einfache Handlungen miteinander kombinier werden zu einer einzigen #neo.gls("ehdlg"). Das setzt allerdings vorraus, dass die einzelnen #neo.gls("ehdlg") sich nicht gegenseitig ausschließen. (handzeichen geben und Tür aufdrücken schließen sich aus)

#action("Standard Kombination", "")
Die Belegung erfolgt durch eine #neo.gls("nhdlg") (beansprucht zwei Segmente) und eine #neo.gls("ehdlg") (beansprucht ein Segment). Die Reihenfolge, kann beliebig festgelegt werden.

#action("Fokussierte Handlungen", "")
Eine einzige #neo.gls("khdlg") belegt sämtliche Segmente und beansprucht somit die volle Dauer der Phase für eine einzige, hochkonzentrierte Durchführung.

==== Mehrphasige Aktionen
Bestimmt Handlungen, besonders das Webenvon Zaubern, oder das betreiben von großen Maschinen erfordert häufig mehrere Kampfrunden bis diese ausgelöst werden können. Diese anzahl an komplexen Handlungen führt dazu, dass der Charakter über mehrere Kampfphasen nicht aktiv am Kampfgeschehen teilnehmen kann. 

#action("Unterbrechung:", [Wird ein Charakter während einer mehrphasigen Handlung durch äußere Einwirkung (z.B. schwerer Schaden oder Betäubung) neutralisiert oder zur Bewegung gezwungen, gilt die Handlung als
gescheitert. Die investierte Energie oder das Material ist
in diesem Fall verloren.])

==== Übersicht der Handlungen
Folgend eine Übersicht der Möglichkeiten welche Handlung in welchem Bereich zugeordnet ist.

#table(
  columns: (1fr,),
  align: left,
  stroke: table-stroke,
  fill: table-fill,
  [*Einfache Handlungen*],
  ..neo.simple
)

#table(
  columns: (1fr,),
  align: left,
  stroke: table-stroke,
  fill: table-fill,
  [*Normale Handlungen*],
  ..neo.normal
)

#table(
  columns: (1fr,),
  align: left,
  stroke: table-stroke,
  fill: table-fill,
  [*Komplexe Handlungen*],
  ..neo.komplex
)

=== Bewegung im Kampf
Die Bewegung während des Kampfes ist ein wichtiger Bestandteil. Hierfür wird die #neo.gls("bwr") jedes Charakters genutzt.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.bwr.f)
)

==== Last der Ausrüstung
Das Gewicht, welches ein Charakter bei sich trägt, hat einfluss auf seine #neo.gls("bwr"). Zu dem Gewicht zählen Kleidung, Rüstung, Waffen und alle anderen Gegenstände den ein Charakter während des Kampfes bei sich trägt.

#table(
  columns: (1fr, 1fr),
  align: (left, left),
  stroke: table-stroke,
  fill: table-fill,
  [*Gewicht*], [*Einschränkung*],
  ..neo.equipment-weight
)

==== Geländebeschaffenheit
Das Gelände auf welchem sich der Kampf befindet hat einfluss auf die #neo.gls("bwr") der einzelnen Charaktere. Der Spielleiter gibt an, welche Geländeart gerade vorrangig ist.

#table(
  columns: (1fr, 1fr),
  align: (left, left),
  stroke: table-stroke,
  fill: table-fill,
  [*Gelände*], [*Einschränkung*],
  ..neo.terrain
)

Die #neo.gls("bwr") wird nacheinander berechnet. Zuerst wird die #neo.gls("bwr"), der einzelnen Charaktere Berechnet. Anshließend fließt das Gelände in die Berechnung mit ein.

== Angriff ausführen
Ein Angriff wird durch das individuelle Können und die äußeren Umstände bestimmt.
Um einen Angriff auszuführen, werden folgende Schritte ausgeführt:

#action("1. Zielauswahl", [Als erstes wird ein Ziel ausgewählt, welches angegriffen werden kann. hierbei spielt die Reichweite die entscheidene Rolle.])

#action("2." + neo.gls("ew") + "berechnen", [Nun werden die Modifikatoren festgelegt. (Gezielter Angriff, Sichtverhältnisse etc) Hieraus ergibt sich der #neo.gls("ew") für die vergleichende Probe.])

#action("3. Angriff ausführen", [Zuletzt wird der Angriff ausgeführ und die vergleichende Probe ermittelt, ob der Angriff erfolgreich ist oder nicht.])

#action("4. Schadensermittlung", [Nach erfolgreichem Angriff, wird der zugefügte Schaden ermittelt.])

=== Zielauswahl
Um einen Gegner angreifen zu können muss dieser sich innerhlab der Reichweite der aktuellen Waffe des Charakters befinden. Je nach eingesetzter Waffe varieiert hier die Reichweite für den Angriff.

=== #neo.gls-long("ew") berechnen
Bevor die vergleichende Probe über Erfolg oder Misserfolg des Angriffs aufschluss gibt, muss zuerst der #neo.gls("ew") für denAngriff ermittelt werden.

=== Nahkampf- / Distanzwaffe
Bei der Nahkampfwaffe wird der #neo.gls("ew") folgendermaßen berechnet.

Zuerst wird der #neo.gls-long("unm") nach folgender Formel berechnet:

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.unm.f)
)

Sinkt der #neo.gls("unm") nach der Berechnung unter 0, dann wird dieser vernachlässigt und als 0 betrachtet.

Ist dieser Berechnet wird der #neo.gls("gfw") berechnet.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.gfw.f)
)

Zuletzt werden die Modifikatoren auf den #neo.gls("gfw") angewendet. Dadurch erhält man den #neo.gls-long("ew") für die ergleichende Probe. 

Folgende Modifikatoren können auf den #neo.gls("gfw") angewendet werden.

#table(
  columns: (1fr, 1fr),
  align: (left, left),
  stroke: table-stroke,
  fill: table-fill,
  ..neo.fight_mod
)

Für die Einsatzfähigkeit werden folgende Modifikatoren eingesetzt.

#table(
  columns: (1fr, 70pt,),
  align: (left, center,),
  stroke: table-stroke,
  fill: table-fill,
  ..neo.usability_mod
)

Für die Trefferzone werden folgende Modifikatoren angewendet.

#table(
  columns: (1fr, 50pt),
  align: (left, center),
  stroke: table-stroke,
  fill: table-fill,
  ..neo.hit_zone
)

=== Fernkampfwaffe
Der #neo.gls("ew") wird genauso berechnet, wie er auch beim Nahkampf berechnet wird. Es kann zusätzlich ein weiterer Modifikator hinzugezogen werden, der die Reichweite zum Ziel mit einbezieht.

#table(
  columns: (auto, 1fr, 65pt),
  align: (left, left, center),
  stroke: table-stroke,
  fill: table-fill,
  ..neo.reach
)

== Schadensermittlung
Der Schaden wird direkt bei erfolgreichem Treffer ausgewürfelt. Die Anzahl der Schadenswürfel (W6) bestimmt die Wucht
eines Treffers. Diese wird in einer festen Abfolge aus
dem Grundkönnen, der Präzision und der Ausrüstung
berechnet.

=== Die Differenz
Die Differenz misst die Präzision des Angriffs im Verhältnis zum #neo.gls("gfw").

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.dif.f)
)

=== Die finale Würfelanzahl
Zur Ermittlung des Würfelpools können Modifikator, wie 

#table(
  columns: (1fr),
  align: (left),
  stroke: table-stroke,
  fill: table-fill,
  ..neo.fight_mod_diff
)

zur Differenz sowie die Waffenstufe addiert oder subtrahiert werden.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.anw.f)
)

Bei Fernkampfwaffen die ein Projektil verschießen, kann die Stufe der Munition noch mit hinzu addiert werden.

#table(
  columns: (1fr, 50pt),
  align: (left, center),
  stroke: table-stroke,
  fill: table-fill,
  ..neo.munition_type
)

==== Erfolgswürfel und Eskalationskaskade
Die ermittelten W6 bestimmt die anzahl an Würfel die für die Schadensermittlung genutzt werden. 
Jedes gerade Ergebnis (2, 4, 6) zählt als Erfolgspunkt.
Jeder Punkt repräsentiert eine Verletzung oder das strukturelle Versagen eines Rüstungsgegenstandes.

==== Eskalationswurf
Erzielt ein Würfel das Ergebnis *6*, wird er unmittelbar erneut geworfen. Dieser Prozess setzt sich so lange fort, wie das Resultat eine *6* zeigt. Sämtliche dabei erzielten Erfolge werden kumulativ addiert.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.ekw.f)
)

== Schadensregulierung
Bevor der Schaden direkt verrechnet wird, wird der Rüstungsschutz des Gegners von der Anzahl der Erfolge abgezogen. Die Restlichen Erfolge werden direkt mit der Lebensenergie verrechnet.
Dabei werden die Erfolge wie folgt von der Lebensenergie abgezogen.

#table(
  columns: (1fr, 2fr),
  align: (left, left),
  stroke: table-stroke,
  fill: table-fill,
  [*Erfolge*],[*Effekt auf Vitalitätsschichten*],
  [1 -- 5], [#neo.gls-long("erm")],
  [6 -- 10], [Die ersten 5 Erfolge reduzieren die körperliche Ermüdung (ERM). Jeder weitere Erfolg (ab dem 6.) verursacht 1 Punkt Schaden (SCH).],
  [11+], [Ab dem 11. Erfolg wird jeder weitere Erfolg als 1 Punkt Schwerer Schaden eingetragen.],
  [15+], [*Terminale Vernichtung* des Primärziels]
)

=== Die Schwelle des Überlebenswillens
Sobald die fünfte Markierung des Traumaschadens gesetzt ist, fällt der Charakter in eine tödliche Bewusstlosigkeit. In dieser Situation entscheidet der Überlebenswille über Leben und Tod.

==== Der Überlebensintervall
Zu Beginn jeder Kampfrunde ist eine #neo.gls-long("stabi") erforderlich um sicherzustellen, dass der Charakter weiterhin am Leben bleibt.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.stabi.f)
)

Jeder Misserfolg reduziert den #neo.gls-long("ulw") um einen Punkt und somit auch den #neo.gls-short("ew"). 

==== Eintretender Tod
Erreicht der Überlebenswille den Nullpunkt, erlischt das Leben des Charakters und kann nicht wieder regeneriert werden.

==== Wurfwaffen und #neo.gls-long("wk") (#neo.gls-short("wk"))
Die Reichweite eines Objekte wird durch das Gewicht und die #neo.gls-long("mus") des Charakters bestimmt.
Als erstes muss die #neo.gls-short("wk") des Charakters ermittelt werden.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.wk.f)
)

Der #neo.gls("rwm") wird wie folgt definiert.

#table(
  columns: (auto, 1fr, 50pt),
  align: (left, left, center),
  stroke: table-stroke,
  fill: table-fill,
  ..neo.reach_mod
)

Die letztendliche Reichweite wird folgendermaßen berechnet.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.rw.f)
)

=== Fernkampfschaden
Der resultierende Schaden, der angewendet wird ist abhängig von der Entfernung des Ziels.

#table(
  columns: (auto, 1fr, 90pt),
  align: (left, left, center),
  stroke: table-stroke,
  fill: table-fill,
  ..neo.reach_hit
)

=== Sprengstoffe und Zonen
Die Sprengkraft eines Sprengstoffes nimmt mit steigender Entfernung aus seinem Detonationsmittelpunkt ab.

#table(
  columns: (auto, 1fr, 90pt),
  align: (left, left, center),
  stroke: table-stroke,
  fill: table-fill,
  ..neo.explosiv
)


=== Regeneration und Heilung

Die Regeneration der #neo.gls-short("gem") und der #neo.gls-short("erm") ist während eines Kampfes nicht möglich.

Die #neo.gls-long("erm") ist an die #neo.gls-short("kon") gekoppelt , die #neo.gls-long("gem") an die #neo.gls-short("wil"). Die Regeneration ist nur durch eine Ruhe möglich.

Die Dauer der Rast und das jeweilige Basisattribut bestimmen die Höhe der Regeneration der #neo.gls-short("gem") und der #neo.gls-short("erm").
#action("Kurze Rast (ca. 2 Stunden):", [Regeneriert Erschöpfung/Ermüdung in Höhe des einfachen Attributswertes (1x Attribut).]) 
#action([Mittlere Rast (ca. 4 Stunden):], [Regeneriert Erschöpfung/Ermüdung in Höhe des zweifachen Attributswertes (2x Attribut).])
#action([Lange Rast (ab 6 Stunden):], [Regeneriert Erschöpfung/Ermüdung in Höhe des dreifachen Attributswertes (was bei durchschnittlichen Attributen einer vollständigen Erholung entspricht)])

=== Schadenskonvertierung

Natürliche Heilung von Verletzungen (Schaden & Trauma) Echte Wunden erfordern Zeit und heilen unabhängig von der Rast in einem festen Tagesrhythmus: 

#table(
  columns: (1fr, 2fr),
  align: (left, left),
  stroke: table-stroke,
  fill: table-fill,
  [*Art*],[*Effekt auf Vitalitätsschichten*],
  [Schaden], [1 Punkt Schaden wird in 10 Punkte #neo.gls("erm") umgewandelt],
  [Trauma], [1 Punkt Traumaschaden wird in 5 Schadenspunkte umgewandelt],
)

#action([Schaden(Stufe II):], [Sobald 10 Plätze in der #neo.gls-short("erm") frei sind, wird ein Schaden automatisch in #neo.gls-short("erm") umgewandelt. Durch diesen Mechanik können max. 2 Schaden am Tag regeneriert werden.]) 

#action([Trauma (Stufe III):], [Sobald im Schaden 5 Plätze frei sind, wird ein Traumaschaden automatisch in 5 Schadenspunkte umgewandelt.])

=== Rüstungsschutz
Die Panzerung eiones Charakters wird über die Rüstungsstufe (RS) definiert. Diese absorbiert Schaden in Höhe ihrer Stufe.

==== Tilgungsprotokoll
Der RS wird unmittelbar von der Gesamtzahl der Erfolge abgezogen. Verbleibende Erfolge werden als Schaden gewertet.

==== Zonenbasierter Schutz
Die Panzerung ist abhöngig von der getroffenen Stelle des Körpers. Jede Körperzone (Torso, Extremitäten) verfügen über eine eingenständige RS.

==== Materialermüdung
Ist die Anzahl an Erfolgen größer als die Rüstungsstufe, so verliert die Rüstung permanent 1 Rüstungsstufe. Die Rüstung kann anschließend wieder repariert werden.


