#import "@local/neo-core:0.1.0" as neo
#import "components.typ": *


= Eigenschaften-Schablonen
== Positive Eigenschaften
#for trait in neo.traits.pos [
  #render_traits(trait)
]

== Negative Eigenschaften
#for trait in neo.traits.neg [
  #render_traits(trait)
]
