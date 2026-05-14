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
