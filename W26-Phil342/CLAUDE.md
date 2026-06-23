When writing slides, avoid these patterns which are indicative of AI use:

**Exclamation Marks**: The tone of the slides should be chatty, but calm. Don't use exclamation marks, or one word exclamations like "Surprising". Leave any of that to the presenter.

**Negative parallelism**: don't use "Not X -- it's Y" constructions. State claims directly instead. Example: instead of "This isn't a tool -- it's a colleague," write "Minty operates as a colleague."

**Cursed vocabulary**: don't use these words unless absolutely necessary- delve, tapestry, vibrant, landscape, realm, intricate, meticulous, pivotal, nuanced, underscore, foster, leverage, harness, utilize, plethora, myriad, confluence, trajectory, holistic, synergy, paradigm, robust, comprehensive, multifaceted, paramount. These words appear with dramatically higher frequency in AI-generated text than in human writing. Any of them in output is a signal that the agent is in mode-collapsed default writing mode.

**Opening filler** (banned phrases): "It's important to note...", "Let's dive in", "Have you ever wondered", "In today's fast-paced world", "Let's unpack". These add no content and mark text as AI-generated.

**Significance inflation** (banned phrases): "serves as a testament to", "plays a crucial/vital role", "leaves a lasting impact", "stands as a", "breathtaking", "enduring legacy". These inflate the apparent importance of claims without adding substance.

**False suspense** (banned phrases): "Here's the thing...", "Here's where it gets interesting...", "But here's the catch...". These are filler that delays the actual content.

**Rhetorical Q&A** Don't use rhetorical Q&A like: "The result? Devastating." Just write the sentence. The interrogative-then-answer format is a recognized AI writing pattern. It's also too close to the exclamations we previously ruled out.

**Rule of three overuse**: Vary list lengths. Two items, or four, or one. Consistent groups of three are an AI writing signature.

**Filler adverbs** (banned or restricted): quietly, deeply, fundamentally, remarkably, arguably, importantly, interestingly, notably, significantly, clearly, certainly, undeniably. Cut them or replace with specifics.

**Em dash overuse**: 2-3 per 1000 words is human range; 10+ is AI range. Use commas, parentheses, or new sentences instead of em dashes.

---

## Build / rendering notes

### Beamer error: "LaTeX Error: There's no line here to end." at `\end{frame}`

**Symptom.** A deck renders fine to revealjs/HTML but the PDF (beamer) build fails with `! LaTeX Error: There's no line here to end.` pointing at an `\end{frame}` line in the generated `.tex`. First seen in deck 19 (the Spence payoff table), 2026.

**Cause.** Modern pandoc (3.1.7+, bundled with recent Quarto) renders every Markdown pipe table as a `\begin{longtable}`. A `longtable` cannot page-break inside a beamer frame, and it throws this error when it is the *sole content of a title-less `---` slide* — i.e. a table with no `##` heading on its slide and no prose after it before the slide ends. Tables that sit under a `##` heading, or that have explanatory text after them on the same slide, are fine. This is content/height-sensitive, so it can appear and disappear as slides are edited.

**In-deck fix (preferred, what we do).** Give that slide a heading so the frame has a title. In practice: change the bare `---` above the table to a `##` heading (a repeated/continuation heading is fine, e.g. a second `## Payoffs`). Verified fixes, any one works: (a) frame title, (b) `allowframebreaks` on the frame, (c) the table rendered as `tabular` instead of `longtable`.

**To find every at-risk slide across the decks:** render each deck to beamer with the real toolchain and grep the logs for `There's no line here to end`. Only a table stranded alone on a bare `---` slide will trip it; payoff-matrix-heavy decks (e.g. 14) are fine because those tables have headings or following text.

**Global safeguard (only if it starts recurring often).** Add this once to the `header-includes` block in `slides/_metadata.yml`; it makes pandoc longtables render as non-breaking tables so they survive inside frames. It touches every table in every deck, so eyeball a couple of table-heavy decks after adding it:

```latex
\makeatletter
\renewenvironment{longtable}[2][]{%
  \setbox0\vbox\bgroup\hsize\textwidth\begin{tabular}{#2}}%
  {\end{tabular}\egroup\par\noindent\centerline{\box0}}%
\let\endhead\relax \let\endfirsthead\relax
\let\endfoot\relax \let\endlastfoot\relax
\makeatother
```
