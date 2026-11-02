---
format: typst
title: "Class 18 — Values and Choice (CCSW Ch 5, 5\\*)"
number-sections: true
---

Talking points, not a handout. Reading: Ch 5. The formal results at the end are
in Ch 5\*.

Ch 5 is the metaethics chapter, and it sits oddly in the book: it is about
whether the discipline can argue about values at all, and it is placed between
Arrow's theorem and the chapters on liberty. The reason for the placement is
§5.6, which is a methodological defence of the axiomatic method we have been
using. Everything before §5.6 is the ground-clearing for that defence.

# What the chapter is reacting against

The target is the New Welfare Economics (1939–50) and its attempt to find a
value-free criterion. Hicks, quoted at p. 105:

> In fact, there is a simple way of overcoming this defeatism, a perfectly
> objective test which enables us to discriminate between those
> re-organizations which improve productive efficiency and those which do not.
> If $A$ is made so much better off by the change that he could compensate $B$
> for his loss, and still have something left over, then the reorganization is
> an *unequivocal improvement*.

That is the Kaldor test from Ch 2, now being advertised as value-free. We
already know from Lemma 2\*f that it is formally broken: it is inconsistent
with every possible CCR under some configuration of preferences. Ch 5 says the
philosophical claim behind it is broken too. Worth making the pairing explicit
since we did Ch 2 recently.

Sen's footnote 6 is the one-line kill: Hicks says the compensation "could" be
paid, whether or not it is actually paid, and that re-introduces the
interpersonal conflict he was claiming to have removed.

Samuelson gets the same treatment. He wrote that "the only consistent and
*ethics-free* definition of an increase in potential real income of a group is
that based upon a uniform shift of the utility possibility function for the
group." Sen's footnote 7 puts him in a dilemma: if real income comparisons are
value judgments, this is not ethics-free; if they are not value judgments, then
this is not the *only* ethics-free definition.

# Two different errors, and Sen only cares about one

Students will read §5.1 as a Hume's Law chapter. It mostly isn't, and the
distinction is worth drawing on the board.

**Error one, the is/ought gap.** You cannot derive a prescriptive conclusion
from exclusively factual premises. Sen cites Hare (1961) for this and notes in
footnotes 4 and 5 that Black, Searle and his own 1966 paper have raised doubts
about whether the law holds. He does not engage with those doubts, and he does
not need to.

**Error two, the unanimity fallacy.** This is the one Sen actually goes after:

> For reasons that are somewhat obscure, being 'value-free' or 'ethics-free'
> has often been identified as being free from interpersonal conflict. The
> implicit assumption seems to be that if everyone agrees on a value judgment,
> then it is not a value judgment at all, but is perfectly 'objective'.

And the payoff sentence:

> Unanimous value judgments may provide the basis of a great deal of welfare
> economics, but this is so not because these are not value judgments, but
> because these value judgments are acceptable to all. This banality would not
> be worth stating had the opposite not been asserted or implied in much of the
> literature.

This explains something we left hanging in Class 16: why the Pareto principle
got treated as beyond question. It is unanimous, and unanimity was being read
as objectivity. The error is about agreement, not about logic.

**A point Sen does not make, worth making.** His argument in §5.1 does not
depend on Hume's Law at all. Welfare economics issues recommendations, so its
*conclusions* are evaluative, and that is enough. If it turned out that ought
*could* be derived from is, welfare economics would not thereby become
value-free; it would just mean value judgments were derivable. Either way they
are value judgments. Sen half-sees this when he says the New Welfare Economics
had "nothing to do with" the Hume's Law doubts, but he does not draw the
conclusion.

# Basic and non-basic

Sen's definition, p. 109:

> A value judgment can be called 'basic' to a person if the judgment is
> supposed to apply **under all conceivable circumstances**, and it is
> 'non-basic' otherwise.

So basicness is being defined modally: a judgment is basic if it survives every
conceivable variation in the facts. The test is counterfactual. Ask the person
"would you say the same if the poor were much poorer?" and see whether they
revise.

His examples: "a rise in national income measured at both base and final year
prices indicates a better economic situation" is probably non-basic, since most
people will revise it if the distribution is bad enough. "I should not kill a
human being" is basic for someone who will not revise it under any
circumstances.

The three warnings at p. 110 are each worth a minute.

- The admissible circumstances need not be *probable* ones. Hence the exchange
  about whether mini-skirts cause cancer in the eye of the beholder. The
  judgment is non-basic even though the dispute would not be fruitful.
- A judgment conditional on circumstances is not shown non-basic by considering
  cases that violate the condition. "On rainy days I should carry an umbrella"
  is not refuted by sunny days.
- A set of judgments might be logically inconsistent, in which case not all can
  be basic. Sen separates judgments that conflict only under specific factual
  circumstances (at least one is non-basic, but not for analytical reasons)
  from ones that conflict analytically, like the kindly man who wants everyone
  to have an income above the national average.

## The grounding reframe

The modal formulation is doing badly, and I think the right diagnosis is that
Sen wants a hyperintensional notion and only has a modal one available in 1970.
Reframe: a value judgment is **non-basic** for a person when their holding it is
*grounded in* their holding some factual belief together with some further value
judgment, and **basic** when it is ungrounded.

Four things this buys.

1. **It fixes the obvious counterexamples.** On the modal test, any judgment
   that happens to hold across all conceivable circumstances counts as basic,
   including ones that are plainly derivative. Take a basic judgment, conjoin a
   necessary truth, and the conjunction passes the test while obviously
   depending on something else. This is Fine's objection to the modal analysis
   of essence, transposed: necessary covariation cannot distinguish what
   explains what.
2. **It removes the need for the second warning.** Conditional judgments
   embarrass the modal test, which is why Sen has to patch it. On the grounding
   reading they are unproblematic: a conditional judgment can sit at the bottom
   of someone's structure without applying in every circumstance.
3. **It makes Sen's "constraining" move intelligible.** At p. 113 he says you
   can convert a non-basic judgment into a basic one by adding a suitable
   constraint, e.g. restricting the national income judgment to cases where the
   Gini is unchanged. On the modal reading this is just restricting the
   quantifier, which makes basicness look cheap. On the grounding reading you
   have changed which proposition is at issue, which is a more honest
   description of what happened.
4. **It dissolves Sen's asymmetry.** He claims at p. 113 that "some value
   judgments are demonstrably non-basic, but no value judgment is demonstrably
   basic", and treats this as deep. It follows directly from the modal
   formulation: you can falsify a universal claim with one case and never
   verify it. Under grounding, basicness is a positive structural fact about
   someone's commitments, and evidence can bear on it in both directions. The
   asymmetry is an artefact of the gloss.

**The cost, and it is real.** Sen's notion is explicitly person-relative:
basic *to a person*, in *his* value system. Grounding-talk is usually not
person-relative. So the reframe forces a choice between a psychologised
grounding relation (what grounds what among this agent's commitments) and the
objective question (what grounds what). Those are different projects, and Sen
is running the first while writing as though he is settling something about the
second. Good thing to put to the room.

# What the reply to Robbins actually establishes

§5.4. Robbins, quoted at p. 112:

> If we disagree about ends it is a case of thy blood or mine — or live or let
> live according to the importance of the difference, or the relative strength
> of our opponents. But, if we disagree about means, then scientific analysis
> can often help us to resolve our differences.

Sen's reply: the contrast holds only if ethics deals exclusively in *basic*
judgments. For non-basic ones, you can dispute the underlying factual premise
or the derivation, and that dispute is scientific. Even granting Hume's Law,
prescriptive conclusions can be drawn from factual premises *among others*.

What this establishes is weaker than it is usually taken to be, and Sen says so:

> From this we do not, unfortunately, get a rule to decide when rational
> disputation is potentially fruitful and when it is not. Non-basicness of a
> judgment in someone's value system can sometimes be conclusively established,
> but the opposite is not the case, so it is best to take a given value judgment
> to be basic to give it, at best, the benefit of the doubt. It seems impossible
> to rule out the possibility of fruitful scientific discussion on value
> judgments.

So the conclusion is "we cannot rule out rational argument", not "rational
argument is available". Worth asking whether that is enough to answer Robbins.
There is also a sense in which Sen talks past him: Robbins was making a claim
about the subject matter, and Sen's reply makes tractability depend on
contingent facts about the disputants' psychology.

# The outvoted democrat

§5.5, p. 114. Sen sets it up cleanly:

> An individual $A$ firmly prefers social state $x$ to state $y$. But he knows
> that everyone else in the community prefers $y$ to $x$. And further,
> individual $A$ is strongly anti-dictatorial. What should he do? If he
> recommends $y$, he will be running against his own preference. If he
> recommends $x$, he will be violating his anti-dictatorial values.

His structural observation is good: individual values enter the model twice,
once in the $R_i$ and once in the choice of CCR, and nothing guarantees the two
cohere.

His resolution is: "In general, one or the other set of judgments must be
non-basic, possibly both." Then he sketches two extremes. At one end, the CCR
judgments are basic and people feel bound by the outcome, which he illustrates
with professorial selection committees that take a second vote to make the
appointment formally unanimous. At the other end, people are committed to their
own ordering and will reject any CCR that does not deliver it, which he
illustrates with the French Revolution. Then he goes to Harsanyi's distinction
between subjective and ethical preferences, and generalises it to a person's
"ethical CCR".

**This is a classification, not a resolution, and it is worth saying so.** Being
told that at least one of two commitments is non-basic does not tell you which,
or what to do, or how to think about the case. And there is a specific reason to
doubt the diagnosis fits. The basic/non-basic apparatus was built to show where
*factual* premises enter a value dispute. But "I should get my way" does not
obviously rest on a factual assumption at all. Sen's machinery is being applied
to a conflict between two normative commitments, which is not the kind of
conflict the machinery was designed to illuminate.

**What is missing.** This is Wollheim's paradox of democracy, from 1962, eight
years before CCSW, and Sen neither cites it nor engages the literature. The
sharper version: $A$ holds that $x$ ought to be enacted (his own judgment) and
that $y$ ought to be enacted (because the democratic machinery chose it). That
is a contradiction, not a tension.

Four responses Sen does not consider, any of which is a better class discussion
than his:

1. **Two different propositions.** "$x$ is best on the merits" and "the output
   of a fair procedure ought to be enacted" are not contradictory; they are
   answers to different questions. Sen's "ethical CCR" gestures at this without
   naming it.
2. **Judgment versus compliance.** You can think a decision wrong and also think
   you ought not resist it. Distinguish "$x$ is right" from "I ought to act to
   bring $x$ about".
3. **The vote as evidence.** If everyone else disagrees with you, that is
   evidence you are wrong, and you should update. Then there is no residual
   conflict. The Condorcet jury theorem is the formal version, and this is the
   cleanest dissolution for Sen's specific case, where $A$ is outvoted by
   literally everyone. Sen does not raise it anywhere.
4. **A duty to support just institutions.** The Rawlsian answer. Worth noting
   that Sen co-taught a seminar with Rawls and Arrow at Harvard in spring 1969,
   the year before this book, and *A Theory of Justice* appeared the year after
   it. Put it as a question rather than a charge: why is the obvious Rawlsian
   move not in the book?

Harsanyi is worth a couple of minutes on its own. Subjective preferences are
what you actually want; ethical preferences are what you would want if you
thought you had an equal chance of being in anyone's position. That is the
veil-of-ignorance structure, in 1955, before Rawls. Sen's footnote 19 flags the
crucial detail: you take on the other person's *subjective features including
their preferences*, not merely their objective circumstances. Objections
deferred to Ch 9.

# Conditions on choice rules, and why this chapter is here

§5.6 is the payoff, and it is where the chapter earns its place.

May's three conditions, on CCRs that already satisfy independence:

- **Anonymity (A).** Permuting preferences among individuals leaves social
  preference unchanged. Names do not matter.
- **Neutrality (N).** The rule does not discriminate between alternatives.
  Descriptions do not matter.
- **Positive responsiveness (S).** If $x$ was socially at least as good as $y$,
  and someone's preference shifts in favour of $x$ with no one else changing,
  then $x$ becomes strictly socially better.

**T.5\*1 (May 1952).** U, A, N and S are necessary and sufficient for a decisive
CCR to be the method of majority decision.

This is our first characterisation theorem, and our first result that says what
a rule *is* rather than what cannot exist. Then the bad news:

**Corollary 5\*1.1.** No SWF satisfies U, A, N and S. (Majority rule yields
intransitive social preference on some profiles.)

**T.5\*2.** No SDF satisfies them either, since majority rule can violate
acyclicity, not merely transitivity. Three voters, three alternatives,
$xP_1yP_1z$, $yP_2zP_2x$, $zP_3xP_3y$.

**The result to spend time on.** Weaken positive responsiveness to
*non-negative* responsiveness (if $x$ does not fall in anyone's ordering, it
must not fall socially), and the picture changes:

**T.5\*3.** For a CCR always yielding a quasi-transitive and complete social
preference relation, conditions U, I, P\* and A are together necessary and
sufficient for the CCR to be the Pareto-extension rule.

Sen's observation at p. 120 is the best thing in the chapter:

> It may also be noted that the difference between the majority rule and the
> Pareto-extension rule, which are rules in two very different traditions,
> appears to be rather small in terms of the underlying conditions.

Both satisfy independence, neutrality, non-negative responsiveness, the strict
Pareto principle, unrestricted domain and anonymity. The majority rule has
positive responsiveness and lacks quasi-transitivity; the Pareto-extension rule
has quasi-transitivity and lacks positive responsiveness. That is the entire
difference between the most majoritarian rule available and the rule that
refuses all distributional judgments.

> A shift from May's 'positive responsiveness' to Arrow's 'positive
> association' takes us almost all the way from the case of the majority rule
> to the very different case of the Pareto-extension rule.

**The methodological moral, which is why the chapter is placed here:**

> These conditions are difficult to judge in isolation and must be viewed along
> with the other conditions with which they may be combined. Judgments of this
> kind on the nature of the CCR tend to be non-basic, and it is relevant for us
> to enquire into the precise circumstances in which these might be used,
> before we put our signature on the dotted line.

So the basic/non-basic apparatus from §5.3 was being developed in order to say
this: our judgments about axioms are themselves non-basic value judgments,
revisable once we see what they imply. That is reflective equilibrium about
social choice axioms, written a year before Rawls named it.

# Unrestricted domain is a different kind of condition

Also §5.6, and a good closing thread because it sets up next class.

> Of these conditions, condition $U$ ... is in a somewhat different logical
> level from the rest. The other conditions specify or qualify what should be
> done given certain configurations of individual preferences. Condition $U$, on
> the other hand, asserts that the CCR must work for all possible
> configurations.

And footnote 21, which is worth reading out:

> The Marxist position that people's preferences depend on their class interests
> would immediately rule out certain preference configurations. In fact, any
> deterministic theory of individual preferences would tend to restrict the
> pattern of individual preferences, thereby reducing the need for the condition
> of unrestricted domain.

So whether U is a reasonable demand depends on your theory of preference
formation, which is not a question internal to social choice theory at all.
This is the same move as adaptive preferences, which Sen develops much later,
and it is the direct setup for single-peakedness next class.

---

# Quotes to have to hand

> In short, a society or an economy can be Pareto-optimal and still be perfectly
> disgusting.

(Ch 2, but the right epigraph for this chapter.)

On nihilism in welfare economics, quoting Baumol: studies bearing "an
ill-concealed resemblance to obituary notices".

On emotivism, quoting Ayer: "in the end there must come a point where one gets
no further answer, but only a repetition of the injunction: Value this because
it is valuable." Sen's reply is that there is no test for telling whether that
point has arrived.

---

# If we have time

**Is the basic/non-basic distinction exhaustive?** Sen's footnote 13: "It is not
asserted here that both the categories must be non-empty." So he allows that
there may be no basic value judgments at all. What would follow?

**The analogy Sen draws with scientific method** (p. 113): treat a judgment as
basic until a case shows otherwise, as one treats a factual hypothesis as true
until refuted. Does the analogy hold up? Falsification needs a notion of
observation, and the corresponding notion here is a reported counterfactual
judgment, which is not obviously evidence of the same kind.

---

# Next time

Back on schedule with Ch 10 and single-peakedness. The link: today's last point
is that U is a demand about which profiles can arise, and next class is about
what happens when you deny it.
