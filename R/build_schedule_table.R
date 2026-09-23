build_schedule_table <- function(schedule) {
  schedule |>
    mutate(
      Slides = if_else(
        Classification == "Lecture",
        '<i class="schedule-icon fa-solid fa-person-chalkboard fa-lg"></i>',
        '<i class="schedule-icon schedule-icon--inactive fa-solid fa-person-chalkboard fa-lg"></i>'
      ),
      Coding = if_else(
        Classification == "Lecture",
        '<i class="schedule-icon fa-solid fa-laptop-code fa-lg"></i>',
        '<i class="schedule-icon schedule-icon--inactive fa-solid fa-laptop-code fa-lg"></i>'
      ),
      Tutorial = ifelse(
        Classification == "Tutorial",
        '<i class="schedule-icon fa-solid fa-chalkboard-user fa-lg"></i>',
        '<i class="schedule-icon schedule-icon--inactive fa-solid fa-chalkboard-user fa-lg"></i>'
      ),
      Assignment = ifelse(
        Classification %in% c("Tutorial", "Assignment"),
        '<i class="schedule-icon fa-solid fa-pen-ruler fa-lg"></i>',
        '<i class="schedule-icon schedule-icon--inactive fa-solid fa-pen-ruler fa-lg"></i>'
      )
    ) |>
      mutate(
    flag = ifelse(Topic %in% c("Mid term exam", "Final exam"), TRUE, FALSE),
    content_flag = ifelse(
      flag == TRUE,
      '<span class="schedule-flag"><i class="fas fa-star"></i>&ensp;',
      ""
    ),
    Topic = ifelse(flag == TRUE,
      glue::glue('<span class="schedule-title">{content_flag}{Topic}</span></span>'),
      Topic
    )
  ) |>
    select(-c(Classification, flag, content_flag))
}
