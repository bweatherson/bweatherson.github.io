---
title: "Utility and Money"
date: "3/25/2026"
---

# Money Is Not Utility

## Plan

- Money is the most familiar unit for measuring value in decisions.
- But dollars and utility are **not the same thing**.
- Today we explore how they differ, and why this matters.

### Associated Reading

*Odds and Ends*, Sections 12.5 and 13.1

## Marginal Utility

Getting \$2x is not twice as valuable as getting \$x.

. . .

Why? Because getting \$2x is like getting \$x, *then getting another \$x once you're already richer*. And the second \$x is worth less to you than the first.

. . .

This is **declining marginal utility** — the extra value of each additional dollar decreases as you get richer.

## Two Claims

These two claims are both true, and closely connected:

1. You're better off getting a million dollars than getting a 50/50 shot at two million dollars.

. . .

2. Getting a million dollars changes your life more than it changes a billionaire's life.

. . .

Both are grounded in declining marginal utility.

## The Utility Curve

The graph of utility as a function of wealth should satisfy:

::: {.incremental}
- **More money → more utility** (the curve slopes upward).
- **Declining marginal utility** (the curve bends downward — it's concave).
:::

## Example: Utility as $\sqrt{\text{Wealth}}$

A simple model: utility = $\sqrt{\text{dollars of net wealth}}$.

- Utility at \$100: $\sqrt{100} = 10$
- Utility at \$400: $\sqrt{400} = 20$
- Utility at \$900: $\sqrt{900} = 30$

. . .

Each extra \$300 gives you 10 more utility at first — but the jumps are worth less and less as you start wealthier.

## Example: Utility as $\log_{10}(\text{Wealth})$

A slightly more realistic model (for wealth above \$1,000):

- Utility at \$10,000: $\log_{10}(10{,}000) = 4$
- Utility at \$100,000: $\log_{10}(100{,}000) = 5$
- Utility at \$1,000,000: $\log_{10}(1{,}000{,}000) = 6$

. . .

Notice that *multiplying* wealth by 10 only *adds* 1 to utility. The relationship between dollars and utility is deeply nonlinear.

## A Worked Example

Suppose someone has a net wealth of \$100,000 (utility = 5).

They are offered a bet: 50% chance of winning \$900,000, 50% chance of losing \$90,000.

. . .

- Win: new wealth = \$1,000,000, utility = 6
- Lose: new wealth = \$10,000, utility = 4

$$
\text{Exp}(U(\text{Bet})) = 0.5 \times 6 + 0.5 \times 4 = 5.0
$$

. . .

Expected utility of the bet = 5 = status quo utility. They should be **indifferent**.

## The Same Bet is Bad with Worse Downside

Now suppose the bet is: 50% chance of winning \$800,000, 50% chance of losing \$90,000.

- Win: new wealth = \$900,000, utility ≈ 5.95
- Lose: new wealth = \$10,000, utility = 4

$$
\text{Exp}(U(\text{Bet})) = 0.5 \times 5.95 + 0.5 \times 4 = 4.98
$$

. . .

The bet now has *negative* expected utility even though its *expected dollar return* is still very positive ($0.5 \times 800{,}000 - 0.5 \times 90{,}000 = \$355{,}000$).

. . .

Expected dollars and expected utility can point in opposite directions.

# Insurance

## The Insurance Puzzle

Every insurance contract is a bet, with you and the insurer on opposite sides.

. . .

The bet can't have a positive expected *dollar* return for both sides simultaneously.

. . .

So why does the insurance industry exist? Why is it rational for both sides to participate?

## An Example

- A person has \$100,000 net wealth, including a car worth \$30,000.
- There's a 10% chance the car is destroyed in the next year.
- An insurer offers: pay \$3,200 now; if the car is destroyed, they refund its full value.

## Without Insurance

- 90% chance: wealth stays at \$100,000, utility = 5.0
- 10% chance: wealth falls to \$70,000, utility ≈ 4.845

$$
\text{Exp}(U) = 0.9 \times 5.0 + 0.1 \times 4.845 = 4.984
$$

## With Insurance

Guaranteed wealth: $100{,}000 - 3{,}200 = \$96{,}800$.

$$
U(\$96{,}800) = \log_{10}(96{,}800) \approx 4.986
$$

. . .

$4.986 > 4.984$ — the insured outcome has **higher expected utility**. Take the insurance.

## The Insurer's Perspective

The insurer collects \$3,200 and pays out \$30,000 with probability 10%.

Expected dollar return = $3{,}200 - 0.1 \times 30{,}000 = \$200 > 0$.

. . .

As long as the insurer has a large, diversified pool of customers (so they effectively face the expected value, not the individual gamble), the insurance contract is profitable.

## Why Both Sides Win

::: {.incremental}
- The customer has a **concave** utility curve — they value certainty more than the raw dollar amounts suggest.
- The insurer, by pooling many independent risks, can afford to behave as if utility is approximately linear in money.
- This asymmetry makes mutually beneficial insurance possible.
:::

. . .

Insurance isn't irrational — but this model also suggests people probably *over-insure* on small risks where the dollar amounts aren't life-changing.

# The Allais Paradox

## A Challenge to Expected Utility

The theory we've built has a very appealing principle built in: the **Sure Thing Principle**.

. . .

If two options have the *same* payoff under some scenario, your preference between them shouldn't depend on what that payoff is.

## The Sure Thing Principle

Suppose options A and B both pay out the same amount if event $p$ occurs.

. . .

Then whether $p$ is true or false doesn't affect the comparison — you're comparing A and B only in the scenarios where $p$ is false.

. . .

Changing the common payoff when $p$ is true shouldn't change whether you prefer A to B.

## The Allais Paradox — First Choice

Which do you prefer?

- **A**: A 10% chance of \$5,000,000
- **B**: An 11% chance of \$1,000,000

. . .

Many people choose **A**.

## The Allais Paradox — Second Choice

Which do you prefer?

- **C**: 10% chance of \$5M, 89% chance of \$1M, 1% chance of nothing
- **D**: \$1,000,000 for certain

. . .

Most people choose **D**.

## Why This Causes a Problem

Represent the options using 10 blue marbles, 89 maize marbles, and 1 scarlet marble:

|   | Blue (×10) | Maize (×89) | Scarlet (×1) |
|:-:|:----------:|:-----------:|:------------:|
| A | \$5M       | \$0         | \$0          |
| B | \$1M       | \$0         | \$1M         |
| C | \$5M       | \$1M        | \$0          |
| D | \$1M       | \$1M        | \$1M         |

. . .

C and D are just A and B with the maize payoff changed from \$0 to \$1M — the *same* change for both. The Sure Thing Principle says your preference between the top pair and the bottom pair should be the same.

## The Math

Let $u(5M) = x$ and $u(1M) = y$.

If $A \succ B$: $0.1x > 0.11y$

. . .

Adding $0.89y$ to both sides: $0.1x + 0.89y > y$

. . .

But $0.1x + 0.89y = \text{Exp}(U(C))$ and $y = \text{Exp}(U(D))$.

. . .

So preferring A to B *forces* you to prefer C to D. You can't rationally have both A $\succ$ B and D $\succ$ C.

## Allais's Conclusion

- The combination A $\succ$ B and D $\succ$ C is intuitively rational.
- But it violates expected utility theory.
- Therefore expected utility theory is wrong.

## A Response

If you learned, before the bet, whether the marble was Maize or not-Maize:

. . .

- If Maize: the payoff in A/B and C/D is the same anyway — you don't care.
- If not-Maize: you face the exact same A vs. B comparison in both cases.

. . .

So by a weak dominance argument, your preference should be the same across both pairs.

## What to Make of This

- The Allais preferences **are common**, especially in real experiments.
- Whether they are **rational** is genuinely contested.
- Modified versions of decision theory (like Buchak's **risk-weighted expected utility**) can accommodate Allais preferences.
- For this course, expected utility maximisation is the standard tool — just be aware it has known challenges.

## For Next Time

- We turn to **game theory**.
- What happens when the outcomes of your decisions depend not on nature, but on the choices of other *rational agents*?
