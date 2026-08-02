// ============================================================================
// resume.typ — layout/styling ONLY. All actual content lives in resume-ml.yaml.
// Edit resume-ml.yaml to update your resume; this file defines how it looks.
// ============================================================================

#let data = yaml("resume-ml.yaml")

#set document(title: data.name + " -- Resume", author: data.name)
#set page(
  paper: "us-letter",
  margin: (top: 0.45in, bottom: 0.45in, left: 0.55in, right: 0.55in),
)
#set text(font: ("Carlito", "Arial"), size: 9.7pt, lang: "en")
#set par(leading: 0.65em, justify: false)
// Unify the automatic gap Typst inserts between ANY two adjacent block-level
// elements (e.g. a title row followed by its bullet list) with the gap
// between bullet items themselves, so spacing feels consistent everywhere.
#set block(spacing: 0.65em)
#set list(marker: [•], indent: 0.65em, body-indent: 0.45em, spacing: 0.65em, tight: true)

#let accent = rgb("#57A1A0")
#let hlink(url, body) = link(url)[#text(fill: accent)[#underline(body)]]
#let md(s) = eval(s, mode: "markup")

// ---------------------------------------------------------------- section --
// A single block with explicit above/below margins (no reliance on implicit
// default spacing) so it behaves the same no matter what surrounds it.
#let section(title) = block(above: 8pt, below: 0pt)[
  #text(weight: "bold", size: 10.6pt)[#upper(title)]
  #line(length: 100%, stroke: 1pt + black)
]

// ----------------------------------------------------------------- header --
// Each column is its own self-contained, vertically-stacked block, and the
// whole row is vertically centered (horizon). This decouples the gap
// between the address lines / email-phone (tight, normal line spacing)
// from the gap between the name and the links line (explicit, larger).
#let header(d) = grid(
  columns: (1.15fr, 1.3fr, 1fr),
  align: (left + horizon, center + horizon, right + horizon),
  [#d.address.line1 \ #d.address.line2],
  align(center)[
    #text(size: 18pt, weight: "bold")[#d.name] \
    #(d.links.map(l => hlink(l.url)[#l.label]).join(" | "))
  ],
  [#d.email \ #d.phone],
)

// ------------------------------------------------------------ entry rows --
#let entry_header(left_content, date) = grid(
  columns: (1fr, auto),
  align: (left, right),
  left_content, [#date],
)

#let bullets(items) = list(..items.map(md))

#let education_entry(e) = block(above: 0.5em, below: 0.5em)[
  #entry_header(
    [#text(weight: "bold")[#e.institution] • #emph[#e.degree] #e.detail],
    e.date,
  )
  #if "bullets" in e { bullets(e.bullets) }
]

#let role_entry(e) = block(above: 0.5em, below: 0.5em)[
  #entry_header(
    [#text(weight: "bold")[#e.title] | #e.role#if "team" in e [, #e.team]#if "links" in e [ • #for l in e.links [#hlink(l.url)[#l.label] ]]],
    e.date,
  )
  #bullets(e.bullets)
]

#let project_entry(p) = block(above: 0.5em, below: 0.5em)[
  #text(weight: "bold")[#p.name]#if "links" in p [#for l in p.links [ • #hlink(l.url)[#l.label]]]
  #bullets(p.bullets)
]

// ==================== DOCUMENT ====================

#header(data)

#section("Education")
#for e in data.education [ #education_entry(e) ]

#section("Experience")
#for e in data.experience [ #role_entry(e) ]

#section("Projects")
#for p in data.projects [ #project_entry(p) ]

#section("Leadership and Community Engagement")
#for e in data.leadership [ #role_entry(e) ]

#section("Skills")
#block(above: 2pt)[
  #for s in data.skills [
    #text(weight: "bold")[#s.label]: #s.items \
  ]
]
