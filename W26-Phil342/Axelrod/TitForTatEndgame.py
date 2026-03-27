import axelrod



#please note that all the code was made by Gemini AI
#not by me because I cannot code.

class TitForTatEndgame(axelrod.Player):
    """
    A player that starts by cooperating and then mimics the previous action of the
    opponent (standard Tit For Tat).
    It also always defects on the very last turn of the tournament.
    """

    name = "Tit For Tat Endgame"
    classifier = {
        "memory_depth": float("inf"),
        "stochastic": False,
        "long_run_time": False,
        "inspects_source": False,
        "manipulates_source": False,
        "manipulates_state": False,
    }

    def strategy(self, opponent: axelrod.Player) -> axelrod.Action:
        # 1. First move
        if not self.history:
            return axelrod.Action.C

        # 2. The Last Turn Defection
        # Check if the current round is the final round
        if len(self.history) == self.tournament_length - 1:
            return axelrod.Action.D

        # 3. Standard Tit-for-Tat Logic
        # React to the opponent's last move
        if opponent.history[-1] == axelrod.Action.D:
            return axelrod.Action.D
            
        return axelrod.Action.C