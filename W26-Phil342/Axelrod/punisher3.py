import axelrod

class MyStrategy(axelrod.Player):
    """This code should do exacly what tit for tat does except in the final two rounds it will always defect."""

    name = "The Punisher"
    classifier = {
        "memory_depth": 1,   # How many rounds back you look (float("inf") for unlimited)
        "stochastic": False,  # True if you use random numbers
        "long_run_time": False,
        "inspects_source": False,
        "manipulates_source": False,
        "manipulates_state": False,
    }

    def strategy(self, opponent: axelrod.Player) -> axelrod.Action:
        # opponent.history is a list of axelrod.Action.C and .D values
        # self.history is the same for your own moves

        round_number = len(self.history) #This will count the round that is currently being played and stores it in the variable round_number

        #Technically due to the fact that there will be no history on round number one my index of round_number will be one step behind the actual round.
        #My code will have round_nuber == 1 on the second technical round. This is accounted for in my strategy later on.

        if round_number > 97: #If the roud number is greater than 97 my code will defect always, given we are playing 100 rounds this will be the last two
            return axelrod.Action.D

        if not opponent.history:  #Otherwise this should play regular tit for tat
            return axelrod.Action.C  # First move
        if opponent.history[-1] == axelrod.Action.D:
            return axelrod.Action.D  # Retaliate
        return axelrod.Action.C      # Otherwise cooperate