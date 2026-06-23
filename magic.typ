#import "@local/neo-core:0.1.0" as neo

#import "@preview/cetz:0.5.2"
#import "color-theme.typ": *
#import "components.typ": *


= Ablauf einer arkanen Formel
Das Wirken arkaner Formeln folgt einem festen Ablauf. Um eine Formel zu weben, werden die folgenden Schritte in der angegebenen Reihenfolge durchlaufen:

#action("Fokus auswählen:", "Es wird die Domäne und der spezifische Fokus bestimmt, der die grundlegende Wirkung der Formel vorgibt.")
#v(0.5em)
#action("Manifestation festlegen:", "Die geometrische Form der Entladung wird gewählt. Dies definiert die Basis-Komplexität und die benötigte Zauberdauer.")
#v(0.5em)
#action("Resonanz festlegen:", "Die Formel wird durch Modifikatoren wie Dauer, Intensität oder Reichweite an die Situation angepasst.")
#v(0.5em)
#action("Einsatzwert berechnen:", "Aus dem Arkanen Gesamtwert und den Abzügen durch Komplexität ergibt sich der finale Zielwert für die vergleichende Probe.")
#v(0.5em)
#action("Arkane Kosten berechnen:", "Die investierte Zeit und geistige Anstrengung wird in Geistige Ermüdung umgerechnet und vom Pool des Wirkenden abgezogen.")


== Domäne der Elemente
#action("Befreundete Domäne:", "Form, Geist")

=== Antimagie 

// #action("Basisattribut:", "abhängig von der zu neutralisierenden Formel")

#description("Antimagie hebt bestehende magische Effekte auf. Sie erzeugt keine eigene Wirkung, sondern stört die arkane Struktur einer fremden Manifestation, bis diese zusammenbricht.")

*Was Antimagie neutralisieren kann* \
Antimagie kann auschließlich gegen Formeln eingesetzt werden, die sich gerade im Aufbau befinden, oder schon gewirkt wurden.

Darunter fallen: Anhaltende Manifestationen (z.B. eine Aura, eine magische Falle oder eine Wand), die durch die Resonanz Dauer weiterhin aktiv bleiben.

Mehrphasige Formeln, die über mehrere Kampfrunden gewirkt werden müssen, können noch während dieser Zeit neutralisiert werden.

*Was Antimagie nicht neutralisieren kann* \
Schnelle Formeln (einfache, normale oder reguläre komplexe Handlungen) können nicht durch Antimagie neutralisiert werden, solange sie gewirkt werden. Um solch eine Formel zu neutralisieren ist eine einfache Ablenkung oder ein erfolgreicher Angriff notwendig.

*Bann-Probe* \
Um eine bestehende Manifestation zu neutralisieren, legt der Arkanist eine Fertigkeitsprobe auf Antimagie ab. Der negative Modifikator für diese Probe berechnet sich wie folgt:

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, $ "Malus" = "(Komplexität − FW)" + "Intensitätsstufe" $)
)

*Komplexität:* Die Komplexität der zu neutralisierenden Formel.

*FW:* Der Fertigkeitswert von Antimagie 

*Intensitätsstufe:* Die Intensitätsstufe der zu neutralisierenden Formel.

Ist der eigene FW gleich oder höher als die Komplexität der Manifestation, entfällt der erste Teil des Malus.

=== Elementarmagie [Element]
// #action("Basisattribut:", "")

#description("Elementarmagie ermöglicht die kinetische Manipulation der vier elementaren Urkräfte: Feuer, Wasser, Erde und Luft. Die Magie bündelt, entzündet oder verdichtet ausschließlich Elemente, die in der direkten Umgebung bereits physisch vorhanden sind.")

*Materiallimitierung* \
Elemente werden nicht aus dem Nichts erschaffen (keine atomare Replikation). Ist das gewünschte Element in der unmittelbaren Umgebung absolut nicht vorhanden (z. B. Erde auf einem offenen Holzschiff auf hoher See), kann die Formel nicht gewoben werden.

*Wirkung der Intensität* \
Die Intensität bestimmt die physische Dichte der Manifestation und den verursachten Schaden:

- *Niedrige Intensität:* Erzeugt Konstrukte mit geringer Dichte (z. B. durchlässige Staubschleier oder leichten Nebel) und minimalem Schaden.
- *Hohe Intensität:* Manifestiert massive, undurchdringliche Materie (z. B. Felsmauern) und verursacht eskalierenden kinetischen Folgeschaden.

*Dauer und Folgeschaden* \
Wird eine elementare Manifestation mit der Resonanz Dauer gewoben, erleidet das Ziel in den folgenden Runden fortlaufenden Schaden. Die genaue Auswirkung (z. B. Erstickung durch Wasser, Verbrennung, Verschüttung) ergibt sich aus dem logischen Kontext und obliegt der Entscheidung des Archivars.

*Spezialregel: Luft-Manifestationen* \
Das Bündeln enormer Luftmengen erzeugt einen physikalischen Nebeneffekt: Für einen Sekundenbruchteil entsteht ein spürbarer Sog in Richtung des Wirkenden. Zudem verursacht der plötzliche, massive Abfall des Luftdrucks ein schmerzhaftes Knacken auf den Ohren aller Personen im direkten Umfeld.

=== Telekinese
// #action("Basisattribut:", "WIL")

#description("Telekinese definiert sich als die Bewegung von Objekten und die Ausübung von physischem Druck durch reinen Willensdruck. Ein Telekinet erschafft keine neuen Elemente, sondern manipuliert die reine kinetische Kraft, um vorhandene Materie als Werkzeug, Waffe oder Barriere zu nutzen.")

*Wirkung der Intensität* \
Die Intensität skaliert den kinetischen Druck der Formel:
- *Niedrige Intensität:* Verschiebt leichte Objekte, absorbiert kinetische Energie (z. B. das sanfte Abbremsen von Stürzen) oder wirbelt Staub auf.
- *Hohe Intensität:* Erzeugt extremen Druck, der Rüstungen zerquetscht, massive Baustrukturen aus dem Fundament reißt und durch pure Wucht letalen Schaden verursacht.


== Domäne der Form
#action("Befreundete Domäne:", "Elementar, Struktur")

=== Illusionsmagie
// Domäne: Form | Basisattribut: WIL | Stufe: 1 | Trainingsstufe: 2
Grundprinzip
#description("Illusionsmagie ermöglicht die Manipulation der sensorischen Wahrnehmung. Die erschaffenen Konstrukte besitzen keine physische Masse und verursachen keinen direkten physischen Schaden. Sie dienen ausschließlich der Täuschung, Desorientierung und psychologischen Manipulation.")
*Gegenwehr* \
Da Illusionen direkt in die Wahrnehmung eingreifen, erfolgt die Gegenwehr unwilliger Ziele über die Psychische Resistenz.
*Wirkung der Intensität* \
Die Intensität bestimmt bei der Illusionsmagie nicht die Zerstörungskraft, sondern die multisensorische Glaubwürdigkeit des Konstrukts:

- *Niedrige Intensität:* Erzeugt rudimentäre, oft flackernde Trugbilder. Akustische, thermische und olfaktorische Komponenten fehlen, was die Illusion bei genauer Betrachtung leicht entlarvt.
- *Hohe Intensität:* Erschafft vollwertige, multisensorische Konstrukte. Integriert täuschend echte Geräusche, Gerüche und spürbare Temperaturveränderungen zur absoluten Realitätstäuschung.

=== Traummagie
// Domäne: Form | Basisattribut: WIL | Stufe: 4 | Trainingsstufe: 4
#description("Traummagie definiert sich als die Manipulation des Unbewussten. Der Arkanist löst sich von der physischen Realität, um in die Welt der schlafenden Geister einzudringen, dort Geheimnisse zu lüften oder den Verstand durch falsche Visionen zu manipulieren.")

*Gegenwehr* \
Da dieser Kampf gänzlich im Reich des Geistes ausgetragen wird, erfolgt die Gegenwehr unwilliger Ziele über die Psychische Resistenz.

*Wirkung der Intensität* \
Die Intensität skaliert die Eindringtiefe und den mentalen Realismus der Vision:
- *Niedrige Intensität:* Implementiert oberflächliche Träume und subtile Eingebungen. Das Opfer nimmt dies oft nur als unruhigen Schlaf wahr; die Erinnerung an den Eingriff verblasst unmittelbar nach dem Erwachen.
- *Hohe Intensität:* Erzwingt greifbare, luzide Albtraumwelten. Bricht den Willen des Ziels, hält es im Schlaf gefangen oder erzeugt totalen Realitätsverlust, da das Gehirn den Traum nicht mehr von der echten Wirklichkeit unterscheiden kann.

=== Verwandlungsmagie
// Domäne: Form | Basisattribut: WIL | Stufe: 4 | Trainingsstufe: 4

#description("Verwandlungsmagie ermöglicht die grundlegende anatomische Veränderung von Lebewesen und physischer Materie. Der Arkanist ist nicht an sein ursprüngliches Gefäß gebunden und vermag es, die eigene Anatomie drastisch zu wandeln oder fremde Substanzen neu zu formen.")

*Gegenwehr* \
Richtet sich diese formende Kraft gegen ein unwilliges Lebewesen, um dessen Körper gewaltsam zu manipulieren, erfolgt die Gegenwehr über die Physische Resistenz.

*Wirkung der Intensität* \
Die Intensität bestimmt das Ausmaß und die anatomische Perfektion der physischen Veränderung:
- *Niedrige Intensität:* Erlaubt lediglich kosmetische Anpassungen der Gesichtszüge oder die Verformung von marginalen, leblosen Objekten. Stoßen schnell an anatomische Grenzen.
- *Hohe Intensität:* Erzwingt die vollständige anatomische Rekonstruktion in fremde Spezies (inklusive aller spezifischen physischen Eigenschaften). Modifiziert massiven anorganischen Stoff oder den Körper von Feinden gegen deren Willen permanent.

== Domäne des Geistes
#action("Befreundete Domäne:", "Elementar, Leben")

=== Beherrschungsmagie
// #action("Basisattribut:", "WIL")
#description("Beherrschungsmagie zielt auf die mentale Kontrolle über fremde Lebewesen ab. Der freie Wille des Ziels wird durch arkane Zwänge gebrochen, um es zu Handlungen zu zwingen, die es aus eigenen Stücken niemals tun würde. In vielen zivilisierten Kulturen gilt diese Disziplin als absolutes Tabu.")

*Gegenwehr* \
Da diese Magie den Geist direkt angreift, leisten unwillige Ziele Widerstand über ihre Psychische Resistenz.

*Wirkung der Intensität* \
Die Intensität bestimmt den Grad des mentalen Zwangs:
- *Niedrige Intensität:* Erlaubt lediglich subtile Suggestionen, kurze Ablenkungen oder das Einpflanzen flüchtiger Gedanken. Das Ziel folgt keinen Befehlen, die gegen die eigene Natur oder den Selbsterhaltungstrieb verstoßen.
- *Hohe Intensität:* Der Wille des Ziels wird vollständig gebrochen. Es handelt als willenlose Marionette und führt selbst komplexe oder selbstmörderische Befehle ohne Zögern aus, da der eigene Verstand in die absolute Isolation gedrängt wurde.


=== Seelenmagie
// **Domäne:** Geist | **Basisattribut:** ERS/WIL | **Stufe:** 6 | **Trainingsstufe:** 5

#description("Seelenmagie manipuliert direkt den metaphysischen Lebensfunken eines Lebewesens. Sie greift tiefer als reine Gedankenkontrolle ein, um Erinnerungen zu verändern, die Persönlichkeit zu verschieben oder die Essenz des Ziels zu beschädigen. ")


*Gegenwehr* \
Angriffe auf die eigene Essenz werden über die *Psychische Resistenz* abgewehrt.

*Wirkung der Intensität* \
Die Intensität skaliert die Tiefe des Eingriffs in den Lebensfunken:
- *Niedrige Intensität:* Beeinflusst nur die Oberfläche des Lebensfunkens. Dämpft rohe Emotionen, erzeugt künstliche Beruhigung oder ein diffuses Gefühl der Verbundenheit. Tiefgreifende Manipulationen oder das Löschen von Erinnerungen sind auf diesem Niveau nicht möglich.
- *Hohe Intensität:* Durchdringt den Lebensfunken bis in den Kern. Ermöglicht das dauerhafte Umschreiben von Erinnerungen, die fundamentale Veränderung des Charakters oder die zerstörerische Attacke auf die Essenz, bis der Lebenswille des Ziels zusammenbricht.


=== Telepathie
// **Domäne:** Geist | **Basisattribut:** ERS/WIL | **Stufe:** 3 | **Trainingsstufe:** 3

#description("Telepathie ermöglicht die lautlose Kommunikation und das Lesen fremder Gedankenströme über beliebige Distanzen. Sie hinterlässt keine physischen oder hörbaren Spuren und eignet sich daher ideal für Infiltration und Spionage.")

*Gegenwehr* \
Das einfache Senden oder Empfangen bei willigen Zielen benötigt keine Gegenwehr. Wird jedoch versucht, in den Geist eines unwilligen Ziels einzudringen, greift dessen Psychische Resistenz

*Wirkung der Intensität* \
Die Intensität bestimmt die Klarheit und Schärfe der telepathischen Verbindung:
- *Niedrige Intensität:* Der Kontakt ist fragil und verrauscht. Es werden lediglich rohe Emotionen (wie akute Angst) oder einfache, gerade erst gedachte Worte aufgefangen. Das Senden beschränkt sich auf kurze Impulse oder Bilder.
- *Hohe Intensität:* Der Kontakt ist kristallklar und unerschütterlich. Erlaubt das tiefe Eindringen in den Verstand, um lang verborgene Geheimnisse präzise zu lesen, sowie das Führen komplexer Echtzeit-Unterhaltungen.


== Domäne des Lebens
#action("Befreundete Domäne:", "Geist, Struktur")

== Körpermagie
// #action("Basisattribut:", neo.gls("kon"))

#description("Körpermagie definiert sich als die interne Kanalisierung der eigenen Lebensenergie zur temporären Steigerung körperlicher und geistiger Attribute. Eine Manipulation der Umwelt oder anderer Personen ist ausgeschlossen; die Wirkung entfaltet sich ausschließlich im eigenen Gefäß.")

*Wirkung der Intensität* \
Die Intensität bestimmt den Grad der biologischen Übersteuerung:
- *Niedrige Intensität:* Optimiert die innere Balance. Erhöht Ausdauer, Atemkontrolle und physische Reflexe auf moderate Weise.
- *Hohe Intensität:* Übersteuert biologische Grenzen. Gewährt temporär übermenschliche Muskelkraft, Schnelligkeit und absolute Präzision.


=== Heilmagie
// **Domäne:** Leben | **Basisattribut:** KON | **Stufe:** 2 | **Trainingsstufe:** 2

#description("Heilmagie ermöglicht das arkane Schließen von Wunden. Sie heilt ausschließlich physische Substanzverletzungen (Schaden) und kritische Systemausfälle (Trauma). Körperliche Ermüdung (ERM) lässt sich auf diesem Wege nicht regenerieren.")

*Mechanik der Heilpunkte* \
Die Resonanz Intensität generiert zusätzliche W6 zur Errechnung von Heilpunkten. Die Umwandlungsrate ist starr:
- *3 Heilpunkte* heilen 1 Punkt Schaden.
- *5 Heilpunkte* heilen 1 Punkt Trauma.

*Der Kaskaden-Schock* \
Heilmagie erschafft kein gesundes Gewebe aus dem Nichts, sondern zwingt den Körper zu rasender Zellreproduktion. Wunden werden in darunterliegende Erschöpfungszustände „heruntergestuft“:
- Die Heilung von 1 Punkt Trauma generiert sofort 5 Punkte Schaden.
- Die Heilung von 1 Punkt Schaden generiert sofort 10 Punkte Körperliche Ermüdung.

*Magische Blockade* \
Die Heilung schlägt fehl und prallt wirkungslos ab, wenn die darunterliegende Leiste des Patienten nicht ausreichend Kapazität bietet:
- Schaden kann nicht geheilt werden, wenn die Körperliche Ermüdung des Ziels bereits bei 21 oder höher liegt (da die 10 neuen Punkte das Maximum von 30 überschreiten würden).
- Trauma kann nicht gewandelt werden, wenn die Schadensleiste nicht mindestens 5 freie Kästchen aufweist.

*Heilungspools (Flächen- und Dauerzauber)* \
Wird die Heilung durch Modifikatoren auf Flächen oder Zeiträume ausgeweitet, sammeln sich die erwürfelten Heilpunkte in einem stationären oder beweglichen Pool. Verletzte Charaktere im Wirkungsbereich entziehen dem Pool automatisch die benötigten Punkte. Ungenutzte Heilpunkte verpuffen mit Ende der Manifestation.



=== Naturmagie
// **Domäne:** Leben | **Basisattribut:** WIL/GES | **Stufe:** 3 | **Trainingsstufe:** 3

#description("Naturmagie ermöglicht die Interaktion und Kontrolle über Flora, Fauna und organische Ökosysteme. Der Arkanist tritt in direkte Resonanz mit dem Lebensfluss der natürlichen Welt, anstatt diese durch rohe Gewalt zu manipulieren.")

*Wirkung der Intensität* \
Die Intensität skaliert die Tiefe der Verbindung und den Grad der Einflussnahme:
- *Niedrige Intensität:* Empfängt rudimentäre Instinkte. Beruhigt Tiere, baut einfache empathische Verbindungen auf oder erspürt das langsame Wachstum der umgebenden Flora.
- *Hohe Intensität:* Erzwingt extremes Pflanzenwachstum zur direkten taktischen Nutzung. Ermöglicht komplexe Kommunikation mit Tieren und das Lesen ganzer Ökosysteme.


== Domäne der Struktur
#action("Befreundete Domäne:", "Form, Leben")

=== Dimensionale Magie
// #action("Basisattribut:", "WIL")

#description("Dimensionale Magie ermöglicht die direkte Manipulation von Raum und Zeit sowie die Öffnung von Portalen im geometrischen Gefüge der Realität. Da diese Magie die kosmische Ordnung verzerrt, erfordert sie ein makelloses arkanes Verständnis.")

*Wirkung der Intensität* \
Die Intensität bestimmt die Stabilität und das Ausmaß der Raumkrümmung:
- *Niedrige Intensität:* Öffnet instabile, flüchtige Risse. Erlaubt kurzstreckige Teleportation, die zwingend direkten Sichtkontakt auf das Ziel erfordert.
- *Hohe Intensität:* Erschafft stabile, langanhaltende Portale für massive Materialtransporte. Ermöglicht die Beschwörung von Wesenheiten aus fremden Dimensionen in die eigene Realität.


=== Runenmagie
// **Domäne:** Struktur | **Basisattribut:** WIL | **Stufe:** 5 | **Trainingsstufe:** 4

#description("Runenmagie dient der Bindung flüchtiger arkaner Energie in dauerhafte materielle Träger wie Stein, Stahl oder Fleisch. Anstatt einen Zauber nur für den Augenblick zu wirken, werden mystische Codes und komplexe Glyphen in feste Materie graviert, um als stetige Ankerpunkte zu dienen.")

*Wirkung der Intensität* \
Die Intensität skaliert die Durchschlagskraft und die Verankerung der Bindung in der Materie:
- *Niedrige Intensität:* Generiert oberflächliche Siegel (z. B. mit Tinte auf Pergament). Gewährt temporäre Verstärkungen oder dient als einmaliges Zaubersiegel, das nach seiner Auslösung sofort zerfällt.
- *Hohe Intensität:* Graviert nahezu unzerstörbare Glyphen tief in Stahl, Stein oder Fleisch. Modifiziert Waffen und Panzerungen mit permanenten arkanen oder kinetischen Eigenschaften, die selbst schwersten Schlägen widerstehen.



=== Schutzmagie
// **Domäne:** Struktur | **Basisattribut:** WIL | **Stufe:** 2 | **Trainingsstufe:** 2

#description("Schutzmagie fokussiert sich auf die Konstruktion defensiver Barrieren und Schutzkreise gegen kinetische, arkane und umweltbedingte Angriffe. Sie bildet das wichtigste Werkzeug, um in den gnadenlosen Gefechten der mechanischen Welt zu überleben.")

*Wirkung der Intensität*  \
Die Intensität definiert die Härte, Dichte und Widerstandskraft der erzeugten Barriere:
- *Niedrige Intensität:* Erschafft fragile, temporäre Puffer. Dämpft extreme Umweltbedingungen und fängt leichte Streifschüsse ab; zersplittert jedoch unter schwerem Beschuss rasch.
- *Hohe Intensität:* Generiert eine statische, undurchdringliche Festung aus reiner arkaner Kraft. Absorbiert das Feuer schwerer Schusswaffen mühelos und blockiert elementare Naturgewalten vollständig.




== Manifestation
#render_manifestations(neo.manifestations)

== Resonanzen
#render_resonanzen(neo.resonanzen)

== Einsatzwert berechnen
Um den Einsatzwert für die Arkane Formel zu errechnen, wird zuerst der #neo.gls("agw") berechnet in abhängigkeit vom einzusetztenden #neo.gls("attr").
#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.agw.f)
)

Anschließend wird der Unerfahrenheits-Malus in Abhängigkeit zum #neo.gls("fw") berechnet.

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.unmm.f)
)

==== Meisterschaft
Ist der FW gleich oder größer als der komplexität, entfällt der Malus komplett.

==== Modifikatoren durch Manifestation & Resonanz:
Beide Modifikatoren erschweren die Kontrolle und verringern den finalen Einsatzwert. Diese negativen Modifikatoren werden kumulativ vom #neo.gls-short("agw") abgezogen.

== Arkane Kosten
Die Kosten für eien Arkane Formel wird anhand der Zeit berechnet, die Sie benötigt um sich selbst zu manifestieren. Jede #neo.gls-short("ehdlg") kostet dem Arkanisten 1 #neo.gls-short("gem").

*1. Manifestation in #neo.gls-short("ehdlg") umrechnen:* 
  - Einfache Handlung = 1 #neo.gls-short("gem")
  - Normale Handlung = 2 #neo.gls-short("gem")
  - Komplexe Handlung = 3 #neo.gls-short("gem")

*2. Resonanzen & zusätzliche Ziele addieren:* 
#table(
  columns: (1fr, 1fr),
  stroke: table-stroke,
  fill: table-fill,
  align: (left, left),
  ..neo.arcane_mod
)

*3. Arkane Stufe:* \
Jede #neo.gls-short("ks") verringert die Zeit, die der Arkanist benötigt um die Formeln zu weben. Jede Stufe verringert die zauberdauer um eine #neo.gls-short("ehdlg").

*4. Finale Dauer & Kosten:* \
Die Kosten können nun 1:1 in #neo.gls-short("gem") umgewandelt werden.
Dabei ist zu berücksichtigen, dass kein Zauber weniger als ein #neo.gls-short("gem") kostet.

*5. Blutmagie* \ 
Kosten, die die verbleibende #neo.gls-short("gem") übersteigen, werden 1:1 von der #neo.gls("erm") abgezogen. Sinkt auch diese auf 0, erleidet der Charakter Schaden und fällt in Ohnmacht.

=== Regeneration
Die Regeneration folgt den gleichen Regeln wie es im Kapitel Kampf beschrieben ist.

== Erschließung neuer Domänen / Fokusse
Das erlernen neuer Fokusse aus einer anderen Domäne erfordert, dass der Arkanist sich entlang der Linien des Pentagrammes weiter entwickelt. 

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    let r = 3.5

    let pos-geist = (90deg, r)
    let pos-form = (18deg, r)
    let pos-leben = (306deg, r) // Entspricht -54°
    let pos-elementar = (234deg, r) // Entspricht -126°
    let pos-struktur = (162deg, r)

    line(pos-geist, pos-form, pos-leben, pos-elementar, pos-struktur,
         close: true, stroke: (paint: luma(150), dash: "dashed", thickness: 1pt))

    line(pos-geist, pos-leben, pos-struktur, pos-form, pos-elementar,
         close: true, stroke: (paint: black, thickness: 2pt))

    // 3. Funktion zum Zeichnen der Knoten (Kristalle)
    let node(pos, name) = {
      // Farbiger Außenring (Der jeweilige Illyrit-Kristall)
      circle(pos, radius: 0.8, fill: gray.at("100"), stroke: 1pt + gray.at("400"))
      // Beschriftung der Domäne
      content(pos, text(weight: "bold", size: 8pt, name))
    }

    // Zeichnen der 5 Domänen mit ihren assoziierten Kristallfarben
    node(pos-struktur, "Struktur")
    node(pos-leben, "Leben")
    node(pos-form, "Form")
    node(pos-geist, "Geist")
    node(pos-elementar, "Elementar")
  })
]
#v(3em)

*Die Brücke:* \
Um eine noch gesperrte Domäne zu aktivieren, muss der Arkanist zwingend eine über das Pentagramm verbundene, befreundete Domäne als Brücke nutzen.

*Die Voraussetzung:* \
Um zur nächsten Domäne zu gelangen, muss der Arkanist bereits mindestens einen Fokus aus der als Brücke genutzten Domäne aktiviert (gelernt) haben.

*Die Erschließung:* \
Wenn diese Voraussetzungen erfüllt sind, gilt die neue Domäne als freigeschaltet. Aus ihr können nun regulär Fokusse aktiviert werden.

== Schadensermittlung
Die Schadensermittlung folgt den gleichen Regeln wie Sie auch im Kampf beschrieben sind. Die Resonanz Intensität überneimmt hier die Funktion der Waffenstufe.

=== Anhaltender Schaden
Anhaltender Schaden
Die Resonanz Dauer erhöht nicht den anfänglichen Schadensausstoß, sondern bestimmt, wie viele Runden das Opfer der Formel ausgesetzt ist.
- *Keine neue Trefferprobe:* In den Folgerunden ist keine erneute Probe erforderlich, da dies bereits geschehen ist.
- *Neuer Schadenswurf:* Zu Beginn jeder Kampfrunde erleidet das Ziel automatisch den Schaden der Manifestation. Hierfür wird lediglich der Schadenspool (die ermittelte Anzahl an W6) für diese spezifische Formel komplett neu ausgewürfelt.
- *Verrechnung:* Der Rüstungsschutz (RS) und etwaige Resistenzen des Ziels werden in jeder Runde aufs Neue von den frischen Erfolgen abgezogen, bevor der verbleibende Schaden mit der Lebensenergie verrechnet wird.




=== Steigerung der Arkanen Stufe

Die Arkane Stufe (AS) zeigt, wie tief ein Magiewirker in seine arkane Kraft eingetaucht ist. Sie wirkt als Bonus auf alle Formeln der erlernten Domänen, ist an keine Charakterstufe oder ein bestimmtes Attribut gebunden und lässt sich durch EP-Investitionen beliebig weit ausbauen.

Gesteigert wird die AS wie eine normale Fertigkeit, allerdings mit deutlich höheren EP-Kosten. Da sie nicht nur eine einzelne Disziplin verbessert, sondern das gesamte magische Fundament, gilt eine feste Trainingsstufe von 10. Die EP-Kosten für den nächsten Stufenaufstieg berechnen sich nach folgender Formel:

#block(
  width: 100%,
  height: 60pt,
  stroke: 1pt + amber.at("600"),
  align(center + horizon, neo.formula.ks.f)
)

Jede neue AS-Stufe bringt drei Verbesserungen mit sich. Der Arkane Gesamtwert (AGW) steigt um 1 Punkt, Formeln lassen sich um eine Einfache Handlung schneller wirken, mindestens eine bleibt aber immer nötig, und ein höherer AGW federt negative Modifikatoren durch hohe Resonanzen besser ab.