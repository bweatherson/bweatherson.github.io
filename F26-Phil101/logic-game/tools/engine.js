// ---- Core deduction engine (shared by verifier and game) ----
// Cells indexed 0..n-1 (row-major, width w). a[i]=1 criminal, 0 innocent.

function evalClue(c, a) {
  const sum = s => s.reduce((t,i)=>t+a[i],0);
  switch (c.t) {
    case 'count':   return sum(c.s) === c.k;
    case 'atmost':  return sum(c.s) <= c.k;
    case 'atleast': return sum(c.s) >= c.k;
    case 'same':    return a[c.a] === a[c.b];
    case 'diff':    return a[c.a] !== a[c.b];
  }
  throw new Error('bad clue '+JSON.stringify(c));
}

// all assignments over n cells satisfying `clues` and matching fixed `known` (map idx->val)
function* assignments(n, known) {
  const idx = [...Array(n).keys()].filter(i => !(i in known));
  const m = idx.length;
  for (let mask=0; mask<(1<<m); mask++) {
    const a = new Array(n);
    for (const k in known) a[k] = known[k];
    for (let b=0;b<m;b++) a[idx[b]] = (mask>>b)&1;
    yield a;
  }
}
function models(n, clues, known={}) {
  const out=[];
  for (const a of assignments(n, known)) {
    let ok=true;
    for (const c of clues) if(!evalClue(c,a)){ok=false;break;}
    if(ok) out.push(a);
  }
  return out;
}

// Is cell c forced given clues+known? returns value or null
function forcedValue(n, clues, known, c) {
  let v=null;
  for (const a of assignments(n, known)) {
    let ok=true; for (const cl of clues) if(!evalClue(cl,a)){ok=false;break;}
    if(!ok) continue;
    if (v===null) v=a[c]; else if (v!==a[c]) return null;
  }
  return v; // null also if no models (shouldn't happen)
}

// minimal number of clues (subset of `clues`) needed, with known, to force cell c to its value. cap = max.
function minSupport(n, clues, known, c, cap) {
  // c must be forced by full set first
  const full = forcedValue(n, clues, known, c);
  if (full===null) return null;
  const idx=[...clues.keys()];
  for (let k=1;k<=cap;k++){
    const combos = kcombos(idx,k);
    for (const combo of combos){
      const sub = combo.map(i=>clues[i]);
      if (forcedValue(n, sub, known, c)===full) return {size:k, clues:combo, val:full};
    }
  }
  return null; // forced but needs >cap clues
}
function kcombos(arr,k){const res=[];(function go(start,cur){if(cur.length===k){res.push(cur.slice());return;}for(let i=start;i<arr.length;i++){cur.push(arr[i]);go(i+1,cur);cur.pop();}})(0,[]);return res;}

module.exports = {evalClue, models, forcedValue, minSupport, kcombos, assignments};
