#import "@local/neo-core:0.1.0" as neo

#import "color-theme.typ": *

= Kernmechanik

== Das 2W12-System
Um das gelingen einer Aktion zu prüfen werden zwei zwölfseitige Würfel (2W12) geworfen. Durch die Normalverteilung bei zwei Würfeln liegt die Wahrscheinlichkeit von mittleren Ergebnissen höher als niedrige bzw. hohe Würfelwürfe.
Diese Art von Würfen werden bei Proben auf die Fertigkeiten, beim Kampf oder beim weben von Arkanen Formeln eingesetzt.

=== Vergleichende Probe
Eine vergleichende Probe dient der Feststellung eines Erfolgs. Das Gesamtergebnis des Wurfs wird mit dem #neo.gls("ew") verglichen. Hierfür werden folgende Schritte durchlaufen.

#text(weight: "bold", "1. " + neo.gls-long("ew") + ":") Als erstes wird berechnet welcher Wert durch den Würfelwurf unterboten werden soll. Hierfür kommen verschiedene Modifikatoren sowie die Einzusetztende Fertigkeit zum Einsatz.

- *Basisattribut ermitteln:*
  Jeder Fertigkeit wird einem Attribut zugeordnet. Dieser kann Situationsbedingt vom Spielleiter angepasst werden.
- *Situationsbedinge Modifikatoren:*
  Je nach Situation kann der Spielleiter den #neo.gls("ew") durch Modifikatoren erleichtern oder erschweren. Hierunter fallen Wetter, sichtverhältnis, Stress etc. 
- *#neo.gls("fw"):*
  Der Wert den der Charakter in der Fertigketi besitzt, auf die die Probe abgelegt werden soll.

#text(weight: "bold", "2. Würfelwurf:") Es gilt bei einem Würfelwurf, dass möglichst niedrig gewürfelt werden sollte.

*3. Ergebnisvergleich:* Zum Schluss wird das gewürfelte Ergebnis mit dem zu erreichendem Zeilwert verglichen. Ist der Würfelwurf kleiner oder gleich dem #neo.gls("ew"), so ist die Probe gelungen, andernfalls ist sie missglückt. 

*4. Differenzberechnung:* Bei einigen Proben ist die Differenz zwischen Einsatzewrt und Würfelergenis wichtig. Auf die Differenz wird in den jeweiligen Stellen darauf eingegangen.

=== Modifikatoren
Besondere Umstände werden durch Modifikatoren dargestellt. Diese beeinflussen direkt den #neo.gls("ew") einer Probe. Ein positiver Modifikator erhöht den #neo.gls("ew") und steigert die Erfolgswahrscheinlichkeit. Ein negativer Modifikator senkt den Schwellenwert und erschwert das Gelingen der Aktion. 

#text(size: 12pt, weight: "bold", "Allgemeine Modifikatoren")
#v(-6pt)
#table(
  columns: (1fr, auto),
  stroke: table-stroke,
  fill: table-fill,
  align: (left, center),
  ..neo.visibility
)

=== Bravourwurf und Patzer
Extreme Ergebnisse führen zu besonderen Auswirkungen. Ein Gesamtergebnis von 2 markiert einen Bravourwurf und gilt als herausragender Erfolg. Ein Gesamtergebnis von 24 wird als Patzer gewertet. Ein Patzer bedeutet ein automatisches Scheitern der Aktion und kann zusätzliche negative Konsequenzen nach sich ziehen.


= Kampf
Beim erkunden der Welt begegnen den Charakteren Kreaturen und Personen die nicht immer Freundlich gesinnt sind. In solchen Situationen entscheidet ein Kampf über das weiterkommen der Charaktere.
== Aktionsökonomie
== Mobilität

== Initiative
Die Inititative legt fest, wer den Kampf beginnen darf. Hierbei ist darauf zu achten, dass die jeweiligen Gruppen die sich im Kampf gegenüberstehen als Einheit handeln. 
Um die Initiative zu ermitteln wird mit einem W12 gewürfelt. Die Gruppe mit dem höheren Würfelwurf beginnt den Kampf. 
Bei gleichstand der Wurfelwürfe, wird erneut gewürfelt.

=== Hinterhalt 
Bei einem Hinterhalt erhält die initiierende Gruppe einen ersten Angriff. Erst nach Abschluss dieser Kampfrunde wird die Initiative für den Kampf ausgewürfelt.

== Schadensermittlung
Der Schaden wird direkt bei erfolgreichem Treffer ausgewürfelt. Hierbei können Situationen entstehen, die es dem Gegener nicht mehr erlauben mit seiner Ganzen Truppe anzugreifen.

#neo.formula.dif.f

#neo.formula.anw.f


== Eskalationskaskade

#neo.formula.ekw.f

== Schadensregulierung
#table(
  columns: (1fr, 2fr),
  align: (left, left),
  stroke: table-stroke,
  fill: table-fill,
  [*Erfolge*],[*Effekt auf Vitalitätsschichten*],
  [1 -- 5], [#neo.gls-long("erm")],
  [6 -- 10], [Basiswert + jede weitere *gerade Zahl* verursacht *Schaden*],
  [11+], [Jede Einheit wird als *Schwerer Schaden* verbucht ],
  [15+], [*Terminale Vernichtung* des Primärziels]
)


== Rüstungssystem und Trefferzonen