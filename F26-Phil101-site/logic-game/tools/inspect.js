const E=require('./engine.js');
const {pool,randSol,rng,geom}=require('./gen.js');
const {uniqueSet,hardness}=(()=>{const m=require('./gen2.js');return m;})();

// re-expose from gen2 (not exported) -> redefine minimal copies
function uSet(w,h,sol,seed){const n=w*h;let P=pool(w,h,sol).slice();const R=rng(seed);for(let i=P.length-1;i>0;i--){const j=Math.floor(R()*(i+1));[P[i],P[j]]=[P[j],P[i]];}const chosen=[];for(const c of P){chosen.push(c);if(E.models(n,chosen).length===1)break;}if(E.models(n,chosen).length!==1)return null;for(let i=chosen.length-1;i>=0;i--){const t=chosen.slice(0,i).concat(chosen.slice(i+1));if(E.models(n,t).length===1)chosen.splice(i,1);}return chosen;}
function hard(n,clues,cap){const known={};const rounds=[];let g=0;while(Object.keys(known).length<n&&g++<n+5){let best=Infinity,sup={};for(let c=0;c<n;c++){if(c in known)continue;const s=E.minSupport(n,clues,known,c,cap);if(s){sup[c]=s;if(s.size<best)best=s.size;}}if(best===Infinity)return{ok:false};const cells=[];for(const c in sup)if(sup[c].size===best){known[c]=sup[c].val;cells.push({cell:+c,val:sup[c].val,clues:sup[c].clues});}rounds.push({size:best,cells});}return{ok:true,hardness:Math.max(...rounds.map(r=>r.size)),rounds};}

const NAMES=['Amir','Bea','Cory','Dana','Evan','Fay','Gil','Hana','Ira','Jo','Kit','Lou'];
function setTxt(s,names){return s.map(i=>names[i]).join(', ');}
function clueTxt(c,names){
  switch(c.t){
    case 'count': return `Exactly ${c.k} of {${setTxt(c.s,names)}} ${c.k===1?'is a criminal':'are criminals'}`;
    case 'atleast': return `At least ${c.k} of {${setTxt(c.s,names)}} are criminals`;
    case 'atmost': return `At most ${c.k} of {${setTxt(c.s,names)}} are criminals`;
    case 'same': return `${names[c.a]} and ${names[c.b]} are the same (both criminal or both innocent)`;
    case 'diff': return `${names[c.a]} and ${names[c.b]} are different (one criminal, one innocent)`;
  }
}
function run(w,h,seed){
  const n=w*h, names=NAMES.slice(0,n);
  const sol=randSol(w,h, 2+Math.floor(rng(seed*7+1)()*(w*h/2.5)), seed*13+5);
  const cs=uSet(w,h,sol,seed*31+9);
  const hd=hard(n,cs,3);
  console.log(`\n=== ${w}x${h} seed=${seed}  hardness=${hd.hardness} ===`);
  console.log('grid (reading order):'); for(let r=0;r<h;r++)console.log('  '+names.slice(r*w,r*w+w).map((nm,k)=>nm+'='+(sol[r*w+k]?'C':'i')).join('  '));
  console.log('CLUES:'); cs.forEach((c,i)=>console.log(`  [${i}] ${clueTxt(c,names)}`));
  console.log('FORCED SOLVE (easiest-first):');
  hd.rounds.forEach((rd,ri)=>{ rd.cells.forEach(ce=>{ console.log(`  round ${ri+1} (chain ${rd.size}): ${names[ce.cell]} = ${ce.val?'CRIMINAL':'innocent'}  via clues [${ce.clues.join(',')}]`);});});
}
const args=process.argv.slice(2).map(Number);
run(args[0],args[1],args[2]);
