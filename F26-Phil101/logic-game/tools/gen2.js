const E=require('./engine.js');
const {geom,pool,randSol,rng}=require('./gen.js');

// minimal subset of pool clues that uniquely determines sol (greedy add then prune)
function uniqueSet(w,h,sol,seed){
  const n=w*h; let P=pool(w,h,sol).slice(); const R=rng(seed);
  for(let i=P.length-1;i>0;i--){const j=Math.floor(R()*(i+1));[P[i],P[j]]=[P[j],P[i]];}
  const chosen=[];
  for(const c of P){ chosen.push(c); const ms=E.models(n,chosen); if(ms.length===1) break; }
  if(E.models(n,chosen).length!==1) return null;
  // prune redundant
  for(let i=chosen.length-1;i>=0;i--){const test=chosen.slice(0,i).concat(chosen.slice(i+1));if(E.models(n,test).length===1)chosen.splice(i,1);}
  return chosen;
}

// hardness: solve with all clues visible, each round do the easiest available deductions.
// returns {hardness, rounds:[{size,cells}], ok}
function hardness(n,clues,cap){
  const known={}; const rounds=[];
  let guard=0;
  while(Object.keys(known).length<n && guard++<n+5){
    let best=Infinity, sup={};
    for(let c=0;c<n;c++){ if(c in known)continue;
      const s=E.minSupport(n,clues,known,c,cap);
      if(s){ sup[c]=s; if(s.size<best)best=s.size; }
    }
    if(best===Infinity) return {ok:false}; // stuck or needs >cap
    const cells=[];
    for(const c in sup){ if(sup[c].size===best){ known[c]=sup[c].val; cells.push({cell:+c,val:sup[c].val,clues:sup[c].clues}); } }
    rounds.push({size:best,cells});
  }
  if(Object.keys(known).length<n) return {ok:false};
  return {ok:true, hardness:Math.max(...rounds.map(r=>r.size)), rounds};
}

if(require.main===module){
  const [,,W,H,TARGET,N]=process.argv.map(Number);
  const w=W||3,h=H||3,target=TARGET||3,tries=N||400;
  const hits=[];
  for(let s=1;s<=tries;s++){
    const ncrim=2+Math.floor(rng(s*7+1)()*(w*h/2.5));
    const sol=randSol(w,h,ncrim,s*13+5);
    const cs=uniqueSet(w,h,sol,s*31+9); if(!cs)continue;
    const hd=hardness(w*h,cs,3); if(!hd.ok)continue;
    if(hd.hardness===target) hits.push({seed:s,ncrim,nClues:cs.length,hardness:hd.hardness,rounds:hd.rounds.length});
  }
  hits.sort((a,b)=>a.nClues-b.nClues||a.rounds-b.rounds);
  console.log(`grid ${w}x${h} target hardness ${target}: ${hits.length} hits`);
  console.log(hits.slice(0,10).map(f=>`seed=${f.seed} crim=${f.ncrim} clues=${f.nClues} rounds=${f.rounds}`).join('\n'));
}
