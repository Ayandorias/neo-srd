// ==========================================
// 1. DIE BASISPALETTEN
// ==========================================
#let primary = (
  "100": rgb("#f2f7f5"), 
  "200": rgb("#dfede7"), 
  "300": rgb("#badbd0"), 
  "400": rgb("#92c4b4"), 
  "500": rgb("#6ba997"), 
  "600": rgb("#4f8f7c"), 
  "700": rgb("#387363"), 
  "800": rgb("#24574a"), 
  "900": rgb("#133b31"), 
)

#let secondary = (
  "900": rgb(12, 10, 9),    
  "800": rgb(35, 32, 30),    
  "700": rgb(60, 55, 52), 
  "600": rgb(90, 85, 80),   
  "500": rgb(125, 120, 115), 
  "400": rgb(160, 155, 150), 
  "300": rgb(195, 190, 185), 
  "200": rgb(220, 215, 210), 
  "100": rgb(240, 238, 235), 
)

// ==========================================
// 2. ERWEITERTE SYSTEM-KONTEXTE (Von mir ergänzt)
// ==========================================

// Spielleiter-Info / Fluff (Hintergrundwissen, das Spieler nicht zwingend wissen müssen)
// Nutzen die weiche, hellere Petrol-Ebene, um sich klar abzugrenzen, ohne bunt zu wirken.
#let bg-fluff         = primary.at("100")
#let border-fluff     = primary.at("500")
#let text-fluff       = secondary.at("800")

// Wichtige Systemwarnung / Tödliche Regeln (z.B. Ertrinken, Kritische Fehler, irreversible Effekte)
// Ein gezielter, gedämpfter Warn-Farbton, der sich mit dem kühlen Petrol beißt, um sofortige Aufmerksamkeit zu erzwingen.
#let bg-danger        = rgb("#fdf2f2") // Sehr blasses, mattes Signal-Rot
#let border-danger    = rgb("#ec5b5b") // Gedämpftes Korallen-Rot (kein Neon-Rot, passend zum Buchdruck)
#let text-danger      = rgb("#7a2020")

// Regel-Mechanik / Stat-Blocks (Wo reine Zahlen stehen, z.B. Attribute, NSC-Werte, Waffenwerte)
// Ein starker Kontrast aus der dunkelsten Petrol-Ebene und hellem Text für kompakte Info-Kästen.
#let bg-crunch        = primary.at("900")
#let text-crunch-fg   = primary.at("100")
#let border-crunch    = primary.at("700")

// Beispiele (Deine 50 Stellen im Dokument, die eine Beispiel-Aktion beschreiben)
// Ein erdiger Akzentton, der sich vom grauen Text abhebt, aber im Lesefluss nicht wie ein Fehler wirkt.
#let text-example     = rgb("#9e6743") // Mattes Ton-Braun (harmoniert exzellent mit dem warmen Grau)

// Querverweise / Seiten-Links (Interne Verlinkungen im PDF)
#let text-link        = primary.at("600")

// ==========================================
// 3. CORE-ELEMENTE
// ==========================================
#let text-main       = secondary.at("900") 
#let text-muted      = secondary.at("500") 
#let text-key        = primary.at("600")

#let text-h1         = primary.at("800")   
#let text-h2         = primary.at("900")   
#let text-h3         = primary.at("700")   
#let text-h4         = primary.at("700")   

#let table-header-bg = primary.at("700") 
#let table-header-fg = secondary.at("100") 
#let table-row-even  = secondary.at("100") 
#let table-row-odd   = white
#let table-border    = secondary.at("300") 

#let formula-bg      = primary.at("100")   
#let formula-border  = primary.at("300")   
#let formula-text    = secondary.at("900")


#let table-fill = ((x, y) => 
  if y == 0 { 
    table-header-bg
  } else if calc.even(y) {
    table-row-even
  } else { 
    table-row-odd
  }
)

#let table-fill-headerless = ((x, y) => 
  if calc.even(y) { 
    secondary.at("100") 
  } else { 
    white 
  }
)

#let table-stroke = (0.5pt + secondary.at("400"))
#let block-stroke = (1pt + primary.at("600"))