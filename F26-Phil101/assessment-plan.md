# Phil 101 — Assessment Plan (Fall 2026)

Working document, settled 4 August 2026. This is the structure the syllabus will state. Individual prompts are not written yet.

Design constraints this answers to: 150 students and three GSIs, so a hard cap on human reading; many students in their first term, so nothing heavy early; as much supervised work as the format allows, because unsupervised short-answer and multiple-choice work can be produced by a language model in seconds; assessment spread across the seven units; and real use made of discussion section, which students attend as often as lecture.

## The scheme

| Component | Weight | Setting | Graded by |
|---|---:|---|---|
| Reading quizzes, in lecture (best 15 of ~20) | 15% | Lecture, clicker | Automatic |
| Discussion section, including Short Answer 1 | 20% | Section | GSI |
| Module quizzes, 4 × 2.5%, open book | 10% | Online | Automatic |
| Short Answer 2, essay scaffolding | 10% | Take-home | GSI |
| Essay | 25% | Take-home | GSI |
| Final examination | 20% | Exam period | Mixed |
| **Total** | **100%** | | |

Supervised components come to 55%. The remaining 45% (module quizzes, Short Answer 2, essay) is done unsupervised and cannot be protected from LLM use by any measure available here. What the scheme does instead is make sure two samples of each student's supervised writing exist, one in October and one in December, against which the essay can be read.

## Escalation

Stakes rise across the term, so nobody's first graded work is consequential.

1. A single reading quiz is worth 1%.
2. The first module quiz is worth 2.5%.
3. Short Answer 1 is worth 8%, and is the first thing a GSI reads.
4. Short Answer 2 is worth 10%.
5. The essay is worth 25%, and lands in week 14.

Nothing above 3% falls due before the sixth week.

## Calendar

Lecture days are numbered as in `course-map.md`. Dates assume classes begin Monday 31 August.

| Item | Released | Due |
|---|---|---|
| Reading quizzes | Day 4 (Thu 10 Sep) onward | In lecture |
| Module Quiz 1 (Days 1–9) | After Day 9 (Tue 29 Sep) | Sun 4 Oct |
| Short Answer 1, epistemology | Written in section | Week of 5 Oct |
| Short Answer 2, perception and consciousness | After Day 12 (Thu 8 Oct) | Fri 23 Oct |
| Module Quiz 2 (Days 10–14) | After Day 14 (Thu 15 Oct) | Sun 1 Nov |
| Short Answer 2 feedback returned | | Fri 6 Nov |
| Essay, ethics and welfare | Fri 6 Nov, with SA2 feedback | Mon 23 Nov |
| Module Quiz 3 (Days 15–21) | After Day 21 (Thu 12 Nov) | Sun 15 Nov |
| Module Quiz 4 (Days 22–27) | After Day 27 (Tue 8 Dec) | Fri 11 Dec |
| Final examination | | Exam period, 14–21 Dec |

Each module quiz covers one block of the course, which is what spreads assessment across the units: reasoning and epistemology, mind, ethics and welfare, then the self with law and politics. Day 28 is review, and is examined only on the final.

### Why the writing sequence sits where it does

The essay is due Monday 23 November, before the Thanksgiving recess, so that feedback reaches students while the term is still running. That constraint sets everything upstream.

The last block a student can be examined on in an essay due 23 November is ethics and welfare, which finishes on Day 21 (Thursday 12 November). So the essay is on ethics and welfare, and Short Answer 2 has to be on something else, or the two land on the same material and the scaffolding teaches nothing.

Short Answer 2 therefore moves to the mind unit, and within it to the first three lectures, Days 10 to 12: perception reconsidered, the bat, and Mary. It goes out after Day 12 on Thursday 8 October and is due Friday 23 October. That puts the three written pieces on three different blocks: epistemology in section, mind at home, ethics and welfare in the essay.

Releasing it after Day 12 rather than Day 14 is what buys the marking time. The three intervals then come out at fifteen days for students to write, fourteen days to mark, and seventeen days for the essay, with nothing squeezed.

The cost is that Short Answer 2 cannot ask about the dualism classes, since they have not happened when it goes out. That is a smaller loss than it sounds. The exercise is about the five moves, not about covering the unit, and perception, Nagel, and Jackson give three perfectly good targets. Dualism is picked up by Module Quiz 2, which still covers Days 10 to 14.

Module Quiz 2 shifts its due date to Sunday 1 November so it does not land in the same week as Short Answer 2.

### What has to be ready beforehand

The table above is the student-facing calendar. This is the other half: what has to exist before each of those dates, and who has to have done it. Written on 17 September, at the end of Day 6.

**Before Day 7, Tuesday 22 September.** This is the first quiz that counts, so three things want settling first.

*Whether students whose home college is not LSA are covered by the iClicker licence.* LSA belongs to the enterprise consortium, but its own documentation says students from other colleges may have to pay, and an intro course this size will have a lot of them. Up to Day 7 a student who could not log in lost nothing. From Day 7 they lose marks. Ask LSATechnologyServices@umich.edu.

*How many quiz days there actually are.* Twenty-five lectures carry a required reading, and twenty-one of those fall on or after Day 7. The syllabus promises quizzes on twenty days with the best fifteen counting, so there is exactly one spare day in the whole term. Running a quiz on all twenty-one eligible days and counting the best fifteen over-delivers slightly on the promise and keeps the spare day; cutting to best fifteen of eighteen also fixes the arithmetic but makes the scheme harsher than the published version part-way through the term. Days 5 and 6 were announced to the class as practice and should not be counted retroactively.

*What iClicker syncs to Canvas.* Since best-fifteen is computed in `tools/reading-quizzes.R`, iClicker probably should not write to the gradebook at all, rather than writing a number that is wrong all term and gets overwritten in December.

**The GSI meeting is the critical path, and it wants to happen by Friday 26 September.** Short Answer 1 is written in section in the week of 5 October. Before it can run there has to be: three or four prompts, the engagement rubric, a worked marking example, the agreed menu for the 5% task, accommodation requirements checked, and one makeup slot booked across all six sections. Two of the three GSIs have never marked anything. None of that survives being done in the week it happens.

**Then, in order.**

| When | What | What has to be ready |
|---|---|---|
| Tue 29 Sep | Module Quiz 1 opens, due Sun 4 Oct | Questions on Days 1-9, written the week before |
| Week of 5 Oct | Short Answer 1, in section | Everything from the GSI meeting above |
| Thu 8 Oct | Short Answer 2 out, due Fri 23 Oct | Five prompts on Days 10-12 |
| Thu 15 Oct | Module Quiz 2 opens, due Sun 1 Nov | Questions on Days 10-14 |

**One dependency that is easy to miss.** Short Answer 2 is set on Days 10 to 12: perception, Nagel and Mary. Those three decks have to exist before 8 October, because the prompts come out of them. That puts three lecture-writing sessions inside the same three weeks as the GSI meeting and two sets of quiz questions.

## The tasks

### Reading quizzes (15%)

Two or three clicker questions at the start of lecture, on that day's assigned reading. A student who did the reading answers in under a minute. A student who did not cannot bluff them.

Run these on roughly twenty of the twenty-four lecture days that carry a reading, and count the best fifteen. Each counted quiz is worth 1%. The drop policy is doing real work: with five free absences nobody has to document an illness and no GSI has to adjudicate one.

At 15% this is the largest automatically-graded component, which is deliberate. It is also the one a student cannot outsource, since they have to be in the room.

Two things to watch. At 9am with 150 students, clicker scores are partly an attendance measure, and proxy clicking is the standard failure. Whatever platform is used should be one that ties responses to the room. Second, only Days 1, 2 and 28 carry no required reading, so twenty-five days are eligible. Days 5 and 6 were run as an ungraded soft launch, which leaves twenty-one eligible days from Day 7 onward.

### Discussion section (20%)

One bucket on the syllabus, with an internal structure settled with the GSIs before term rather than left to each of them. Proposed split, for that conversation:

| Piece | Weight |
|---|---:|
| Short Answer 1, written in section | 8% |
| Section engagement, banded rubric | 7% |
| One further task, form chosen by the GSI from an agreed menu | 5% |

Twenty per cent assessed by three different people is a larger source of grade inequity than it looks. Two students of equal merit in different sections should not finish most of a letter grade apart because their GSIs read the word "participation" differently. The engagement rubric wants a small number of bands with worked descriptions, and the distributions want checking against each other around week eight.

Two of the three GSIs are teaching for the first time, which cuts against open-ended discretion twice over. They have no calibration to draw on, and an unstructured 20% is something they will worry about rather than enjoy. A menu of three or four concrete options for the 5% component gives them a real choice without asking them to invent an assessment from nothing. Alongside it they will want the engagement rubric, a worked example of a graded Short Answer 1, and a marking meeting after the first batch comes in.

### Module quizzes (4 × 2.5%)

Multiple choice, open book, taken online, one per block of the course.

These are reading compliance rather than assessment, and the weighting says so. Any of them can be completed by a language model, and at 2.5% each it is not worth building an enforcement apparatus to prevent that. What they buy is a reason to keep up with the material between the written pieces, and four data points on where the class is lost.

### Short Answer 1 (8%, inside the section component), written in section

Three or four short prompts on the epistemology material from Days 1 through 9, written by hand in section during the week of 5 October, in about thirty minutes.

This is the load-bearing piece of the whole design, and not because of its weight. It is the only sample of unassisted prose the course collects before the essay. Grade it generously; the aim is a calibration sample and a low-cost first experience of being read, not a filter.

Absences need a makeup path decided in advance. At 150 students, expect ten to fifteen across the six sections. A single scheduled makeup slot in the following week is cheaper than arranging them one at a time.

Accommodations need checking before the date is fixed. Students with extended time or a keyboard requirement cannot be handled in a 50-minute section without arrangement, and at this enrolment there will be several.

### Short Answer 2 (10%), take-home

Five prompts that walk a student through the moves an essay makes, on a case from Days 10 to 12: sense-data, the bat, or the knowledge argument. Out Thursday 8 October, due Friday 23 October.

1. State the view in your own words, in three sentences.
2. Give the strongest argument its defenders offer.
3. State the objection you find most serious.
4. Say how a defender might answer that objection.
5. Say where you come down, and why.

Each answer is a short paragraph. Graded on the answers separately, not as continuous prose.

### Essay (25%)

The essay applies the same five moves to a topic from ethics and welfare (Days 15 to 21), without the prompts. Due Monday 23 November.

It matters that the topic is not the one from Short Answer 2. If the essay were a matter of stitching the earlier answers into paragraphs, that is a task a language model does perfectly, and the scaffolding would have taught nothing. What transfers is the structure. The student has been walked through the moves once with the prompts visible, and now makes them unaided on new material.

Around 1200 words. The prompt goes out with feedback on Short Answer 2, so the feedback is usable.

### Final examination (20%)

Two parts. A multiple-choice section covering the whole course, worth 12%, which grades itself. And two or three short-answer questions worth 8%, of the kind students have already met in Short Answer 1 and in section.

The short answers should be drawn from Days 22 to 28. That is deliberate. Those seven lectures cover the self, law, punishment, and free speech, and once the essay moved to November they carry almost nothing else: Module Quiz 4 at 2.5% is the only other thing attached to them. Pointing the exam's written questions at that stretch gives it about 10.5% of the grade, and tells students the last three weeks are not a victory lap.

Anyone who wrote their own work during term should find both parts straightforward. That is the intent, and it should be said to the students in as many words.

## Grading load

Per GSI, at fifty students each.

| Item | Minutes each | Hours per GSI | Marking window |
|---|---:|---:|---|
| Short Answer 1 | 5 | 4 | Week of 12 Oct |
| Short Answer 2 | 12 | 10 | 23 Oct to 6 Nov |
| Essay | 20 | 17 | 30 Nov to 11 Dec |
| Final, short-answer part | 8 | 7 | Exam period |
| **Total** | | **38** | |

Thirty-eight hours across a fifteen-week term is not a heavy marking load, and the November essay deadline improves its shape without reducing it. The essay and the final no longer overlap: essays are marked across the two working weeks from 30 November to 11 December and go back on the last day of classes, three days before the exam period opens.

Nobody should be marking over the Thanksgiving recess. The essay is due Monday 23 November and the recess runs Wednesday to Friday that week, so the marking window starts the following Monday. That is deliberate and should be said out loud, or someone new to teaching will assume the holiday is working time.

Short Answer 2 gets a full fortnight, 23 October to 6 November, because its feedback is the piece of writing instruction the essay depends on. Ten hours each across two weeks, with only the tail of Short Answer 1 marking behind it.

## What this does not solve

Half the grade is earned out of sight, and no scheme available at this enrolment changes that. The supervised samples make a gross mismatch visible between what a student writes in a room and what they submit from home. They do not prove anything, and building an academic-integrity case on a difference in writing style is a fight worth avoiding. Treat the samples as a signal for a conversation, not as evidence.

The honest position to take with the class is that the components which can be automated are weighted so that automating them gains a student almost nothing, and the components that carry weight are ones where doing the work themselves is the only route to the grade. That happens to be true of this scheme, which is a better deterrent than a policy paragraph.

## Open items

- Settle the internal split of the 20% section component with the GSIs, and agree the engagement rubric and the menu for the 5% task.
- Two of three GSIs are new to teaching: budget time for a rubric walkthrough, a worked marking example, and a post-first-batch calibration meeting.
- Confirm the exam date and length once the University publishes the schedule, and confirm the short-answer questions can be drawn from Days 22 to 28.
- Check accommodation requirements before fixing the Short Answer 1 section date.
- Confirm the GSIs can return marked Short Answer 2 scripts by Friday 6 November. The date is not movable: the essay question goes out with them, and pushing it later eats the essay window rather than the marking window.
- Fix the reading-quiz denominator before Day 7. Twenty-one eligible days remain and the syllabus promises twenty quizzes, so there is one spare day for the term. Running all twenty-one and counting the best fifteen is the option that does not make the published scheme harsher. Best 15 of 20 also leaves a student sitting on fifteen strong scores by mid-November free to skip the last three weeks at no cost; the final's short-answer section pointing at Days 22 to 28 is the other half of the answer to that.
- Settle whether students outside LSA are covered by the iClicker licence. Time-critical: graded quizzes begin Day 7.
