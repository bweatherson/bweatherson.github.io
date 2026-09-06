#!/usr/bin/env Rscript

# reading-quizzes.R — apply the best-15-of-20 reading quiz policy and produce
# one column for the Canvas gradebook.
#
# WHY THIS EXISTS
#
# iClicker Cloud has no drop-lowest and no best-N. It sums every session and
# syncs a single total, so the policy the syllabus promises cannot be expressed
# inside it. Canvas *can* drop lowest scores, but only through assignment-group
# rules, which need every session to be its own column: twenty columns in the
# gradebook, and twenty rows of email when one of them looks wrong. So the
# policy is applied here instead, and Canvas receives one column that is
# already correct.
#
# THE POLICY, as stated on the syllabus: quizzes run on twenty of the days that
# carry a reading, and the best fifteen count. Five missed days therefore cost
# nothing and need no explanation. Lectures 5 and 6 were the soft launch and do
# not count at all.
#
# HOW TO RUN IT
#
#   1. iClicker Cloud: export the gradebook to CSV.
#   2. Canvas: Grades -> Export -> Export Entire Gradebook.
#      This file is the authoritative roster. iClicker's is not: a student who
#      never registered an iClicker account is absent from it entirely, and
#      needs to score zero rather than vanish.
#   3. Put both CSVs beside this script, set the block below, then run
#
#        Rscript tools/reading-quizzes.R
#
#   4. READ THE REPORT IT PRINTS before doing anything with the output. It
#      lists every student it could not match in either direction. At 150
#      students expect a handful; expect none of them to be silent.
#   5. Upload the output through Canvas: Grades -> Import. Canvas shows a
#      preview; read that too.
#
# Run it once mid-term so students can see where they stand, and once at the
# end for the real thing.

# These all come with tidyverse; loaded individually so the script starts faster.
library(readr)
library(dplyr)
library(tidyr)

# ---------------------------------------------------------------- settings --

ICLICKER_CSV <- "iclicker-gradebook.csv"
CANVAS_CSV   <- "canvas-gradebook.csv"
OUTPUT_CSV   <- "reading-quizzes-for-canvas.csv"

COUNT       <- 15    # how many sessions count toward the grade
PER_SESSION <- 3     # maximum points available in one session

# Sessions to ignore entirely. The soft-launch classes go here, named exactly
# as their columns appear in the iClicker export.
SOFT_LAUNCH <- c()

# Columns in the iClicker export that identify the student rather than record a
# score. Everything else is treated as a session, so if this list is wrong the
# arithmetic is wrong. The script prints what it decided; check it the first time.
ICLICKER_ID_COLS <- c("Last Name", "First Name", "Email", "Student ID")

# The iClicker column holding something that matches a U-M uniqname, usually an
# email address. Matching is done on the uniqname, not on names: preferred
# names, changed names and dual enrolments all break name matching, silently.
ICLICKER_KEY_COL <- "Email"

# Must match the Canvas assignment name EXACTLY, or Canvas creates a second
# assignment on import instead of filling in the one you meant.
CANVAS_COLUMN <- "Reading Quizzes"

# --------------------------------------------------------------- functions --

uniqname <- function(x) {
  # umich.edu addresses, bare uniqnames and stray capitals all reduce to the
  # same key. Anything unparseable stays as itself and shows up unmatched.
  x |> tolower() |> trimws() |> sub("@.*$", "", x = _)
}

stop_if_missing <- function(df, cols, what) {
  absent <- setdiff(cols, names(df))
  if (length(absent)) {
    stop(what, " is missing these columns: ", paste(absent, collapse = ", "),
         "\nColumns actually present: ", paste(names(df), collapse = ", "),
         call. = FALSE)
  }
}

# -------------------------------------------------------------------- read --

iclicker <- read_csv(ICLICKER_CSV, show_col_types = FALSE)
canvas   <- read_csv(CANVAS_CSV,   show_col_types = FALSE)

stop_if_missing(iclicker, c(ICLICKER_ID_COLS, ICLICKER_KEY_COL), "The iClicker export")
stop_if_missing(canvas, c("Student", "ID", "SIS Login ID"), "The Canvas export")

# Canvas puts a "Points Possible" row directly under the header, and sometimes a
# Test Student. Neither is a person.
canvas <- canvas |>
  filter(!is.na(ID), Student != "Points Possible", Student != "Test Student")

session_cols <- setdiff(names(iclicker), ICLICKER_ID_COLS)
session_cols <- setdiff(session_cols, SOFT_LAUNCH)

message("Sessions being counted (", length(session_cols), "):")
message("  ", paste(session_cols, collapse = ", "))
if (length(SOFT_LAUNCH)) {
  message("Excluded as soft launch: ", paste(SOFT_LAUNCH, collapse = ", "))
}
if (length(session_cols) < COUNT) {
  warning("Only ", length(session_cols), " sessions, but the policy counts ",
          COUNT, ". Everyone will be scored out of a denominator they cannot reach.",
          call. = FALSE)
}

# ----------------------------------------------------------------- compute --

scored <- iclicker |>
  mutate(key = uniqname(.data[[ICLICKER_KEY_COL]])) |>
  select(key, all_of(session_cols)) |>
  pivot_longer(all_of(session_cols), names_to = "session", values_to = "score") |>
  mutate(score = replace_na(as.numeric(score), 0)) |>
  group_by(key) |>
  # Fewer than COUNT sessions is fine: they keep what they have, and the
  # denominator below is unchanged. That is what a missed class costs.
  slice_max(score, n = COUNT, with_ties = FALSE) |>
  summarise(points = sum(score), .groups = "drop") |>
  mutate(percent = round(100 * points / (COUNT * PER_SESSION), 1))

# ------------------------------------------------------------------- match --

canvas_keyed <- canvas |> mutate(key = uniqname(`SIS Login ID`))

unmatched_iclicker <- setdiff(scored$key, canvas_keyed$key)
unmatched_canvas   <- setdiff(canvas_keyed$key, scored$key)

out <- canvas_keyed |>
  left_join(scored, by = "key") |>
  # A student absent from the iClicker export never registered. That is a zero,
  # not a missing value, and it must not silently drop out of the upload.
  mutate(!!CANVAS_COLUMN := replace_na(percent, 0)) |>
  select(any_of(c("Student", "ID", "SIS User ID", "SIS Login ID", "Section")),
         all_of(CANVAS_COLUMN))

# ------------------------------------------------------------------ report --

message("\n--- check this before uploading ---")
message("Canvas roster: ", nrow(canvas_keyed), " students")
message("Scored from iClicker: ", nrow(scored))
message("Scored 0 because they are not in the iClicker export: ",
        length(unmatched_canvas))

if (length(unmatched_iclicker)) {
  message("\nIn iClicker but NOT on the Canvas roster (", length(unmatched_iclicker),
          "). These scores are being discarded — dropped students, or a bad key:")
  message("  ", paste(unmatched_iclicker, collapse = ", "))
}
if (length(unmatched_canvas)) {
  message("\nOn the Canvas roster but NOT in iClicker (", length(unmatched_canvas),
          "). These are being scored 0. If this list is long, something is wrong ",
          "with the roster sync rather than with the students:")
  message("  ", paste(unmatched_canvas, collapse = ", "))
}

message("\nScore distribution:")
print(summary(out[[CANVAS_COLUMN]]))

write_csv(out, OUTPUT_CSV)
message("\nWrote ", OUTPUT_CSV, " (", nrow(out), " rows). ",
        "Upload via Canvas Grades -> Import.")
