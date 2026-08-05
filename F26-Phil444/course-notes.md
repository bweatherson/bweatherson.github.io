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
