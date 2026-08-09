# PHIL 444 (F26): Course Planning Notes

Running notes on pedagogical decisions for the course as it gets built. Not a student-facing document.

## Mixed strategies: introduce at L5, finish at L10

At L5 (mixed strategies and the interpretation problem), introduce the five interpretations of mixed equilibrium:

1. **Literal randomization** (Binmore-style): players use randomizing devices and know they are using them.
2. **Long-run frequency** (Reichenbach-style): mixtures are limiting frequencies over repeated play. Be explicit about whether the "frequencies" are over independent plays of the same one-shot game or over rounds of a repeated game; this distinction is important and easy to slide past.
3. **Population interpretation**: mixtures describe proportions of pure-strategy types in a population. Note this as a position on the menu but do not develop; evolutionary game theory is off the agenda for this course. Skyrms's *Evolution of the Social Contract* is the philosophy-side referent if students want to follow up.
4. **Harsanyi purification**: mixed equilibrium is the limit of pure-strategy Bayesian Nash equilibria of nearby Bayesian games with small private payoff perturbations. **Mention only as a preview at L5**; defer the technical treatment until after Bayesian games and BNE have been introduced.
5. **Aumann–Brandenburger epistemic**: the "mix" is the opponent's belief about your pure strategy, not actual randomization.

Return to Harsanyi at L10 (Bayesian Nash equilibrium), right after BNE is on the table. Frame it as: "Remember the indifference puzzle from L5? Now that we have BNE, here is Harsanyi's resolution." Walk through the matching-pennies derivation. With types iid uniform on [0,1] and payoffs perturbed by ε·θᵢ(sᵢ), each player's decision rule at the symmetric equilibrium reduces to "play H iff θᵢ(H) > θᵢ(T)" — a deterministic function of type. By symmetry of the type distribution this induces a 50–50 marginal over actions regardless of ε, so as ε → 0 we recover the mixed equilibrium of unperturbed matching pennies as the limit of pure-strategy BNE in the nearby perturbed games.

At the end of L9, flag explicitly that we will return to mixed strategies in L10, so the deferral feels intentional rather than forgotten.

Canonical readings: Harsanyi (1973) for purification; Aumann (1987) on correlated equilibrium and subjective rationality; Aumann & Brandenburger (1995) on epistemic conditions for Nash equilibrium.

## Cursed equilibrium and the winner's curse: mention at L14 (Akerlof)

Spend roughly five minutes near the end of L14 noting:

- Akerlof's analysis assumes both sides are fully rational.
- Empirically, in common-value settings (especially auctions), sophisticated bidders systematically overbid: the winner's curse.
- One modern formal treatment is Eyster and Rabin's cursed equilibrium (Econometrica, 2005), which relaxes the assumption that players fully condition on the correlation between other players' actions and their types. A χ-cursed equilibrium with χ ∈ [0,1] interpolates between full conditioning (χ = 0, standard BNE) and fully ignoring the correlation (χ = 1).
- The math is not dramatically harder than BNE, but it belongs to a different research program (bounded rationality rather than refining rational choice), so the course will not develop it.
- Mention level-k thinking (Stahl and Wilson; Nagel) and quantal response equilibrium (McKelvey and Palfrey) as the other two canonical modern behavioral GT concepts, in case students want to pursue this line further.

The upshot for the course: this is the natural place to acknowledge that the rational-choice modeling we have been doing is one program among several, and that there is a sophisticated modern literature on systematic departures from it. The point is not to undermine the course's rational-choice spine but to be honest about where it does and doesn't track behavior.

## Forward induction and the intuitive criterion: thread from L9 to L12

L9 introduces forward induction via van Damme's burning-money game in Battle of the Sexes. The reasoning principle: if a player has made a move that's only rational if they're committed to a particular continuation, the opponent should infer that and update their beliefs accordingly. Backward induction by itself doesn't capture this; you have to reason about what kind of player would have made the prior move.

L12 (Cho–Kreps intuitive criterion) applies the same reasoning principle to signaling games. When player 1 sends an off-equilibrium signal, player 2 should ask: which types of player 1 could rationally have sent it? Types for whom the signal is strictly dominated by the equilibrium signal are ruled out, so player 2's beliefs after the off-equilibrium signal should put zero weight on those types.

Both are answers to the same philosophical question: how should you reason about another rational agent's seemingly unexpected move? Forward induction says the move tells you something about what the player must be planning. The intuitive criterion says the move tells you something about what type of player you are facing.

When teaching L12, explicitly point back to L9. The burning-money example and the beer-quiche example are the same reasoning principle in different formal clothes. Making the connection visible is what stops the intuitive criterion from feeling arbitrary; the criterion is forward induction applied to signaling games.

Pedagogical bonus: this is the moment in the course where the unifying theme pays off in a non-trivial way. Two seemingly different problems (refining equilibrium in dynamic games and refining equilibrium in Bayesian signaling games) turn out to be variations on the same philosophical question about how one rational agent should interpret another's actions.

## Distinguishing forward and backward induction at L9

Students have been confused about this in past iterations. The cleanest way to put the difference:

- **Backward induction** rests on the assumption that *future* actions will be rational. You reason from the end of the game backwards, ruling out choices that wouldn't be rational at later nodes.
- **Forward induction** draws conclusions from the assumption that *past* actions were rational. An unexpected move has been made; it was made by a rational player; update your beliefs about that player accordingly.

Both rely on the rationality of the other player. They just point the inference in opposite directions through the game tree.

Spend two or three minutes at the start of L9 making this contrast explicit before going into the burning-money example. A single slide with both definitions side by side would help. The burning-money illustration only lands if students have the distinction firmly in hand first; otherwise they tend to read forward induction as a strange version of backward induction and miss the philosophical point.

## Second half: the reading policy, and what it demands of the slides

CCSW alternates unstarred chapters (the argument, in prose) with starred chapters (the proofs). Sen says in the 1970 preface that the unstarred chapters can be read on their own. The syllabus takes him at his word: unstarred chapters are required reading, starred chapters are recommended, with three exceptions where the starred chapter is the lecture (Ch 3\*, Ch 6\*, Ch A1\*).

This was forced by arithmetic. The book is 426 pages of text across fourteen lectures, twice a week. Assigning everything works out to 30 pages a lecture of dense formal material, and several individual lectures were far worse: 61 pages for the original L25, 55 for L20, 36 for L16. Under the policy the required load is about 19 pages a lecture.

**The consequence for slide-writing is the important part. The proofs now live in the slides, not the reading.** Students are not being asked to work through the starred chapters, so if a result is not proved at the board it is not in the course at all. The second-half slides therefore have to carry more formal weight than the first-half slides did, where students had textbook-equivalent material to fall back on.

Proofs the slides need to carry, by lecture:

- L17: May's theorem, from Ch 5\*. Anonymity, neutrality and positive responsiveness characterise majority rule over two alternatives.
- L18: Arrow's theorem, Sen's decisive-set proof from Ch 3\*. Field expansion, then contraction of decisive sets. Ch 3\* is required, but the slides should still be self-contained.
- L19: value restriction and single-peakedness, from Ch 10\*. This is the whole content of the lecture and Ch 10\* is only recommended.
- L20: quasi-transitivity and acyclicity results from Ch 4\*, and Gibbard's oligarchy theorem. The oligarchy result is the point of the lecture; without it, weakening collective rationality looks free.
- L21: the comparability framework and aggregation quasi-orderings from Ch 7\*.
- L22: Gibbard-Satterthwaite, and the Muller-Satterthwaite equivalence with Arrow. No Sen chapter behind this one at all.
- L23: the liberal paradox proof from Ch 6\*, which is three pages and required, so this one is easy.
- L25: the weak equity axiom, and the impersonality material from Ch 9\*.
- L27: Ch A4\* on votes and majorities.

Nine of the fourteen second-half lectures have a proof obligation. Budget accordingly when drafting: these are not lectures that can be built out of prose slides.

The risk to watch is that the second half becomes more technical than the first while appearing lighter, because the required page count dropped. If the quizzes track the proofs (they should, since that is where the formal content now lives) students who read only the unstarred chapters will be caught out. Say this explicitly in L15, and again in L17 before Arrow.

## Second half: why the order is not Sen's order

The lectures do not follow the book. The arc is: setup, the impossibility, three escapes from it, strategy, a second impossibility, then what positive theory survives.

The reason is that Sen's order scatters the material that answers a single question. Following the book puts Arrow at L18 and the two classic escapes at L22-23 and L25, so the second escape arrives ten lectures and five weeks after the problem it solves. The three escapes now run consecutively at L19 (restrict the domain), L20 (weaken collective rationality), and L21 (enrich the informational base), which is also the order of increasing philosophical interest.

Two consequences to keep in mind while writing:

Ch 4 and 4\* are apparatus as well as escape route. The definitions of social decision functions and choice functions are needed from L16 onward, but the philosophical use of them belongs at L20. Introduce the vocabulary at the board in L16 and flag that the argument about it comes later.

Ch 3 (Collective Rationality) moved from L16 to L20. It is the informal chapter asking whether social preference must be an ordering, which is exactly what L20 is about. Teaching it at L16 meant raising the question and then re-raising it four lectures later.

## Second half: what is not covered, and why

**Judgment aggregation is out.** Some students will have seen List and Pettit in an earlier course. The puzzle takes ten minutes to state, and the solutions that get most attention in philosophy (premise-based, conclusion-based, sequential priority) are close relatives of one another. Two families are not variants of "fix an order, majority-vote, propagate": distance-based rules, which minimise Hamming distance to the individual judgment sets and are path-independent by construction (Nehring and Pivato; Dietrich and List), and unidimensional alignment, which is a domain restriction rather than a procedure (List) and is the direct analogue of single-peakedness. Neither earns a lecture here.

What is worth five minutes, somewhere in the L19-21 block: the escapes from judgment aggregation impossibility map one-to-one onto the escapes from Arrow. Restrict the domain, weaken the rationality requirement, enrich the informational base. The same three. This makes the Arrow structure look like a general pattern rather than a fact about preference aggregation, and it costs almost no time. The linear and geometric pooling impossibilities in credal aggregation sit in the same family, which is a second free remark for students who have seen that material.

**Gibbard-Satterthwaite is in**, as L22, and it is the one non-Sen lecture in the formal part of the half. It delivers on the promise made in the L1 slides that aggregation procedures have to be sensitive to strategic behaviour, and it is where the two halves of the course meet: a voting rule is a game form, and the Muller-Satterthwaite equivalence shows the theorem is Arrow's in different clothes. Reading is Sen's 1999 Nobel lecture rather than Gibbard 1973, which is rough going for this audience.

**Capability gets its own lecture** (L26), on the grounds that graduate students in philosophy are more likely to meet the capability approach than any other part of Sen's work. Primary reading is "Equality of What?" rather than the CCSW chapters, with Nussbaum's 2003 piece for the contrast: she wants a determinate list, Sen refuses to give one. Make the connection to L27 explicit, since Sen's refusal is itself a social-choice position. He thinks the weights should come out of public reasoning rather than from a theorist, which is why the capability lecture sits next to the public-reasoning lecture.

**Ch 8\* (Bargains and Social Welfare Functions) is dropped entirely**, and Ch 8 is recommended only. **Ch A3 and A3\* dropped to recommended**, which is the most debatable cut in the plan: A3 is Sen's own 2017 revision of the equity material, and it is now optional. The alternative is to make A3 required at L25 and demote Ch 9, which has something to be said for it, since A3 is written knowing where the argument ended up.

## Second half: remaining pressure points

Two places where the load and the calendar still collide.

L22 rests entirely on the Nobel lecture, 30 pages, the heaviest single required item in the half. It is discursive rather than technical, so this is probably fine, but it is the one to watch.

L24 has 27 pages of Ch A5 over a weekend with Quiz 8 attached. Quiz 8 has to be on the Tuesday because Thursday is Thanksgiving, so there is no easy fix short of moving material out of A5.

Also worth noting: quizzes 5 through 8 fall at L19, L21, L23 and L24, so lectures 25 through 28 carry no quiz. The second essay covers that ground, and the last four lectures are the least formal in the half, so this is defensible rather than accidental.

## Chapter 6: the Bayesian games foundation (written)

The audit found no coverage of Bayesian games, types, or Bayesian Nash equilibrium anywhere in the notes, which left L10 with nothing behind it. The gap was worse than a missing lecture. Chapter 6 was titled "Bayesian Games" and opened at perfect Bayesian equilibrium, and the signalling figures already used a Nature node drawing types with probability p and 1-p. The machinery was in use two sections before it was introduced.

Five sections now sit at the head of chapter 6, ahead of the existing perfect Bayesian equilibrium material.

- **Two Kinds of Ignorance.** Imperfect against incomplete information, which students conflate. Ends on the regress worry: modelling ignorance about payoffs looks like it needs an infinite hierarchy of beliefs about beliefs.
- **Types.** Harsanyi's transformation as the answer to that regress. Nature, types, the definition of a Bayesian game, and the common prior assumption flagged as philosophically loaded rather than passed over. Points forward to the Nature nodes in the signalling figures, which is the payoff of putting this material first.
- **Bayesian Nash Equilibrium.** Strategies as functions from types to actions, with the two-types-means-four-strategies point made heavily, since that is where students go wrong. BNE defined twice, once directly and once as Nash equilibrium of the transformed game.
- **An Example.** Battle of the Sexes from chapter 1 with Col's type unknown: sociable half the time, elusive half the time. Worked to the equilibrium where Row plays X, sociable Col matches and elusive Col mismatches. Includes the comparative static, that Row prefers X just when the probability of a sociable Col is above one third. All the arithmetic was checked numerically.
- **Purification.** Discharges the debt the L5 slides incur. Harsanyi's response to the indifference puzzle, then two objections: that the result is a limit claim while the game we care about sits at the limit, and that the perturbed game is not the game we started with.

Conventions followed: grid tables in the chapter 1 style, `\nicefrac` inline and `\frac` in displayed maths, which is what the rest of the book does.

Still open on the game theory side. No centipede for L8. Nothing on Spence or Akerlof for L13 and L14, though the papers are assigned so this may be fine. And the five interpretations of mixed strategies exist only in `slides/05.qmd`, so a student reading the notes gets the mechanics of mixing and none of the philosophy. That is the same species of gap as the one just closed.

## Second half: how defeasible the schedule is

The choice was between drafting class plans for all fourteen sessions and treating the schedule as a defeasible default. Went with the default, plus pacing work on L16-L18 only, on the grounds that a class plan written in August for a seminar not yet met is fiction, while L16-L18 is pure formal content that can be timed now.

Two things made the question look harder than it was.

There was no slack. Fourteen sessions, fourteen topics, one reading each. "Let the pace decide" would have meant "let the pace decide what falls off the end", which is why the strength-of-default question felt unanswerable.

The quizzes are pinned to dates and the content is not. Quizzes 5-8 sit at L19, L21, L23 and L24. If content slides by a session and quiz dates do not, the quiz tests untaught material. The syllabus now says quizzes cover material through the previous class meeting, whatever that turned out to be.

On how strong the default is: strong about order and prerequisites, weak about pace. Never reorder to catch up, never skip L16, L17, L18 or L21, and spend two classes on a topic whenever the room needs it. The thing being defended is the trunk, not the calendar.

On the trade-off between covering the important material and keeping a sensible order: it is weaker than it looks, because Part II is not a chain. The three escapes at L19, L20 and L21 are parallel. Each needs L17-L18 and none needs the others. The Paretian liberal at L23 needs Ch 2's apparatus and not Arrow's proof. L25 and L26 hang off L21. So a branch can be compressed without disturbing any order.

The trade-off only bites if the cut runs backwards from the end, which is what happens by default, and which would put capability at L26 at risk. Since capability is the part of Sen these students are most likely to meet again, that is the worst thing to leave exposed. Fix is a pre-declared drop order that does not run backwards: L27 and L28 merge first, then L24 folds into L23. Two sessions recoverable, identified in August rather than in November.

## Second half: pacing L16-L20 against the text

Done with Ch 1*, Ch 2, Ch 2*, Ch 3 and Ch A1* in hand.

**L16 was overloaded and now is not.** As written it carried about twenty-five numbered items: six relation properties, Sen's six-way naming table on p. 54, P and I, maximal set against choice set, choice functions, quasi-transitivity, acyclicity, Lemmas 1*b, 1*j, 1*k and 1*l, then Definitions 2*1 to 2*6 and Lemmas 2*a, 2*b and 2*e. That is not eighty minutes. The maximal-against-choice-set distinction on its own wants ten, and Sen's example where neither xRy nor yRx holds, so both are maximal and neither is best, is the thing students need and the thing they will otherwise miss.

Quasi-transitivity, choice functions and the existence lemmas are not used until L20, and acyclicity is not used until L19. Both moved to where they are used. L16 keeps R, P and I, reflexivity, completeness and transitivity, quasi-ordering against ordering, maximal set against choice set, the CCR definition, the Pareto relation, and Lemma 2*a.

**Section 2*2 of Ch 2* is now recommended only.** Kaldor and Scitovsky compensation tests, Lemmas 2*f to 2*h. Three of the chapter's six pages, orthodox welfare economics, and nothing later in the course uses it. Ch 2* is a three-page reading now.

**Ch 3 moved from L20 to L17, and Ch 3* dropped to recommended.** The chapter is called Collective Rationality, which is why it was at L20, but the content is Arrow's setup: 3.1 and 3.2 are Bergson-Samuelson and the Arrovian SWF, 3.3 states U, P, I and D informally with the Lincoln and Lenin gloss on independence, and 3.4 gives Condorcet properly plus the Borda count failing I and the traditional-code rule failing P. That is L17's topic almost line by line. The chapters that are actually about weakening collective rationality are Ch 4 and A2, which stay at L20. Side benefit: the four conditions now arrive in prose the night before the proof rather than in Ch 3*'s formalism.

**L18 has about half an hour spare**, which was the surprise. Sen's 2017 proof is as short as he claims. Axioms five minutes if L17 has done them, decisive and locally decisive five, spread of decisiveness fifteen, contraction of decisive sets twenty to twenty-five, theorem five. The contraction lemma is the only fiddly one, because of the G1 and G2 partition and the case split on z. Call it fifty-five minutes. The Kirman and Sondermann invisible-dictators material on p. 288 is right there and is a good use of the rest.

**The L20 overload dissolves.** Ch A1* does double duty. Pages 282 to 288 are the Arrow proof, which is L18. Pages 289 to 293 are quasi-transitivity, the Pareto-extension rule, Gibbard's oligarchy theorem and the acyclicity and veto results, which is L20's topic entire. So L20 reads the back half of a chapter the class already has, plus Ch 4 and A2, rather than three new chapters.

Sen also hands over L20's organising fact on p. 289. The spread of decisiveness needs only quasi-transitivity; the contraction of decisive sets needs full transitivity. That is why weakening transitivity escapes Arrow, and it is visible as a specific broken step in a proof they saw the week before. Build the lecture on it.

Students should stop at p. 293. Blau and Deb on NIM, semi-orders, s-and-t orders and the ultrafilter topology run to p. 300 and are a different course.

**Two loose ends.** May's theorem has no required reading; it is in Ch 5*, which is recommended, so L17's contrast case is board-only. And the notation is not uniform across editions: A1* is 2017 and writes I-squared for independence while distinguishing relational I from Arrow's choice-functional I-A, Ch 3 and Ch 3* are 1970 and write plain I, and the Pareto relation R-bar from Ch 2* does not reappear in A1*. Worth one slide at L18.

## Syllabus reading list: notes references and links

Three passes over the schedule.

**Hard line breaks.** Every **Topic**, **Reading**, **Recommended**, **Quiz** and **Essay** line that is followed by another such line now ends in four spaces, so Quarto breaks rather than reflowing them into one paragraph. Forty-five lines. Lines at the end of a block were left alone.

**Notes references.** The TBDs for Lectures 2 through 11 are filled in against the lecture notes, by chapter and numbered section. Section numbers assume the current heading order in `notes/*.qmd`, so if headings get inserted or moved the numbers shift; the section titles are given alongside as a check. Lecture 15 picks up Ch 7 as recommended background, since it covers Arrow and the voting systems quickly before the second half slows down and does it properly.

**Links.** JSTOR where the item has a 10.2307 DOI, which covers Cho and Kreps (1885060), Spence (1882010), Akerlof (1879431) and Gibbard (1914083). Publisher pages otherwise: AEA for Sen's Nobel lecture, the Chicago DOI for the Paretian liberal, the Taylor and Francis DOI for Nussbaum, and the Tanner Lectures site for "Equality of What?". All eight resolved when checked. The syllabus now warns that most need a campus connection or the library proxy.

The "textbook to be confirmed" sentence in Required Materials is gone. The notes are named as the main first-half reading, with Bonanno as an optional second voice. No Bonanno chapter numbers, because I have not checked them against the edition students would download.

## Gaps the reading-list pass turned up

Four places where the syllabus promises something the notes do not contain.

- **L2 lists Allais and Ellsberg**, and neither appears anywhere in the notes. Ch 2 has probability, conditional probability, Bayes, expected value and orthodox decision theory, and stops. The reading now points at 2.4-2.5, which is the expected utility material only.
- **L8 lists the centipede**, and there is no centipede in the notes. The draft in `_new-centipede-ch5.md` is still not spliced. The reading points at 5.5, Problems with Backwards Induction, which is the right home for it.
- **L13 and L14 are Spence and Akerlof**, and `_new-spence-akerlof-ch6.md` is still not spliced either. Both lectures currently rest entirely on the papers. That may be fine, but it means two of the fourteen first-half classes have no notes behind them.
- **Three sections have no lecture**: 4.2 (Correlated Equilibrium), 4.3 (Coordination Games) and 5.7 (Iterated Prisoners' Dilemma). Correlated equilibrium in particular is a substantial piece of the notes with nowhere to be taught. Either it earns a place in one of L6 or L7, or it should be marked as background.

The interpretations draft did land: 3.12 (What Is a Mixed Strategy?) is in the notes and is assigned at L5.

## Bonanno as second voice

Bonanno's *Game Theory* is now cited by section in the Recommended lines for Lectures 2 through 12.

**The edition matters.** The table of contents that circulates on arXiv and eScholarship is the second edition, 15 chapters. The file on Bonanno's own site is the third edition, 16 chapters, because the Introduction became Chapter 1 and everything shifted by one. Ordinal games in strategic form is Ch 2 there, not Ch 1; expected utility is Ch 5, not Ch 4; perfect Bayesian equilibrium is Ch 13, not Ch 12. Chapters 8 and 10 were also reorganised internally, so section numbers within them do not carry over either. All references in the syllabus are to the third edition, and Required Materials now says so and links to the author's PDF rather than to arXiv.

**Two lectures get nothing from Bonanno.** He has no forward induction, so L9 has no Recommended line at all. And he has no intuitive criterion, so L12 points at Ch 12 on sequential equilibrium as the neighbouring refinement, with a note saying as much. He also has nothing on correlated equilibrium, nothing on Spence or Akerlof, and nothing on social choice, so the second half of the course is unaffected by any of this.

**One pairing worth keeping.** Bonanno 9.5, Harsanyi consistency of beliefs, is the common prior assumption under another name. The notes flag that assumption as philosophically loaded at 6.2 and promise to come back to it, so the pointer is doing real work rather than padding.

## Part II of the book is cut

Chapter 7 (Group Decisions) is out of the coursebook. The book now runs
index, chapters 1 to 6, references, with no parts, since a single part called
"Game Theory" in a book that is entirely game theory was doing no work.

The reasoning: the text for the second half is Sen, one informal chapter is a
stub rather than a part, and there is no point paraphrasing a book the students
have in front of them.

The file is kept at `notes/_archive/07-group-decisions.qmd`. The underscore keeps
Quarto from rendering it, so it stays available without appearing anywhere. It is
9,000 words on Arrow, proofs of Arrow, Condorcet cycles and six voting systems.

The preface was rewritten, since it previously said the last chapter was relevant
to the second half and that the Part II voting material was still assigned. Both
claims are now false. The L15 recommendation of Ch 7 has come out of the syllabus.

**Two consequences worth tracking.** The book title is still *Game Theory and
Social Choice*, which now promises a half the book does not contain. Either the
title changes or the preface has to carry the explanation, which at the moment it
does. And cutting the chapter cuts plurality, runoff, instant runoff, Borda,
approval and range voting from the course altogether, since Sen barely covers
them. The Gibbard-Satterthwaite handout for L22 is the obvious place to put them
back, because it is about voting rules as game forms and those are the rules.

## Spence: what came over from the 300-level slides

Compared `notes/_new-spence-akerlof-ch6.md` and section 6.8 against slides 18 and
19 from the 300-level course. The v1 draft is at
`notes/_to_delete/_new-spence-akerlof-ch6-v1.md`.

The structural problem was that the notes ran model-first and mentioned the world
once, in an aside, while the slides run explanandum-first. More to the point, the
notes gave the case against signalling (the age gradient) and not the case for it,
then closed on a firm negative verdict. Two new sections fix that.

**The College Wage Premium** brings in the sheepskin effect, which was missing
entirely and is the strongest single piece of evidence for signalling; the
three-way split between human capital, selection and signalling, in place of the
old two-way contrast; and the what-would-the-world-look-like test.

**Does the Signalling Model Fit?** collects what the model gets right (sheepskin,
content independence, no front-end gatekeeping, the scale of the premium) and then
three difficulties: the age gradient with its two available responses, the
permanent student problem, and degree length. The permanent student point is from
the slides and is the best thing in either document, because it attacks the single
crossing assumption rather than a prediction, so it does not merely embarrass the
model, it stops the separating equilibrium existing.

Degree length is where the evidence divides. Bologna and the UK against the US
favour signalling; @arteaga2018 on Universidad de los Andes runs the other way and
is much the cleanest test, since the reform cut coursework by 20% and 14% while
holding the university, the degree title, the diploma, the entering class and the
graduation rates fixed, and earnings still fell 16% and 13%. Verified against the
paper: *Journal of Public Economics* 157 (2018) 212-225, doi
10.1016/j.jpubeco.2017.10.007. Needs a bib entry; one is in the draft file.

**Placement.** These go at the end of chapter 6, after 6.9 The Intuitive
Criterion, not inside 6.8. That matches lecture order, since the intuitive
criterion is L12 and Spence and Akerlof are L13 and L14, and it avoids breaking
6.8's run-in to 6.9.

**Three suggested edits to existing 6.8 prose** are at the foot of the draft file
and have not been applied: retiring "dullard", replacing the closing verdict
paragraph, which now duplicates and pre-empts the new material, and the question
of where the cheap talk point belongs.

**One trap.** The slides and the notes are not the same game. Student payoffs
agree but the employer's do not, and the difference is not an affine
transformation, so no numbers or trees can move across without redoing the
equilibrium analysis.

Left in the slides deliberately: the three OECD tables, the gender breakdown of
the age gradient, and the discussion prompts.

## Correlated equilibrium and the iterated Prisoners' Dilemma: both cut from the syllabus, both kept in the book

**Correlated equilibrium (4.2) is out of the course.** Its place in the
literature is unsettled; some people think it should displace Nash, others barely
mention it. Bonanno refers to it a couple of times and then says it is not
covered in his book. If he can leave it out, so can we.

**The iterated Prisoners' Dilemma (5.7) is out too**, for a different reason.
It was done at length in the 300-level course and enough of this class will have
been there that repeating it is not a good use of eighty minutes.

Both sections stay in the book, so that students who have not met the material
have somewhere to go. No syllabus change was needed, because neither section was
ever assigned: L6 reads 4.1 only, and L7 to L9 read 5.1 to 5.6. The preface
already carries the right framing, since it now says that a section not on the
schedule is there as background rather than as something students are expected to
have read.

**Still open: 4.3, Coordination Games.** About 1,950 words, against 1,150 for
4.1 and 2,000 for 4.2. With 4.2 out as well, L6 assigns only 4.1, which is roughly
a quarter of the chapter. It covers equilibrium selection across three games and
runs through to the society-formation discussion, which asks how far social life resembles an iterated Prisoners'
Dilemma and how far an iterated Stag Hunt. That is the most philosophical passage
in chapter 4, and as things stand no lecture reaches it.

**One dangling cross-reference.** Section 3.12, which is assigned at L5, says
"as we will see when we come to the iterated Prisoners' Dilemma". Since 5.7 stays
in the book, that sentence is still true of the book and now false of the course.
Fine if it reads as a pointer into the text; worth rewording if it reads as a
promise about a class.
