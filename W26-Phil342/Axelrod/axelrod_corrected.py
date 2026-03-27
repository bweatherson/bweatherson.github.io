# -*- coding: utf-8 -*-
"""
Corrected version of Anjan Aviram Singer's axelrod (2).py.

Fixes applied:
  1. Removed Jupyter shell-magic line (!pip install axelrod) — not valid Python.
  2. Anjan class: all six elif conditions were identical; corrected each to
     check the distinct opponent response pattern described in the docstring.
  3. Anjan class: comparisons used string literals ('C','D') but opponent.history
     holds axelrod.Action enum values — fixed to use axelrod.Action.C / .D.
  4. Anjan class: the 'alternate vs GTFT' branch used a local `count` variable
     that reset to -1 on every call, so it always returned the same action.
     Fixed to use round-number parity instead.
  5. Coin class: `type='C'` was set at the top of strategy() on every call, so
     the random flip only affected round 1 and the player cooperated every
     subsequent round. Fixed to flip on every round. Also corrected
     stochastic: False -> True.
  6. Cooperated class: `if len(self.history)=99` used = (assignment) instead of
     == (comparison). Fixed. Also added missing colon after `else`. Removed
     unused `type` variable. Note: the hardcoded 99 means it defects on round
     100, which was presumably intended for a 100-round tournament; for a
     200-round tournament you would want `self.tournament_length - 1` instead.
  7. Players list: removed references to ACoin() since that class is commented
     out; removed the erroneous `print(ACoin.chance)` line.
"""

import axelrod
import random


# ── Anjan Aviram Singer's strategy ───────────────────────────────────────────

class Anjan(axelrod.Player):
    """Probe the opponent for common strategies w/ 'DDCC'
        if CDDC->TFT->TFT
        if CCDC->GTFT->alternate
        if CDDD->punishTFT->AllC
        if DDDD->AllD->AllD
        if CCCC->AllC->AllD
        if DDCC->self->AllC
        else->TFT
        basically the presumption here is that the loss of defection in the
        first couple rounds is beaten out by the amount of 'chumps' (GTFT and
        AllC) I think I can take advantage of over a lot of rounds"""

    name = "My Strategy"
    classifier = {
        "memory_depth": float("inf"),
        "stochastic": False,
        "long_run_time": False,
        "inspects_source": False,
        "manipulates_source": False,
        "manipulates_state": False,
    }

    def strategy(self, opponent: axelrod.Player) -> axelrod.Action:
        C, D = axelrod.Action.C, axelrod.Action.D

        # Preset probing first 4 moves: D, D, C, C
        if not self.history:
            return D
        if len(self.history) == 1:
            return D
        if len(self.history) == 2:
            return C
        if len(self.history) == 3:
            return C

        # Classify opponent based on their first 4 responses to our D,D,C,C probe.
        # FIX 2 & 3: each branch now checks a distinct pattern using Action enums.
        opp4 = list(opponent.history[:4])
        if opp4 == [C, D, D, C]:
            opp_strategy = 'TFT'
        elif opp4 == [C, C, D, C]:
            opp_strategy = 'GTFT'
        elif opp4 == [C, D, D, D]:
            opp_strategy = 'punishTFT'
        elif opp4 == [D, D, D, D]:
            opp_strategy = 'AllD'
        elif opp4 == [C, C, C, C]:
            opp_strategy = 'AllC'
        elif opp4 == [D, D, C, C]:
            opp_strategy = 'self'
        else:
            opp_strategy = 'other'

        if opp_strategy == 'TFT':  # play TFT
            if opponent.history[-1] == D:
                return D
            return C
        elif opp_strategy == 'GTFT':  # alternate D/C
            # FIX 4: use round-number parity instead of a local counter that
            # reset to -1 on every call.
            if len(self.history) % 2 == 0:
                return D
            return C
        elif opp_strategy == 'punishTFT':  # AllC
            return C
        elif opp_strategy == 'AllD':  # AllD
            return D
        elif opp_strategy == 'AllC':  # AllD
            return D
        elif opp_strategy == 'self':  # AllC
            return C
        else:  # 'other' -> TFT
            if opponent.history[-1] == D:
                return D
            return C


# ── Coin ─────────────────────────────────────────────────────────────────────

class Coin(axelrod.Player):
    """Flips a fair coin each round to decide whether to cooperate or defect."""

    name = "Coin"
    classifier = {
        "memory_depth": 1,
        "stochastic": True,   # FIX 5: was False, but the strategy uses random
        "long_run_time": False,
        "inspects_source": False,
        "manipulates_source": False,
        "manipulates_state": False,
    }

    def strategy(self, opponent: axelrod.Player) -> axelrod.Action:
        # FIX 5: flip the coin every round, not just on round 1.
        if random.random() < 0.5:
            return axelrod.Action.D
        return axelrod.Action.C


# ── ACoin (commented out in the original; kept here for reference) ────────────

# class ACoin(axelrod.Player):
#     """Plays AllC w/ some probability based on how AllC has done in the past,
#     same w/ AllD"""
#     ...


# ── Cooperated ────────────────────────────────────────────────────────────────

class Cooperated(axelrod.Player):
    """Cooperates until round 100, then defects once."""

    name = "Cooperated"
    classifier = {
        "memory_depth": 1,
        "stochastic": False,
        "long_run_time": False,
        "inspects_source": False,
        "manipulates_source": False,
        "manipulates_state": False,
    }

    def strategy(self, opponent: axelrod.Player) -> axelrod.Action:
        # FIX 6: was `if len(self.history)=99` (assignment) and `else` without colon.
        # Note: hardcoded 99 means this defects on round 100. For a 200-round
        # tournament use `self.tournament_length - 1` to defect on the last round.
        if len(self.history) == 99:
            return axelrod.Action.D
        else:
            return axelrod.Action.C


# ── Test tournament (Anjan's original test setup, minus ACoin) ────────────────

players = [
    axelrod.TitForTat(),
    axelrod.TitForTat(),
    axelrod.TitForTat(),
    axelrod.TitForTat(),
    axelrod.GTFT(),
    axelrod.GTFT(),
    axelrod.GTFT(),
    axelrod.GTFT(),
    axelrod.GTFT(),
    Coin(),
    Coin(),
    Coin(),
    Coin(),
    Coin(),
    Coin(),
    # FIX 7: ACoin() removed — that class is commented out.
    axelrod.Cooperator(),
    axelrod.Cooperator(),
    axelrod.Cooperator(),
    Anjan(),
]

tourney = axelrod.Tournament(players, turns=200, repetitions=5)

print("Running tournament...")
results = tourney.play(progress_bar=False)
print("Tournament complete.")

print("Rankings by score:")
print(results.ranked_names)
