import numpy as np, math
rng = np.random.default_rng(7717)

def rate(n, m, k, trials, vscale=1.0, ascale=1.0, dist="normal", batch=400):
    """P(no Condorcet winner). Voters ~ vscale * D, alternatives ~ ascale * D."""
    fails = done = 0
    while done < trials:
        b = min(batch, trials - done)
        if dist == "normal":
            V = vscale * rng.standard_normal((b, n, k))
            A = ascale * rng.standard_normal((b, m, k))
        else:
            V = vscale * (rng.random((b, n, k)) - 0.5)
            A = ascale * (rng.random((b, m, k)) - 0.5)
        D = ((V[:, :, None, :] - A[:, None, :, :]) ** 2).sum(-1)
        wins = (D[:, :, :, None] < D[:, :, None, :]).sum(1)
        beats = wins > wins.transpose(0, 2, 1)
        np.einsum('bii->bi', beats)[...] = True
        fails += int((~beats.all(axis=2).any(axis=1)).sum())
        done += b
    return fails / trials

T = 200000
print("A. Small-n behaviour, m=3, k=2.  200k trials/cell; +-2 s.e. shown\n")
print(f"{'n':>5}  {'normal':>18}  {'uniform':>18}")
for n in (3, 5, 7, 9, 11, 15, 21, 31, 51, 75, 101):
    out = []
    for d in ("normal", "uniform"):
        r = rate(n, 3, 2, T, 1.0, 1.0, d, max(50, int(2e6/(n*9))))
        se = math.sqrt(r*(1-r)/T)
        out.append(f"{r:.5f} +-{2*se:.5f}")
    print(f"{n:>5}  {out[0]:>18}  {out[1]:>18}")

print("\n\nB. Feasible set wide or narrow relative to the electorate (normal, k=2, n=51)")
print("   voters ~ N(0,I); alternatives ~ N(0, s^2 I).  60k trials/cell\n")
print(f"{'s':>7}  {'m=3':>9}  {'m=5':>9}  {'m=10':>9}")
for s in (0.05, 0.1, 0.25, 0.5, 1.0, 2.0, 4.0, 10.0):
    row = [rate(51, m, 2, 60000, 1.0, s, "normal", max(40, int(2e6/(51*m*m)))) for m in (3, 5, 10)]
    print(f"{s:>7}  " + "  ".join(f"{v:>9.4f}" for v in row))

print("\n\nC. Same, in three dimensions (n=51, k=3)\n")
print(f"{'s':>7}  {'m=3':>9}  {'m=5':>9}  {'m=10':>9}")
for s in (0.05, 0.1, 0.25, 0.5, 1.0, 2.0, 4.0, 10.0):
    row = [rate(51, m, 3, 60000, 1.0, s, "normal", max(40, int(2e6/(51*m*m)))) for m in (3, 5, 10)]
    print(f"{s:>7}  " + "  ".join(f"{v:>9.4f}" for v in row))
