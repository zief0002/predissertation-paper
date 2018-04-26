# predissertation-paper
This provides a bookdown template for writing and formatting a predissertation paper using R Markdown.


Download the template (which encompasses all the files on this site) by clicking the `Clone or Download` button and select `Download ZIP`. This will download a ZIP file of the entire site on your local computer. Unzip the folder.

To use the QME Predissertation template you will also need to have the following installed on your computer (instructions to follow):

1. RStudio
2. LaTeX Distribution (and packages)
3. Fonts used in the template
4. A few R packages


## 1. RStudio

To use the QME Predissertation template you need to have a recent version of [RStudio](http://www.rstudio.com/products/rstudio/download/) installed on your computer. This will ensure that Pandoc is installed for you and will allow you to compile your predissertation into a PDF file.


## 2. LaTeX distribution

You will also need to install a LaTeX distribution system (that includes XeLaTeX). If you already have [TeXLive](https://www.tug.org/texlive/) or [MikTeX](https://miktex.org/) installed you are set. If not, the easiest way to install LaTeX on any platform is via the [`tinytex`](https://yihui.name/tinytex/) R package. Enter the following commands in the RStudio console to install `tinytex`:

```{r}
install.packages(c('tinytex', 'rmarkdown'))
tinytex::install_tinytex()

# after restarting RStudio, confirm that you have LaTeX with 
tinytex:::is_tinytex()
```

The template also relies on several LaTeX packages for styling your predissertation paper. If you are using RStudio to compile your predissertation paper, any package that needs to be installed should do so automatically the first time you compile your document. (This is especially true if you are using `tinytex` as your LaTeX distribution.)

If when you compile you get errors saying that certain things could not be found, you may need to manually install one or more of the following packages:

- `memoir` (CTAN: https://ctan.org/pkg/memoir): Primary document/style class
- `adforn` (CTAN: https://ctan.org/pkg/adforn): Provides ornamentation on the title page.
- `amsthm` (CTAN: https://ctan.org/pkg/amsthm): Facilitates better typesetting of mathematics
- `booktabs` (Installed as part of the `memoir` class): Facilitates better typesetting of tables
- `datetime` (CTAN: https://ctan.org/pkg/datetime): Formats date
- `float` (CTAN: https://ctan.org/pkg/float): Improves interface for floating objects
- `hyperref` (CTAN: https://ctan.org/pkg/hyperref): Adds support for hypertext
- `microtype` (CTAN: https://ctan.org/pkg/microtype): Facilitates "subliminal refinements towards typographical perfection"
- `xcolor` (CTAN: https://ctan.org/pkg/xcolor): Extends color palettes
- `xltxtra` (CTAN: https://ctan.org/pkg/xltxtra): Adds several features to \XeLaTeX



## 3. Fonts used in the template

The QME Predissertation Paper template requires that a few specific fonts also be installed on your computer:

- [EB Garamond](https://github.com/georgd/EB-Garamond), 
- [Source Code Pro](https://github.com/adobe-fonts/source-code-pro/), and 
- [Lato](http://www.latofonts.com/lato-free-fonts/)

These fonts are included in the the folder `fonts.zip`. You can unzip this folder and then install the three fonts. On most computers, you can double-click on all of the TTF or OTF files and then follow your system's instructions for installing the fonts.


## 4. A few R packages

The QME Predissertation Paper template relies on a few R packages. Install (or update) the following R packages:

- bookdown
- devtools
- dplyr
- ggplot2
- kableExtra
- knitr
- readr

Executing the syntax below in your R console will check that these packages are installed.


```{r}
# List of packages required for this analysis
pkg <- c("bookdown", "devtools", "dplyr", "ggplot2", "knitr", "kableExtra", "readr")

# Check if packages are not installed and assign the
# names of the packages not installed to the variable new.pkg
new.pkg <- pkg[!(pkg %in% installed.packages())]

# If there are any packages in the list that aren't installed,
# install them
if (length(new.pkg))
  install.packages(new.pkg, repos = "http://cran.rstudio.com")
```

## Using the QME Predissertation Template

Once you have everything installed, you can try compiling the default predissertation paper included in the template. To do this, click the `Build Book` button under the `Build` tab in RStudio. (Or select `Build All` from the `Build` menu.) 

The predissertation paper is then compiled into a TeX document (`predissertation.tex`) and a PDF file (`predissertation.pdf`). Both of these are created and placed in the `_book` directory.

If the PDF of the presdissertation paper successfully compiles, congratulations! You are ready to begin writing and adding your own content into the template. 




## Adding Content

To help you understand the different files and where you should add your content, the directory/file structure for the QME Predissertation Paper template is shown below.


```
├── 01-intro.Rmd
├── 02-literature.Rmd
├── 03-method.Rmd
├── 04-results.Rmd
├── 05-discussion.Rmd
├── 06-references.Rmd
├── DESCRIPTION
├── LICENSE
├── README.md
├── _book
│   ├── predissertation.pdf
│   └── predissertation.tex
├── _bookdown.yml
├── _bookdown_files
│   └── predissertation_files
│       └── figure-latex
│           ├── delaysboxplot-1.pdf
│           └── nice-fig-1.pdf
├── _build.sh
├── _deploy.sh
├── _output.yml
├── bib
│   ├── book.bib
│   └── packages.bib
├── data
│   ├── flights.csv
│   └── tab-gopher-women-sports.csv
├── figures
│   └── goldy.png
├── fonts.zip
├── frontmatter
│   └── 00-abstract.Rmd
├── index.Rmd
├── predissertation.Rproj
├── scripts
│   ├── knit-chapters-to-docx.R
│   └── thesis-style-ref.docx
├── style
│   ├── frontmatter.tex
│   ├── preamble.tex
│   └── template.tex
└── thesis.lol
```

Most of these files you do not need to touch at all. The best way to work with these files is to open the `predissertation.Rproj` file. This will open an R Project called `predissertation` in RStudio and you can select individual files by clicking on them under the `Files` tab.


### index.Rmd

The file `index.Rmd` is the file that is like the master file. Compiling this file calls all of the content files (see below), puts them in to a single predissertation document, and styles them appropriately. 

In this file, you can change the YAML metadata to provide the `title`, `author`, and `description` of your predissertation paper. You should not need to change anything else (unless you add an additional BIB file; see section below).



### Which files do I edit to include my content?

The primary files you need to edit will be the actual chapter RMD files (those that begin with a number). The following files will hold the content of each chapter (major section) in your predissertation paper:

- `01-introduction.Rmd`
- `02-literature.Rmd`
- `03-method.Rmd`
- `04-results.Rmd`
- `05-discussion.Rmd`

The first line in these files begins with a hashtag and gives the chapter title. (You do not have to change these chapter titles unless you want to.) Add content to these files as you write your paper.

The file `00-abstract.Rmd` in the `frontmatter` directory is where you can include your predissertation paper's abstract. This document should not include a chapter/section title. The formatting of the \LaTeX will add this automatically.



### Figures, Data, and BIB Files

The `figures`, `data`, and `bib` directories are repository folders to store figures, data, and BIB files you want to include in your predissertation paper. While they don't need to be placed in these folders, doing so will keep your predissertation project more organized.

The BIB files are where we include the metadata (using BIBTeX) for the references. If you include additional BIB files, you also need to include those in the YAML section of `index.Rmd`.



## More Detailed Information (\#protips)

In the following sections, we outine some additional detail to help you navigate writing the predissertation paper in R Markdown, including:

- How to render a single chapter's content for speedier compiling.
- How to render a Word document for your advisor.
- How to include figures so they are numbered and appear in your "List of Figures".
- How to include tables so they are numbered and appear in your "List of Tables".
- How to make sure that tables and figures are placed where you want them in your paper.
- How to obtain numbered equations.
- How to add footnoes/endnotes.
- How to add references into your bibliography.
- How to format your bibliography to other styles (e.g., Chicago rather than APA).


### Rendering a Single Chapter's Content

Clicking `Knit` will only compile the chapter you are currently working on and will likely put PLACEHOLDERS in for other chapters. Since this only renders the output for that specific chapter, it should be faster than building the entire book. However, you should not expect that the content of other chapters is correctly rendered as well. For example, when you navigate to a different chapter, you are actually viewing the old output of that chapter (which may not even exist).


## Word Document for your Advisor

You can send the PDF file of your predissertation paper to your advisor for comments and edits. However, most advisors are more comfortable using Word to edit and make comments. There is an R script file (`knit-chapters-to-docx.R`) in the `scripts` folder that you can run to compile each chapter into a separate DOCX document. Note that the formatting won't be perfect in the Word documents. 



### Figures

If your thesis has a lot of figures, _R Markdown_ might behave better for you than that other word processor. One perk is that it will automatically number the figures accordingly in each chapter. You'll also be able to create a label for each figure, add a caption, and then reference the figure in a way similar to what we saw with tables earlier. If you label your figures, you can move the figures around and _R Markdown_ will automatically adjust the numbering for you. No need for you to remember! So that you don't have to get too far into LaTeX to do this, a couple **R** functions have been created for you to assist. You'll see their use below.

Figures and tables with captions will be placed in `figure` and `table` environments, respectively.


We can import pictures that were not created in **R**. In the code chunk below, we will load in a picture stored as `goldy.png` in our `figures` directory. We then give it the caption of "Goldy rendered as a pencil drawing.", the label of "goldy", and specify that this is a figure. Make note of the different **R** chunk options that are given in the R Markdown file (not shown in the knitted document).

````
```{r goldy, fig.cap="Goldy rendered as a pencil drawing."}
include_graphics(path = "figures/goldy.png")
```
````

Here is a reference to the Goldy image: Figure `\@ref(fig:goldy)`. Note the use of the `fig:` code here. By naming the **R** chunk that contains the figure, we can then reference that figure later as done in the first sentence here. We can also specify the caption for the figure via the R chunk option `fig.cap`.

You can, of course, also create figures using R syntax within a code chunk. 

````
```{r nice-fig, fig.cap='Here is a nice figure!', out.width='80%', fig.asp=.75, fig.align='center', fig.pos='H'}
par(mar = c(4, 4, .1, .1))
plot(pressure, type = 'b', pch = 19)
```
````

Similar to our Goldy picture, we reference these figures through calling its code chunk label with the `fig:` prefix, e.g., see Figure `\@ref(fig:nice-fig)`. 


*Note:* If you need it to appear in the list of figures or tables, it should be placed in a code chunk.


### Tables

The easiest way to create a table is to use Excel to input the information for your table and save it as a CSV file. Then you can read in the CSV file, and use the `kable()` function from **knitr** to style the table.

````
```{r nice-tab}
#Read in data
gopher = readr::read_csv("data/tab-gopher-women-sports.csv")

# Create table
knitr::kable(
  gopher, 
  caption = "2017 Ticket Sales and Operating Revenue for the University of Minnesota Women's Athletic Teams",
  booktabs = TRUE
)
```
````

Further table styling can be carried out via the **kableExtra** package; see https://haozhu233.github.io/kableExtra/awesome_table_in_pdf.pdf. Below we demonstrate some of that functionality.

````
```{r nice-tab-2}
library(kableExtra)

knitr::kable(
  gopher, 
  caption = "2017 Ticket Sales and Operating Revenue for the University of Minnesota Women's Athletic Teams",
  booktabs = TRUE,
  format = "latex"
  ) %>%
  footnote(general = "Data obtained from the 2017 NCAA Financial Report")
```
````

You can also create the table from within R itself and then use `kable()`.

````
```{r}
tab = flights %>%
  filter(month == 12, day == 24) %>%
  group_by(carrier_name) %>%
  summarize(
    Departure = mean(dep_delay),
    Arrival = mean(arr_delay)
    ) %>%
  select(Carrier = carrier_name, Departure, Arrival)

knitr::kable(
  tab, 
  caption = "Average Departure and Arrival Delay (in Minutes) by Carrier on Decemebr 24",
  booktabs = TRUE,
  format = "latex",
  digits = 2
  )
```
````

Finally, you can also reference tables generated from `knitr::kable()`, e.g., see Table `\@ref(tab:nice-tab)`.



### Floats

One thing that may be annoying is the way _R Markdown_ handles "floats" like tables and figures (it's really LaTeX's fault). LaTeX will try to find the best place to put your object based on the text around it and until you're really, truly done writing you should just leave it where it lies. There are some optional arguments specified in the options parameter of the `label` function. If you need to shift your figure around, it might be good to look here on tweaking the options argument: <https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions>

To override LaTeX's floating, we include the chunk option `pos="H"`. That will override the float and place the figure exactly where the code chunk is. This is a LaTeX positioning called from the **float** package, which is pre-loaded in the QME Predissertation Paper template style files.

````
```{r goldy2, fig.cap="Goldy still rendered as a pencil drawing. This time we overrode the float using the 'H' option.", fig.pos="H"}
include_graphics(path = "figures/goldy.png")
```
````


### Mathematics

To use mathematics if you output to an HTML file, add the following at the end of the `index.Rmd` file.

```
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  TeX: { equationNumbers: { autoNumber: "AMS" } }
});
</script>
```


Using LaTeX is the best way to typeset mathematics. One nice feature of _R Markdown_ is its ability to read LaTeX code directly. To include an un-numbered equation, use `$$`.

```
$$
\hat{Y_i} = \beta_0 + \beta_1(X_{1i}) + \beta_2(X_{2i})
$$
```

To include a numbered equation, use `\begin{equation}` and `\end{equation}` to embed your mathematics rather than `$$`

```
\begin{equation}
Y_i = \beta_0 + \beta_1(X_{1i}) + \beta_2(X_{2i}) + \epsilon_i
\end{equation}
```


### Footnotes and Endnotes

You might want to footnote something. ^[footnote text] The footnote will be in a smaller font and placed appropriately. Endnotes work in much the same way. 


### Citations

You can write citations, too. For example, we are using the **bookdown** package `[@R-bookdown]` in this sample book, which was built on top of R Markdown and **knitr** `[@xie2015]`. For more information, including many different citation types, see https://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html#citations


### Bibliographies

The BIB files are where we include the metadata (using BIBTeX) for the references. If you include additional BIB files, you also need to include those in the YAML section of `index.Rmd`. 

For example, if you have the BIBTeX information for your references in a file called `my-predissertation-referces.bib`, you (1) place that BIB file in the `bib` folder, and (2) change the YAML for the `bibliography` line in the `index.Rmd` file to,

```
bibliography: ['bib/book.bib', 'bib/packages.bib', bib/my-predissertation-referces.bib]
```

There are a variety of reference tools that can export metadata to a BIB file. You can do this with:

- Mendelay [[how-to](https://blog.mendeley.com/2011/10/25/howto-use-mendeley-to-create-citations-using-latex-and-bibtex/)]
- Paperpile [[how-to](http://forum.paperpile.com/t/how-to-export-a-document-and-citations-to-latex-and-bibtex/784)]
- Papers 
- Zotero [[how-to](http://unimelb.libguides.com/c.php?g=565734&p=3897111)]

### Styling the Bibliography

If you look at the YAML header at the top of the `index.Rmd` file you can see that we can specify the style of the bibliography as `apalike` using the `biblio-style:` line in the YAML. 

This can be changed by downloading a particualar CSL style file (see https://www.zotero.org/styles), and editing the YAML so that it uses the new style file. For more information, see https://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html#citation_styles


### Tips for Bibliographies

- Like with thesis formatting, the sooner you start compiling your bibliography for something as large as thesis, the better. 
- The cite key (a citation's label) needs to be unique from the other entries.
- When you have more than one author or editor, you need to separate each author's name by the word "and" e.g. `Author = {Noble, Sam and Youngberg, Jessica},`.
- Bibliographies made using BibTeX (whether manually or using a manager) accept LaTeX markup, so you can italicize and add symbols as necessary.
- To force capitalization in an article title or where all lowercase is generally used, bracket the capital letter in curly braces in the BIB file.



## Credits, Notes, and Thanks

The QME Predissertation Paper template draws inspiration from several places. This list is likely incomplete, but attempts to credit those that came before. "If I have seen further, it is because I stand on the shoulders of giants."

- [Michael Ekstrand](https://md.ekstrandom.net/resources/umn-thesis/) [[github](https://github.com/mdekstrand/umn-thesis)] for his inspired use of the `memoir` class to format scholarly work, the University of Minnesota thesis in particular.
- [Ben Marwick](https://github.com/benmarwick/huskydown/blob/master/README.md) for his work on `huskydown` (a thesis template for the University of Washington), especially the font choice. 
- [Yihui Xie](https://bookdown.org/yihui/bookdown/) for his work on `bookdown`, the work-horse beneath the template.
- [RStudio Team](https://www.rstudio.com/) for their vision in creating RStudio, their continued resources in building educational resources, and their willingness to share all of it with the world.


## License

<p xmlns:dct="http://purl.org/dc/terms/">
  <a rel="license"
     href="http://creativecommons.org/publicdomain/zero/1.0/">
    <img src="http://i.creativecommons.org/p/zero/1.0/88x31.png" style="border-style: none;" alt="CC0" />
  </a>
  <br />
  To the extent possible under law,
  <span rel="dct:publisher" resource="[_:publisher]">the person who associated CC0</span>
  with this work has waived all copyright and related or neighboring
  rights to this work.
</p>


## Anything else?

If you would like to see examples of other things in this template, please contact me at [zief0002@umn.edu](zief0002@umn.edu) with your suggestions. I love to see people using _R Markdown_ for their theses, and am happy to help.

