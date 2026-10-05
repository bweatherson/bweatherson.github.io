# PHIL 444 TODO

The **Assessment** section below was rewritten on Monday 5 October and is
current. The two sections above it date from 12 August and have not been
re-verified since; several items in them are known to be done. Defects in the
book now live in `editorial-todo.md`.

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

## Assessment

Status as of Monday 5 October. Quizzes 1 to 4 are written and have run. Decks 01
to 14 exist, so the game theory half is covered.

### The only urgent item

- [ ] **First essay prompt.** Due Friday 30 October, which is 25 days away. The
      syllabus tells students that if they write on a topic, the recommended
      readings for it count as required, so the prompt has to reach them early
      enough to choose a topic and then do that reading.

      Target: out by Thursday 15 October, which is L14 and the last class before
      the study break. That gives them the break plus two full weeks, and it means
      they are not starting the essay in the same week Part II starts.

      The essay covers the first half only, and the first half is now written, so
      there is nothing left to wait for.

### Not yet, and here is why

- [ ] **Quiz 5**, due Friday 6 November. **Quiz 6**, due Friday 13 November.
      **Quiz 7**, due Friday 20 November. **Quiz 8**, due Friday 4 December.

      All four fall in Part II, and the syllabus promises two things that bear on
      when to write them. The reading schedule for Part II is a defeasible
      default, and quizzes cover "the material through the previous class meeting,
      whatever that turned out to be, rather than whatever this schedule says it
      should have been."

      So a quiz 5 written now is written against a schedule that has been
      announced as provisional. Drafting against Sen's chapters rather than
      against lecture numbers would survive slippage; drafting against lectures
      would not.

      Earliest sensible moment for quiz 5 is after L17 (Thursday 29 October), once
      the actual pace of Part II is visible. That is still a week before it is due.

- [ ] **Second essay prompt.** Due Friday 18 December. Same reasoning as the
      first: out by the end of November, which depends on knowing what Part II
      actually covered.

### Supporting work with dates attached

- [ ] **Slides for L15 to L28.** Fourteen decks at two a week. L15 is Thursday 22
      October, the first class after the break.
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
- [ ] **Check the timing on L16 to L18** against the revised plan in
      `course-notes.md`, before Tuesday 27 October. L16 was overloaded and has been
      cut back; L18 should have around half an hour spare.
- [ ] **Notation slide for L18.** A1* is 2017 and writes I-squared for
      independence while distinguishing relational I from Arrow's choice-functional
      I-A; Ch 3 and Ch 3* are 1970 and write plain I; the Pareto relation R-bar
      from Ch 2* does not reappear in A1*.

### Calendar

| Date | What |
|:-----|:-----|
| Thu 15 Oct | L14, last class before the break. Essay 1 prompt out by here. |
| Mon 19, Tue 20 Oct | Fall study break |
| Thu 22 Oct | L15, Part II begins |
| Fri 30 Oct | **Essay 1 due** |
| Fri 6 Nov | Quiz 5 due |
| Fri 13 Nov | Quiz 6 due |
| Tue 17 Nov | L22, Gibbard-Satterthwaite. Handout out before this. |
| Fri 20 Nov | Quiz 7 due |
| Thu 26 Nov | No class, Thanksgiving |
| Fri 4 Dec | Quiz 8 due |
| Thu 10 Dec | L28, last class |
| Fri 18 Dec | **Final essay due** |
