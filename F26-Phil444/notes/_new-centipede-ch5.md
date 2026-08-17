## The Centipede {#sec-centipede}

In **Cooperative Caterpillar**, backwards induction reasoning gets the players to the outcome that many people would say is intuitive. Stalnaker's objection is that the reasoning doesn't go through in theory, but at least you might say it works in practice. Once we make the game less cooperative, backwards induction reasoning ceases to be either intuitive, or to match what we see in experimental settings.

The game is due to @rosenthal1981, and is usually called the **centipede**, because that is what the diagram looks like once you draw enough legs on it.

Two players alternate. At each turn a player can take the larger share of a growing pot, ending the game, or pass, in which case the pot grows and the other player faces the same choice. @tbl-centipede is a short version, with four decision nodes.

+:----------+:-------:+:-------:+:-------:+:-------:+:-------:+
| **Node**  | 1       | 2       | 3       | 4       | end     |
+-----------+---------+---------+---------+---------+---------+
| **Mover** | Alice   | Bob     | Alice   | Bob     |         |
+-----------+---------+---------+---------+---------+---------+
| **Take**  | 2, 0    | 1, 3    | 4, 2    | 3, 5    |         |
+-----------+---------+---------+---------+---------+---------+
| **Pass**  | on      | on      | on      | on      | 6, 4    |
+-----------+---------+---------+---------+---------+---------+

: A short version of centipede {#tbl-centipede}

Read that as follows. If Alice takes at node 1, she gets 2 and Bob gets 0. If she passes, Bob chooses at node 2, where taking gets him 3 and gets Alice 1. And so on. If everyone passes at every node, they end at 6, 4.

Notice two things about the payoffs. First, the total grows: 2 at the first node, 4 at the second, 6 at the third, 8 at the fourth, 10 at the end. Passing always makes the pie bigger. Second, at each node the mover does better by taking now than by taking one round later. Alice gets 2 by taking at node 1 and only 1 if Bob takes at node 2.

Now look what happens when we step through the backwards induction reasoning. At node 4, Bob compares taking, which gets him 5, with passing, which gets him 4. So Bob takes. Given that, at node 3 Alice compares taking, which gets her 4, with passing, which leads to Bob taking and gets her 3. So Alice takes. Given that, at node 2 Bob compares 3 with the 2 he gets when Alice takes at node 3. So Bob takes. And given that, at node 1 Alice compares 2 with the 1 she gets when Bob takes at node 2. So Alice takes at node 1.

The unique subgame perfect equilibrium is that Alice takes immediately, and the players walk away with 2 and 0. They never reach the part of the tree where the money is. Moreover, we could have let the game go on arbitrarily long, and this would have been the same result. As long as there's a final node, where one player knows the game will end no matter what they do, backwards induction reasoning can get started, and it results in Alice taking at node 1.

This is really strange. No individual step is strange. Bob really should take rather than pass at the last step. It is fairly plausible that Alice should take rather than pass at the second last step. But if we add up enough of these plausible steps, we get something quite implausible.

The implausibility is not just that they end up with a result that is worse, for both of them, than what they could have got. One-shot prisoners' dilemma has that structure, and we mostly think that it's tragic, rather than irrational, that the players end up in a Pareto-inferior outcome.

Rather, the implausibility is that it feels like there is a way for them to have done better. By passing in the early rounds, they can give each other good reason to think that they will keep on passing, and hence a reason to pass themselves. Think about what happens too the backwards induction reasoning if anyone deviates. (This will be just like what Stalnaker says goes wrong in **Cooperative Caterpillar**.) Suppose Alice passes at node 1. Bob now has to decide what to do at a node that backwards induction says should never be reached. The argument for taking at node 2 ran through the claim that Alice will take at node 3, and that claim was derived from the assumption that Alice is rational. But Alice has just done the thing that assumption ruled out.

So what should Bob believe? There are at least three answers, and each has been defended.

- Alice made a mistake, a slip of the hand, and is otherwise rational. Then Bob should still expect her to take at node 3, and should take now.
- Alice is not rational after all. Then Bob has no idea what she will do at node 3, and the backwards induction argument for taking at node 2 has lost its premise.
- Alice is rational, and is signalling that she intends to pass again, in the hope that Bob will pass too and they will both do better. This is forward induction reasoning of the kind we saw in the **Money Burning Game**, and on this reading Bob should pass.

The centipede is therefore not just a puzzle about whether backwards induction gives the right answer. It is a puzzle about what the assumption of common knowledge of rationality is even saying, given that the reasoning it licenses runs through nodes that it says will never be reached. Stalnaker's discussion of **Cooperative Caterpillar** is designed to show that we can see the same mistake in backwards induction reasoning even in cases where it gets the intuitive right answer, and that hence the first option here is mistaken.

There is an empirical footnote. When people play centipede games in the laboratory, they mostly do not take at the first node. They pass for a while and take somewhere in the middle. That does not settle anything about what is rational, but it does mean the theory is predicting something that does not happen, which is at least a reason to look at the theory again.
