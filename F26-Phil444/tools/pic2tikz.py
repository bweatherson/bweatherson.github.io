#!/usr/bin/env python3
r"""Convert the LaTeX picture-environment figures from the 2017 notes to TikZ.

The source vocabulary is small and this handles all of it:

  \pictext{x}{y}{s}                         text, baseline-anchored at (x,y)
  \put(x,y){\circle{d}}                     open node (a decision node)
  \put(x,y){\circle*{d}}                    filled node
  \put(x,y){\line(dx,dy){n}}                segment; n is the HORIZONTAL extent
                                            unless dx == 0, when it is vertical
  \multiput(x,y)(sx,sy){k}{\line(1,0){L}}   dashed run (an information set)
  \drawsquare{x1}{y1}{x2}{y2}{s}            square, corner (x1,y1), side s

The source never sets \unitlength, so it defaults to 1pt, and the TikZ output
uses x=1pt, y=1pt. The figures therefore come out at their original size.

Usage:  python3 tools/pic2tikz.py notes/figures/src notes/figures/tikz
"""
import re, sys, os

NUM = r'\s*(-?[\d.]+)\s*'

def endpoint(x, y, dx, dy, n):
    if dx == 0:
        return x, y + (n if dy > 0 else -n)
    return x + (n if dx > 0 else -n), y + (n if dx > 0 else -n) * dy / dx

def convert(src):
    out = []
    body = '\n'.join(l for l in src.split('\n') if not l.lstrip().startswith('%'))
    for tok in re.finditer(
        r'\\pictext\{'+NUM+r'\}\{'+NUM+r'\}\{(?P<txt>(?:[^{}]|\{[^{}]*\})*)\}'
        r'|\\put\('+NUM+','+NUM+r'\)\{\\circle(?P<fill>\*?)\{'+NUM+r'\}\}'
        r'|\\put\('+NUM+','+NUM+r'\)\{\\line\('+NUM+','+NUM+r'\)\{'+NUM+r'\}\}'
        r'|\\multiput\('+NUM+','+NUM+r'\)\('+NUM+','+NUM+r'\)\{'+NUM+r'\}\{\\line\('+NUM+','+NUM+r'\)\{'+NUM+r'\}\}'
        r'|\\drawsquare\{'+NUM+r'\}\{'+NUM+r'\}\{'+NUM+r'\}\{'+NUM+r'\}\{'+NUM+r'\}',
        body):
        g = [x for x in tok.groups() if x is not None]
        t = tok.group(0)
        if t.startswith('\\pictext'):
            x, y = float(g[0]), float(g[1])
            out.append(f'  \\node[anchor=south] at ({x:g},{y:g}) {{{tok.group("txt")}}};')
        elif '\\circle' in t:
            x, y, d = float(g[0]), float(g[1]), float(g[-1])
            cmd = 'fill' if tok.group('fill') else 'draw'
            out.append(f'  \\{cmd} ({x:g},{y:g}) circle ({d/2:g});')
        elif t.startswith('\\multiput'):
            x, y, sx, sy, k, dx, dy, L = map(float, g)
            out.append(f'  \\draw[dashed] ({x:g},{y:g}) -- '
                       f'({x + (k-1)*sx + (L if dx else 0):g},{y + (k-1)*sy:g});')
        elif t.startswith('\\drawsquare'):
            x1, y1, _, _, s = map(float, g)
            out.append(f'  \\draw ({x1:g},{y1:g}) rectangle ({x1+s:g},{y1+s:g});')
        else:
            x, y, dx, dy, n = map(float, g)
            x2, y2 = endpoint(x, y, dx, dy, n)
            out.append(f'  \\draw ({x:g},{y:g}) -- ({x2:g},{y2:g});')
    head = ('\\begin{tikzpicture}[x=1pt, y=1pt, '
            'every node/.style={inner sep=1pt, font=\\small}]')
    return head + '\n' + '\n'.join(out) + '\n\\end{tikzpicture}\n', len(out)

if __name__ == '__main__':
    src_dir, out_dir = sys.argv[1], sys.argv[2]
    os.makedirs(out_dir, exist_ok=True)
    total = 0
    for fn in sorted(f for f in os.listdir(src_dir) if f.endswith('.tex')):
        raw = open(os.path.join(src_dir, fn)).read()
        tikz, n = convert(raw)
        # sanity: every source command must have produced an output command
        want = sum(len(re.findall(p, '\n'.join(
                   l for l in raw.split('\n') if not l.lstrip().startswith('%'))))
                   for p in (r'\\pictext', r'\\put\(', r'\\multiput', r'\\drawsquare'))
        assert n == want, f'{fn}: {want} source commands, {n} converted'
        open(os.path.join(out_dir, fn), 'w').write(
            f'% {raw.split(chr(10))[0].lstrip("% ")}\n{tikz}')
        total += n
        print(f'  {fn:22} {n:3} commands')
    print(f'  {total} commands across {len(os.listdir(out_dir))} figures')
