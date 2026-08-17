# PHIL 444 TODO

As of 12 August 2026. Status verified against what is actually on disk.

Two deadlines govern everything here. **The book is due Monday 24 August**, 12
days away, because it is a textbook and textbooks are ready before term rather
than the night before the class that uses them. **Teaching starts Tuesday 1
September**, and the syllabus has to be final by then. Everything else is paced
by the lecture it serves.

Lecture dates for reference: L1 Tue 1 Sep, L2 Thu 3 Sep, L4 and Quiz 1 Thu 10 Sep,
L6 Thu 17 Sep, L8 Thu 24 Sep, L13 Tue 13 Oct, L15 Thu 22 Oct, L16 Tue 27 Oct,
essay 1 due Fri 30 Oct, L22 Tue 17 Nov, L25 Tue 1 Dec, L28 Thu 10 Dec, final
essay due Fri 18 Dec.

## The book: everything due Monday 24 August

### Writing

- [X] **Ellsberg.** Written as 2.9, tagged `sec-ellsberg`, with `tbl-ellsberg`
      captioned and cross-referenced from the text.
- [X] **Read the new Allais material** in chapter 2, and delete the two DRAFT
      callouts. Both callouts and the banner comments are gone.
- [X] **Read and splice the centipede draft.** Now 5.6, tagged `sec-centipede`.
- [X] **Read and splice the Spence and Akerlof draft.** Now four sections at the
      end of chapter 6. Three follow-ups below.
- [ ] **Strip the editorial apparatus out of chapter 6.** The whole draft file went
      in, not just the prose. Lines 271 to 581 currently carry the version-2 banner
      comment, the two DRAFT callouts, and the entire block headed "SEPARATE ITEM:
      EDITS TO EXISTING 6.8" with its three `###` subsections and the bibtex
      snippet. That block was written to be read and thrown away, and it will
      render in the book as it stands.
- [ ] **Tag the three new chapter 6 headings.** The College Wage Premium, Does the
      Signalling Model Fit? and Akerlof and the Market for Lemons have no
      `{#sec-...}` id. Spence has one.
- [ ] **Decide on the three suggested 6.8 edits**, none of which is applied.
      "Dullard" and "dull students" are still in 6.8. More pressing, the old
      closing paragraph at line 201 is intact, so the age-gradient argument and the
      verdict on it now appear twice in the chapter, once at 201 and once in Does
      the Signalling Model Fit?, and the earlier one pre-empts the later.

### References

- [X] **Allais 1953 and Ellsberg 1961 are in `references.bib`.** Savage and Buchak
      turned out not to be needed: neither name survives in chapter 2 now.
- [ ] **Neither `Allais1953` nor `Ellsberg1961` is cited.** Both sections name them
      in prose without an `@`, so the entries sit in the bib unused.
- [X] **Bib entry for Arteaga 2018.**
- [ ] **Scan the text for things that should be cited and are not.** The two known
      cases are Allais and Ellsberg, but the new chapter 2 and chapter 6 material
      names a good deal else in prose.
- [ ] **Normalise citation keys to lowercase.** The bib has two vintages: 24
      lowercase keys, all cited, and 8 capitalised ones, none cited, which are the
      recent additions. `Allais1953`, `BenPorathDekel1992`, `Ellsberg1961`,
      `Hume1739`, `Jevons1871`, `Reichenbach1949`, `Rousseau1755`, `Stalnaker1998`.
- [ ] **Two duplicate bib entries.** `rousseau1755` at line 143 and `Rousseau1755`
      at 284; `hume1739` at 149 and `Hume1739` at 274. The lowercase ones are the
      cited pair. (`stalnaker1996` and `Stalnaker1998` look like genuinely
      different works.)
- [ ] **The `CHECK` comment is still at line 134** of `references.bib`, reading
      "standard works, details from memory rather than verified". Either the
      entries under it have been checked and the comment should go, or they have
      not.
- [ ] **`references-needed.md` is empty**, 0 bytes, timestamped 11 August. Whatever
      was in it did not save.
- [X] **`@leytonbrown2008`** is gone from the prose. The bib entry survives,
      uncited, which is harmless.
- [ ] **The OECD figures in chapter 6 are unchanged and still wrong.** The text at
      line 337 still reads "the average premium for a bachelor's degree at around
      140% of what a worker with upper secondary education alone makes, and the
      figure for the United States at around 164%", which is exactly the
      ratio-against-premium confusion. 140 on that OECD index is a premium of 40%,
      and 164 is a premium of 64%. Still uncited to *Education at a Glance* as well.

### Production

- [X] **Chapter 3 table captions.** All 25 captioned.
- [X] **Caption for `tbl-allais`.**
- [X] **Run `sh tools/build-figures.sh`.** The SVGs were rebuilt on 9 August.
- [X] **The book title.** Decided: it stays *Game Theory and Social Choice*. It is
      a link to earlier versions of the notes that may still be in circulation, the
      preface explains the scope, and the syllabus refers to it the same way.
- [X] **Delete the spliced drafts.** The three named files are gone.
- [ ] **Table captions in the other chapters**, ten in all: one in chapter 1 at
      line 68, six in chapter 5 at lines 44, 70, 231, 261, 441 and 465, and three
      in chapter 6 at lines 56, 68 and 464. Chapters 2, 3 and 4 are complete.
- [ ] **Delete `notes/_new-centipede-ch5.md` and `notes/_new-spence-akerlof-ch6.md`.**
      Both are now spliced, so both are dead weight. Move them to `_to_delete/`.

## The syllabus: final by Tuesday 1 September

- [ ] **Office hours** are still TBD.
- [ ] **Decide about 4.3, Coordination Games.** Correlated equilibrium (4.2) and
      the iterated Prisoners' Dilemma (5.7) are settled: both stay in the book and
      neither goes on the syllabus. 4.3 is still open, and it is 1,950 words
      against 1,150 for 4.1, so with 4.2 also out L6 assigns roughly a quarter of
      chapter 4. It ends on the society-formation material about how far social
      life looks like an iterated Prisoners' Dilemma rather than an iterated Stag
      Hunt, which is the most philosophical passage in the chapter, and nothing on
      the schedule reaches it.
- [ ] **May's theorem has no required reading.** It is in Ch 5*, which is
      recommended, so L17's contrast case is board-only. Promote Ch 5* or accept
      it.
- [ ] **A3 against Ch 9 at L25.** Whether A3 becomes required with Ch 9 demoted.
      A3 is Sen's own 2017 revision of the equity material. This can move later
      under the defeasibility policy, but it is printed in the syllabus now, so it
      is cheaper to settle before it goes out.
- [ ] **L9 has no recommended reading.** Bonanno has nothing on forward induction,
      so it is the only first-half lecture with nothing beside the notes. Accept or
      find something.
- [ ] **Spence and Akerlof** Once we add some sections in to the text, add references to them to week 7 of the syllabus

## Rolling, from 1 September

- [ ] **Slides for L1 and L2**, before term starts. 01 and 02 exist; L2 needs
      whatever Ellsberg turns into.
- [ ] **Slides for L6 through L28.** 01 to 05 exist, so this is 23 decks at two a
      week. The largest item on this list and the one most likely to be
      underestimated.
- [ ] **Eight quizzes.** Worth 40% of the grade, and nothing exists for any of
      them. Quiz 1 is Thursday 10 September, and the rest fall at L6, L8, L12,
      L19, L21, L23 and L24.
- [ ] **Notation slide for L18.** A1* is 2017 and writes I-squared for
      independence while distinguishing relational I from Arrow's choice-functional
      I-A; Ch 3 and Ch 3* are 1970 and write plain I; the Pareto relation R-bar
      from Ch 2* does not reappear in A1*.

## Dated after term starts

- [ ] **First essay prompt**, well before Friday 30 October. Topics are meant to
      draw on the recommended reading, so students need it early enough to choose
      what to read. Realistically early October.
- [ ] **Check the timing on L16 to L18** against the revised plan in
      `course-notes.md`, before Tuesday 27 October. L16 was overloaded and has been
      cut back; L18 should have around half an hour spare.
- [ ] **Gibbard-Satterthwaite handout**, before Tuesday 17 November, distributed
      with the week 12 reading at the latest. Decided against an appendix to the
      book. G-S and Muller-Satterthwaite are not in CCSW, the Nobel lecture is
      discursive, and Gibbard 1973 is rough going, so L22 needs something readable
      of its own.
- [ ] **Decide whether the voting systems material rides along with it.** Cutting
      chapter 7 also cut plurality, runoff, instant runoff, Borda, approval and
      range voting out of the course. Sen barely touches them. Since the handout is
      about voting rules as game forms, those rules are the natural examples for
      it, and one handout could carry both.
- [ ] **Second essay prompt**, before Friday 18 December.
