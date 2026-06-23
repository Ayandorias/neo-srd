#import "@local/neo-core:0.1.0" as neo

#import "components.typ": *

== Tiere
#for key in neo.npcs_animals.keys() {
  render-npc(neo.npcs_animals.at(key))
}