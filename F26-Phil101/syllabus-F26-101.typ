// Simple numbering for non-book documents
#let equation-numbering = "(1)"
#let callout-numbering = "1"
#let subfloat-numbering(n-super, subfloat-idx) = {
  numbering("1a", n-super, subfloat-idx)
}

// Theorem configuration for theorion
// Simple numbering for non-book documents (no heading inheritance)
#let theorem-inherited-levels = 0

// Theorem numbering format (can be overridden by extensions for appendix support)
// This function returns the numbering pattern to use
#let theorem-numbering(loc) = "1.1"

// Default theorem render function
#let theorem-render(prefix: none, title: "", full-title: auto, body) = {
  if full-title != "" and full-title != auto and full-title != none {
    strong[#full-title.]
    h(0.5em)
  }
  body
}
// Some definitions presupposed by pandoc's typst output.
#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms.item: it => block(breakable: false)[
  #text(weight: "bold")[#it.term]
  #block(inset: (left: 1.5em, top: -0.4em))[#it.description]
]

// Some quarto-specific definitions.

#show raw.where(block: true): set block(
    fill: luma(230),
    width: 100%,
    inset: 8pt,
    radius: 2pt
  )

#let block_with_new_content(old_block, new_content) = {
  let fields = old_block.fields()
  let _ = fields.remove("body")
  if fields.at("below", default: none) != none {
    // TODO: this is a hack because below is a "synthesized element"
    // according to the experts in the typst discord...
    fields.below = fields.below.abs
  }
  block.with(..fields)(new_content)
}

#let empty(v) = {
  if type(v) == str {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$")).at(0, default: none) != none
  } else if type(v) == content {
    if v.at("text", default: none) != none {
      return empty(v.text)
    }
    for child in v.at("children", default: ()) {
      if not empty(child) {
        return false
      }
    }
    return true
  }

}

// Subfloats
// This is a technique that we adapted from https://github.com/tingerrr/subpar/
#let quartosubfloatcounter = counter("quartosubfloatcounter")

#let quarto_super(
  kind: str,
  caption: none,
  label: none,
  supplement: str,
  position: none,
  subcapnumbering: "(a)",
  body,
) = {
  context {
    let figcounter = counter(figure.where(kind: kind))
    let n-super = figcounter.get().first() + 1
    set figure.caption(position: position)
    [#figure(
      kind: kind,
      supplement: supplement,
      caption: caption,
      {
        show figure.where(kind: kind): set figure(numbering: _ => {
          let subfloat-idx = quartosubfloatcounter.get().first() + 1
          subfloat-numbering(n-super, subfloat-idx)
        })
        show figure.where(kind: kind): set figure.caption(position: position)

        show figure: it => {
          let num = numbering(subcapnumbering, n-super, quartosubfloatcounter.get().first() + 1)
          show figure.caption: it => block({
            num.slice(2) // I don't understand why the numbering contains output that it really shouldn't, but this fixes it shrug?
            [ ]
            it.body
          })

          quartosubfloatcounter.step()
          it
          counter(figure.where(kind: it.kind)).update(n => n - 1)
        }

        quartosubfloatcounter.update(0)
        body
      }
    )#label]
  }
}

// callout rendering
// this is a figure show rule because callouts are crossreferenceable
#show figure: it => {
  if type(it.kind) != str {
    return it
  }
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match == none {
    return it
  }
  let kind = kind_match.captures.at(0, default: "other")
  kind = upper(kind.first()) + kind.slice(1)
  // now we pull apart the callout and reassemble it with the crossref name and counter

  // when we cleanup pandoc's emitted code to avoid spaces this will have to change
  let old_callout = it.body.children.at(1).body.children.at(1)
  let old_title_block = old_callout.body.children.at(0)
  let children = old_title_block.body.body.children
  let old_title = if children.len() == 1 {
    children.at(0)  // no icon: title at index 0
  } else {
    children.at(1)  // with icon: title at index 1
  }

  // TODO use custom separator if available
  // Use the figure's counter display which handles chapter-based numbering
  // (when numbering is a function that includes the heading counter)
  let callout_num = it.counter.display(it.numbering)
  let new_title = if empty(old_title) {
    [#kind #callout_num]
  } else {
    [#kind #callout_num: #old_title]
  }

  let new_title_block = block_with_new_content(
    old_title_block,
    block_with_new_content(
      old_title_block.body,
      if children.len() == 1 {
        new_title  // no icon: just the title
      } else {
        children.at(0) + new_title  // with icon: preserve icon block + new title
      }))

  align(left, block_with_new_content(old_callout,
    block(below: 0pt, new_title_block) +
    old_callout.body.children.at(1)))
}

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black, body_background_color: white) = {
  block(
    breakable: false, 
    fill: background_color, 
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"), 
    width: 100%, 
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%, 
      below: 0pt, 
      block(
        fill: background_color,
        width: 100%,
        inset: 8pt)[#if icon != none [#text(icon_color, weight: 900)[#icon] ]#title]) +
      if(body != []){
        block(
          inset: 1pt, 
          width: 100%, 
          block(fill: body_background_color, width: 100%, inset: 8pt, body))
      }
    )
}




#let article(
  title: none,
  subtitle: none,
  authors: none,
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: none,
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  // Set document metadata for PDF accessibility
  set document(title: title, keywords: keywords)
  set document(
    author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set par(
    justify: true,
    leading: linestretch * 0.65em
  )
  set text(lang: lang,
           region: region,
           size: fontsize)
  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  set heading(numbering: sectionnumbering)

  show link: set text(fill: rgb(content-to-string(linkcolor))) if linkcolor != none
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none
  show link: this => {
    if filecolor != none and type(this.dest) == label {
      text(this, fill: rgb(content-to-string(filecolor)))
    } else {
      text(this)
    }
   }

  let has-title-block = title != none or (authors != none and authors != ()) or date != none or abstract != none
  if has-title-block {
    place(
      top,
      float: true,
      scope: "parent",
      clearance: 4mm,
      block(below: 1em, width: 100%)[

        #if title != none {
          align(center, block(inset: 2em)[
            #set par(leading: heading-line-height) if heading-line-height != none
            #set text(font: heading-family) if heading-family != none
            #set text(weight: heading-weight)
            #set text(style: heading-style) if heading-style != "normal"
            #set text(fill: heading-color) if heading-color != black

            #text(size: title-size)[#title #if thanks != none {
              footnote(thanks, numbering: "*")
              counter(footnote).update(n => n - 1)
            }]
            #(if subtitle != none {
              parbreak()
              text(size: subtitle-size)[#subtitle]
            })
          ])
        }

        #if authors != none and authors != () {
          let count = authors.len()
          let ncols = calc.min(count, 3)
          grid(
            columns: (1fr,) * ncols,
            row-gutter: 1.5em,
            ..authors.map(author =>
                align(center)[
                  #author.name \
                  #author.affiliation \
                  #author.email
                ]
            )
          )
        }

        #if date != none {
          align(center)[#block(inset: 1em)[
            #date
          ]]
        }

        #if abstract != none {
          block(inset: 2em)[
          #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
          ]
        }
      ]
    )
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  doc
}

#set table(
  inset: 6pt,
  stroke: none
)
// A little extra leading; Typst's default is 0.65em.
#set par(leading: 0.72em)

// Heading spacing. Level 2 is the Week headings, level 3 the
// individual class days. The reading lines under each date are held
// together by hard line breaks, so the only thing separating a date
// from its readings is the heading's `below`. Raise `above` to open
// the gaps between blocks, `below` to unstick a heading.
#show heading.where(level: 2): set block(above: 2.0em, below: 0.9em)
#show heading.where(level: 3): set block(above: 1.5em, below: 0.65em)
#import "@preview/fontawesome:0.5.0": *
#let brand-color = (:)
#let brand-color-background = (:)
#let brand-logo = (:)

#set page(
  paper: "us-letter",
  margin: (x: 1in,y: 1in,),
  numbering: "1",
  columns: 1,
)

#show: doc => article(
  title: [PHIL 101: Introduction to Philosophy],
  authors: (
    ( name: [Brian Weatherson],
      affiliation: [],
      email: [] ),
    ),
  date: [2026-01-01],
  font: ("EB Garamond",),
  fontsize: 11pt,
  heading-family: ("EB Garamond",),
  toc_title: [Table of contents],
  toc_depth: 3,
  doc,
)

#block[
#callout(
body: 
[
This version is for the pre-term meeting, not for students. The last section records what is still open. Delete that section, and this box, before the student version goes out.

]
, 
title: 
[
Draft for discussion with GSIs
]
, 
background_color: 
rgb("#f7dddc")
, 
icon_color: 
rgb("#CC1914")
, 
icon: 
fa-exclamation()
, 
body_background_color: 
white
)
]
#strong[Instructor]: Brian Weatherson \ #strong[Email]: weath\@umich.edu \ #strong[Office Hours]: TBD \ #strong[Lectures]: Tuesday and Thursday, 9:00--9:50, room TBD \ #strong[Discussion sections]: Twice weekly, 50 minutes, times and rooms TBD \ #strong[Web]: canvas.umich.edu and #link("https://bweatherson.github.io/F26-Phil101-site/")

~

= Key Points
<key-points>
- This course is an introduction to philosophy through a set of connected questions: how we ought to reason, when a belief is rational, what minds and persons are, and what we owe each other.
- No background is assumed. Most readings are short, and all of them are free.
- The course meets twice a week for lecture and twice a week for discussion section. Attendance at both matters, and a good deal of the assessment happens in the room.
- Assessment is spread across many small pieces rather than concentrated in a few large ones. Nothing worth more than 3% falls due before the sixth week.
- There is one essay, worth 25%, and it comes at the end of a sequence designed to teach you how to write it.

= Course Description
<course-description>
Philosophy starts from questions that are easy to ask and hard to answer. This course takes a handful of them and works through what has been said in reply, from classical India and ancient Greece to work published in the last few years.

We begin with reasoning. What makes an argument a good one, what separates the inferences that are safe from the ones that pay, and why does a run of evidence never quite settle what comes next?

The second unit asks when a belief is rational. We'll start with the question of when perceptual beliefs are rational, and then move onto other cases. A particular focus will be beliefs formed via testimony. This raises both theoretical questions, what makes a belief formed via testimony rational, and practical questions, in a world like this, who should we trust?

The middle of the course is about minds. The big question here is one of the oldest in philosophy: what is the relationship between minds and bodies. We'll get to that by looking again at perception, and in particular thinking about the conscious aspects of perception, what it #emph[feels like] to perceive the world the way we do.

The rest of the course is about value. What makes an action right, what makes a life go well, what makes you the same person you were at five, and what a state may and may not do to you. We end on free speech, which sends us back to where we started, since the case for free speech is a claim about how a group of people reasons its way to the truth.

= Required Materials
<required-materials>
There is no textbook to buy. Every required reading is free and linked from the course site and from Canvas.

Readings are short by design. Most weeks ask for under 5,000 words (about 10-15 pages of a normal book), though there are a couple of heavier days.

You will need an iClicker or the iClicker app for this course, since reading quizzes are answered in lecture. Details will be on Canvas before the first class.

= Course Requirements
<course-requirements>
#table(
  columns: 2,
  align: (auto,right,),
  table.header([Component], [Weight],),
  table.hline(),
  [Reading quizzes in lecture, best 15 of 20], [15%],
  [Discussion section, including Short Answer 1], [20%],
  [Module quizzes, four at 2.5% each], [10%],
  [Short Answer 2], [10%],
  [Essay], [25%],
  [Final examination], [20%],
  [#strong[Total]], [#strong[100%]],
)
#strong[Reading quizzes.] Two or three questions in lecture on that day's reading. These should be trivial #emph[if you've done the reading]. Quizzes run on #strong[twenty] of the days that carry a reading and the best #strong[fifteen] count, so five missed days cost you nothing and need no explanation.

#strong[Discussion section.] Twenty per cent of the grade is earned in section. Part of it is Short Answer 1, described below. #strong[WE NEED TO DISCUSS WHAT GOES HERE BEFORE DISTRIBUTING TO THE STUDENTS]

#strong[Module quizzes.] Four short open-book multiple-choice quizzes, taken on Canvas, one at the end of each block of the course. These are there to help you keep up, and they are weighted accordingly.

#strong[Short Answer 1.] Three short questions on the first block of the course, written by hand in section in the week of Monday, October 05. About thirty minutes. This is the first piece of writing anyone reads.

#strong[Short Answer 2.] Five questions on Lectures 10 to 12, done at home, due Friday 23 October. They walk you through the moves a philosophy essay makes, and are practice for the essay.

#strong[Essay.] About 1,200 words on a question in ethics or welfare, due Monday 23 November. The essay should have a similar structure to Short Answer 2. We will get comments back to you on Short Answer 2 well before this is due.

#strong[Final examination.] This will be on the last part of the course, since there is no work to turn in from that part. It will be a mix of short-answer and multiple-choice.

= Submit Your Own Work
<submit-your-own-work>
Anything you put your name to, and hand in, has to be #emph[your own work]. Copying passages from a textbook, borrowing someone else's work, paying someone to do it for you, or handing the assignment to a chatbot, are ways of creating documents that are not your own work, and are violations of academic integrity. Getting someone (or something) else to translate what you wrote is also #emph[not acceptable] for this course.

In practice, we have the following two rules on #emph[everything] written that you turn in.

+ There must be an #emph[acknowledgments] section where you record all the help you got, from friends, family, books, computers, etc. You should overshare here; it's fine to get lots of help, and as long as the result is your own work, we aren't going to worry what help you got. One exception to this: if if you do use any online tools (that includes search engines, now that they have language models built in) you must keep records of everything you ask them. Do not use anyone else's account, or any account you cannot access the history of, for any course-related purpose.
+ For anything you write, you have to be able to answer two questions: #emph[What did you mean by that?] and #emph[Why did you write that?]. That's what we mean by something being your own work; you can explain and defend it.

#strong[NOTE FOR GSIs - THIS IS IMPORTANT AND WILL BE SOMETHING YOU HAVE TO DO; WE SHOULD TALK ABOUT THE LOGISTICS OF THIS AND WHETHER IT CAN BE IMPROVED]

To that end, we will frequently #strong[audit] the turned in work. In practice, that means we'll ask the auditee (that might be you!) to explain, in person, what they meant by various claims, and why they wrote it. We will audit work that we think is suspicious, and we will also do some audits #emph[at random]. If we audit you, this does not mean we think you cheated; it could be random. It's annoying for us, and I'm sure annoying for you, that we have to do this, but the evidence is that people turning in work which is not their own is a bit out of control.

= Canvas
<canvas>
There is a Canvas site for this course at #link("https://canvas.umich.edu"). Readings, quizzes, and announcements live there. Check it regularly.

There is also a course website at #link("https://bweatherson.github.io/F26-Phil101-site/") with the slides and other material.

#pagebreak()
= Class Schedule
<class-schedule>
Readings are listed under the class they are for, and should be done before that class. Where more than one required item is listed, do the shortest one first.

The #emph[Stanford Encyclopedia of Philosophy] (plato.stanford.edu) and the #emph[Internet Encyclopedia of Philosophy] (iep.utm.edu) have entries on nearly every topic in this course. Both are free and written by specialists. Checking them is a good move whenever a reading or a lecture leaves you stuck, whether or not a particular entry is listed below. These entries are often long, and the listings below will sometimes point you to the part of an entry that's most relevant.

== Week 1: Getting Started
<week-1-getting-started>
=== Tuesday, September 01 (Lecture 1) --- Introduction
<tuesday-september-01-lecture-1-introduction>
What the course is about, and how it works. No reading.

=== Thursday, September 03 (Lecture 2) --- Deduction: the logic game
<thursday-september-03-lecture-2-deduction-the-logic-game>
We play a deduction game in class. No reading.

== Week 2: Risky Inference
<week-2-risky-inference>
=== Tuesday, September 08 (Lecture 3) --- Induction, analogy, and explanation
<tuesday-september-08-lecture-3-induction-analogy-and-explanation>
#strong[Required]: Arthur Conan Doyle, #link("https://www.gutenberg.org/ebooks/1661")["The Boscombe Valley Mystery," in #emph[The Adventures of Sherlock Holmes]] (Project Gutenberg). One passage only, about two pages: from "Sherlock Holmes was transformed when he was hot upon such a scent as this" to "There are several other indications, but these may be enough to aid us in our search." This isn't a philosophy paper, but we'll start with the philosophical presuppositions behind it. \ #strong[Recommended]: #link("https://www.gutenberg.org/ebooks/1661")[The rest of the story].

=== Thursday, September 10 (Lecture 4) --- Grue
<thursday-september-10-lecture-4-grue>
#strong[Required]: Jonathan Weisberg, #link("https://jonathanweisberg.org/vip/grue.html")["The Grue Paradox," in #emph[Odds & Ends], appendix C]. \ #strong[Recommended]: Sven Neth, #link("https://philpapers.org/archive/NETGNR.pdf")["Goodman's New Riddle of Induction Explained in Words of One Syllable."]

== Week 3: When Is a Belief Rational?
<week-3-when-is-a-belief-rational>
=== Tuesday, September 15 (Lecture 5) --- Perceptual evidence, and how many sources of knowledge there are
<tuesday-september-15-lecture-5-perceptual-evidence-and-how-many-sources-of-knowledge-there-are>
#strong[Required]: Todd R. Long, #link("https://1000wordphilosophy.com/2023/03/19/epistemic-justification/")["Epistemic Justification: What is Rational Belief?"] (1000-Word Philosophy). \ #strong[Required]: Stephen Phillips and Anand Vaidya SEP, #link("https://plato.stanford.edu/entries/epistemology-india/#KnowKnowSour")["Epistemology in Classical Indian Philosophy"], SEP, #strong[§1.1]. \ #strong[Recommended]: Ted Poston, #link("https://iep.utm.edu/foundationalism-in-epistemology/")["Foundationalism"], IEP, #strong[§§1--2].

=== Thursday, September 17 (Lecture 6) --- Memory and the forgotten source
<thursday-september-17-lecture-6-memory-and-the-forgotten-source>
#strong[Required]: Matthew Frise, #link("https://plato.stanford.edu/entries/memory-episprob/#PresGene")["Epistemological Problems of Memory"], SEP, #strong[§2.4]. \ #strong[Recommended]: Lisa K. Fazio et al., #link("https://www.apa.org/pubs/journals/features/xge-0000098.pdf")["Knowledge Does Not Protect Against Illusory Truth."]

== Week 4: Believing Other People
<week-4-believing-other-people>
=== Tuesday, September 22 (Lecture 7) --- Does testimony stand on its own?
<tuesday-september-22-lecture-7-does-testimony-stand-on-its-own>
#strong[Required]: Dhirendra Mohan Datta, #link("https://www.jstor.org/stable/2249544")["Testimony as a Method of Knowledge,"] #emph[Mind] 36 (1927): 354--358. (Note you need to be on campus, or have a JSTOR account, for this one.) \ #strong[Recommended]: Dan Sperber et al., #link("https://www.dan.sperber.fr/wp-content/uploads/2010_clement-et-al_epistemic-vigilance.pdf")["Epistemic Vigilance,"] #emph[Mind & Language] 25 (2010).

=== Thursday, September 24 (Lecture 8) --- Whom do you trust?
<thursday-september-24-lecture-8-whom-do-you-trust>
#strong[Required]: Elizabeth Anderson, #link("https://joelvelasco.net/teaching/2330/democracy-public-policy-and-lay-assessments-of-scientific-testimony1.pdf")["Democracy, Public Policy, and Lay Assessments of Scientific Testimony," #emph[Episteme] (2011), §2 (pp.~145--149)]. \ #strong[Recommended]: Helen Longino, #link("https://plato.stanford.edu/entries/scientific-knowledge-social/#BigSciTruAut")["The Social Dimensions of Scientific Knowledge"], SEP, #strong[§2].

== Week 5: Science, and the Mind
<week-5-science-and-the-mind>
=== Tuesday, September 29 (Lecture 9) --- Why trust science, and how trust breaks
<tuesday-september-29-lecture-9-why-trust-science-and-how-trust-breaks>
#strong[Required]: C. Thi Nguyen, #link("https://aeon.co/essays/why-its-as-hard-to-escape-an-echo-chamber-as-it-is-to-flee-a-cult")["Escape the Echo Chamber"], #emph[Aeon]. \ #strong[Required]: Naomi Oreskes, #link("https://news.harvard.edu/gazette/story/2019/10/in-why-trust-science-naomi-oreskes-explains-why-the-process-of-proof-is-worth-trusting/")["Defending science in a post-fact era"], #emph[Harvard Gazette], 2019. (The important part is the third question, about the 'five pillars'. The rest of the interview is #strong[Recommended]\.)

#emph[Module Quiz 1 (Lectures 1--9) opens after class, due Sunday.] (NOTE FOR GSIs; should I just post the questions earlier?)

=== Thursday, October 01 (Lecture 10) --- Perception reconsidered
<thursday-october-01-lecture-10-perception-reconsidered>
#strong[Required]: Bertrand Russell, #link("https://www.gutenberg.org/files/5827/5827-h/5827-h.htm")[#emph[The Problems of Philosophy]], ch.~1, "Appearance and Reality." \ #strong[Recommended]: Tim Crane and Craig French, #link("https://plato.stanford.edu/entries/perception-problem/")["The Problem of Perception"], SEP, "The Argument from Illusion", #strong[§2]. \ #strong[Recommended]: Paul Coates, #link("https://iep.utm.edu/sense-da/")["Sense-Data"], IEP.

== Week 6: Consciousness
<week-6-consciousness>
#emph[Short Answer 1 is written in section this week.]

=== Tuesday, October 06 (Lecture 11) --- What it is like
<tuesday-october-06-lecture-11-what-it-is-like>
#strong[Required]: Thomas Nagel, #link("https://rintintin.colorado.edu/~vancecd/phil201/Nagel.pdf")["What Is It Like to Be a Bat?"]. Note this is slightly more reading than most days in class.

=== Thursday, October 08 (Lecture 12) --- The hard problem, and Mary
<thursday-october-08-lecture-12-the-hard-problem-and-mary>
#strong[Required]: Tufan Kıymaz, #link("https://1000wordphilosophy.com/2019/10/05/the-knowledge-argument-against-physicalism/")["The Knowledge Argument Against Physicalism"] (1000-Word Philosophy). \ #strong[Required]: Frank Jackson, #link("https://courses.physics.illinois.edu/phys419/sp2021/Jackson1986_WhatMaryDidntKnow.pdf")["What Mary Didn't Know"]. It's probably best to read Kıymaz first as background for Jackson's paper.

#emph[Short Answer 2 goes out after class, on Lectures 10 to 12, due Friday 23 October.]

== Week 7: Dualism
<week-7-dualism>
=== Tuesday, October 13 (Lecture 13) --- The case for Dualism
<tuesday-october-13-lecture-13-the-case-for-dualism>
#strong[Required]: Peter Adamson, #link("https://aeon.co/ideas/what-can-avicenna-teach-us-about-the-mind-body-problem")["What can Avicenna teach us about the mind-body problem?" (#emph[Aeon Ideas])]. \ #strong[Required]: Marc Bobro, #link("https://1000wordphilosophy.com/2018/08/05/descartes-meditations-4-6/")["René Descartes' #emph[Meditations] 4--6"] (1000-Word Philosophy). The most important part is the end, on Meditation VI. \ #strong[Recommended]: Jacob Berger, #link("https://1000wordphilosophy.com/2024/02/03/mind-body-problem/")["The Mind-Body Problem," the "Varieties of Dualism" section]. \ #strong[Recommended]: René Descartes #link("https://www.earlymoderntexts.com/assets/pdfs/descartes1641.pdf")[Meditation VI], translated by Jonathan Bennett.

=== Thursday, October 15 (Lecture 14) --- The case against Dualism
<thursday-october-15-lecture-14-the-case-against-dualism>
#strong[Required]: Jacob Berger, #link("https://1000wordphilosophy.com/2024/02/03/mind-body-problem/")["The Mind-Body Problem: What Are Minds?" (1000-Word Philosophy)]. \ #strong[Recommended]: Steven Schneider, #link("https://iep.utm.edu/identity/")["Identity Theory"], IEP, introduction. \ #strong[Recommended]: Princess Elisabeth of Bohemia and René Descartes, #link("https://www.earlymoderntexts.com/assets/pdfs/descartes1643_1.pdf")[Correspondence of 1643].

#emph[Module Quiz 2 (Lectures 10--14) opens after class, due Sunday 1 November.]

== Week 8: Consequentialism
<week-8-consequentialism>
#emph[Short Answer 2 due Friday, October 23.]

=== Tuesday, October 20 --- Fall Study Break, no class
<tuesday-october-20-fall-study-break-no-class>
=== Thursday, October 22 (Lecture 15) --- Consequentialism
<thursday-october-22-lecture-15-consequentialism>
#strong[Required]: Shane Gronholz, #link("https://1000wordphilosophy.com/2014/05/15/consequentialism/")["Consequentialism and Utilitarianism"] (1000-Word Philosophy). \ #strong[Required]: J. S. Mill, #link("https://utilitarianism.net/books/utilitarianism-john-stuart-mill/2/")[#emph[Utilitarianism]] ch.~2, first five paragraphs (extract posted to Canvas). \ #strong[Recommended]: Walter Sinnott-Armstrong , #link("https://plato.stanford.edu/entries/consequentialism/")["Consequentialism"], SEP, #strong[§1], "Classic Utilitarianism."

== Week 9: Deontology and Trolleys
<week-9-deontology-and-trolleys>
=== Tuesday, October 27 (Lecture 16) --- Deontology
<tuesday-october-27-lecture-16-deontology>
#strong[Required]: Andrew Chapman, #link("https://1000wordphilosophy.com/2014/06/09/introduction-to-deontology-kantian-ethics/")["Deontology: Kantian Ethics"] (1000-Word Philosophy). \ #strong[Recommended]: Larry Alexander and Michael Moore, #link("https://plato.stanford.edu/entries/ethics-deontological/")["Deontological Ethics,"], SEP, #strong[§1], "Deontology's Foil: Consequentialism". \ #strong[Recommended]: Immanuel Kant, #link("https://www.earlymoderntexts.com/assets/pdfs/kant1785.pdf")[#emph[Groundwork for the Metaphysic of Morals]], translated by Jonathan Bennett, Chapter 1, especially the opening on the good will and the passages on universal law.

=== Thursday, October 29 (Lecture 17) --- Trolley problems and objections
<thursday-october-29-lecture-17-trolley-problems-and-objections>
#strong[Required]: Gabriel Andrade, #link("https://1000wordphilosophy.com/2023/03/11/doctrine-of-double-effect/")["The Doctrine of Double Effect"] (1000-Word Philosophy). \ #strong[Required]: Judith Jarvis Thomson, #link("https://openyls.law.yale.edu/handle/20.500.13051/16338")["The Trolley Problem"], sections I and II.

== Week 10: What Makes a Life Go Well
<week-10-what-makes-a-life-go-well>
=== Tuesday, November 03 (Lecture 18) --- What is welfare?
<tuesday-november-03-lecture-18-what-is-welfare>
#strong[Required]: Richard Y. Chappell and Darius Meissner, #link("https://www.utilitarianism.net/theories-of-wellbeing")["Theories of Well-Being"], the introduction. \ #strong[Required]: Roger Crisp, #link("https://plato.stanford.edu/entries/well-being/")["Well-Being"], SEP, #strong[§1], "The Concept."

=== Thursday, November 05 (Lecture 19) --- Hedonism
<thursday-november-05-lecture-19-hedonism>
#strong[Required]: Roger Crisp, #link("https://plato.stanford.edu/entries/well-being/#Hed")["Well-Being"], SEP, #strong[§4.1], "Hedonism." \ #strong[Required]: Robert Nozick, #link("https://rintintin.colorado.edu/~vancecd/phil3160/Nozick1.pdf")["The Experience Machine"]. (This is just a two page excerpt.)

#emph[Short Answer 2 comes back Friday, with the essay question.] (AGAIN, IT MIGHT BE BEST TO DISTRIBUTE ESSAY QUESTIONS EARLIER)

== Week 11: Desire, and the Objective List
<week-11-desire-and-the-objective-list>
=== Tuesday, November 10 (Lecture 20) --- Desire and preference theories
<tuesday-november-10-lecture-20-desire-and-preference-theories>
#strong[Required]: Roger Crisp, #link("https://plato.stanford.edu/entries/well-being/#DesThe")["Well-Being"], SEP, #strong[§4.2], "Desire Theories". \ #strong[Recommended]: Richard Y. Chappell and Darius Meissner, #link("https://www.utilitarianism.net/theories-of-wellbeing")["Theories of Well-Being"], the desire-theory section.

=== Thursday, November 12 (Lecture 21) --- Objective lists, and who has a welfare
<thursday-november-12-lecture-21-objective-lists-and-who-has-a-welfare>
#strong[Required]: Roger Crisp, #link("https://plato.stanford.edu/entries/well-being/")["Well-Being"], SEP, #strong[§4.3], "Objective List Theories." \ #strong[Required]: Lori Gruen and Susana Monsó, #link("https://plato.stanford.edu/entries/moral-animal/#MorConAni")["The Moral Status of Animals"], SEP, #strong[§1.1], "Speciesism" and #strong[§1.4], "Sentience". \ #strong[Recommended]: Conor Purcell, #link("https://aeon.co/essays/if-ais-can-feel-pain-what-is-our-responsibility-towards-them")["If AIs Can Feel Pain, What Is Our Responsibility Towards Them?"], #emph[Aeon]. \ #strong[Recommended]: Walter Sinnott-Armstrong and Vincent Conitzer, #link("https://www.cs.cmu.edu/~conitzer/AImoralstatuschapter.pdf")["How Much Moral Status Could Artificial Intelligence Ever Achieve?"]. If you are writing an essay on this topic, this is #strong[Required].

#emph[Module Quiz 3 (Lectures 15--21) opens after class.]

== Week 12: The Self
<week-12-the-self>
=== Tuesday, November 17 (Lecture 22) --- Personal identity: the cases
<tuesday-november-17-lecture-22-personal-identity-the-cases>
#strong[Required]: Kristin Seemuth Whaley, #link("https://1000wordphilosophy.com/2022/02/03/psychological-approaches-to-personal-identity/")["Psychological Approaches to Personal Identity"] (1000-Word Philosophy). \ #strong[Required]: Derek Parfit, #link("https://rintintin.colorado.edu/~vancecd/phil375/Parfit.pdf")["Divided Minds and the Nature of Persons"]. \ #strong[Recommended]: Chad Vance, #link("https://1000wordphilosophy.com/2014/02/10/personal-identity/")["Personal Identity: How We Exist Over Time"] (1000-Word Philosophy).

=== Thursday, November 19 (Lecture 23) --- What matters in survival
<thursday-november-19-lecture-23-what-matters-in-survival>
#strong[Required]: John Locke, #link("https://www.earlymoderntexts.com/assets/pdfs/locke1690book2_4.pdf")[#emph[An Essay Concerning Human Understanding], Book II: Ideas], Chapter xxvii, §§9, 14, and 26. (Those are on pages 115, 117, and 120.) \ #strong[Required]: Daniel Weltman, #link("https://1000wordphilosophy.com/2023/02/25/no-self/")["The Buddhist Theory of No-Self"] (1000-Word Philosophy). \ #strong[Required]: Jessica Gordon-Roth, #link("https://plato.stanford.edu/entries/locke-personal-identity/")["Locke on Personal Identity"], #emph[Stanford Encyclopedia of Philosophy], #strong[§1], "Locke on Persons and Personal Identity: The Basics." \ #strong[Recommended]: #link("https://www.earlymoderntexts.com/assets/pdfs/locke1690book2_4.pdf")[#emph[An Essay Concerning Human Understanding], Book II: Ideas], all of Chapter xxvii, for anyone who wants to see the details of Locke's view in a more original form.

== Week 13: Law
<week-13-law>
#emph[Essay due Monday, November 23.]

=== Tuesday, November 24 (Lecture 24) --- Why obey the law?
<tuesday-november-24-lecture-24-why-obey-the-law>
#strong[Required]: John Protevi, #link("https://www.protevi.com/john/FH/PDF/Crito.pdf")["Plato's #emph[Crito]"]. Read this first. \ #strong[Required]: Plato, #link("https://www.gutenberg.org/files/1657/1657-h/1657-h.htm")[#emph[Crito]]. (Jowett translation, Project Gutenberg)

=== Thursday, November 26 --- Thanksgiving recess, no class
<thursday-november-26-thanksgiving-recess-no-class>
== Week 14: Punishment and Speech
<week-14-punishment-and-speech>
=== Tuesday, December 01 (Lecture 25) --- Theories of punishment
<tuesday-december-01-lecture-25-theories-of-punishment>
#strong[Required]: Travis Joseph Rodgers, #link("https://1000wordphilosophy.com/2019/02/05/theories-of-punishment/")["Theories of Punishment"] (1000-Word Philosophy). \ #strong[Recommended]: Zachary Hoskins and Anthony Duff, #link("https://plato.stanford.edu/entries/legal-punishment/")["Legal Punishment"], SEP, #strong[§3-4], "Consequentialist Accounts" and "Retributivist Accounts".

=== Thursday, December 03 (Lecture 26) --- Free speech and the marketplace of ideas
<thursday-december-03-lecture-26-free-speech-and-the-marketplace-of-ideas>
#strong[Required]: Mark Satta, #link("https://1000wordphilosophy.com/2021/02/04/free-speech/")["Free Speech"] (1000-Word Philosophy) \ #strong[Required]: J. S. Mill and H. T. Mill, #link("https://www.gutenberg.org/files/34901/34901-h/34901-h.htm")[#emph[On Liberty]], extract from Chapter 2 on Canvas.

== Week 15: Ending
<week-15-ending>
=== Tuesday, December 08 (Lecture 27) --- Does the marketplace track truth?
<tuesday-december-08-lecture-27-does-the-marketplace-track-truth>
#strong[Required]: David V. Johnson, #link("https://aeon.co/ideas/how-do-we-pry-apart-the-true-and-compelling-from-the-false-and-toxic")["How do we pry apart the true and compelling from the false and toxic?" (#emph[Aeon Ideas])].

#emph[Module Quiz 4 (Lectures 22--27) opens after class, due Friday.]

=== Thursday, December 10 (Lecture 28) --- Review
<thursday-december-10-lecture-28-review>
No reading. Bring questions.

The final examination is in the University examination period, 14--21 December. The date and room will be posted once the University publishes the schedule.

#pagebreak()
= Open for the GSI meeting
<open-for-the-gsi-meeting>
#emph[This section is not for students. Delete it before the syllabus goes out.]

== The section component
<the-section-component>
We should decide what to do with the 20%. That's a lot for you, but on the other hand, it gives you plenty of things to do in class, and two classes a week is a lot to prep. So I think we should go with something like

+ Short Answer 1 \~8%
+ Presentations on readings \~6%
+ Participation \~6%

But we can alter point 2, or add something else. I think it would #emph[probably] be best to be uniform across the sections, but I'm willing to be talked out of it.

== Consequences of the November essay deadline
<consequences-of-the-november-essay-deadline>
The essay is due Monday 23 November so that marked essays go back before the examination.

Short Answer 2 is marked across two weeks, 23 October to 6 November. That's an important deadline to hit, because the students should use the feedback from in in essay 1. Also, this should get #emph[more] feedback than either short answer 1 or frankly the essay. (And definitely more than the exam.)

Then essay marking doesn't have as hard a deadline; ideally 2 weeks after it's turned in, but a bit of slippage here isn't the end of the world.

The stuff at the end isn't as crucial to the grading, because it only shows up on one quiz and an exam. That may result in some loss of enthusiasm. Now maybe that's fine; it's the end of term. And free speech normally gets enough enthusiasm anyway. And no matter what the grade, students over-index on the importance of the exam. But if you're worried, we could move some of the 20% to in class activities after the essay is due in.

Short Answer 1 is meant to be in class, and this could cause accommodations complications. We should flag this early, and get on top of any issues. The same goes for any other in class writing assignments you want to do. Also, you might want to schedule a makeup slot - preferably one slot across all six sections, because out of 150 we will always have some crises.
