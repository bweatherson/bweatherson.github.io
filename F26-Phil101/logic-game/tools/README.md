# Deduction-game tools

The scripts that generated and verified the puzzles in `../deduction.html`. Node only, no dependencies. Run them from this folder.

## What each file does

`engine.js` — the core logic, shared with the game. Evaluates a clue against an assignment, enumerates models, and computes `minSupport`: the smallest set of clues that forces a given suspect's verdict. A puzzle is "hardness k" if the hardest forced step, solving easiest-first, needs k clues chained.

`gen.js` — grid geometry (rows, columns, neighbours, edges, corners) and the clue pool for a solution. Running it directly searches random puzzles and prints seeds.

`gen2.js` — searches for puzzles of a target hardness. A puzzle is kept only if it has a unique solution and solves all the way through without ever needing more than the cap (3).

`inspect.js` — prints one puzzle in full: the grid with verdicts, the clue list in plain English, and the easiest-first solving order with the supporting clues for each step. This is how to read a candidate before using it.

## Common commands

Search 3×3 puzzles that require a genuine three-clue reductio:

    node gen2.js 3 3 3 200      # width height targetHardness tries

Read a specific puzzle (the three in the game are seeds 19, 17, 26):

    node inspect.js 3 3 19      # warm-up
    node inspect.js 4 3 17      # challenge
    node inspect.js 3 3 26      # worked example

## Adding a puzzle to the game

Find a seed you like with `gen2.js`, read it with `inspect.js`, then copy its solution and clue array into the `PUZZLES` object in `deduction.html`. The clue objects are plain: `{t:"count",s:[...],k:N}`, `{t:"atmost"|"atleast",s:[...],k:N}`, `{t:"same"|"diff",a:i,b:j}`. Indices are row-major from the top-left. To show a clue with a geometric phrasing instead of a name list, add a `text:"..."` field; the engine ignores it and only reads `s`/`k`/`a`/`b`, so the wording must match the set exactly.
