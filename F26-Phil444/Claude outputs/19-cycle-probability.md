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
alternatives drawn at random. Good and Tideman (1976) was the obvious candidate,
since it is the source of what later writers call the "normal spatial model" and
its title is almost the question. I have now read it, and it is not about this.
See the next section. So the gap looks real.

Simulation work exists but is scattered and mostly two-dimensional: Koehler
(1990), Hug (1999), Bräuninger (2007), Miller (2007), and Tideman and Plassmann
(2012), who report a cycle in 0.53% of simulated elections with 1,000 voters,
falling towards zero as $n$ grows. I have that figure at second hand from Song
(2021) rather than from Tideman and Plassmann directly.

# What Good and Tideman actually do

I. J. Good and T. N. Tideman, "From individual to collective ordering through
multidimensional attribute space", *Proceedings of the Royal Society of London
A* 347 (1976): 371–385.

It is an estimation paper, and it contains no result about how often cycles
occur. The setup is close to ours: $N$ candidates at points in an attribute
space, $M$ voters whose ideal points are treated as multivariate normal with
mode $O$, spherical indifference surfaces, preference by distance. The
$\frac{1}{2}N(N-1)$ perpendicular bisecting hyperplanes meet at the circumcentre
$P$ and cut the space into $N!$ sectors, one for each rank order. Integrating
the normal density over sector $\nu$ gives the vote share $p_\nu$ that the model
predicts for that ordering.

The question they ask is the inverse one. Given the *observed* shares $q_\nu$,
where must the candidates be? They fit candidate positions by minimising
$\sum_\nu (p_\nu - q_\nu)^2$, and then take the collective ordering to be the
rank order of the distances $OX_1, \ldots, OX_N$ from the mode, which is the
same as the ordering labelling the sector that contains $O$.

The fit is overdetermined, and that is the heart of the paper. Vote shares have
$N! - 1$ degrees of freedom while candidate configurations have only
$\frac{1}{2}(N^2 + N - 4)$. For three candidates that is five against four, so a
perfect fit is generally unavailable and the residual is the price.

Two things in it are worth the class's time anyway.

**Their worked example is a cycle that their rule resolves.** Example (ii), 34
votes over three candidates, has $A$ beating $B$, $B$ beating $C$ and $C$
beating $A$. Their method returns $BCA$. Borda returns $BAC$. So here is a rule
that takes a cyclic profile, returns an ordering, and disagrees with Borda while
doing it. Their third example uses the 1972 American National Election Study
thermometer scores, 2,521 respondents ranking Nixon, Kennedy and McGovern, and
there their order and the Borda order agree.

**Their reply to Arrow is a rejection of condition $I$ on epistemological
grounds.** This is the part I would actually use. They treat a collective
ordering as an *estimate*:

> In practice the best that any ordering procedure can achieve is to make an
> *estimate* of the 'Platonic' orderings of the candidates, just as a
> statistical sample can lead only to an estimate of a population parameter.
> Pursuing this analogy, we assert that if the set of candidates changes,
> thereby changing the available evidence, then there is no reason why a
> collective ordering of a pair should not sometimes be reversed, just as the
> estimate of a statistical parameter varies with the sample. In particular,
> pair-consistency should not be regarded as a desideratum in our opinion.

Then the barb: "Unreasonable assumptions lead to unreasonable conclusions." They
put Buchanan (1954) and Plott (1971) alongside themselves.

That is a line on Arrow we have not met. The Ch 10 escapes restrict the domain;
the Ch 4 escapes weaken collective rationality; this one says independence was
never a reasonable demand, because adding a candidate adds evidence. It connects
straight to §5.6 on judging conditions by what they imply rather than in
isolation, and it would carry a seminar on its own.

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

# Does a bigger electorate help?

Yes, past about seven voters. Below that it hurts slightly. $m=3$, $k=2$,
200,000 trials a cell, two standard errors shown.

| $n$ | normal | uniform |
|---:|---:|---:|
| 3 | 0.01221 $\pm$ 0.00049 | 0.01554 $\pm$ 0.00055 |
| 5 | 0.01385 $\pm$ 0.00052 | 0.01904 $\pm$ 0.00061 |
| 7 | 0.01333 $\pm$ 0.00051 | 0.01960 $\pm$ 0.00062 |
| 9 | 0.01202 $\pm$ 0.00049 | 0.01856 $\pm$ 0.00060 |
| 11 | 0.01112 $\pm$ 0.00047 | 0.01809 $\pm$ 0.00060 |
| 15 | 0.00908 $\pm$ 0.00042 | 0.01605 $\pm$ 0.00056 |
| 21 | 0.00752 $\pm$ 0.00039 | 0.01341 $\pm$ 0.00051 |
| 31 | 0.00517 $\pm$ 0.00032 | 0.01021 $\pm$ 0.00045 |
| 51 | 0.00354 $\pm$ 0.00027 | 0.00809 $\pm$ 0.00040 |
| 75 | 0.00236 $\pm$ 0.00022 | 0.00553 $\pm$ 0.00033 |
| 101 | 0.00182 $\pm$ 0.00019 | 0.00428 $\pm$ 0.00029 |

There is a small hump at the bottom, peaking around five to seven voters, and
the rise is well outside sampling error in both columns. After that the decline
is steady.

**This is the reverse of Sen's Table 10.1.** Under impartial culture the
probability *rises* with the electorate, from 0.0556 at three voters to 0.0877
in the limit. In the spatial model it falls, and by a hundred voters it is an
order of magnitude below where it started. The two models disagree about the
sign of the effect of population size, which is as sharp a demonstration as one
could want that the impartial-culture assumption is not a harmless idealisation.

# How wide is the feasible set?

The alternatives need not come from the same distribution as the voters. What
matters is the ratio of the two spreads. Voters are $N(0, I)$ and alternatives
are $N(0, s^2 I)$, so $s$ small means the options on the table are close
together relative to how much the electorate disagrees. $n = 51$, 60,000 trials
a cell.

| $s$ | $m=3$, $k=2$ | $m=5$, $k=2$ | $m=10$, $k=2$ | $m=3$, $k=3$ | $m=5$, $k=3$ | $m=10$, $k=3$ |
|---:|---:|---:|---:|---:|---:|---:|
| 0.05 | 0.0556 | 0.1777 | 0.3725 | 0.0695 | 0.2108 | 0.4312 |
| 0.1 | 0.0512 | 0.1685 | 0.3971 | 0.0622 | 0.1950 | 0.4364 |
| 0.25 | 0.0288 | 0.1047 | 0.2863 | 0.0351 | 0.1179 | 0.3027 |
| 0.5 | 0.0119 | 0.0412 | 0.1239 | 0.0153 | 0.0485 | 0.1289 |
| 1.0 | 0.0033 | 0.0130 | 0.0375 | 0.0040 | 0.0142 | 0.0382 |
| 2.0 | 0.0007 | 0.0035 | 0.0094 | 0.0010 | 0.0038 | 0.0098 |
| 4.0 | 0.0001 | 0.0009 | 0.0029 | 0.0003 | 0.0011 | 0.0021 |
| 10.0 | 0.0000 | 0.0001 | 0.0005 | 0.0000 | 0.0002 | 0.0003 |

This single ratio swings the answer across three orders of magnitude, and it
swings it the opposite way from what one might guess. A *widely* scattered set
of options produces almost no cycles, because relative to the spread of the
options the whole electorate sits at nearly one point and nearly everyone ranks
them the same way. A *tightly clustered* set produces many, because every
bisecting hyperplane then passes close to the centre of the electorate and
splits it near fifty-fifty, so every pairwise comparison is nearly a tie.

The moral for modelling: if the alternatives are policies whose availability is
fixed by exogenous feasibility rather than by candidates choosing where to
stand, then the clustering worry goes away, but a different question has to be
answered. Are the feasible options marginal variations on each other, with the
electorate spread across a wide range of ideals? That is the small-$s$ regime,
and it is the bad one. Budget allocations that differ at the edges, chosen by a
population with genuinely divergent ideal points, sit exactly there.

# Impartial culture is a limit of the spatial model

Push $s$ towards zero and raise the dimension, and the spatial numbers climb
towards Sen's tables. $n = 51$, 60,000 trials a cell.

| $k$ | $s$ | $m=3$ | $m=5$ | $m=10$ |
|---:|---:|---:|---:|---:|
| 2 | 0.05 | 0.0556 | 0.1798 | 0.3717 |
| 2 | 0.01 | 0.0609 | 0.1730 | 0.3224 |
| 2 | 0.001 | 0.0603 | 0.1680 | 0.3098 |
| 3 | 0.05 | 0.0672 | 0.2079 | 0.4312 |
| 3 | 0.01 | 0.0720 | 0.2074 | 0.4001 |
| 3 | 0.001 | 0.0717 | 0.2061 | 0.3895 |
| 5 | 0.05 | 0.0759 | 0.2267 | 0.4593 |
| 5 | 0.01 | 0.0795 | 0.2238 | 0.4422 |
| 5 | 0.001 | 0.0771 | 0.2292 | 0.4378 |
| 9 | 0.05 | 0.0791 | 0.2331 | 0.4714 |
| 9 | 0.01 | 0.0830 | 0.2347 | 0.4631 |
| 9 | 0.001 | 0.0831 | 0.2346 | 0.4582 |

Sen's figures for comparison: 0.0877 for three alternatives (Table 10.1,
limiting value), 0.2513 for five and 0.4887 for ten (Table 10.2). At $k=9$ and
$s = 0.001$ the three-alternative cell reads 0.0831, and Sen's Table 10.1 gives
0.0843 at twenty-five voters, so with fifty-one voters the match is essentially
exact.

**Why the dimension matters here and nowhere else.** The $\frac{1}{2}m(m-1)$
bisecting hyperplanes cut $\mathbb{R}^k$ into cells, one per realisable
ordering, and the number of cells is at most
$\sum_{i=0}^{k}\binom{m(m-1)/2}{i}$, which is polynomial in $m$ rather than
factorial.

| $m$ | $m!$ | $k=2$ | $k=3$ | $k=5$ | $k=9$ |
|---:|---:|---:|---:|---:|---:|
| 3 | 6 | 6 | 6 | 6 | 6 |
| 5 | 120 | 56 | 120 | 120 | 120 |
| 10 | 3,628,800 | 1,036 | 15,226 | 1,385,980 | 3,628,800 |

In two dimensions, ten alternatives admit only about a thousand of the three
and a half million possible orderings. The spatial model is *automatically*
value-restricted, in Sen's sense, by its own geometry, and the restriction is
drastic at low dimension. Raise $k$ past $m-1$ and the restriction disappears,
every ordering becomes realisable, and with the feasible set shrunk to a point
the model reproduces impartial culture.

So Sen's Tables 10.1 and 10.2 are not an arbitrary assumption after all. They
are the limiting worst case of the spatial model: options as close together as
possible, issue space as high-dimensional as possible. That is a better defence
of those tables than Sen gives, and it is also a sharper statement of why he is
right to be unhappy with them, since the limit is attained only under conditions
nothing like any real choice.

# Does cycling happen only where nothing is at stake?

A tempting inference from the last two sections: the cycling regime is small
$s$, small $s$ means the options barely differ, and if the options barely differ
then it hardly matters which one we pick. Cycles would then be a problem that
arises exactly where it does not matter.

The inference has a gap, and the gap is that $s$ is a ratio. Small $s$ means the
options are close together *relative to how far apart the voters' ideals are*,
and the model is scale-free, so it cannot distinguish two situations:

- the options really are near-identical, and the stakes are low;
- the options differ perfectly substantially, and the electorate is spread very
  wide.

Both are small $s$. In the second, nothing about the stakes has changed and the
cycling has gone up anyway. So "cycles happen where it does not matter" is not
something the model delivers. It is an extra assumption about which of the two
readings you are in.

**The version of the thought that does survive is better than the original.** In
the small-$s$ regime each voter's preference between two options has magnitude
of order $s$, while the gap between that voter's ideal and anything feasible is
of order $1$. So every voter is close to indifferent between the options, in the
precise sense that their preference is a small fraction of what is at stake for
them overall. Majority rule in this regime is aggregating weakly-held
preferences and reporting the result as though it were decisive.

That is Sen's third objection to the method of majority decision, from §10.1:

> the MMD takes no account of intensities of individual preference, and it is
> certainly arguable that what matters is not merely the *number* who prefer $x$
> to $y$ and the *number* who prefer $y$ to $x$, but also *by how much* each
> prefers one alternative to the other.

The simulation says the regime where that objection bites hardest is the same
regime where cycles are common. §10.1 and §10.2 are two views of one problem,
and Sen presents them as separate complaints.

## Shape of disagreement, not size

The polarisation reading needs one more refinement, because spreading the voters
out is not one thing. Below, three voter distributions with the *same total
variance*: spherical normal, two tight blocs, and three tight blocs. $k = 2$,
$n = 51$, 60,000 trials a cell.

| $m$ | $s$ | spherical | two blocs | three blocs |
|---:|---:|---:|---:|---:|
| 3 | 0.1 | 0.0501 | 0.0110 | 0.2068 |
| 3 | 0.3 | 0.0230 | 0.0082 | 0.1815 |
| 3 | 1.0 | 0.0032 | 0.0051 | 0.0570 |
| 5 | 0.1 | 0.1692 | 0.0335 | 0.5724 |
| 5 | 0.3 | 0.0870 | 0.0296 | 0.5366 |
| 5 | 1.0 | 0.0126 | 0.0203 | 0.1944 |
| 10 | 0.1 | 0.3952 | 0.0815 | 0.9021 |
| 10 | 0.3 | 0.2411 | 0.0850 | 0.9003 |
| 10 | 1.0 | 0.0365 | 0.0645 | 0.4847 |

Equal disagreement, and a factor of eleven between the best and worst
arrangement of it at ten options. Two-way polarisation *reduces* cycling below
the spherical case; three-way fragmentation raises it to near-certainty.

The two-bloc column is Sen's own observation in §10.2, confirmed:

> in a two-class society where 'class war' takes the form that all members of
> one class have exactly the opposite preference to each member of the other
> class, majority decision must be transitive, irrespective of the number of
> people in each class.

The reason is that two blocs define an axis, and preferences arranged along a
single axis are single-peaked, so we are back in the $k=1$ case whatever the
nominal dimension of the space. The three-bloc column has no axis to collapse
onto, which is also why Miller notes that a trimodal distribution keeps a large
yolk however many voters there are.

So the right summary is not that cycling tracks stakes, and not that it tracks
polarisation. It tracks **fragmentation**: disagreement that does not line up
along one axis. A bitterly divided society with two camps is safe. A mildly
divided society with three is not.

# Caveats

**A correction to an earlier version of this note.** I previously wrote that
drawing alternatives from a more dispersed distribution would push the numbers
up. That is backwards, as the table above shows. Dispersed alternatives mean
fewer cycles.

The uniform and normal cases differ by roughly a factor of two throughout, so
the distribution is doing real work and none of these figures should be quoted
without it.

Where the alternatives and voters are drawn from the same distribution, the
numbers in the first tables apply. Where they are not, the ratio $s$ matters
more than anything else in this note.

Simulation code: `tools/condorcet-cycles.py` and `tools/condorcet-scale.py` and `tools/condorcet-shape.py`.
