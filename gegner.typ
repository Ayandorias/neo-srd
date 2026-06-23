#import "@local/neo-core:0.1.0" as neo

#import "components.typ": *

== Magiebegabte Gegner
Magiebegabte NSCs skalieren ihre Werte und Fähigkeiten mit der Arkanen Stufe (KS). Die folgenden Tabellen listen die archetypischen Vertreter der fünf Domänen auf. Jeder Eintrag definiert die Attribute, Fokusse, Fertigkeiten und Taktiken für die Stufen 1, 7 und 14. Die Werte für Lebensenergie (ERM/SCH/TRA) und Geistige Ermüdung (GEM) sind standardisiert, sofern nicht anders vermerkt.

#for key in neo.npcs.keys() {
  render-npc(neo.npcs.at(key))
}

== Nicht magiebegabte Gegner
#for key in neo.npcs_non_magic.keys() {
  render-npc(neo.npcs_non_magic.at(key))
}

