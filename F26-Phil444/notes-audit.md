# State of `444-Lecture-Notes-Winter-2017.qmd`

Audit before deciding how much work reviving these notes takes. 44,400 words, 2,936 lines, 283KB.

## Verdict

The prose is intact and good. The formatting is a pandoc conversion from the `.tex`, and it broke in one place that matters enormously and several that matter a little.

**Every game tree in the file has been destroyed.** All fifteen of them. That is the whole job; the rest is an afternoon.

## The trees

The originals were LaTeX `picture` environments, drawn with `\put`, `\line`, `\circle` and a `\pictext` macro. Pandoc has no idea what to do with those, so it emitted `<figure><div class="picture">` wrappers containing the bare coordinate pairs as paragraphs of text. What renders now is a column of numbers like `(175, 0)` and `(105, 47)`. Not a degraded diagram, no diagram at all.

| Section | Trees |
|---|---:|
| Normal Form and Extensive Form | 2 |
| Backwards Induction | 4 |
| Subgame Perfect Equilibrium | 2 |
| Problems with Backwards Induction | 1 |
| Perfect Bayesian Equilibrium | 1 |
| Signaling Games | 1 |
| Signaling without Cooperation | 1 |
| The Intuitive Criterion | 1 |
| Coordination Games (Schelling focal points) | 2 |

Captions, so you know what is there: Five, Five with last move assumed, Five with last two moves assumed, Five″, Five″ with last move assumed, Easy Game, Perfect, Incredible, Cooperative Caterpillar, Prisoners' Dilemma, Simple Signal, College Signal, Canadian Signal.

**They are recoverable.** `444-Lecture-Notes-Winter-2017.tex` still has all fifteen `picture` environments with every coordinate. Thirteen are game trees inside `figure` environments; two are the Schelling nine-shape grids, which sit inside a blockquote with no label and are easy to miss. Nothing is lost, it just needs redrawing in something that renders.

Since the drawing primitives are so simple, the cheapest route is probably mechanical: a script that parses `\put(x,y){\line(dx,dy){len}}`, `\circle`, `\circle*` and `\pictext` out of the `.tex` and emits SVG. Fifteen figures, one script, and it preserves your original layouts exactly rather than making you re-lay-out thirteen trees by hand. SVG also renders in both HTML and PDF with no toolchain and no extension.

The alternatives, if you would rather redraw:

- **TikZ.** Best-looking PDF, and it is what you would use if these were going into a paper. Needs a Quarto extension or a pre-compile step for the HTML side.
- **Graphviz/DOT.** Quarto renders it natively to both formats. Trees are fine; the dashed ovals for information sets are awkward, and you need those for the Prisoners' Dilemma and the signalling games.
- **Hand-authored SVG.** Same output as the script route, more control, fifteen times the work.

The trees are also the critical path for a second reason. They sit in exactly the lectures where Bonanno is thin: signalling and the intuitive criterion are in your notes and not in his.

## Other format problems

Ranked by how much they matter.

**No YAML front matter.** The file cannot render on its own. Needs a header, and a decision about whether it stays one long document or gets split per-lecture.

**11 broken cross-references.** Pandoc turned `\ref{FiveGameChart}` into `[5.1](#FiveGameChart){reference-type="ref" reference="FiveGameChart"}`. In Quarto these render as a literal "5.1" linked to an anchor that does not exist. They all point at the trees, so they get fixed when the trees do. Worth converting to `@fig-` cross-references at the same time.

**6 `eqnarray*` environments.** Deprecated in LaTeX for twenty years, and MathJax does not implement it. Twelve instances survive into the HTML as literal `eqnarray` text. Convert to `align*`, which is what the other 11 math environments already use.

**Inconsistent display math.** 49 uses of `$$...$$` and 18 of `\[...\]`. Pick one; `$$` is safer in Quarto.

**71 `::: center` divs.** These are `\begin{center}` artifacts. Quarto has no `.center` class, so they do nothing. Strip them, or define the class if you actually want the payoff matrices centred.

**8 `::: enumerate*` divs**, from the `mdwlist` package. Same story.

**Payoff matrices are pandoc grid tables** with row-spanning, wrapped in the `::: center` divs. 214 rule lines. They are valid and they render, but they are miserable to edit and they do not match the clean pipe tables in slides 01 through 05. Worth normalising if the notes and slides are meant to look like one course.

## Content coverage against the F26 syllabus

| Lecture | Topic | Notes section | State |
|---|---|---|---|
| L2 | Decision theory revision | Probability and Decision Theory | Good |
| L3 | Strategic form, dominance | Basics of Game Theory | Good |
| L4 | Nash equilibrium | Best Responses, Nash Equilibrium, Finding Nash Equilibria | Good |
| L5 | Mixed strategies | Mixed Strategies | Partial, see below |
| L6 | Rationalizability, CKR | Rationalizability, Correlated Equilibrium | Good |
| L7 | Extensive form, subgame perfection | Normal Form and Extensive Form, Subgame Perfect Equilibrium | Trees broken |
| L8 | Backward induction, centipede | Backwards Induction, Problems with Backwards Induction | Trees broken, no centipede |
| L9 | Forward induction | Money Burning Game | Trees broken, otherwise good |
| L10 | Bayesian games, BNE | none | **Missing entirely** |
| L11 | Signalling, PBE | Perfect Bayesian Equilibrium, Signaling Games | Trees broken |
| L12 | Beer-quiche, intuitive criterion | The Intuitive Criterion | Trees broken |
| L13 | Spence | none | Missing |
| L14 | Akerlof | none | Missing |

### The L10 hole is the surprise

Zero hits for "Bayesian Nash equilibrium", zero for types in the Harsanyi sense, zero for type spaces. The Bayesian Games section goes straight to perfect Bayesian equilibrium without ever setting up Bayesian games. So L10 as the syllabus describes it, types and incomplete information and BNE, has no coverage at all.

This compounds. `course-notes.md` has the Harsanyi purification treatment deferred from L5 to L10 specifically because BNE will be on the table by then. If L10 has to be written from scratch, purification is downstream of that.

Bonanno does cover this well: Part V is three chapters on incomplete information, including the type-space approach. So L10 may be the one lecture where he carries the load and the notes point at him.

### Other content gaps

- **Harsanyi purification**: nothing, as expected.
- **Centipede**: nothing. Forward induction and the money-burning game are there and well done, but there is no centipede treatment for L8.
- **Akerlof and Spence**: nothing. Both are assigned as primary papers, so this may be fine.
- **Mixed strategy interpretation**: the notes cover the mechanics but not the five-interpretations material that L5 now runs on. That content exists only in `slides/05.qmd`.

## The second half of the file

**Voting Theory** (lines 2549 to 2928) is more useful than I expected. Sections on Making a Decision, Desiderata for Preference Aggregation Mechanisms, Assessing Plurality Voting, Arrow's Theorem, Cyclic Preferences, Proofs of Arrow's Theorem, then six voting systems: plurality, runoff, instant runoff, Borda, approval, range.

Sen does not do the comparative voting-systems material at all, so this is not redundant with the new second half. Proofs of Arrow's Theorem is directly usable at L18, and the voting systems fit at L19 alongside majority choice and domain restriction.

**Group Minds** (line 2929 to the end) is an empty stub. The heading is there and nothing follows it but the footnote definitions for the whole document. Either it was never written or it did not survive the conversion. Worth checking against the `.tex` if you remember writing it.

## Suggested order of work

1. **Decide the tree format**, then recover all thirteen. Everything from L7 to L12 is blocked on this, and it is the only genuinely large item.
2. **Mechanical cleanup**: YAML header, strip the `::: center` and `::: enumerate*` divs, `eqnarray*` to `align*`, normalise display math, convert the eleven cross-references to `@fig-`.
3. **Decide on splitting.** One long document or per-lecture files. Affects the syllabus links and how students navigate.
4. **Normalise the tables** to pipe tables, if the notes and slides should match.
5. **Write the missing content**: L10 first since it is a hole rather than a gap, then centipede for L8, then purification.
6. **Decide what Voting Theory becomes.** It is good material that no longer has an obvious home, since Sen owns the second half now.

Steps 1 and 2 can happen in either order, but doing 2 first makes 1 easier to check.


---

## Update: step 2 done

Mechanical cleanup applied. Output is `lecture-notes.qmd`; the 2017 file is untouched as an archive.

- YAML header added, HTML and PDF formats, numbered sections, TOC.
- 15 destroyed figures replaced by placeholders. The 13 trees are Quarto figure divs with `fig-` ids so cross-references work; the 2 Schelling grids are inline blockquote placeholders, since they had no labels and nothing refers to them.
- 11 broken `reference-type="ref"` cross-references converted to `@fig-` references. All 10 distinct targets resolve. `fig-caterpillar`, `fig-perfect` and `fig-simple-signal` are defined but never referenced, which matches the original.
- 71 `::: center` divs stripped; 8 `::: enumerate*` divs converted to real numbered lists.
- 6 `eqnarray*` environments converted to `align*`.
- 18 `\[ ... \]` display math converted to `$$ ... $$`.
- All 15 `picture` sources extracted to `figures/src/*.tex`, one file per figure, each carrying its caption and original label as comments.

Fixed a duplicate-label bug from the original LaTeX along the way: `PDEForm` labelled both the Prisoners' Dilemma tree and the Cooperative Caterpillar. The single inbound reference points at the Prisoners' Dilemma, so that kept the id and the caterpillar got a new one.

Renders under pandoc with no errors. Div nesting balances. Not yet rendered under Quarto proper.

Remaining from the original list: the figures themselves (step 1), the split decision (step 3), table normalisation (step 4), missing content (step 5, L10 first), and what becomes of Voting Theory (step 6).
