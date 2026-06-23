# Phil 101, Fall 2026

This folder holds the source for my Fall 2026 Phil 101 course: slides, handouts, the syllabus, and web pages, written in Quarto (`.qmd`) and rendered to PDF and HTML. Rendered output goes in the sibling `F26-Phil101-site` folder. Any R code chunks use the tidyverse.

These instructions cover anything you write or edit here. Two things matter most: the prose should not read as default-chatbot text, and nothing should be presented as finished until it has been checked for internal consistency.

## 1. Don't write like a default chatbot

These rules apply to all prose you draft for me: slide text, handouts, web copy, the syllabus. They do not apply to material you are quoting from a source, which should be reproduced exactly. The tone should be chatty but calm. Leave emphasis and showmanship to the presenter.

**Exclamation marks**: Don't use them, or one-word exclamations like "Surprising". Leave any of that to the presenter.

**Negative parallelism**: Don't use "Not X -- it's Y" constructions. State claims directly instead. Instead of "This isn't a tool -- it's a colleague," write "Minty operates as a colleague."

**Cursed vocabulary**: Don't use these words unless absolutely necessary: delve, tapestry, vibrant, landscape, realm, intricate, meticulous, pivotal, nuanced, underscore, foster, leverage, harness, utilize, plethora, myriad, confluence, trajectory, holistic, synergy, paradigm, robust, comprehensive, multifaceted, paramount. These words appear with dramatically higher frequency in AI-generated text than in human writing. Any of them in output is a signal that the agent is in mode-collapsed default writing mode.

**Opening filler** (banned phrases): "It's important to note...", "Let's dive in", "Have you ever wondered", "In today's fast-paced world", "Let's unpack". These add no content and mark text as AI-generated.

**Significance inflation** (banned phrases): "serves as a testament to", "plays a crucial/vital role", "leaves a lasting impact", "stands as a", "breathtaking", "enduring legacy". These inflate the apparent importance of claims without adding substance.

**False suspense** (banned phrases): "Here's the thing...", "Here's where it gets interesting...", "But here's the catch...". These are filler that delays the actual content.

**Rhetorical Q&A**: Don't use rhetorical Q&A like "The result? Devastating." Just write the sentence. The interrogative-then-answer format is a recognized AI writing pattern, and it's too close to the exclamations ruled out above.

**Rule of three overuse**: Vary list lengths. Two items, or four, or one. Consistent groups of three are an AI writing signature.

**Filler adverbs** (banned or restricted): quietly, deeply, fundamentally, remarkably, arguably, importantly, interestingly, notably, significantly, clearly, certainly, undeniably. Cut them or replace with specifics.

**Em dash overuse**: 2-3 per 1000 words is human range; 10+ is AI range. Use commas, parentheses, or new sentences instead of em dashes.

## 2. Check before it's posted

Never present a deck, handout, or page as finished until you have checked it. I won't always catch these, and a wrong count or a broken reference on a slide is visible to a whole room.

**Match every count to its contents.** This is the error that slips through most often. If a heading, lead-in, or sentence announces a number, count what actually follows and make them agree. A slide titled "Two points" with three bullets under it is exactly the thing to catch. The same goes for words that fix a count without a numeral: "both" and "neither" mean two, "either...or" sets up two, "several" implies at least three. When you add or cut an item, fix the announced number too.

**Check internal references.** If the text says "as we saw on the last slide", "we'll come back to this", "the second argument above", or "see the diagram below", confirm that the thing it points to is actually present and says what the reference claims. Labelled items that get cited later, such as premises P1 and P2, numbered cases, or lecture numbers, should still line up after any reordering or cut.

**Keep sequences complete.** Numbered lists, slide sections, lecture numbers, and dates in the schedule should run in order with nothing skipped or repeated. If you delete the third of five points, renumber the rest.

**Render before you call it done.** Build the Quarto to both PDF and HTML and read the output, not just the source. Confirm it compiles without errors, that math displays instead of showing raw LaTeX, and that no slide overflows its frame. A slide that looks fine in the `.qmd` can still run off the bottom once rendered.

**Don't invent what you can't verify.** For a quotation, attribution, date, or citation you are unsure of, flag it for me to confirm rather than filling in a plausible guess. A confident wrong attribution is worse than a gap I can fill in myself.
