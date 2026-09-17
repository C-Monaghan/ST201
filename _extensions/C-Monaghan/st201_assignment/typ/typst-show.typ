#show: doc => article(
  title: [
    $if(title)$
      $title$
    $endif$
  ],
  subtitle: [$if(subtitle)$$subtitle$$endif$
  ],
  authors: [
    $if(author)$
      $author$
    $endif$
  ],
  description: [
    $if(description)$
      $description$
    $endif$
  ],
  date: [
    $if(date)$
      $date$
    $endif$
  ],
  $if(mainfont)$
    font: "$mainfont$",
  $endif$
  $if(mathfont)$
    mathfont: "$mathfont$",
  $endif$
  $if(codefont)$
    codefont: "$codefont$",
  $endif$
  $if(fontsize)$
    fontsize: $fontsize$,
  $endif$
  $if(linestretch)$
    linestretch: $linestretch$,
  $endif$
  $if(papersize)$
    paper: "$papersize$",
  $endif$
  $if(margin)$
    margin: (
      x: $margin.x$,
      y: $margin.y$,
    ),
  $endif$
  $if(linkcolor)$
    linkcolor: "$linkcolor$",
  $endif$
  doc,
)
