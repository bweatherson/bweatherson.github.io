# Phil 101 — Status Audit, 4 August 2026

Four weeks to the first class (Tuesday 1 September). Last substantive work on this folder was 25 June, so this is a cold restart.

Two things are true at once. The planning is in better shape than a mostly-empty slide folder suggests: the course map is settled, the calendar arithmetic checks out, and the readings menu has done most of the searching. But the three deliverables named in the project instructions are at very uneven stages, and one of them has not been started.

| Deliverable | State |
|---|---|
| Syllabus | Nothing written. No file exists. |
| Assessment tasks | Nothing written, and no grading scheme decided. |
| Slides | 6 decks of 28. |

---

## 1. What we have

### Planning documents (in good shape)

**`course-map.md`** is the spine, and it holds up. Twenty-eight lectures across seven units, with the reasoning behind each join written down. I checked the calendar against the Registrar's published Fall 2026 calendar and it is right: classes begin Monday 31 August, Fall Study Break is 19–20 October (so Tuesday 20 October is out), Thanksgiving recess is 25–27 November (so Thursday 26 November is out), and the last day of classes is Friday 11 December, which leaves Thursday 10 December as a legitimate final meeting. Tuesdays and Thursdays across that span come to 30 meetings; removing the two cancelled days gives exactly 28. The map is not off by one.

**`readings-options.md`** covers Days 4 through 27. Days 4–9 are marked chosen and are done. Days 10–27 are menus of two or three candidates each with a note on length and level, which is the hard part of the work, but no decision has been recorded for any of them.

### Slides: six decks

Written and rendered to HTML: `03`, `05`, `06`, `07`, `08`, `09`. That is Days 3 and 5 through 9, the induction class and the evidence-and-testimony run.

On quality, the four decks from 06 to 09 are the strongest. They have a clear through-line, the readings are attached to the right classes, and the closing slides hand off to the next class properly. Deck 03 is fine on its own. Deck 05 is the weak one, for the reason in section 3 below.

### The deduction game

`logic-game/deduction.html` is a finished, self-contained browser game with four puzzles (warm-up, worked example, and two challenges), plus a `tools/` folder of Node scripts that generate and verify puzzles and a README explaining how to add more. This is the Day 2 material and it is built.

It is not, however, reachable by a student. See section 2.

---

## 2. What is missing

### The syllabus (nothing exists)

There is no syllabus file in the folder. The Phil 444 syllabus is a usable working template: an R chunk computes every class date from the Monday of week 1, so the schedule section writes its own dates. That structure ports directly. What it cannot supply is the content: 101 needs its own description, its own requirements, and its own grading scheme, none of which have been settled.

### Assessment (nothing exists, nothing decided)

No assessment task has been drafted, and there is no record anywhere in the folder of what the assessment structure will be. Grepping the whole source folder for "essay", "quiz", "exam", "grade", or "assess" turns up nothing but incidental prose in the slides. This is the item with the longest lead time, because the syllabus cannot be finished without it, and it is the one with no work banked at all.

### Twenty-two slide decks

Missing: `01` (intro), `02` (deduction, though the game itself is built), `04` (grue), and `10` through `28`.

Two of the missing ones are needed before anything already written is: Day 1 and Day 2 come before Day 3.

### Reading decisions for eighteen classes

Days 10–27 have menus but no picks. Days 1, 2, 3, and 28 are not covered by the menu at all, which is defensible for 1, 2, and 28, but Day 3 (induction, analogy, IBE) is a real class with no reading listed.

### Reading availability, unverified

The document's own caveats flag this and it has not been actioned. Several assigned PDFs are course-hosted copies of in-copyright work: Nagel, Jackson, Chalmers, the Nozick excerpt, and Parfit. The note says Parfit "is not formally free." If a link has rotted or a copy has been pulled since June, you want to know that before the syllabus lists it, not in week 12.

Six long primary texts are flagged as needing named excerpts and have not received them: Mill's *Utilitarianism* ch. 2, Mill's *On Liberty* ch. 2, Kant's *Groundwork* I, Foot, Thomson, and the *Crito*. A seventh item is open: Day 25's Mill "Speech in Favour of Capital Punishment" is marked "confirm a clean host before assigning."

### A landing page and a working site

The rendered site has no real front page. `F26-Phil101-site/index.html` is a 235-byte auto-generated redirect to `slides/03.html`, which is what Quarto produces when there is no `index.qmd`. Phil 444 has an `index.qmd`; worth knowing before porting it, its lecture table is a single TBD placeholder row and its readings section is the word TBD, so what ports is the shape and not the content.

The deduction game is not deployed. `logic-game/` exists in the source folder but there is no `logic-game/` in the rendered site, so the finished Day 2 activity has no URL to send students to.

No PDFs have been rendered. `slides/_metadata.yml` configures both revealjs and clean-typst output, but the site folder contains no `.pdf` files at all, only HTML. Every deck is HTML-only. The same problem is visible next door: `F26-Phil444-site` holds only `syllabus-F26-444.pdf`, while the 444 index page links to HTML and Word versions that were never rendered. If you port the 444 syllabus, that broken-link pattern ports with it unless you render all three formats.

---

## 3. Inconsistencies to fix in what already exists

The file renumbering described at the foot of `course-map.md` was carried out: memory is 06, Datta 07, Anderson 08, Oreskes and Nguyen 09. What did not follow was the prose inside the decks, and the map's own note still says the renumbering is pending. Most of the breaks below are that unfinished follow-through.

**Day 5 is half-written.** The map assigns Day 5 two jobs, perceptual evidentialism and the sources question. `05.qmd` does only the second. Its title is "How Many Sources of Knowledge?" and the words "evidential", "justification", and "foundational" do not appear in it. The Day 5 readings (the Long piece on epistemic justification, the IEP foundationalism sections) go with a part of the class that has not been written.

**Day 6 recaps a class that did not happen.** `06.qmd` opens with a slide headed "Last time" whose first line is "We set up the evidentialist picture." Day 5 did not set that up. This will read as a non-sequitur to anyone in the room.

**Day 5 points forward to the wrong class, three times.** "We take that up in full next class." "We read him next class." And on the closing slide, "Next class, the question head on. Does testimony stand on its own feet?" Next class is Day 6, which is memory. All three belong to Day 7. As it stands, Day 5 promises Datta on Thursday and Day 6 delivers memory instead.

**Day 7's reading slide is mislabelled.** Decks 05, 06, 08, and 09 all title their reading slide "Reading" and list that day's own assigned reading. Deck 07 titles its "For next time" and then lists Datta, which is Day 7's own reading. Four decks against one; 07 is the odd one out.

**Hume on miracles is in the plan but not in the deck.** The map says Hume on miracles "lives inside the testimony class at 7, as the lead reductionist case Datta answers." In `07.qmd` he gets exactly one sentence in passing. The lead case the map calls for is not there.

**Deck 03 talks as though the course meets daily.** A slide headed "Yesterday" opens the deduction recap, and the deck later says "we press tomorrow" and "Tomorrow we ask." The course meets Tuesday and Thursday. Day 3 is Tuesday 8 September; the deduction game was Thursday 3 September, five days earlier. The other decks use "last time" and "next class" correctly, so this is deck 03 alone.

**Three stale lines in the planning docs.** `course-map.md` still says "Slide files still to renumber to match this order", which is done. `readings-options.md` says in its intro that "Days 6–9 are already chosen" when Days 4 and 5 also carry the ✓ chosen mark. `logic-game/tools/README.md` says "the three in the game", and there are four. Each is a one-line fix.

**Two topic titles disagree between documents.** Day 17 is "Trolley problems and objections" in the map and "Trolley problems and double effect" in the readings menu. Cosmetic, but the syllabus will need one of them.

**Two items are parked and unplaced.** The map's last paragraph lists the 2026 "old debates, new instances" asides, and two take-home discussion questions (belief versus representation, and the identity conditions of an AI). Neither has a home in any deck.

---

## 4. Priority list

The ordering below is driven by what blocks what. Assessment blocks the syllabus. The syllabus needs the readings locked. Slides only need to stay ahead of the room once term starts, with the exception of the three decks needed in the opening fortnight.

### This week (4–9 August) — decide, don't draft

Nothing here takes long, but everything downstream waits on it.

1. **Settle the assessment structure.** Number of pieces, weights, and whether there are quizzes. This is the single blocking decision. For a 101 with non-majors the 444 model (two essays at 25% each, best six of eight quizzes at 40%, participation at 10%) may not transfer, and that is a judgement call I cannot make for you.
2. **Decide what the assessment tasks actually are**, at the level of one line each. Not the prompts, just the shape: what the first essay asks students to do, what a quiz looks like.
3. **Lock readings for Days 10–17.** The menus are already researched; this is choosing, not searching. Doing eight days now is enough to write the syllabus schedule for the first two-thirds of the term.

### Week of 10–16 August — the syllabus

4. **Draft `syllabus-F26-101.qmd`**, ported from the 444 file so the date arithmetic comes for free. Everything except the schedule table can be written from the course map.
5. **Verify every reading link before it goes in the syllabus.** Particularly the five in-copyright course PDFs, and Parfit above all. Substitutes need finding now, not in November.
6. **Lock readings for Days 18–27**, and settle the four days the menu never covered (1, 2, 3, and 28). That completes the schedule.
7. **Name the six excerpts.** Mill twice, Kant, Foot, Thomson, and the *Crito* all need page or section ranges before the syllabus can state a reading load.
8. **Render the syllabus to PDF, HTML, and Word**, and read the PDF rather than the source.

### Week of 17–23 August — repairs and the opening decks

9. **Fix the Day 5 and Day 6 seam.** Write the evidentialism half of Day 5, correct Day 5's three forward references so they point at Day 7, and confirm Day 6's opening recap now matches what Day 5 actually does. These edits go together; doing one without the others leaves a different break.
10. **Fix deck 03's day-of-week language**, and give Day 3 a reading or record that it deliberately has none.
11. **Fix deck 07's reading-slide title**, and decide whether Hume on miracles gets the room the map promises him.
12. **Clear the three stale lines** in `course-map.md`, `readings-options.md`, and the game README.
13. **Draft decks 01 and 02.** Day 1 is the intro. Day 2 is a class built around a finished game, so the deck is mostly framing and debrief.

### Week of 24–30 August — the site, and running room

14. **Draft deck 04 (grue).** That puts you through Thursday 10 September with everything written.
15. **Write `index.qmd`** for the course site: syllabus links, a lecture table, the game, and slide navigation instructions.
16. **Deploy the deduction game.** Get `logic-game/deduction.html` into the rendered site and confirm the URL works from a browser that is not yours.
17. **Render the decks to PDF** and check that nothing overflows a frame.
18. **Draft the first assessment task in full**, if it falls due early enough to matter.

### Once term starts

Days 10 onward can be written a week ahead. That is 19 decks across the eleven teaching weeks from Day 10 to the end, near enough to two a week, which is sustainable only if nothing slips. The cheapest source of slack is drafting decks 10 through 14 (the whole mind unit) in the last week of August, since that unit is self-contained and its readings are already narrowed to three candidates a day.

---

## 5. Decisions I need from you

These are the ones I cannot resolve from what is in the folder:

- The assessment structure and weights.
- Whether the course has a required text, or runs entirely on the free-and-linked readings the menu assumes.
- Enrolment and whether there are GSIs, which changes what assessment is feasible.
- Whether the syllabus has a departmental deadline before 1 September.
- Whether to keep Day 5 as a double (evidentialism plus pramāṇa) or to let the sources question have the whole class and move evidentialism into Day 6 alongside memory. Splitting the difference is what produced the current break.
