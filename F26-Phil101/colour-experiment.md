# The colour demonstration for Day 11

Not editing `slides/11.qmd`, since you're in it. Two blocks to paste, then the
reasoning, then the things that could go wrong.

Images are already in `images/`:

- `unique-green-ladder.png` — five swatches, A to E
- `unique-green-single.png` — your `#00B68F`, on a neutral surround

Both are PNG on purpose. **Do not run these through `prep-images.py`.** It sends
anything without an alpha channel to JPEG at quality 82, and JPEG's chroma
subsampling would blur and shift exactly the thing being judged.

---

## Block 1 — goes first, before "Where we are"

```markdown
# A question to start

## Which one is pure green?

![](../images/unique-green-ladder.png){.nostretch fig-alt="Five green swatches, labelled A to E, running from a yellowish green to a blue-green, on a neutral grey background."}

By **pure green** I mean the one that is neither a bit yellowish nor a bit
bluish. Just green.

**A, B, C, D, or E?**

. . .

Don't confer. There's no right answer and nobody can see your vote.
```

## Block 2 — goes after "It isn't really about bats"

```markdown
## Back to the swatches

You didn't agree.

. . .

Three things could explain that, and they are not the same thing.

1. You saw different colours. Where you sit changes what reaches your eye.
2. You mean slightly different things by "yellowish".
3. Your experiences of the same swatch differ.

. . .

The first one a lab can control for, and when it does, the disagreement stays.

## How big the disagreement is

Pool the published studies and settings for pure green vary across people with
ordinary colour vision by about **55 nm** of wavelength.^[Kuehni's compilation,
reported in Wuerger et al., "The distribution of unique green wavelengths",
*Journal of Vision* 13 (2013).]

For pure **yellow** it's about 15 nm. Green is the outlier, and nobody is sure why.

. . .

So this isn't people being sloppy. It is a stable difference between eyes that
all pass every test we have.

## Which leaves the hard part

The lab can rule out the first explanation. It cannot separate the second from
the third.

. . .

Is the person two rows over having a different experience, or describing the
same one differently?

. . .

You have no way to check, and neither do they. That's Nagel's problem — except
it isn't about bats, and it isn't hypothetical, and it's happening in this room
between people with the same equipment.
```

---

## Why a ladder rather than one swatch

Your instinct on the hue was right. `#00B68F` is L\*66, a\*−48, b\*+9, which puts
it at hue angle 169°, close to the yellow/blue null — a sensible guess at pure
green. The single-swatch version is in `images/` if you want it.

But the ladder does three things the single swatch can't.

**It gives you a distribution instead of a verdict.** One swatch and three
options gets you a three-bar chart. Five swatches gets you a shape, and the
shape *is* the phenomenon — this is also closer to how the actual experiments
run, where an observer adjusts a patch until it stops looking yellowish or
bluish.

**It blunts the projector problem.** With one swatch you are asking an absolute
question about a stimulus that genuinely differs across the room: seat position,
viewing angle and ambient light all change what arrives. A student who notices
this has a real objection, and it is the objection that kills the
demonstration — "we didn't disagree about one colour, we saw different colours."
With a ladder the question is comparative. Off-axis shift moves everyone's
choice in the same direction, so the *spread* still means something even if the
*centre* doesn't.

**It keeps the wording from doing the work.** "Slightly bluish" invites people
to differ about the word. "Which of these five" narrows that considerably,
though it doesn't eliminate it — which is why Block 2 keeps word-use on the
list of explanations rather than pretending it's been excluded.

The five are equal in lightness and chroma, varying only in hue, from 140° to
184° in 11° steps at L\*66 C\*41.5. Holding L\* and C\* fixed costs some
saturation relative to your `#00B68F`, which is the price of making hue the only
variable. Grey gaps between them, because adjacent patches shift each other's
appearance.

---

## What could go wrong

**The vote piles onto one end.** This is the real risk, and I can't rule it out
from here. Nothing in the literature maps the population's unique-green point
onto sRGB coordinates in a way I'd trust, and CIELAB is known to be unreliable
about unique hues specifically — it puts pure green near 180°, and my own read
of the ladder puts it nearer 150°. That disagreement is why the span is as wide
as it is: it brackets both answers. **Test it on the actual lecture projector
first**, with a GSI or two standing in different parts of the room. If everyone
picks A or everyone picks E, shift the window and regenerate; the script is
reproducible from the numbers above.

A lopsided result is still usable, incidentally — it just becomes "we mostly
agreed, and here's why that's more surprising than it sounds" rather than the
demonstration you wanted. But it's worth ten minutes beforehand to avoid.

**Colour vision deficiency.** Roughly one man in twelve and one woman in two
hundred has some red-green deficiency, so in 150 students expect five or six.
iClicker answers aren't visible to anyone else, so nobody is exposed. Worth a
sentence anyway, because the philosophically interesting claim is about people
whose colour vision is *normal* — mentioning the dichromats and setting them
aside makes the argument stronger, since it forecloses the easy dismissal that
the variation is just a known defect.

**Overclaiming.** The thing to resist is "see, our experiences differ." The vote
doesn't show that, and a sharp student will say so. What it shows is a
disagreement whose source you can't determine from outside — which is a better
result, because it's Nagel's actual thesis rather than a stronger one he was
careful not to assert.

---

## What it costs

Four slides and about four minutes, in a deck already running 24 slides for 50
minutes. The cheapest thing to cut is the merge of **"Try it"** and **"Why the
test fails"** into a single slide — both are short, and the Nagel quotation
carries them. That buys most of it back.

If you'd rather not spend the time, the demonstration also works as a
five-minute opener in section that week, where the GSIs have the room to let
people argue about it.

---

## Zero-equipment alternative

If the projector turns out to be too unreliable: ask who thinks coriander tastes
like soap. It's around one person in seven or eight, it's partly genetic, it
needs no display, and everyone who has it is certain about it. It makes the same
point about stable differences in experience between ordinary humans, and it
cannot be blamed on where you're sitting. It's less connected to the philosophy
literature than unique green, which is the tradeoff.
