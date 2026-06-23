#import "@local/neo-core:0.1.0" as neo

#import "components.typ": *

== Magiebegabte Gegner
Magiebegabte NSCs skalieren ihre Werte und Fähigkeiten mit der Arkanen Stufe (KS). Die folgenden Tabellen listen die archetypischen Vertreter der fünf Domänen auf. Jeder Eintrag definiert die Attribute, Fokusse, Fertigkeiten und Taktiken für die Stufen 1, 7 und 14. Die Werte für Lebensenergie (ERM/SCH/TRA) und Geistige Ermüdung (GEM) sind standardisiert, sofern nicht anders vermerkt.

#for key in neo.npcs.keys() {
  render-npc(neo.npcs.at(key))
}
=== Dimensions-Weber
=== Elementarist
=== Heiler
=== Illusionist
=== Kultist
=== Mentalist
=== Natur-Mystiker
=== Seher

== Nicht magiebegabte Gegner
=== Attentäter
=== Bandit
=== Bogenschütze
=== Bürger
=== Dieb
=== Gladiator
=== Kopfgeldjäger
=== Pirat
=== Ritter
=== Schläger
=== Schmuggler
=== Soldat
=== Söldner
=== Wache
=== Wilderer