add_slides <- function(slide_id, height = "600px") {
  cat('```{=html}\n')
  cat('<div class="slides-container">\n')
  cat('  <div class="slide-options">\n')
  cat(
    '    <a class="btn btn-primary" href="',
    slide_id,
    '" target="_blank">\n',
    sep = ""
  )
  cat(
    '      <i class="fa-solid fa-arrow-up-right-from-square"></i> Open slides in New Window\n'
  )
  cat('    </a>\n')
  cat('  </div>\n')
  cat('  <iframe src="', slide_id, '"\n', sep = "")
  cat('    class="slide-frame"\n')
  cat('    width="100%"\n')
  cat('    height="', height, '"\n', sep = "")
  cat('    style="border: 2px solid #dee2e6; border-radius: 8px;">\n')
  cat('  </iframe>\n')
  cat('</div>\n')
  cat('```\n')
}
