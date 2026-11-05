import sys; sys.path.insert(0,"/home/claude/sim")
import numpy as np, math
rng = np.random.default_rng(4242)

def voters(kind, b, n, k):
    """Each returns ideal points with total variance 2 per voter (k=2)."""
    if kind == "spherical":
        return rng.standard_normal((b, n, k))
    w = 0.3
    if kind == "two blocs":
        d = math.sqrt(2 - 2*w*w)
        c = np.zeros((2, k)); c[0,0] = d; c[1,0] = -d
    elif kind == "three blocs":
        r = math.sqrt(2 - 2*w*w); c = np.zeros((3, k))
        for j in range(3):
            c[j,0] = r*math.cos(2*math.pi*j/3); c[j,1] = r*math.sin(2*math.pi*j/3)
    which = rng.integers(0, len(c), size=(b, n))
    return c[which] + w*rng.standard_normal((b, n, k))

def rate(kind, n, m, k, s, trials, batch=400):
    fails = done = 0
    while done < trials:
        b = min(batch, trials-done)
        V = voters(kind, b, n, k)
        A = s*rng.standard_normal((b, m, k))
        D = ((V[:,:,None,:]-A[:,None,:,:])**2).sum(-1)
        wins = (D[:,:,:,None] < D[:,:,None,:]).sum(1)
        beats = wins > wins.transpose(0,2,1)
        np.einsum('bii->bi', beats)[...] = True
        fails += int((~beats.all(axis=2).any(axis=1)).sum())
        done += b
    return fails/trials

print("Shape of disagreement, not just its size.  k=2, n=51, 60k trials.")
print("All three voter distributions have the SAME total variance.\n")
print(f"{'alternatives s':>15}  " + "  ".join(f"{t:<14}" for t in ("spherical","two blocs","three blocs")))
for m in (3, 5, 10):
    print(f"\n  m = {m}")
    for s in (0.1, 0.3, 1.0):
        row = [rate(t, 51, m, 2, s, 60000, max(40,int(2e6/(51*m*m))))
               for t in ("spherical","two blocs","three blocs")]
        print(f"{s:>15}  " + "  ".join(f"{v:<14.4f}" for v in row))
