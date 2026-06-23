#import "@local/neo-core:0.1.0" as neo

#import "components.typ": *


= Fertigkeiten

== Arkanes Wissen
#for magic in neo.magic-skills [
    #render_magic(magic)
]

== Kampffertigkeiten
#for fight in neo.skills.combat [
    #render_skill(fight)
]

== Künstlerische Fertigkeiten
#for handwerk in neo.skills.handwerk [
    #render_skill(handwerk)
]

== Naturverbundene Fertigkeiten
#for natur in neo.skills.natur [
    #render_skill(natur)
]

== Soziale Fertigkeiten
#for sozial in neo.skills.sozial [
    #render_skill(sozial)
]

== Technische Fertigkeiten
#for technik in neo.skills.technik [
    #render_skill(technik)
]

== Überlebensfertigkeiten
#for survival in neo.skills.survival [
    #render_skill(survival)
]


