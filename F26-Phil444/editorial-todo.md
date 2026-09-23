# Editorial to-do: the long pass

Companion to `TODO.md`. That file is operational — what has to exist before a
given date. This one is the list of things that are *wrong or unfinished in the
text* and can wait for a thorough editorial pass rather than a deadline.

Everything below was verified against the files on disk on **23 September 2026**.
Line numbers drift as soon as anything is edited; treat them as hints, and search
for the quoted string instead.

Nothing here is urgent. The rule of thumb: if it would embarrass you in a printed
textbook, it belongs on this list; if it would break a class, it belongs in
`TODO.md`.

---

## Chapter 5 — Games and Time

### Uncaptioned tables (6)

Six grid tables have no caption and no `{#tbl-}` id, so they cannot be
cross-referenced and will print bare.

| Line | What the table is |
|-----:|:------------------|
| 44   | The 8 x 4 normal form of **Five** |
| 70   | **Five** with the top-left outcome changed to a draw |
| 240  | Strategic form of **Easy Game** |
| 270  | Strategic form of **Incredible** |
| 449  | Three-round iterated PD, reduced to 8 x 8 |
| 473  | The same after deleting strongly dominated strategies |

The table at 44 is referred to in the prose as "the giant table", and the one at
70 as "the table", so captioning them also fixes two vague references.

### Typos and slips

- **Line 268.** "But writing out the able reveals another Nash equilibria."
  Two problems: *able* for *table*, and *another ... equilibria*.
- **Line 268.** "and $g$ if Player plays $R$" — missing "I" after "Player".
- **Line 268.** The same sentence says Player II plays $b$ "if Player I plays
  Left", then $g$ "if Player plays $R$". Left/Right and $L$/$R$ are mixed within
  one sentence; pick one.

### Substantive

- **§5.2 could use the Last Counter figure.** The exercise callout added on
  16 September describes the subtraction game in prose. `figures/svg/four.svg`,
  `four-2.svg` and `four-3.svg` now exist (built for the lecture 7 slides) and
  would drop straight in if you want the notes to show the tree rather than
  describe it.
- **§5.6 has no figure.** The centipede is presented as `tbl-centipede`.
  `figures/svg/centipede.svg` now exists, in the same style as the caterpillar,
  and could go alongside or instead of the table.

---

## Chapter 6 — Bayesian Games

Most of the August list here is now done: the three new headings are tagged, the
editorial apparatus and DRAFT callouts are gone, and the OECD figures are
corrected to 40% and 64% and cited to `@OECD2025`. What is left is small.

- **Line 179.** "I'll use use 'high' and 'low'" — doubled word, inside a
  footnote.
- **§6.4, the varying-prior sentence.** Uses `\nicefrac{1}{2}` and then
  `\frac{1}{3}` twice, in the same sentence. Deliberately left alone on
  23 September pending a decision about whether `\nicefrac` is rendering the way
  you want in HTML. If it is, make the other two match; if it isn't, drop it
  throughout.
- **§6.4, same paragraph.** "Below that it falls apart, though something strange
  starts to happen." The strange thing is introduced in the *next* sentence, so
  "though" points the wrong way. Probably wants "and".
- **§6.8 wording.** "Dullard" and "dull students" are still in the text. Flagged
  in `TODO.md` in August as one of three suggested edits; the other two appear to
  have been resolved.

---

## Bibliography

- **The `CHECK` comment at `references.bib` line 134** — "standard works, details
  from memory rather than verified" — is still there, and so is the note at line 3
  explaining it. Either the entries below it have been verified and both comments
  should go, or they have not and this is the reminder.
- **Key case is now nearly uniform.** The August list had eight capitalised keys;
  only `OECD2025` remains, which is a conventional organisational key and probably
  fine as is. Worth one decision rather than eight.
- **`references-needed.md` is now 23 KB** and current — the August note that it
  was empty is stale.

---

## Housekeeping

- **Two spliced draft files are still in `notes/`**: `_new-centipede-ch5.md` and
  `_new-spence-akerlof-ch6.md`. Both are fully spliced. They need moving to
  `_to_delete/` rather than deleting outright, because the bridge can't delete.
- **Three unused SVGs in `slides/figures/`**: `five.svg`, `five-2.svg`,
  `five-3.svg`. Left behind when lecture 7 moved from **Five** to **Last
  Counter**. Harmless, but they will confuse anyone reading the directory.

---

## Format and accessibility

- **If the book ever moves to Typst, `fig-alt` has to become `alt`.** Established
  on 18 September: Quarto 1.10's Typst writer silently drops `fig-alt` and reads
  only `alt`. The notes use `fig-alt` throughout, which is correct for HTML and
  LaTeX and would produce a PDF/UA failure under Typst with no useful error beyond
  "missing alt text". The slide decks have already been converted to `alt`.
- **Several notes figures have no alt text at all.** Worth a sweep if
  accessibility compliance matters for the book the way it did for the syllabus on
  Canvas.

---

## Open questions, not defects

- **§5.8 Iterated Prisoners' Dilemma is on no lecture's reading list.** This is
  deliberate — `TODO.md` records the decision that it stays in the book and off
  the syllabus — but the decision was taken when the section was mis-numbered 5.7,
  and it is worth re-confirming now that lecture 8 has spare room and the section
  is the same unravelling phenomenon the lecture is about.
- **Stalnaker on iterated PD.** There is an argument in Stalnaker that backwards
  induction survives in iterated PD on weaker assumptions than usual. Not in the
  notes, not understood well enough to teach at the 400 level, and parked on
  23 September as grad-seminar material. If it ever goes in, it would sit at the
  end of §5.8.
- **4.3 Coordination Games** — still the open question from `TODO.md`, unchanged.

---

## Fixed during the slide-drafting pass

Recorded so they don't get re-flagged.

- `tbl-rat-payout-2` in §4.1 had no unique equilibrium; corrected in the notes and
  in both legacy lecture-note files.
- §6.4 caption cross-reference `@#tbl-familiar-bos`, the missing backslash in
  `$frac{1}{3}$`, "beleifs", "the cases the these tools", and the truncated
  sentence in the purification theorem — all fixed 23 September.
- Syllabus section references for chapter 5 corrected: lecture 8 now reads
  5.5-5.6, lecture 9 reads 5.7. Lecture 3's mangled "Ch 1 (Basics of Game
  Theory).1.10" now reads "Ch 1 (Basics of Game Theory), 1.1-1.10".
