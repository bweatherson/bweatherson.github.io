## What Is a Mixed Strategy?

Back at the start of the chapter we assumed that players have mixed strategies available, and noted that it is a delicate question what that assumption amounts to. We now have the tools to see why the question is hard, and to say more than we could then.

Start with the feature of mixed equilibria that generates the difficulty. At a mixed equilibrium, every pure strategy in the support has the same expected return as the mixture itself. That is exactly what we exploited when we found these equilibria: we solved for the probabilities that made the *other* player indifferent. But it means that at the equilibrium, a player has no reason at all to play the mixture rather than any of the strategies in its support. Playing $U$ for certain does exactly as well as playing $\langle U, 0.5; D, 0.5 \rangle$, given what the other player is doing.

Compare a pure strategy equilibrium. There, deviating makes you strictly worse off, and that is why you stay. In a mixed equilibrium nothing pushes you towards the equilibrium mixture. The only thing your mixture accomplishes is keeping the other player indifferent, which is an odd thing for a self-interested agent to be aiming at.

So the usual story about equilibrium, that each player is doing the best they can for themselves, does not explain why anyone would mix in the proportions the equilibrium specifies. This is where the interpretive question stops being idle.

### Objective Chance

On the first of our three interpretations, playing a mixed strategy is using a randomising device, and the probabilities are objective chances.

This is the original reading. @vonneumann1944 introduced mixtures precisely so that an opponent could not find out what you were going to do, and it is the natural reading for poker, or for a tax authority deciding which returns to audit, where being predictable is what you most want to avoid. Professional athletes do come close to the predicted mixtures; there is a small empirical literature on tennis serves and penalty kicks.

The trouble is that the indifference puzzle survives untouched. Having a randomising device is one thing. Having a reason to set it to those particular odds is another, and the equilibrium gives you none.

There is a weaker version of the same thought that is worth separating out. What matters, one might say, is not that I actually use a randomiser, but that you cannot tell the difference between what I am doing and a chance process. On this version I might be running something perfectly deterministic; if you cannot model it, then as far as the game is concerned it is a mixture. Notice that this has quietly relocated the probability from my machinery to your ignorance, which makes it a step towards the epistemic reading rather than a version of this one.

### Frequentist

On the second interpretation the mixture is not in anyone's head. It is a long-run frequency, which makes the probabilities objective in something like Reichenbach's sense.

One distinction matters here and is easy to lose. Frequencies over independent plays of the same one-shot game are one thing. Frequencies over rounds of a repeated game are another. A repeated game is a different game, with a much larger strategy space and its own equilibria, as we will see when we come to the iterated Prisoners' Dilemma. Sliding between the two makes this interpretation look easier than it is.

There is a variant that avoids the problem by moving from one player to many. On the **population** reading, the mixture describes a population rather than a person: some fraction of players are $U$-types who always play $U$, the rest are $D$-types, and nobody randomises at all. The equilibrium becomes a fact about how the population is composed, and the interesting question is which compositions are stable. This is the entry point to evolutionary game theory, which we are not doing in this course. @skyrms1996 is where to go if you want to follow it up.

### Epistemic

The third interpretation gives up on the idea that anyone randomises.

@aumannbrandenburger1995 develop the strongest version of this. Row plays some pure strategy. The mixture attributed to Row is Col's *belief* about what Row will do. Row's indifference is then not a puzzle about Row's motivation at all; it is a fact about Col's uncertainty.

This is a larger revision than it first appears. On the standard picture an equilibrium is a profile of actions. On this one it is a profile of conjectures, and the theorem to prove is that mutual knowledge of rationality and of the conjectures forces those conjectures into the pattern that Nash equilibrium describes. It also dissolves the indifference puzzle rather than answering it: there was never a decision to explain, because nobody was choosing a mixture.

### Where This Leaves Us

The three readings disagree about where the probability lives: in a device, in a sequence of plays, or in someone's beliefs. They also disagree about what an equilibrium is a claim about. The first makes it a claim about individual behaviour, the second about a series or a population, the third about states of information.

There is a fourth answer, due to Harsanyi, which says the randomness is real but sits in the other player's ignorance of your exact payoffs. We cannot state it properly yet, because it needs machinery we have not built. We will come back to it in the chapter on Bayesian games.

You do not have to choose between these. You do have to notice that "the players mix 50-50" is not yet a claim with a settled meaning.
