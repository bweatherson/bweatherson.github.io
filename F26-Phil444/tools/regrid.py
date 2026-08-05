#!/usr/bin/env python3
"""Reflow pandoc grid tables so the +---+ rules match the cell contents.

A grid table encodes its column boundaries in character positions, so editing a
cell changes the geometry. Wrapping a payoff in $...$ makes the row too wide;
replacing [9]{.underline} with **9** makes it too narrow. Either way pandoc
loses the column boundaries and mis-parses the table.

This recomputes each table's column widths from its widest cell and rewrites
every line, preserving the alignment markers in the first rule (+:---+---:+)
and any spanning or row-spanning cells. Tables that are already consistent are
left untouched, so it is safe to run after every editing session.

    python3 tools/regrid.py notes/*.qmd
"""
import re, sys

def parse_row(line):
    return [c for c in line.strip('\n')[1:-1].split('|')]

def is_rule(l): return re.match(r'^\+[-=:+]+\+$', l) is not None
def is_cont(l): return re.match(r'^\|[ ]*\+[-+]+\+$', l) is not None

def reflow(block):
    aligns = []
    for seg in re.findall(r'\+([-=:]+)(?=\+)', block[0]):
        aligns.append((seg.startswith(':'), seg.endswith(':')))
    n = len(aligns)

    rows = []
    for l in block:
        if is_cont(l):   rows.append(('cont', None))
        elif is_rule(l): rows.append(('rule', l.startswith('+=')))
        else:            rows.append(('row', parse_row(l)))

    width = [0]*n
    for kind, cells in rows:
        if kind == 'row' and cells and len(cells) == n:
            for k, c in enumerate(cells):
                width[k] = max(width[k], len(c.strip()) + 2)
    width = [max(w, 3) for w in width]

    for kind, cells in rows:                      # a spanning cell must fit
        if kind == 'row' and cells and len(cells) < n:
            span = n - len(cells) + 1
            need = len(cells[-1].strip()) + 2
            have = sum(width[-span:]) + (span - 1)
            if need > have:
                width[-1] += need - have

    def rule(heavy=False, start=0):
        ch = '=' if heavy else '-'
        out = '+' if start == 0 else '|' + ' '*width[0] + '+'
        for k in range(start, n):
            out += ch*width[k] + '+'
        return out

    def first_rule():
        out = '+'
        for k, (l, r) in enumerate(aligns):
            seg = '-'*width[k]
            if l: seg = ':' + seg[1:]
            if r: seg = seg[:-1] + ':'
            out += seg + '+'
        return out

    res, seen_first = [], False
    for kind, payload in rows:
        if kind == 'rule':
            res.append(first_rule() if not seen_first else rule(payload))
            seen_first = True
        elif kind == 'cont':
            res.append(rule(False, start=1))
        else:
            cells = payload
            if len(cells) == n:
                res.append('|' + '|'.join(' ' + c.strip().ljust(width[k]-1)
                                          for k, c in enumerate(cells)) + '|')
            else:
                span = n - len(cells) + 1
                w = sum(width[-span:]) + (span - 1)
                parts = [' ' + c.strip().ljust(width[k]-1) for k, c in enumerate(cells[:-1])]
                parts.append(' ' + cells[-1].strip().ljust(w-1))
                res.append('|' + '|'.join(parts) + '|')
    return res

def process(path):
    L = open(path).read().split('\n')
    out, i, fixed = [], 0, 0
    while i < len(L):
        if is_rule(L[i]) and (i == 0 or not L[i-1].startswith(('|','+'))):
            j = i
            while j < len(L) and L[j].startswith(('|','+')): j += 1
            new = reflow(L[i:j])
            if new != L[i:j]: fixed += 1
            out.extend(new); i = j; continue
        out.append(L[i]); i += 1
    open(path, 'w').write('\n'.join(out))
    return fixed

if __name__ == '__main__':
    for p in sys.argv[1:]:
        print(f"  {p}: {process(p)} tables reflowed")
