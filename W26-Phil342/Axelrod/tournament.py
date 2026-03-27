"""
Phil 342 Iterated Prisoner's Dilemma Tournament
36 students using pre-built Axelrod strategies + 3 custom strategies.

Notes on CSV corrections:
  - Meci listed "Gradual Grudger" (not a real Axelrod class); using axelrod.Gradual
  - Williams listed "Adaptive Pavlov" (not a real Axelrod class); using axelrod.APavlov2011
  - "axelrod (2).py" (Anjan Aviram Singer) cannot be imported directly because it contains
    a Jupyter shell magic command (!pip install) and syntax errors in the Cooperated class.
    The Anjan strategy class is reproduced inline below.
"""

import sys
import os
import axelrod

# ── Custom strategy 1: Foster Riley Dugan (punisher3.py) ─────────────────────
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from punisher3 import MyStrategy          # "The Punisher": TFT but defects last 2 rounds

# ── Custom strategy 2: Sungjing Hong (TitForTatEndgame.py) ───────────────────
from TitForTatEndgame import TitForTatEndgame   # TFT but defects on final round

# ── Custom strategy 3: Anjan Aviram Singer (axelrod (2).py) ──────────────────
# Inlined here because the original file has a Jupyter shell-magic command on
# line 11 (!pip install axelrod) and syntax errors that prevent direct import.
class Anjan(axelrod.Player):
    """Probe the opponent for common strategies w/ 'DDCC'
        if CDDC->TFT->TFT
        if CCDC->GTFT->alternate
        if CDDD->punishTFT->AllC
        if DDDD->AllD->AllD
        if CCCC->AllC->AllD
        if DDCC->self->AllC
        else->TFT"""

    name = "Anjan (My Strategy)"
    classifier = {
        "memory_depth": float("inf"),
        "stochastic": False,
        "long_run_time": False,
        "inspects_source": False,
        "manipulates_source": False,
        "manipulates_state": False,
    }

    def strategy(self, opponent: axelrod.Player) -> axelrod.Action:
        # Preset probing first 4 moves: D, D, C, C
        if not self.history:
            return axelrod.Action.D
        if len(self.history) == 1:
            return axelrod.Action.D
        if len(self.history) == 2:
            return axelrod.Action.C
        if len(self.history) == 3:
            return axelrod.Action.C

        # Classify opponent based on their first 4 responses
        opp4 = list(opponent.history[:4])
        C, D = axelrod.Action.C, axelrod.Action.D
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

        if opp_strategy == 'TFT':
            if opponent.history[-1] == D:
                return D
            return C
        elif opp_strategy == 'GTFT':
            # Alternate D/C based on round parity
            if len(self.history) % 2 == 0:
                return D
            return C
        elif opp_strategy == 'punishTFT':
            return C
        elif opp_strategy == 'AllD':
            return D
        elif opp_strategy == 'AllC':
            return D
        elif opp_strategy == 'self':
            return C
        else:  # 'other' -> TFT
            if opponent.history[-1] == D:
                return D
            return C


# ── Build player list ─────────────────────────────────────────────────────────
# Each entry: (student name, player instance)
students = [
    # Pre-built strategies (36 students)
    ("Agarwal, Rohit",                  axelrod.GTFT()),
    ("Al-Robayhe-Jones, Amir Jasim",    axelrod.TwoTitsForTat()),
    ("Alvesteffer, Hope Leigh",         axelrod.TitForTat()),
    ("Asam, Olivia Rachel",             axelrod.WinStayLoseShift()),
    ("Bienenfeld, Jemma Haven",         axelrod.TitForTat()),
    ("Bui, Emily",                      axelrod.TitForTat()),
    ("Chow, Kevin Lee",                 axelrod.TitForTat()),
    ("Ciaramitaro, Alex Marco",         axelrod.TitForTat()),
    ("Das, Ishani",                     axelrod.TitForTat()),
    ("Donnelly, Brenden Ferguson",      axelrod.TitForTat()),
    ("Kim, Seohee",                     axelrod.TitFor2Tats()),
    ("Kurtz, Lowell Yeoh",              axelrod.LevelPunisher()),
    ("Lee, Joshua Q",                   axelrod.TitFor2Tats()),
    ("Li, Roxane",                      axelrod.WinStayLoseShift()),
    ("Lu, Aline",                       axelrod.TwoTitsForTat()),
    ("Mansur, Abrar Fattah",            axelrod.ForgivingTitForTat()),
    ("Masters, Thomas Jeffrey",         axelrod.TitForTat()),
    ("Meci, Brian",                     axelrod.Gradual()),        # listed "Gradual Grudger" — not a real class; using Gradual
    ("Michelle, Alexis Raye",           axelrod.HardProber()),
    ("Morgan Chevres, Iliana Rose",     axelrod.ZDGTFT2()),
    ("Nykerk, Natalie E",               axelrod.TitForTat()),
    ("Orban, Eve Virginia",             axelrod.Detective()),
    ("Ott, Sarah Evelyn",               axelrod.TwoTitsForTat()),
    ("Pak, Jungjin",                    axelrod.TwoTitsForTat()),
    ("Park, Bohyun",                    axelrod.TitForTat()),
    ("Pratt, Mackenna Lynn",            axelrod.TitForTat()),
    ("Silverberg, Matan Simcha",        axelrod.TitForTat()),
    ("Stopka, Jocelyn",                 axelrod.Prober()),
    ("Sugrue, Connor Florimond",        axelrod.Grudger()),
    ("Tolan, Haley",                    axelrod.OriginalGradual()),
    ("Tomeny, Kaitlyn Kim",             axelrod.GTFT()),
    ("Valdes, Alexander",               axelrod.TitForTat()),
    ("Williams, Paris Nicole",          axelrod.APavlov2011()),    # listed "Adaptive Pavlov" — not a real class; using APavlov2011
    ("Wilson, Chanel Rone",             axelrod.TitForTat()),
    ("Yuan, Minnie",                    axelrod.TitForTat()),
    ("Zhu, Yutian",                     axelrod.LevelPunisher()),
    # Custom strategies (3 students)
    ("Dugan, Foster Riley",             MyStrategy()),
    ("Hong, Sungjing",                  TitForTatEndgame()),
    ("Singer, Anjan Aviram",            Anjan()),
]

# Give each player a name that includes the student's name for easy reading
for student_name, player in students:
    player.name = f"{student_name} ({player.name})"

players = [p for _, p in students]

# ── Run tournament ────────────────────────────────────────────────────────────
print(f"Running tournament with {len(players)} players...")

tournament = axelrod.Tournament(
    players,
    turns=200,
    repetitions=10,
    seed=42,
)
results = tournament.play(progress_bar=True)

# ── Print results ─────────────────────────────────────────────────────────────
print("\n=== FINAL RANKINGS ===")
ranked = results.ranking          # list of player indices, best first
scores = results.normalised_scores

for rank, idx in enumerate(ranked, start=1):
    player_name = players[idx].name
    avg_score = sum(scores[idx]) / len(scores[idx])
    print(f"{rank:3d}. {player_name:<60s}  avg score/turn: {avg_score:.4f}")
