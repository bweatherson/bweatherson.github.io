## Two Kinds of Ignorance

In the games of the last chapter, players were sometimes ignorant about what had already happened. When a player has to move without knowing which node of the tree they are at, we represent that with an information set, and we say the game is one of **imperfect information**. Prisoners' Dilemma in extensive form is like this. The second player moves knowing the rules, knowing the payoffs, knowing everything about the game, and not knowing only what the first player just did.

There is a different thing a player might not know. They might not know what the game is. They might not know what the other player's payoffs are, and so not know what the other player is trying to achieve. Games like this are games of **incomplete information**.

The distinction matters and it is easy to lose, so it is worth putting the two side by side. In a game of imperfect information you know the whole payoff table and you don't know where you are in the tree. In a game of incomplete information you don't know the payoff table.

Almost every interesting application of game theory outside the classroom involves incomplete information. When you bargain over a used car you do not know how much the seller values it. When a firm decides whether to enter a market it does not know the incumbent's costs. When two states approach a crisis, neither knows how much the other is willing to lose. Writing down a payoff table and assuming both players can see it is a serious idealisation.

But we don't obviously have a theory for these cases. Our solution concepts all take a game as input, and a game is a payoff table. If the players don't know the payoff table, we cannot even say what game they are playing, and if we cannot say that, we cannot say what an equilibrium of it would be. Worse, there is a regress waiting. If Row doesn't know Col's payoffs, Row has beliefs about them. Col then has beliefs about Row's beliefs about Col's payoffs. And Row has beliefs about those. It looks like modelling ignorance about payoffs requires an infinite hierarchy of beliefs about beliefs, which is not something we can write on a page.

## Types

John Harsanyi found a way through this, and it is one of the great ideas in the subject. Games of incomplete information can be turned into games of imperfect information, which we already know how to handle.

The trick is to let the ignorance be about a move rather than about the game. We add a new player, **Nature**, who moves first, and whose move settles what the payoffs are. Nature's move is not a choice; it is a draw from a probability distribution that is common knowledge. The players then observe part of what Nature did, and not all of it.

What each player observes about Nature's move is called their **type**. A type settles everything about a player that the other players might be unsure of. In most of our examples the type just is the player's payoff function, but nothing turns on that. A type could encode how patient a player is, or how good they are at chess, or what they believe about the other player.

So a **Bayesian game** has:

- a set of players;
- for each player, a set of actions;
- for each player, a set of possible types;
- a probability distribution over the profiles of types, called the **prior**;
- for each player, a payoff function that depends on the actions of everyone
  and on their own type.

We assume the prior is common knowledge. This is the **common prior assumption**, and it is doing a lot of work. It says the players start out agreeing about how likely each type profile is, and disagree only because they have seen different draws. That assumption is not innocent, and philosophers have pushed on it hard. We will come back to it. For now, notice what it buys us: the infinite hierarchy of beliefs about beliefs collapses. Once the prior is common knowledge, a player's beliefs about the others' types are just the conditional probabilities they get from the prior, given their own type, and everyone can compute those.

You have already seen this construction without it being named. The signalling games later in this chapter all begin with an unfilled node marked $N$, with probabilities on the branches leading out of it. That is Nature, drawing a type for the player who is about to signal.

## Bayesian Nash Equilibrium

Once the game has been transformed this way, we can reuse Nash equilibrium almost unchanged. There is one adjustment to make first.

In a Bayesian game, a player knows their own type before acting. So a strategy cannot just be an action; it has to say what the player does for each type they might turn out to have. A **strategy** in a Bayesian game is a function from that player's types to that player's actions.

This is the point where students most often go wrong, so it's worth being heavy-handed about it. If Col has two types, then Col has *four* strategies, not two: do X whatever happens, do Y whatever happens, do X if the first type and Y if the second, or do Y if the first and X if the second. And Col will only ever perform one action in any play of the game. But the strategy has to be defined for the type Col didn't turn out to have, because Row's reasoning depends on what Col would have done in that case.

A **Bayesian Nash equilibrium** is then a profile of strategies, one for each player, such that each type of each player is choosing an action that maximises their expected payoff, given the strategies of the others and given the beliefs about the others' types that they get by conditioning the prior on their own type.

Equivalently, and this is the cleaner way to say it: a Bayesian Nash equilibrium is a Nash equilibrium of the imperfect information game that Harsanyi's transformation produces. We have not invented a new solution concept. We have found a way to describe a wider class of situations in terms we already had.

## An Example

Take Battle of the Sexes from the first chapter, and make one change. Row still wants to meet Col. But Row is no longer sure that Col wants to meet Row.

Col has two types. With probability $\nicefrac{1}{2}$ Col is *sociable*, and wants to meet, with the payoffs we saw before. With probability $\nicefrac{1}{2}$ Col is *elusive*, and would rather be wherever Row is not. Col knows which type Col is. Row does not.

If Col is sociable, the game is the one we already know.

+:--------+--:+:----:+:----:+
|         |   | **Col**     |
+---------+---+------+------+
|         |   | X    | Y    |
+---------+---+------+------+
| **Row** | X | 2, 1 | 0, 0 |
|         +---+------+------+
|         | Y | 0, 0 | 1, 2 |
+---------+---+------+------+

If Col is elusive, Row's payoffs are unchanged, and Col's are not.

+:--------+--:+:----:+:----:+
|         |   | **Col**     |
+---------+---+------+------+
|         |   | X    | Y    |
+---------+---+------+------+
| **Row** | X | 2, 0 | 0, 2 |
|         +---+------+------+
|         | Y | 0, 1 | 1, 0 |
+---------+---+------+------+

Look first at Col, who has it easy, because Col knows which table is live.

Sociable Col wants to match Row. If Row plays X, sociable Col gets 1 from X and 0 from Y, so plays X. If Row plays Y, sociable Col gets 0 from X and 2 from Y, so plays Y.

Elusive Col wants to mismatch. If Row plays X, elusive Col gets 0 from X and 2 from Y, so plays Y. If Row plays Y, elusive Col gets 1 from X and 0 from Y, so plays X.

Now Row, who has to average over the two. Suppose Col's strategy is *play X if sociable, Y if elusive*. Then Col plays X half the time and Y half the time, from Row's point of view, and Row's expected payoffs are

$$
E(X) = \nicefrac{1}{2} \times 2 + \nicefrac{1}{2} \times 0 = 1
$$

$$
E(Y) = \nicefrac{1}{2} \times 0 + \nicefrac{1}{2} \times 1 = \nicefrac{1}{2}
$$

So Row plays X. And we should check this is consistent: given that Row plays X, sociable Col does want to play X, and elusive Col does want to play Y. Nothing unravels, so we have a Bayesian Nash equilibrium.

Two things about this are worth pausing on.

The first is that Col's two types do different things, and that is what makes the whole exercise interesting. Row is not facing a single opponent with known motives. Row is facing a distribution over opponents, and has to pick an action that is good on average against it.

The second is that Row's behaviour looks, from the outside, exactly like behaviour in an ordinary game. Row picks X and sticks with it. The incomplete information is not visible in what Row does. But it is visible in why Row does it, and in what Row would have done had the probabilities been different. Suppose Col were sociable with probability $p$ rather than $\nicefrac{1}{2}$. Then Row's expected payoff from X is $2p$ and from Y is $1 - p$, so Row prefers X just when $p > \nicefrac{1}{3}$. Below that, Row gives up on meeting.

## Purification

We can now settle a debt from the chapter on mixed strategies.

The problem there was that mixed equilibria seem to require players to randomise, and it is not clear why anyone would. At a mixed equilibrium every pure strategy in the support does exactly as well as the mixture, so nothing recommends the mixture over any of them. The only thing a player's mixture accomplishes is keeping the *other* player indifferent, which is a strange thing for a self-interested agent to be aiming at.

Harsanyi's response is that the randomness is real but it is in the wrong place. It is not in anyone's decision. It is in the other player's ignorance.

The argument runs like this. Take a game with a mixed equilibrium and no pure one. Now perturb it slightly. Give each player a small amount of private information about their own payoffs: their true payoffs are the original ones plus some small random amount, and each player observes their own perturbation and not the other's. This is a Bayesian game, and the perturbation is the type.

In the perturbed game, almost every type has a strict best reply. A player whose private draw tips them slightly towards one action simply takes it. No one randomises; every type plays a pure strategy. But an opponent who cannot see the draw cannot predict the action, and from the opponent's point of view the player's behaviour is a probability distribution over actions.

Harsanyi's theorem is that as the perturbations shrink towards zero, that distribution converges to the mixed equilibrium of the original game. The mixed equilibrium is the limit of pure strategy Bayesian Nash equilibria of nearby games of incomplete information.

If that is right, the interpretive problem dissolves. Nobody was ever spinning a wheel. Each player was doing the determinate thing their own private situation called for, and the mixture was never a description of anyone's decision. It was a description of what the other player could work out.

Whether it is right is a further question, and there are two obvious places to push. The first is that the result is a limit claim, and the game we actually wanted to analyse is the one at the limit, where the perturbations are gone and the puzzle is back. The second is that the perturbed game is not the game we started with, so we can ask why facts about its neighbours should tell us what to do here. Neither objection is decisive. But both are worth taking seriously.
