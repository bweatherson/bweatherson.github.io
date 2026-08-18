const E = require('./engine.js');

// geometry helpers
function geom(w,h){
  const n=w*h, rc=i=>[Math.floor(i/w), i%w];
  const rows=[...Array(h)].map((_,r)=>[...Array(w)].map((_,c)=>r*w+c));
  const cols=[...Array(w)].map((_,c)=>[...Array(h)].map((_,r)=>r*w+c));
  const neigh=i=>{const[r,c]=rc(i);const o=[];for(let dr=-1;dr<=1;dr++)for(let dc=-1;dc<=1;dc++){if(!dr&&!dc)continue;const nr=r+dr,nc=c+dc;if(nr>=0&&nr<h&&nc>=0&&nc<w)o.push(nr*w+nc);}return o;};
  const adjPairs=[];for(let i=0;i<n;i++){const[r,c]=rc(i);if(c+1<w)adjPairs.push([i,i+1]);if(r+1<h)adjPairs.push([i,i+w]);}
  const corners=[0,w-1,(h-1)*w,(h-1)*w+w-1].filter((v,k,a)=>a.indexOf(v)===k);
  return {n,rows,cols,neigh,adjPairs,corners};
}

// build candidate true clues for solution sol
function pool(w,h,sol){
  const g=geom(w,h), n=g.n, P=[];
  const cnt=s=>s.reduce((t,i)=>t+sol[i],0);
  g.rows.forEach((s,r)=>P.push({t:'count',s,k:cnt(s),kind:'row',meta:r}));
  g.cols.forEach((s,c)=>P.push({t:'count',s,k:cnt(s),kind:'col',meta:c}));
  // neighbor counts
  for(let i=0;i<n;i++){const s=g.neigh(i);P.push({t:'count',s,k:cnt(s),kind:'neigh',meta:i});}
  // same/diff adjacent
  g.adjPairs.forEach(([a,b])=>{ if(sol[a]===sol[b])P.push({t:'same',a,b,kind:'rel'}); else P.push({t:'diff',a,b,kind:'rel'});});
  // corners count
  P.push({t:'count',s:g.corners,k:cnt(g.corners),kind:'corners'});
  // total
  P.push({t:'count',s:[...Array(n).keys()],k:cnt([...Array(n).keys()]),kind:'total'});
  // atmost/atleast for a few neighbor sets (looser, supports reductio variety)
  for(let i=0;i<n;i++){const s=g.neigh(i);const k=cnt(s);P.push({t:'atleast',s,k,kind:'nl',meta:i});P.push({t:'atmost',s,k,kind:'nm',meta:i});}
  return P;
}

function rng(seed){let s=seed>>>0;return()=>{s=(s*1664525+1013904223)>>>0;return s/4294967296;};}

// greedy build ordered clue list that forces all cells, each step <= cap clues
function build(w,h,sol,seed,cap){
  const n=w*h, R=rng(seed);
  let P=pool(w,h,sol).slice();
  // shuffle
  for(let i=P.length-1;i>0;i--){const j=Math.floor(R()*(i+1));[P[i],P[j]]=[P[j],P[i]];}
  const revealed=[]; const known={}; const order=[];
  // helper: cascade fix all cells forced within cap given revealed+known
  function cascade(){
    let prog=true, steps=[];
    while(prog){prog=false;
      for(let c=0;c<n;c++){ if(c in known) continue;
        const sup=E.minSupport(n,revealed,known,c,cap);
        if(sup){known[c]=sup.val; steps.push({cell:c,val:sup.val,size:sup.size,clues:sup.clues.map(i=>revealed[i])}); prog=true;}
      }
    }
    return steps;
  }
  // bootstrap: reveal clues until something forced
  let guard=0;
  while(Object.keys(known).length<n && guard++<200){
    // try to add one clue that yields progress
    let added=false;
    for(let pi=0;pi<P.length;pi++){
      const cand=P[pi];
      revealed.push(cand);
      const before=Object.keys(known).length;
      const steps=cascade();
      if(steps.length>0){ order.push({clue:cand, forced:steps}); P.splice(pi,1); added=true; break; }
      else { revealed.pop(); } // useless, drop from revealed (keep in pool for later)
    }
    if(!added) break; // stuck
  }
  const solved=Object.keys(known).length===n;
  // verify uniqueness under revealed clues
  const ms=E.models(n,revealed);
  const unique = ms.length===1 && ms[0].every((v,i)=>v===sol[i]);
  const maxSize=order.reduce((m,o)=>Math.max(m,...o.forced.map(f=>f.size)),0);
  return {solved,unique,clues:revealed,order,maxSize};
}

function randSol(w,h,ncrim,seed){const n=w*h,R=rng(seed);const idx=[...Array(n).keys()];for(let i=n-1;i>0;i--){const j=Math.floor(R()*(i+1));[idx[i],idx[j]]=[idx[j],idx[i]];}const sol=new Array(n).fill(0);for(let i=0;i<ncrim;i++)sol[idx[i]]=1;return sol;}

module.exports={geom,pool,build,randSol,rng};

// CLI search
if(require.main===module){
  const [,,W,H,NC,CAP,N]=process.argv.map(Number);
  const w=W||3,h=H||3,cap=CAP||3,tries=N||400;
  const found=[];
  for(let s=1;s<=tries;s++){
    const ncrim = NC||(2+Math.floor(rng(s*7+1)()*(w*h/3)));
    const sol=randSol(w,h,ncrim,s*13+5);
    const r=build(w,h,sol,s*101+3,cap);
    if(r.solved&&r.unique){found.push({seed:s,sol,ncrim,nClues:r.clues.length,maxSize:r.maxSize,steps:r.order.length});}
  }
  found.sort((a,b)=>a.nClues-b.nClues || a.maxSize-b.maxSize);
  console.log('grid',w+'x'+h,'cap',cap,'found',found.length,'of',tries);
  console.log(found.slice(0,12).map(f=>`seed=${f.seed} crim=${f.ncrim} clues=${f.nClues} maxChain=${f.maxSize} steps=${f.steps}`).join('\n'));
}
