---
format: typst
title: "How Likely Is a Cycle? The Spatial Version of Sen's §10.2 Question"
---

Background note for the Ch 10 class. Sen's §10.2 asks for the probability of
cyclical majorities under the "impartial culture" assumption that all orderings
are equally likely, and reports Guilbaud's 8.77% limit for three alternatives
(Table 10.1) and the rise towards 1 as the number of alternatives grows
(Table 10.2). Sen is rightly unhappy with the assumption. Footnote 4:

> In this 'impartial culture', given a two-alternative choice between my being
> beheaded at dawn and my living on, the probability of my preferring either to
> the other will be exactly one-half. I protest.

The natural repair is to put voters and alternatives in a Euclidean space and
let preference be given by distance. That is the spatial model, and it is the
right setting for the question, because single-peakedness is the $k=1$ case of
it. This note reports what the literature has and what it does not, and gives
simulation results for the general case.

# The question

$n$ voters and $m$ alternatives are points drawn independently from some
distribution on $\mathbb{R}^k$. Voter $v$ prefers alternative $A$ to $B$ when
$\lVert v - A \rVert < \lVert v - B \rVert$. What is the probability that the
majority relation over the $m$ alternatives has no Condorcet winner?

For $k = 1$ the answer is zero: Euclidean preferences on a line are
single-peaked, so Black's theorem applies. Everything else is open territory.

# What the literature has

The literature splits into two streams that do not quite meet in the middle.

**Stream one takes every point in the space to be an alternative.** This is the
$m \to \infty$ limit. Plott (1967) gives the radial symmetry condition for a
core to exist, and it is knife-edge. McKelvey (1976, 1979) shows that when
symmetry fails, which is almost always, the top cycle is the entire space.
Schofield (1978, 1983) adds genericity results. The verdict here is maximally
pessimistic, and it is the result usually quoted.

**Stream two takes a finite set of alternatives and random preference
orderings.** This is Sen's §10.2: Guilbaud (1952), Garman and Kamien (1968),
Niemi and Weisberg (1968), later Gehrlein and Fishburn. It is not spatial at
all, and it inherits exactly the objection in Sen's footnote 4. The most recent
work here is Sauermann (arXiv:2203.13713, 2022), which shows that under
impartial culture with $2k-1$ voters and $n$ alternatives the probability of a
Condorcet winner is $\Theta(n^{-(k-1)/k})$, and which disproves Gehrlein's
conjecture that impartial culture minimises that probability.

**The bridge between them is the yolk.** The yolk is the smallest ball meeting
every median hyperplane; the concept is due to McKelvey (1986), building on
Ferejohn, McKelvey and Packel (1984). The useful fact is a bound on win sets:
$Y$ beats $X$ only if $Y$ is at most $2r$ further from the yolk centre than $X$
is, where $r$ is the yolk radius. Feld, Grofman and Miller (1988) and Tovey
("The Almost Surely Shrinking Yolk", 1990 working paper, later in *Mathematical
Social Sciences*) show the expected yolk radius goes to zero as the number of
voters grows, for centred distributions. Tovey left the rate open; simulations
reported in Miller's survey suggest an inverse square root law in $n$.

That bound does the work for our question. If the yolk shrinks and the
alternatives are fixed in number, then the alternative nearest the yolk centre
beats everything else as soon as $2r$ is smaller than the gaps between the
alternatives' distances to the centre. So a Condorcet winner should exist with
probability approaching one as $n$ grows with $m$ fixed. I have not found this
stated as a theorem.

**What I could not find.** Nobody appears to have computed the probability for
the general case with $n$, $m$ and $k$ all finite and both voters and
alternatives drawn at random. The closest thing by title is Good and Tideman,
"From individual to collective ordering through multidimensional attribute
space", *Proceedings of the Royal Society of London A* 347 (1976): 371–385,
which is the source of what Song (2021) calls the "normal spatial model", with
ideal points drawn from a multivariate normal. I could not get at the paper and
have not verified what it proves. **That is the one to check before relying on
any of this.**

Simulation work exists but is scattered and mostly two-dimensional: Koehler
(1990), Hug (1999), Bräuninger (2007), Miller (2007), and Tideman and Plassmann
(2012), who report a cycle in 0.53% of simulated elections with 1,000 voters,
falling towards zero as $n$ grows. I have that figure at second hand from Song
(2021) rather than from Tideman and Plassmann directly.

# Simulation

Since the general numbers do not seem to be in print, here they are. Voters and
alternatives are drawn independently from the same distribution, either standard
normal or uniform on the unit cube in $\mathbb{R}^k$. 20,000 trials per cell.
Entries are the proportion of trials with no Condorcet winner.

## Points drawn from a standard normal

| $n$ | $m$ | $k=1$ | $k=2$ | $k=3$ | $k=5$ | $k=10$ |
|---:|---:|---:|---:|---:|---:|---:|
| 3 | 3 | 0.0000 | 0.0140 | 0.0173 | 0.0179 | 0.0215 |
| 3 | 5 | 0.0000 | 0.0459 | 0.0575 | 0.0688 | 0.0741 |
| 3 | 10 | 0.0000 | 0.1268 | 0.1510 | 0.1711 | 0.1716 |
| 11 | 3 | 0.0000 | 0.0100 | 0.0135 | 0.0156 | 0.0173 |
| 11 | 5 | 0.0000 | 0.0391 | 0.0452 | 0.0481 | 0.0519 |
| 11 | 10 | 0.0000 | 0.1152 | 0.1241 | 0.1224 | 0.1217 |
| 51 | 3 | 0.0000 | 0.0040 | 0.0043 | 0.0048 | 0.0056 |
| 51 | 5 | 0.0000 | 0.0137 | 0.0141 | 0.0152 | 0.0152 |
| 51 | 10 | 0.0000 | 0.0371 | 0.0398 | 0.0353 | 0.0355 |
| 201 | 3 | 0.0000 | 0.0008 | 0.0017 | 0.0016 | 0.0014 |
| 201 | 5 | 0.0000 | 0.0037 | 0.0036 | 0.0038 | 0.0041 |
| 201 | 10 | 0.0000 | 0.0112 | 0.0100 | 0.0098 | 0.0100 |
| 1001 | 3 | 0.0000 | 0.0001 | 0.0006 | 0.0002 | 0.0001 |
| 1001 | 5 | 0.0000 | 0.0010 | 0.0008 | 0.0004 | 0.0005 |
| 1001 | 10 | 0.0000 | 0.0024 | 0.0018 | 0.0019 | 0.0018 |

## Points drawn uniformly from the unit cube

| $n$ | $m$ | $k=1$ | $k=2$ | $k=3$ | $k=5$ | $k=10$ |
|---:|---:|---:|---:|---:|---:|---:|
| 3 | 3 | 0.0000 | 0.0150 | 0.0231 | 0.0293 | 0.0358 |
| 3 | 5 | 0.0000 | 0.0526 | 0.0732 | 0.0917 | 0.1032 |
| 3 | 10 | 0.0000 | 0.1370 | 0.1749 | 0.2079 | 0.2233 |
| 11 | 3 | 0.0000 | 0.0173 | 0.0244 | 0.0278 | 0.0318 |
| 11 | 5 | 0.0000 | 0.0560 | 0.0746 | 0.0839 | 0.0881 |
| 11 | 10 | 0.0000 | 0.1325 | 0.1553 | 0.1729 | 0.1918 |
| 51 | 3 | 0.0000 | 0.0076 | 0.0101 | 0.0095 | 0.0106 |
| 51 | 5 | 0.0000 | 0.0190 | 0.0249 | 0.0309 | 0.0314 |
| 51 | 10 | 0.0000 | 0.0456 | 0.0515 | 0.0583 | 0.0657 |
| 201 | 3 | 0.0000 | 0.0022 | 0.0032 | 0.0039 | 0.0036 |
| 201 | 5 | 0.0000 | 0.0064 | 0.0073 | 0.0084 | 0.0102 |
| 201 | 10 | 0.0000 | 0.0114 | 0.0126 | 0.0179 | 0.0186 |
| 1001 | 3 | 0.0000 | 0.0004 | 0.0008 | 0.0006 | 0.0006 |
| 1001 | 5 | 0.0000 | 0.0011 | 0.0018 | 0.0026 | 0.0016 |
| 1001 | 10 | 0.0000 | 0.0027 | 0.0028 | 0.0032 | 0.0043 |

## Letting the alternatives fill the space ($k=2$, uniform, 10,000 trials)

| $m$ | $n=3$ | $n=11$ | $n=51$ |
|---:|---:|---:|---:|
| 3 | 0.0141 | 0.0193 | 0.0067 |
| 5 | 0.0507 | 0.0537 | 0.0212 |
| 10 | 0.1342 | 0.1316 | 0.0429 |
| 20 | 0.2627 | 0.2523 | 0.0844 |
| 50 | 0.4427 | 0.4804 | 0.1961 |
| 100 | 0.5677 | 0.6741 | 0.3462 |
| 200 | 0.6803 | 0.8347 | 0.5515 |
| 400 | 0.7545 | 0.9335 | 0.7515 |

## Decay in the number of voters ($m=3$, $k=2$, 60,000 trials)

| $n$ | normal | uniform |
|---:|---:|---:|
| 11 | 0.01013 | 0.01818 |
| 21 | 0.00728 | 0.01325 |
| 51 | 0.00330 | 0.00755 |
| 101 | 0.00177 | 0.00425 |
| 201 | 0.00098 | 0.00203 |
| 501 | 0.00055 | 0.00123 |
| 1001 | 0.00022 | 0.00063 |
| 2001 | 0.00015 | 0.00018 |

# What the numbers say

**Dimension matters much less than the literature's tone suggests.** The whole
qualitative difference is between $k=1$ and $k=2$. After that the curve is
nearly flat: going from three dimensions to ten barely moves the number, and in
the normal case sometimes moves it down. If you had only read McKelvey you would
expect high dimensionality to be catastrophic. With a finite set of alternatives
it is not.

**The number of alternatives is what drives cycles.** Going from three
alternatives to ten multiplies the probability by roughly eight, at every $n$
and every $k$. The last table shows where this ends up: with the number of
voters held fixed and the alternatives allowed to fill the space, the
probability climbs towards one. That is the Plott and McKelvey result arriving
as a limit rather than a theorem, and it shows what those results are really
about. They are about the density of the alternative set, not about dimension.

**The number of voters pushes hard the other way.** With three alternatives and
a thousand voters the probability is a few in ten thousand. Over the range where
my estimates are reliable the decay is roughly $n^{-0.75}$, which sits between
the $n^{-1/2}$ that the shrinking-yolk heuristic suggests and $n^{-1}$. I cannot
pin the exponent down: the large-$n$ cells have very few events, so the
estimates there are noisy, and the apparent steepening at the bottom of the last
table should not be trusted. A plausible story for an exponent above $1/2$ is
that a yolk-bound failure is necessary but not sufficient for a cycle.

**The two limits pull in opposite directions**, which is the useful thing to
tell the class. Whether cycles are a real problem in the spatial model is not a
question about dimension. It is a question about the ratio of alternatives to
voters.

# Caveats

The alternatives are drawn from the same distribution as the voters. Real
candidates are not positioned at random and tend to cluster where voters are,
which is Miller's argument for why cycles are rarer in practice than the
geometry suggests. Drawing alternatives from a more dispersed distribution would
push the numbers up.

The uniform and normal cases differ by roughly a factor of two throughout, so
the distribution is doing real work and none of these figures should be quoted
without it.

Simulation code: `tools/condorcet-cycles.py`.
