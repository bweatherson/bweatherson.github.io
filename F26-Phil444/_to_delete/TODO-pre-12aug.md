# PHIL 444 TODO

As of 8 August 2026.

Two deadlines govern everything here. **The book is due Monday 24 August**, 16
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

- [X] **Ellsberg.** The one item here with nothing drafted, so the largest
      unknown in this section. Belongs at the end of chapter 2 with the new Allais
      material.
- [X] **Read the new Allais material** in chapter 2, and delete the two DRAFT
      callouts. It sits at the end of the chapter between the banner comments.
- [X] **Read and splice the centipede draft**, `notes/_new-centipede-ch5.md`.
      Destination is 5.5, Problems with Backwards Induction.
- [ ] **Read and splice the Spence and Akerlof draft**,
      `notes/_new-spence-akerlof-ch6.md`, version 2. Goes at the end of chapter 6,
      after 6.9. Three suggested edits to existing 6.8 prose are at the foot of
      that file and have not been applied.

### References

- [ ] **Bib entries for Allais 1953, Savage 1954, Buchak 2013.** Named in the new
      chapter 2 prose but not cited, because they are not in `references.bib`.
- [X] **Bib entry for Arteaga 2018.** One is ready to paste at the foot of the
      Spence and Akerlof draft.
- [X] **Four `CHECK` entries** left in `notes/references.bib`.
- [ ] **References-needed.md** has a lot of questions for Claude or me to answer.
- [X] **`@leytonbrown2008` in section 1.2.** Leyton-Brown and Shoham is no longer
      the course textbook. Keep the citation or replace it.
- [X] **The OECD figures** in the new College Wage Premium section are from the
      300-level slides, uncited, and unchecked. Either cite *Education at a
      Glance* and verify them, or cut them. (FIXED: And we'd made a mistake; we'd written 164% meaning that the college wage is 164% of the high school wage. That's a premium of 64%, not 164%.)

### Production

- [X] **Chapter 3 table captions.** 12 of 25 done, 13 to go.
- [X] **Caption decision for `tbl-allais`**, the new ticket table in chapter 2.
- [X] **Run `sh tools/build-figures.sh`** on the Mac, so the 15 recovered figures
      pick up EB Garamond Math. It has never been run there.
- [X] **The book title.** Still *Game Theory and Social Choice*, which now
      promises a half the book does not contain. Either it becomes *Game Theory*,
      which means also changing how the syllabus refers to it, or it keeps the
      course's name and the preface carries the explanation, which it currently
      does.
- [X] **Delete the spliced drafts**: `notes/_new-bayesian-section.md`,
      `notes/_new-interpretations-ch3.md`,
      `notes/_new-interpretations-ch3-top-replacement.md`. All three are already in
      the chapters. `device_bash` cannot delete, so these have to be moved to
      `_to_delete/` or removed by hand.

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
