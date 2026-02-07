#import "./lib.typ": *

#show: template.with(
  author: [Ezalor],
  title: [Homework From My Teacher],
  course: [The Name of The Course This HW Belong To],
  doc_type: DocType.Homework,
  doc_lang: Lang.English,
  num_heading: true,
)

= Maxwell Equations
Here is example of referencing equation: @eq:maxwell-gauss is part of @eq:maxwell.

$
  &integral.surf_(partial V) arrow(E) dot odif(arrow(A)) = 1/epsilon_0 Q_"enc"#<eq:maxwell-gauss>\
  &integral.surf_(partial V) arrow(B) dot odif(arrow(A)) = 0\
  &integral.cont_(partial S) arrow(E) dot odif(arrow(l)) = - (partial Phi_B)/(partial t)#<eq:maxwell-faraday>\
  &integral.cont_(partial S) arrow(B) dot odif(arrow(l)) = mu_0 I + mu_0 epsilon_0 (partial Phi_E)/(partial t)#<eq:maxwell-ampere>
$<eq:maxwell>

#lorem(50)

#lorem(30)
This is from `physica` typst package:
$
  tensor(Gamma,+k,-i,-j), braket(a, phi, b), imat(2, fill:*) !=
  hmat(;x,y,z;delim:"|",big:#true)
$
Equation without label, will not have numbering.

== Subsection Showing Random Text
#lorem(50)

#lorem(80)

#lorem(50)

= Example Table

Take a look at this simple, yet powerfull @tab:default

#figure(
  caption: [To keep this template simple, let use the default table],
  table(
    columns: (auto, auto, 1fr),
    align: (left, left, left),
    table.header(
      align(center)[#strong[Date]],
      strong[°No],
      align(center)[#strong[Description]]
    ),
    [24/01/03], [813], [Filtered participant pool],
    [24/01/03], [477], [Transitioned to sec. regimen],
    [24/01/11], [051], [Cycled treatment substrate],
  )
)<tab:default>

#bibliography("ref.bib", full: true, title: "Referensi")
