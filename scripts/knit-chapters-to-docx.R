# Preview Chapter 1
bookdown::preview_chapter("01-intro.Rmd",
  output_format = "bookdown::word_document2",
  output_file = paste0("thesis-chap01-", format(Sys.Date(), ("%Y-%m-%d")), ".docx"),
  output_dir = "chapter-previews",
  output_options = list(reference_docx = "scripts/thesis-style-ref.docx")
  )



# Preview Chapter 2
bookdown::preview_chapter("02-literature.Rmd",
  output_format = "bookdown::word_document2",
  output_file = paste0("thesis-chap02-", format(Sys.Date(), ("%Y-%m-%d")), ".docx"),
  output_dir = "chapter-previews",
  output_options = list(reference_docx = "~/Desktop/thesis-word/thesis-style-ref.docx")
  )



# Preview Chapter 3
bookdown::preview_chapter("03-method.Rmd",
  output_format = "bookdown::word_document2",
  output_file = paste0("thesis-chap03-", format(Sys.Date(), ("%Y-%m-%d")), ".docx"),
  output_dir = "chapter-previews",
  output_options = list(reference_docx = "~/Desktop/thesis-word/thesis-style-ref.docx")
  )




# Preview Chapter 4
bookdown::preview_chapter("04-results.Rmd",
  output_format = "bookdown::word_document2",
  output_file = paste0("thesis-chap04-", format(Sys.Date(), ("%Y-%m-%d")), ".docx"),
  output_dir = "chapter-previews",
  output_options = list(reference_docx = "~/Desktop/thesis-word/thesis-style-ref.docx")
  )



# Preview Chapter 5
bookdown::preview_chapter("05-discussion.Rmd",
  output_format = "bookdown::word_document2",
  output_file = paste0("thesis-chap05-", format(Sys.Date(), ("%Y-%m-%d")), ".docx"),
  output_dir = "chapter-previews",
  output_options = list(reference_docx = "~/Desktop/thesis-word/thesis-style-ref.docx")
  )

