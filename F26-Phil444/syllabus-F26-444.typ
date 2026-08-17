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

// Heading spacing. The three field lines under each date are one
// paragraph held together by hard line breaks, so the only thing
// separating a date from its Topic line is the heading's `below`.
// Level 2 is the Week headings, level 3 the individual class days.
// Raise `above` to open the gaps between blocks, `below` to unstick a
// heading from the lines under it.
#show heading.where(level: 2): set block(above: 2.0em, below: 0.9em)
#show heading.where(level: 3): set block(above: 1.5em, below: 0.65em)
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
  title: [PHIL 444: Game Theory and Social Choice],
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

#strong[Lead Instructor]: Brian Weatherson \ #strong[Email]: weath\@umich.edu \ #strong[Web]: canvas.umich.edu \ #strong[Office Hours]: TBD

~

= Key Points
<key-points>
- This course examines two philosophical questions about choice in social settings.
- The first half is on game theory, with a special focus on what we can rationally do when all we know is that everyone involved is rational, and what does this tell us about rationality?
- The second half works through Amartya Sen's #emph[Collective Choice and Social Welfare] (2017 expanded edition): what does it mean for a group to choose, and how can individual judgments be combined into collective ones?
- There will be more mathematics than in a typical philosophy course, but less than in an economics course covering this material. In particular, there will be no calculus.
- Assessment consists of two essays (25% each), eight quizzes with the best six counting for 40% in total, and class participation (10%).

= Course Description
<course-description>
This course examines two philosophical questions about choice in social settings.

The first half asks what rational choice looks like when the unknowns are not natural events (the weather, the bus arrival time) but the actions of other rational agents who are reasoning about you. Standard expected-utility theory does not pin down behavior in such settings. We work through the central solution concepts of game theory (Nash equilibrium, rationalizability, subgame perfection, perfect Bayesian equilibrium) and ask what philosophical claims each one rests on. At the end we discuss signaling games and refinements of equilibrium concepts, the beer-quiche example and the Cho-Kreps intuitive criterion, and two famous applications of these games: used car markets and job-market signaling.

The second half asks what it means for a group to choose. Working from Sen's #emph[Collective Choice and Social Welfare] (2017 expanded edition), we study the formalism behind results like Arrow's famous impossibility theorem and the philosophical responses Sen develops, including his work on interpersonal comparison, justice, rights, and the limits of welfarism.

The unifying theme is that individual rationality does not extend cleanly to social settings. Game theory and social choice theory are two related, but interestingly distinct, ways of seeing how social settings create new complications. We will look at what philosophers, political scientists, and economists, have made of these complications.

= Required Materials
<required-materials>
The required text is:

- Amartya Sen, #emph[Collective Choice and Social Welfare: An Expanded Edition] (Harvard University Press, 2017). Available electronically through the University of Michigan library. (Hereafter called CCSW.)

The main reading for the first half is my own lecture notes, #emph[Game Theory and Social Choice], free at #link("https://bweatherson.github.io/F26-Phil444-site/notes/"), supplemented by three classic papers (Akerlof on lemons, Spence on job-market signalling, Cho and Kreps on the intuitive criterion). Giacomo Bonanno's #emph[Game Theory], also free, is a good second voice if you'd like something other than my lectures and my notes. Very usefully, it comes with worked solutions to every exercise. It's available at #link("https://faculty.econ.ucdavis.edu/faculty/bonanno/PDF/GT_book.pdf"). Section numbers in the schedule refer to that file, which is the third edition. If you just Google it you might find earlier editions, which have slightly different numbers. (ArXiV, for instance, just has the second edition.)

There will be some supplementary readings in the second half, which will be linked, but the priority is CCSW. All readings will be made available through Canvas or the course website.

= Course Requirements
<course-requirements>
- There will be 2 essays, each worth 25% of the grade, one for each half of the course.
- There will be 8 quizzes over the semester. Your best 6 results count, and together they are worth 40% of the grade.
- 10% of the grade is for participation in class.

= Summary of Grading System
<summary-of-grading-system>
+ Essays - 2 essays, 25% each: 50%
+ Quizzes - best 6 of 8: 40%
+ Class participation: 10%

= Canvas
<canvas>
There is a Canvas site for this course, which can be accessed from #link("https://canvas.umich.edu"). Course documents will be available from this site. Please make sure that you can access this site. Consult the site regularly for announcements, including changes to the course schedule. And there are many tools on the site to communicate with each other, and with me.

There is also a github site for the course which contains more documents, and it is at #link("https://bweatherson.github.io/F26-Phil444-site/").

#pagebreak()
= Class Schedule
<class-schedule>
Readings should be done before the scheduled class. Lectures 1-14 cover game theory; Lectures 15-28 cover social choice theory, working through Sen's #emph[Collective Choice and Social Welfare] (cited below as CCSW). "Notes" below refers to my lecture notes, #emph[Game Theory and Social Choice], at #link("https://bweatherson.github.io/F26-Phil444-site/notes/").

CCSW alternates between chapters and starred chapters. The starred chapters are more mathematical. Sen says in the preface that the unstarred chapters can be read on their own, and we're #emph[mostly] going to follow him. We will mostly be using the unstarred chapers as reqiured reading, and the starred ones as recommended, and I'll go over the key proofs. But we won't #emph[always] to this. In some cases the formalism is the point of what we're studying, and in those cases we'll be focussing on the starred chapters. 'Recommended' here really does mean #emph[recommended]\; if you're struggling with any of the quizzes, then looking through Sen's presentation of the formal work may very well help.

In general (and I think this is true for every class), if you are doing an essay on a topic, the recommended readings should be treated as #emph[required]. If you choose to write on something, I expect you to be on top of both the prose version of the topic, and the mathematical version. In part two, this will be easy to follow, since Sen is very good about separating out these versions.

The plan for the second half is not set in stone. This is a seminar working through a book, and I think the best practice for classes like that is to let the class itself determine the pace. I've made a best guess at what speed we'll work at, but it's just that, a best guess. If we need more time for something than I've guessed, we'll take more time.

The order will not change. There is a plan for how later parts build on earlier parts, even within the Choose Your Own Adventure structure of CCSW. If we don't get to stuff, it comes out of the end.

Changes to a week's reading will be posted on Canvas by the Friday before. If nothing is posted, what is below stands.

Quizzes cover the material through the previous class meeting, whatever that turned out to be, rather than whatever this schedule says it should have been.

== Week 1: Decision and Strategic Settings
<week-1-decision-and-strategic-settings>
=== Tuesday, September 01 (Lecture~1)
<tuesday-september-01-lecture-1>
#strong[Topic]: Course overview and the two organizing questions. \ #strong[Reading]: None.

=== Thursday, September 03 (Lecture~2)
<thursday-september-03-lecture-2>
#strong[Topic]: Decision theory under risk and uncertainty: expected utility, Allais and Ellsberg. The formal contrast with strategic settings. \ #strong[Reading]: Notes, 2.4-2.5 (Expected Value; Orthodox Decision Theory). \ #strong[Recommended]: Notes, 2.1-2.3, if you want the probability revision. Bonanno, 5.1-5.3, for a more careful statement of the von Neumann-Morgenstern axioms.

== Week 2: Strategic Form Games
<week-2-strategic-form-games>
=== Tuesday, September 08 (Lecture~3)
<tuesday-september-08-lecture-3>
#strong[Topic]: Strategic form games; dominance and iterated elimination of dominated strategies. \ #strong[Reading]: Notes, Ch~1 (Basics of Game Theory).1.10. \ #strong[Recommended]: Bonanno, Ch~2 (Ordinal Games in Strategic Form), 2.1-2.2 and 2.5, which keeps the two iterated deletion procedures carefully apart.

=== Thursday, September 10 (Lecture~4)
<thursday-september-10-lecture-4>
#strong[Topic]: Nash equilibrium. \ #strong[Reading]: Notes, 3.1-3.6.2 (Mixed Strategies through Finding Best Responses). \ #strong[Recommended]: Bonanno, 2.6 (Nash equilibrium).

#strong[Quiz]: Quiz~1 on Canvas, due Friday, September 11.

== Week 3: Mixed Strategies and Rationalizability
<week-3-mixed-strategies-and-rationalizability>
=== Tuesday, September 15 (Lecture~5)
<tuesday-september-15-lecture-5>
#strong[Topic]: Mixed strategies and the interpretation problem (Aumann; Harsanyi purification). \ #strong[Reading]: Notes, 3.6.3-3.8 (Finding Mixed Strategy Equilibria through What Is a Mixed Strategy?). \ #strong[Recommended]: Bonanno, Ch~6 (Strategic-form Games), 6.1-6.3.

=== Thursday, September 17 (Lecture~6)
<thursday-september-17-lecture-6>
#strong[Topic]: Rationalizability; common knowledge of rationality. \ #strong[Reading]: Notes, 4.1 (Rationalizability). \ #strong[Recommended]: Bonanno, 6.4 (Strict dominance and rationalizability), and Ch~10 (Rationality), 10.1-10.3. Ch~8 (Common Knowledge) gives a more careful epistemic justification of rationalizability.

#strong[Quiz]: Quiz~2 on Canvas, due Friday, September 18.

== Week 4: Dynamic Games
<week-4-dynamic-games>
=== Tuesday, September 22 (Lecture~7)
<tuesday-september-22-lecture-7>
#strong[Topic]: Extensive form games; subgame perfection. \ #strong[Reading]: Notes, 5.1-5.4 (Normal Form and Extensive Form through Subgame Perfect Equilibrium). \ #strong[Recommended]: Bonanno, 3.1-3.3; 4.1-4.4; and 7.2, which redoes subgame perfection once payoffs are cardinal.

=== Thursday, September 24 (Lecture~8)
<thursday-september-24-lecture-8>
#strong[Topic]: Backward induction; the centipede paradox. \ #strong[Reading]: Notes, 5.5 (Problems with Backwards Induction). \ #strong[Recommended]: Bonanno, 3.2 and 3.4; 7.3 (Problems with the notion of subgame-perfect equilibrium); 10.4 (Common knowledge of rationality in extensive-form games).

#strong[Quiz]: Quiz~3 on Canvas, due Friday, September 25.

== Week 5: Forward Induction and Bayesian Games
<week-5-forward-induction-and-bayesian-games>
=== Tuesday, September 29 (Lecture~9)
<tuesday-september-29-lecture-9>
#strong[Topic]: Forward induction. Van Damme's burning-money game; reasoning about what kind of player would have made an off-path move. \ #strong[Reading]: Notes, 5.6 (Money Burning Game). \ #strong[Recommended]: Elchanan Ben-Porath and Eddie Dekel, "Signaling future actions and the potential for sacrifice", #emph[Journal of Economic Theory] 57 (1992): 36-51. #link("https://doi.org/10.1016/S0022-0531(05)80039-0")

=== Thursday, October 01 (Lecture~10)
<thursday-october-01-lecture-10>
#strong[Topic]: Bayesian games and Bayesian Nash equilibrium. Types, incomplete information, and Nash equilibrium applied to type-conditional strategies. \ #strong[Reading]: Notes, 6.1-6.5 (Two Kinds of Ignorance through Purification). \ #strong[Recommended]: Bonanno, Ch~14 (Static Games), 14.1-14.3, and Ch~16 (The Type-Space Approach), 16.1-16.2. Also 9.5 (Harsanyi consistency of beliefs), which is our common prior assumption under another name.

== Week 6: Signaling Games
<week-6-signaling-games>
=== Tuesday, October 06 (Lecture~11)
<tuesday-october-06-lecture-11>
#strong[Topic]: Signaling games; perfect Bayesian equilibrium. \ #strong[Reading]: Notes, 6.6-6.8 (Perfect Bayesian Equilibrium through Signaling without Cooperation). \ #strong[Recommended]: Bonanno, 13.1-13.3, and 15.1 (One-sided incomplete information).

=== Thursday, October 08 (Lecture~12)
<thursday-october-08-lecture-12>
#strong[Topic]: The beer-quiche game; the intuitive criterion. \ #strong[Reading]: Notes, 6.9 (The Intuitive Criterion). In-Koo Cho and David M. Kreps, "Signaling Games and Stable Equilibria", #emph[Quarterly Journal of Economics] 102 (1987): 179-221. #link("https://www.jstor.org/stable/1885060") \ #strong[Recommended]: Bonanno, Ch~12 (Sequential Equilibrium). He does not cover the intuitive criterion, but this is a similar idea.

#strong[Quiz]: Quiz~4 on Canvas, due Friday, October 09.

== Week 7: Asymmetric Information
<week-7-asymmetric-information>
=== Tuesday, October 13 (Lecture~13)
<tuesday-october-13-lecture-13>
#strong[Topic]: Spence on job-market signaling. \ #strong[Reading]: Michael Spence, "Job Market Signaling", #emph[Quarterly Journal of Economics] 87 (1973): 355-374. #link("https://www.jstor.org/stable/1882010")

=== Thursday, October 15 (Lecture~14)
<thursday-october-15-lecture-14>
#strong[Topic]: Akerlof on lemons. \ #strong[Reading]: George A. Akerlof, "The Market for 'Lemons': Quality Uncertainty and the Market Mechanism", #emph[Quarterly Journal of Economics] 84 (1970): 488-500. #link("https://www.jstor.org/stable/1879431")

== Week 8: Transition
<week-8-transition>
=== Tuesday, October 20
<tuesday-october-20>
No class -- Fall Study Break (October 19-20).

=== Thursday, October 22 (Lecture~15)
<thursday-october-22-lecture-15>
#strong[Topic]: Introduction to CCSW. \ #strong[Reading]: CCSW: Ch~1 (Introduction); Ch~A1 (Enlightenment and Impossibility). \ #strong[Recommended]: CCSW: New Introduction (2017). This is a really helpful overview about what the book is trying to do, and why it includes #emph[these] topics.

== Week 9: Foundations
<week-9-foundations>
=== Tuesday, October 27 (Lecture~16)
<tuesday-october-27-lecture-16>
#strong[Topic]: The formal apparatus we'll use. \ #strong[Reading]: CCSW: Ch~2 (Unanimity); Ch~2\* (Collective Choice Rules and Pareto Comparisons), section 2#emph[1 only. \ #strong[Recommended]: CCSW: Ch~1] (Preference Relations). This is a #emph[really] helpful overview of the terminology; you might want to build a 'cheat sheet' of key terms from it.

=== Thursday, October 29 (Lecture~17)
<thursday-october-29-lecture-17>
#strong[Topic]: Arrow's theorem, with a focus on why three options are needed. \ #strong[Reading]: CCSW: Ch~3 (Collective Rationality). \ #strong[Recommended]: CCSW: Ch~3\* (Social Welfare Functions); Ch~5 (Values and Choice); Ch~5\* (Anonymity, Neutrality and Responsiveness).

#strong[Essay]: First essay due Friday, October 30 at 5pm.

== Week 10: Arrow's Theorem, and the First Escape
<week-10-arrows-theorem-and-the-first-escape>
=== Tuesday, November 03 (Lecture~18)
<tuesday-november-03-lecture-18>
#strong[Topic]: Sen's proof of Arrow's Theorem. \ #strong[Reading]: CCSW: Ch~A1\* (Social Preference), to p.~288. \ #strong[Recommended]: CCSW: Ch~3\* (Social Welfare Functions).

=== Thursday, November 05 (Lecture~19)
<thursday-november-05-lecture-19>
#strong[Topic]: Views which reject Universal Domain, in particular the single-peakedness assumption \ #strong[Reading]: CCSW: Ch~10 (Majority Choice and Related Systems). \ #strong[Recommended]: CCSW: Ch~10\* (Restricted Preferences and Rational Choice).

#strong[Quiz]: Quiz~5, on Canvas, due Friday, November 06.

== Week 11: Two More Escapes
<week-11-two-more-escapes>
=== Tuesday, November 10 (Lecture~20)
<tuesday-november-10-lecture-20>
#strong[Topic]: Views which reject Collective Rationality, with a focus on Gibbard's oligarchy result. \ #strong[Reading]: CCSW: Ch~A1\* (Social Preference), pp.~289-293; Ch~4 (Choice Versus Orderings); Ch~A2 (Rationality and Consistency). \ #strong[Recommended]: CCSW: Ch~4\* (Social Decision Functions); Ch~A2\* (Problems of Social Choice).

=== Thursday, November 12 (Lecture~21)
<thursday-november-12-lecture-21>
#strong[Topic]: Third escape: use more than preferences. \ #strong[Reading]: CCSW: Ch~7 (Interpersonal Aggregation and Comparability). \ #strong[Recommended]: CCSW: Ch~7\* (Aggregation Quasi-Orderings); Ch~8 (Cardinality With or Without Comparability).

#strong[Quiz]: Quiz~6, on Canvas, due Friday, November 13.

== Week 12: Strategy and Liberty
<week-12-strategy-and-liberty>
=== Tuesday, November 17 (Lecture~22)
<tuesday-november-17-lecture-22>
#strong[Topic]: Strategic manipulation, up to the Gibbard-Satterthwaite theorem. (This brings game theory back into social choice theory.) \ #strong[Reading]: Amartya Sen, "The Possibility of Social Choice", #emph[American Economic Review] 89 (1999): 349-378. #link("https://www.aeaweb.org/articles?id=10.1257/aer.89.3.349") \ #strong[Recommended]: Allan Gibbard, "Manipulation of Voting Schemes: A General Result", #emph[Econometrica] 41 (1973): 587-601. #link("https://www.jstor.org/stable/1914083")

=== Thursday, November 19 (Lecture~23)
<thursday-november-19-lecture-23>
#strong[Topic]: Sen's liberal paradox. \ #strong[Reading]: CCSW: Ch~6 (Conflicts and Dilemmas); Ch~6\* (The Liberal Paradox). \ #strong[Recommended]: Amartya Sen, "The Impossibility of a Paretian Liberal", #emph[Journal of Political Economy] 78 (1970): 152-157. #link("https://doi.org/10.1086/259614")

#strong[Quiz]: Quiz~7, on Canvas, due Friday, November 20.

== Week 13: Rights
<week-13-rights>
=== Tuesday, November 24 (Lecture~24)
<tuesday-november-24-lecture-24>
#strong[Topic]: Rights and social choice. Sen's later response to his own paradox. \ #strong[Reading]: CCSW: Ch~A5 (The Idea of Rights). \ #strong[Recommended]: CCSW: Ch~A5\* (Rights and Social Choice).

=== Thursday, November 26
<thursday-november-26>
No class -- Thanksgiving recess (November 25-27).

== Week 14: Equity, Justice, Capability
<week-14-equity-justice-capability>
=== Tuesday, December 01 (Lecture~25)
<tuesday-december-01-lecture-25>
#strong[Topic]: Equity and justice. The weak equity axiom, and the limits of welfarism. \ #strong[Reading]: CCSW: Ch~9 (Equity and Justice). \ #strong[Recommended]: CCSW: Ch~9\* (Impersonality and Collective Quasi-Orderings); Ch~A3 (Justice and Equity).

=== Thursday, December 03 (Lecture~26)
<thursday-december-03-lecture-26>
#strong[Topic]: The capability approach. \ #strong[Reading]: Amartya Sen, "Equality of What?", Tanner Lecture on Human Values, Stanford University, 22 May 1979; reprinted in #emph[Choice, Welfare and Measurement]. #link("https://tannerlectures.org/lectures/equality-of-what/") \ #strong[Recommended]: CCSW: Ch~A3\* (Social Welfare Evaluation). Martha Nussbaum, "Capabilities as Fundamental Entitlements: Sen and Social Justice", #emph[Feminist Economics] 9 (2003): 33-59. #link("https://doi.org/10.1080/1354570022000077926")

#strong[Quiz]: Quiz~8, on Canvas, due Friday, December 04.

== Week 15: Democracy and Public Reasoning
<week-15-democracy-and-public-reasoning>
=== Tuesday, December 08 (Lecture~27)
<tuesday-december-08-lecture-27>
#strong[Topic]: Democracy and public engagement. \ #strong[Reading]: CCSW: Ch~A4 (Democracy and Public Engagement). \ #strong[Recommended]: CCSW: Ch~A4\* (Votes and Majorities).

=== Thursday, December 10 (Lecture~28)
<thursday-december-10-lecture-28>
#strong[Topic]: Reasoning and social decisions. \ #strong[Reading]: CCSW: Ch~A6 (Reasoning and Social Decisions). \ #strong[Recommended]: CCSW: Ch~11 (Theory and Practice).

#strong[FINAL ESSAY]: Due Friday, December 18 at 5pm.

#pagebreak()
= Plagiarism
<plagiarism>
Although team-work, and even co-authorship, is encouraged, plagiarism is strictly prohibited. You are responsible for making sure that none of your work is plagiarized. Be sure to cite work that you use, both direct quotations and paraphrased ideas. Any citation method that is tolerably clear is permitted, but if you'd like a good description of a citation scheme that works well in philosophy, look at #link("http://bit.ly/VDhRJ4").

You are encouraged to discuss the course material, including assignments, with your classmates, but all written work that you hand in under your own name must be your own. If work is handed is as the work of two people, you are affirming that each person did a fair share of the work. (Note that when you're submitting work on Canvas, you have to each submit the paper, even if it is co-authored. That way Canvas knows that everyone has turned in work.)

This is a 400-level course, so I don't want to be as heavy-handed with enforcement as in a big lecture course. But still we have some basic ground rules.

+ Acknowledge all assistance that you got. Note that this is something Sen does somewhat briefly in the original Preface to CCSW, and at much greater length in the revised version.
+ Don't get any assistance from an LLM that you wouldn't be happy to get from a human. List precisely what help you do get from LLMs, and keep a record of all interactions. (Don't use anyone else's account.)
+ When I say the work is 'your own', I mean that if someone asked you about any sentence in it, you could answer two questions: #emph[What does this mean?] and #emph[Why did you say this?]. If I suspect you are turning in work that is not your own, I'll be very disappointed, and the first step will be to ask you those two questions.

You should also be familiar with the academic integrity policies of the College of Literature, Science & the Arts at the University of Michigan, which are available here: #link("http://www.lsa.umich.edu/academicintegrity/"). Violations of these policies will be reported to the Office of the Assistant Dean for Student Academic Affairs, and sanctioned with a course grade of F.

= Disability
<disability>
The University of Michigan abides by the Americans with Disabilities Act of 1990, Section 504 of the Rehabilitation Act of 1973, and other applicable federal and state laws that prohibit discrimination on the basis of disability, which mandate that reasonable accommodations be provided for qualified students with disabilities.

If you have a disability, and may require some type of instructional and/or examination accommodation, please contact me early in the semester. If you have not already done so, you will also need to register with the Office of Services for Students with Disabilities. The office is located at G664 Haven Hall.

For more information on disability services at the University of Michigan, go to #link("http://ssd.umich.edu").
