---
title: "Expected Utility"
date: "3/23/2026"
---

# Random Variables and Expected Value

## Plan

- We now move from probability to **decisions**.
- The key question: when outcomes depend on uncertain facts, how should we choose?
- Today we introduce the core tool: **expected utility**.

### Associated Reading

*Odds and Ends*, Chapters 11 and 12

## Random Variables

- A **random variable** is a variable that takes different numerical values in different states.
- In other words: a function from possibilities to numbers.

. . .

Examples:

::: {.incremental}
- $X$ = the age of the next US president at inauguration.
- $Y$ = the number of children you will have in your lifetime.
- $Z$ = the number of your friends who correctly predict tonight's game.
:::

## An Example

- 12 of your friends predicted the Lakers will win; 7 predicted the Clippers.
- Let $X$ = the number of friends who predicted correctly.

$$
X = \begin{cases} 12 & \text{if Lakers win} \\ 7 & \text{if Clippers win} \end{cases}
$$

## Expected Value

Given a random variable $X$ and a probability function $\Pr$:

$$
\text{Exp}(X) = \sum_i x_i \cdot \Pr(X = x_i)
$$

. . .

This is a **weighted average** of the possible values, where the weights are the probabilities.

## Back to the Example

If $\Pr(\text{Lakers win}) = 0.7$:

\begin{align*}
\text{Exp}(X) &= 12 \times 0.7 + 7 \times 0.3 \\
              &= 8.4 + 2.1 \\
              &= 10.5
\end{align*}

. . .

Note: the "expected value" doesn't have to be a value that $X$ can actually take — it's an average, not a prediction.

# Decision Tables

## States and Choices

We want to model decisions where outcomes depend on external facts outside our control.

|          | State 1 | State 2 |
|---------:|:-------:|:-------:|
| Choice 1 | $a$     | $b$     |
| Choice 2 | $c$     | $d$     |

. . .

- **Choices**: the options available to you.
- **States**: ways the world might be that affect the outcome.
- **Outcomes**: a choice plus a state determines an outcome.
- **Utilities**: numbers representing how good each outcome is.

## An Example

A friend has to choose between watching the Packers game and finishing a paper due Monday.

|                | Packers Win | Packers Lose |
|---------------:|:-----------:|:------------:|
| Watch Football |      4      |      1       |
| Work on Paper  |      3      |      2       |

. . .

The numbers reflect preferences. Higher is better.

# Dominance

## Dominance Reasoning

The simplest rule: **never choose a dominated option**.

. . .

- $A$ **strongly dominates** $B$: $A$ gives a strictly better outcome than $B$ in every state.
- $A$ **weakly dominates** $B$: $A$ gives at least as good an outcome as $B$ in every state, and strictly better in at least one.

## A Case Where Dominance Applies

|                | Packers Win | Packers Lose |
|---------------:|:-----------:|:------------:|
| Watch Football |      3      |      1       |
| Work on Paper  |      4      |      2       |

. . .

Working on the paper gives a better outcome **regardless** of what the Packers do. It strongly dominates watching football.

. . .

This is compelling reasoning: if one option is better in every possible scenario, you should choose it.

## Why Dominance Isn't Always Enough

|                | Packers Win | Packers Lose |
|---------------:|:-----------:|:------------:|
| Watch Football |      4      |      1       |
| Work on Paper  |      3      |      2       |

. . .

Neither option dominates the other. What to do depends on **how likely** each state is and **how much** you care about each outcome.

## Why Magnitude Matters

Consider two friends facing the "same" decision table (same ranking of outcomes):

. . .

- Chris's cheap airline has a luggage problem in bad weather — bags arrive a day late.
- Robin's cheap airline has a structural problem in bad weather — it crashes.

. . .

Clearly these are different decisions, even though the *ranking* of outcomes is identical. The **magnitude** of the difference between outcomes matters too.

# Maximising Expected Utility

## The Rule

> The rational choice is the one that **maximises expected utility**.

. . .

Expected utility of a choice = weighted average of utilities of outcomes, weighted by probabilities:

$$
\text{Exp}(U(\text{Choice})) = \sum_i \Pr(\text{State}_i) \times U(\text{Choice}, \text{State}_i)
$$

## The Airline Example

|                   | Good Weather (Pr = 0.8) | Bad Weather (Pr = 0.2) |
|------------------:|:-----------------------:|:----------------------:|
| Fly Cheap Airline | 10                      | 0                      |
| Fly Good Airline  | 6                       | 5                      |

\begin{align*}
\text{Exp}(\text{Cheap}) &= 0.8 \times 10 + 0.2 \times 0 = 8.0 \\
\text{Exp}(\text{Good})  &= 0.8 \times 6 + 0.2 \times 5 = 5.8
\end{align*}

. . .

Fly cheap — it has higher expected utility.

## What If Bad Weather is Worse?

|                   | Good Weather (Pr = 0.8) | Bad Weather (Pr = 0.2) |
|------------------:|:-----------------------:|:----------------------:|
| Fly Cheap Airline | 10                      | **−20**                |
| Fly Good Airline  | 6                       | 5                      |

\begin{align*}
\text{Exp}(\text{Cheap}) &= 0.8 \times 10 + 0.2 \times (-20) = 4.0 \\
\text{Exp}(\text{Good})  &= 0.8 \times 6 + 0.2 \times 5 = 5.8
\end{align*}

. . .

Now fly the reliable airline. The downside risk changed everything.

## What If the Gap is Small?

|                   | Good Weather (Pr = 0.8) | Bad Weather (Pr = 0.2) |
|------------------:|:-----------------------:|:----------------------:|
| Fly Cheap Airline | 10                      | 0                      |
| Fly Good Airline  | **9**                   | **8**                  |

\begin{align*}
\text{Exp}(\text{Cheap}) &= 0.8 \times 10 + 0.2 \times 0 = 8.0 \\
\text{Exp}(\text{Good})  &= 0.8 \times 9 + 0.2 \times 8 = 8.8
\end{align*}

. . .

The reliable airline wins — there's much less to gain by going cheap.

## What If Bad Weather is Likely?

|                   | Good Weather (Pr = **0.3**) | Bad Weather (Pr = **0.7**) |
|------------------:|:---------------------------:|:--------------------------:|
| Fly Cheap Airline | 10                          | 0                          |
| Fly Good Airline  | 6                           | 5                          |

\begin{align*}
\text{Exp}(\text{Cheap}) &= 0.3 \times 10 + 0.7 \times 0 = 3.0 \\
\text{Exp}(\text{Good})  &= 0.3 \times 6 + 0.7 \times 5 = 5.3
\end{align*}

. . .

Bad weather being likely makes the reliable airline the clear choice.

## What Drives the Decision

The correct choice depends on all three of:

::: {.incremental}
1. **Probabilities**: How likely are the different states?
2. **Upside**: How much do you gain by the cheaper/riskier option when things go well?
3. **Downside**: How much do you lose when things go badly?
:::

. . .

Expected utility theory is the formal framework that integrates these three factors.

## For Next Time

- We will look at the relationship between **money and utility**.
- Why isn't doubling your money the same as doubling your utility?
- And what does this tell us about insurance, gambling, and risk?
