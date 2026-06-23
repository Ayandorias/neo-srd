#let amber = (
  "900": rgb(69, 39, 0),
  "800": rgb(120, 66, 10),
  "700": rgb(180, 100, 15),
  "600": rgb(215, 130, 10),
  "500": rgb(245, 158, 11),
  "400": rgb(251, 191, 36),
  "300": rgb(253, 210, 90),
  "200": rgb(254, 230, 150),
  "100": rgb(255, 245, 210),
)

#let gray = (
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

#let primary-color = gray.at("700")
#let section-color = gray.at("800")


#let table-fill = ((x, y) => if y == 0 { gray.at("300") } else if calc.even(y) { gray.at("100") } else { white })
#let table-fill-headerless = ((x, y) => if calc.even(y) { gray.at("100") } else { white })
#let table-stroke = (0.5pt + gray.at("400"))