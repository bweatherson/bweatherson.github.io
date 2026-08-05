# Which tables need captions

Put the caption on the line straight after the table, then a blank line:

```
: Prisoners' Dilemma {#tbl-pd}
```

and refer to it in the prose as `@tbl-pd`.

I looked for a natural small subset and did not find one. My first guess was that the
long chapters repeat the same game with different cells bolded, so only the first
instance would need naming. That is true of just 6 of the 73. The rest are genuinely
distinct: separate games, or fragments of one large matrix being worked through a corner
at a time, which is why chapter 3 has 25 of them.

So the honest answer is that if the goal is passing an accessibility checker, it is
about 70 captions. If the goal is readability, the ones that repay it most are:

- **every table in chapters 2 and 7** (29 of them), which are truth tables and voting
  profiles rather than payoff matrices, and which the prose refers back to repeatedly;
- **the tables that introduce a named game** in chapters 1, 4 and 6, where the caption is
  just the name and takes seconds;
- **the fragments in chapter 3** are the ones I would skip if skipping any. Several are
  explicitly partial views, introduced by phrases like "let's look at a fragment of the
  matrix" or "the top left corner", and a numbered caption on a corner of a matrix is
  more likely to confuse than help.

The `repeat` marker below flags the 6 that duplicate an earlier table's contents.


## 1 · Basics of Game Theory

`01-basics.qmd` — 9 tables

| line | | what it is |
|---:|:--|:--|
| 19 | **new** | Here is a representation of an important kind of two player simultaneous move game. |
| 69 | **repeat of line 19** | We've already seen a version of this game. |
| 81 | **new** | The general form of the game is given here, assuming $a > b > c > d$, and $2b > a + d$. |
| 97 | **new** | ok at is called Stag Hunt. We'll again do a version with commonly used numbers, then the general version. |
| 109 | **repeat of line 81** | The general version has $a > b > c > d$ and $b + c > a + d$ |
| 127 | **new** | I don't particularly like the name of this one, but it is common enough that you probably should know it. |
| 139 | **new** | Here's the general version, with $a > b > c$, |
| 155 | **new** | Our last game is not for the faint of heart. |
| 212 | **new** | ers play $Y$. Here is another game that isn't solved by the first step, but is solved by the second step. |

## 2 · Probability and Decision Theory

`02-decision-theory.qmd` — 7 tables

| line | | what it is |
|---:|:--|:--|
| 9 | **new** |  lists the (very approximate) population and land mass for England, Scotland, Wales and Northern Ireland. |
| 22 | **new** | sting, again approximately, the portion of the UK population and land mass in each of the four countries. |
| 51 | **new** | on, defined over the Boolean combinations of three propositions, if we're thinking about things this way. |
| 74 | **new** | st, we could set the probability of any line where $q$ is false to 0. So we will get the following table. |
| 87 | **new** | ualise this as multiplying by $\nicefrac{1}{\Pr(q)}$, i.e. by multiplying by 100. Then we'll end up with: |
| 190 | **new** | passes) and long (8+ passes). Imagine that we observed a bunch of games, and recorded the following data. |
| 198 | **new** | e other hand, medium to long possessions often end in goals. Let's add another column to make this clear. |

## 3 · Mixed Strategies and Nash Equilibrium

`03-nash-equilibrium.qmd` — 25 tables

| line | | what it is |
|---:|:--|:--|
| 29 | **new** |  Middle, and $D$, for Down, for Row's options, and $L$ for Left, and $R$ for Right, for Column's options. |
| 51 | **new** | o in the following example, $D$ is weakly dominated by $U$, but it is a best response given $\Pr(R) = 1$. |
| 63 | **new** | st response? It turns out the answer to this question is a little more complicated. Start with this game. |
| 89 | **new** |  $\langle U, 0.5; D, 0.5 \rangle$. We'll add this to the table, and note in the table its expected value. |
| 107 | **new** | M$ from a guaranteed 1 to a guaranteed 2. I've reprinted that here with the mixed strategy made explicit. |
| 127 | **new** |  to justify when playing against a rational opponent. Consider the following game from Row's perspective. |
| 141 | **new** | sidering domination; indeed domination by pure strategies.The following example is a little more complex. |
| 179 | **new** | Consider the following game: |
| 233 | **new** | trategy can't be part of an equilibrium either. This idea can help us find the equilibrium in some games. |
| 245 | **new** | t is really as if the strategy isn't even there. From that perspective, the table really looks like this. |
| 261 | **new** | the players Row and Col, as usual, and just use the number $n$ for the strategy of choosing location $n$. |
| 277 | **new** | Let's look at the opposite corner of the matrix. |
| 297 | **new** | t's turn to the comparison between Spot 1 and Spot 2. Again, we'll just look at a fragment of the matrix. |
| 315 | **new** | e that dominated strategy. Here's what the top left corner of the game matrix looks like when we do that. |
| 339 | **new** | e'll leave off columns 0 and 10, since they are dominated, and we have deleted those as possible options. |
| 369 | **new** | support for a mixed strategy equilibria could be. To see an example of this, consider the following game. |
| 387 | **new** | yoff for Row that does best, assuming Col makes that choice. Here's how the table looks after we do that. |
| 405 | **new** | le with ties. Now we'll go through Col's options, finding the best response to each possible play by Row. |
| 435 | **new** | We'll start by considering the very abstractly defined game. |
| 519 | **new** | has a choice, Speed or Not Speed. Row has a different choice, Detect or Not Detect. Here are the payoffs. |
| 533 | **new** | that there is too much speeding, and doubles the fine for speeding. Now the payoff table looks like this. |
| 549 | **new** | We'll work out the equilibria for the following game. |
| 563 | **new** | As a first step, we'll underline the best responses, and see if any equilibria turn up that way. |
| 577 | **new** | erform $b$; there is no reason to play $c$ since $a$ will always do 1 point better. So let's delete that. |
| 593 | **new** | er $A$. Option $A$ does better than $C$ whether Col plays $a$ or $b$. So let's delete option $C$ as well. |

## 4 · Other Equilibrium Concepts

`04-other-equilibria.qmd` — 10 tables

| line | | what it is |
|---:|:--|:--|
| 17 | **new** | ble. Consider, for example, this game (which is similar to some we've looked at in the previous chapter). |
| 55 | **new** |  choices there can be more separation between the two principles. Consider either of the following games. |
| 67 | **new** |  choices there can be more separation between the two principles. Consider either of the following games. |
| 89 | **new** |  the game table as this. (In reality it's more like a many move game, but this is a first approximation.) |
| 109 | **new** | n. (Perhaps it comes about if they really dislike waiting at lights while the other person goes through.) |
| 129 | **repeat of line 109** | m that maximises expected returns, but that takes some more time. Let's look again at the previous table. |
| 208 | **new** |  end up being chosen. Consider, for instance, the following three games (two of which we've seen before). |
| 218 | **new** |  end up being chosen. Consider, for instance, the following three games (two of which we've seen before). |
| 228 | **new** |  end up being chosen. Consider, for instance, the following three games (two of which we've seen before). |
| 294 | **new** | e Sexes have a risk-dominant equilibrium. An asymmetric Meeting game, however, does. Here is one example. |

## 5 · Games and Time

`05-games-and-time.qmd` — 8 tables

| line | | what it is |
|---:|:--|:--|
| 44 | **new** | ible strategies. Let's record the giant table listing the outcomes if they play each of those strategies. |
| 70 | **new** |  $L$ in the top-left corner has to be changed to a $D$. But it requires making many changes to the table. |
| 231 | **new** | w and Player II on the column. (We'll also do this from now on unless there is a reason to do otherwise.) |
| 261 | **new** | ayer I plays Left, and $g$ if Player plays $R$. But writing out the able reveals another Nash equilibria. |
| 318 | **new** | letter for one of Row's options here; this is to distinguish the $d$ of down from the $D$ of Don't burn.) |
| 330 | **new** | ll write $lr$ for the strategy of playing $l$ if $D$, and $r$ if $B$, and so on for the other strategies. |
| 392 | **new** | for a *two* round iterated Prisoners' Dilemma, but it is crucial that it is actually a three-round game.) |
| 416 | **new** | $ is strongly dominated by $DDD$. Similarly $ccc$ and $dcc$ are strongly dominated. So let's delete them. |

## 6 · Bayesian Games

`06-bayesian-games.qmd` — 2 tables

| line | | what it is |
|---:|:--|:--|
| 56 | **new** | If Col is sociable, the game is the one we already know. |
| 68 | **repeat of line 56** | If Col is elusive, Row's payoffs are unchanged, and Col's are not. |

## 7 · Group Decisions

`07-group-decisions.qmd` — 12 tables

| line | | what it is |
|---:|:--|:--|
| 42 | **new** |  first, 3 to each second place, etc. The points that each friend awards are given by the following table. |
| 55 | **new** | riend to give each restaurant a score out of 10, and add up the scores. Here is how the numbers fall out. |
| 131 | **new** | r lists the choices from their first preference, on top, to their least favourite option, on the bottom.) |
| 142 | **new** | at's what independence of irrelevant alternatives says. So now we'll be left with the following rankings. |
| 160 | **repeat of line 131** | nce ordering in the formal sense we're interested in. Consider the following distribution of preferences. |
| 181 | **new** | This is a rather odd conclusion I think. Imagine that we have four voters with the following preferences. |
| 217 | **new** | p of each column representing the percentage of voters who have the preference ordering listed below it.) |
| 246 | **new** | roduce. For instance, imagine that there are four candidates, and the arrangement of votes is as follows. |
| 256 | **new** | t happens if $D$ drops out of the election, or all of $D$'s supporters decide to vote more strategically. |
| 277 | **new** | ility. The following situation does arise, though rarely. Imagine the voters are split the following way. |
| 286 | **new** |  way they vote, voting for $C$ instead of their preferred candidate $A$, so now the votes look like this. |
| 332 | **repeat of line 217** | ted from first preference to last preference, with stars indicating which candidates the voters vote for. |

---

**73 tables: 67 new, 6 repeats, of which 3 are already captioned.**
