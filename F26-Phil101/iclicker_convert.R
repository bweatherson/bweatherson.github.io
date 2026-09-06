library(tidyverse)

PER_SESSION <- 3    # max points in a single session
COUNT       <- 15   # how many sessions count

read_csv("iclicker-gradebook.csv") |>
  pivot_longer(
    cols      = -c(student_name, student_id, email),
    names_to  = "session",
    values_to = "score"
  ) |>
  mutate(score = replace_na(score, 0)) |>
  group_by(student_id, email) |>
  slice_max(score, n = COUNT, with_ties = FALSE) |>
  summarise(
    points  = sum(score),
    percent = 100 * points / (COUNT * PER_SESSION),
    .groups = "drop"
  ) |>
  write_csv("reading-quizzes-final.csv")