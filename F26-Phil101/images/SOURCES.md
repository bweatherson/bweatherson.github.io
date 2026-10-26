# Image sources — Phil 101

One entry per committed image in this folder. This file is the record of where
each picture came from and what licence it is under, so that slide credits can be
written from it and so that a year from now there is no guessing.

The full-resolution originals live in `_originals/`, which is gitignored and never
published. What is committed here are the web derivatives, built with:

    python3 tools/prep-images.py build --dir F26-Phil101

Before committing, check nothing oversized has crept in:

    python3 tools/prep-images.py check --dir F26-Phil101

## Preferred sources

Public-domain collections, in rough order of usefulness for this course:

- Rijksmuseum, <https://www.rijksmuseum.nl/en/rijksstudio> — very high resolution, generous terms
- The Metropolitan Museum of Art Open Access, <https://www.metmuseum.org/art/collection>
- Yale Center for British Art, <https://britishart.yale.edu/collections>
- The Getty Open Content, <https://www.getty.edu/art/collection/>
- NYPL Digital Collections, <https://digitalcollections.nypl.org/>
- Library of Congress, <https://www.loc.gov/free-to-use/>
- Wikimedia Commons, <https://commons.wikimedia.org/> — check the individual file's licence, it varies

For diagrams, draw an SVG rather than looking for a photograph. It will be a few
kilobytes instead of a hundred, it will scale to any projector, and it will
usually teach the point better.

## Entries

| File | What it is | Source | Accession / ID | Status |
|---|---|---|---|---|
| `mill.jpg` | Photographic portrait of John Stuart Mill, c. 1870 | Wikimedia Commons | `File:John Stuart Mill by London Stereoscopic Company, c1870.jpg` | Public domain — published c. 1870. Confirm the licence box on the file page. |
| `kant.jpg` | Portrait of Immanuel Kant, Johann Gottlieb Becker, 1768 | Wikimedia Commons (via the Wikipedia article on Kant) | lead portrait of the en.wikipedia "Immanuel Kant" article | Public domain — painted 1768. Confirm the licence box on the file page. |
| `foot.jpg` | Philippa Foot, cropped from the Somerville College group photograph of 1939 | Somerville College, Oxford — LGBTQ History Month page, Feb 2025. Same photograph on Commons as `File:Philippa Foot 1939.jpg` (lower resolution). | — | PD. UK photographs taken pre-1957 ran 50 yrs from creation, so out of copyright since 1989, and not URAA-restored in the US. A faithful scan of a PD 2D work adds no new copyright. |
| `aquinas.jpg` | Carlo Crivelli, *Saint Thomas Aquinas*, 1476 (panel of the Demidoff Altarpiece) | Wikimedia Commons; painting held by the National Gallery, London | NG788.9 | PD — painted 1476, Crivelli d. c.1494. A faithful reproduction of a PD 2D work adds no new copyright. |
| `loop-variant.svg` | Diagram: Bystander at the Switch beside Thomson's loop variant | Drawn for this course | — | Original work, no third-party rights. |

<!--
Add a row per image. Delete the example when the first real entry goes in.
"Status" should say why it is safe to publish: public domain, CC0, CC BY with
attribution given on the slide, or licensed stock used at web resolution.
-->
