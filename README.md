# predissertation-paper
This provides a bookdown template for writing and formatting a predissertation paper using R Markdown.


To use the QME Predissertation template you need to have a recent version of [RStudio](http://www.rstudio.com/products/rstudio/download/) installed on your computer. This will ensure that Pandoc is installed for you and will allow you to compile your predissertation into a PDF file.



## LaTeX Distribution

You will also need to install a \LaTeX distribution system (that includes \XeLaTeX). If you already have [TeXLive](https://www.tug.org/texlive/) or [MikTeX](https://miktex.org/) installed you are set. If not, the easiest way to install \LaTeX on any platform is via the [`tinytex`](https://yihui.name/tinytex/) R package. Enter the following commands in the RStudio console to install `tinytex`:

```{r}
install.packages(c('tinytex', 'rmarkdown'))
tinytex::install_tinytex()

# after restarting RStudio, confirm that you have LaTeX with 
tinytex:::is_tinytex()
```

The template also relies on several \LaTeX packages for styling your predissertation paper.If you installed `tinytex`, the installation should happen automatically the first time you compile your document.  If you have a \LaTeX distribution that you previously installed, you will need to install the following packages:

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



## Fonts

The QME Predissertation Paper template requires that a few specific fonts also be installed on your computer:

- [EB Garamond](https://github.com/georgd/EB-Garamond), 
- [Source Code Pro](https://github.com/adobe-fonts/source-code-pro/), and 
- [Lato](http://www.latofonts.com/lato-free-fonts/)

You need to install these before proceeding, either by using your usual method of installing fonts (the fonts are included in this repository inside the zipped `fonts.zip` file), or following these instructions:

On an OSX system you can download a copy of the fonts in this repository with <https://github.com/zief0002/predissertation-paper/raw/master/fonts.zip>, unzip and move them to your fonts directory (or just double-click on each to install them). 

An alternative method for installing these fonts, assuming [homebrew](https://brew.sh/) is installed and updated, is the following:

```
brew update
brew tap caskroom/fonts
brew cask install font-eb-garamond font-source-code-pro font-lato
```

On Windows the usual pointing and clicking is required to install the fonts listed above. You can download a copy of the fonts in this repository at <https://github.com/zief0002/predissertation-paper/raw/master/fonts.zip>, unzip and move them to your fonts directory. 



## R Packages

The QME Predissertation Paper template relies on several R packages. Install (or update) the following R packages:

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


The directory/file structure for the QME Predissertation Paper template is below.


```
├── 01-intro.Rmd
├── 02-literature.Rmd
├── 03-method.Rmd
├── 04-results.Rmd
├── 05-discussion.Rmd
├── 06-references.Rmd
├── DESCRIPTION
├── LICENSE
├── _book
│   ├── predissertation.pdf
│   └── predissertation.tex
├── _bookdown.yml
├── _bookdown_files
│   └── predissertation_files
│       └── figure-latex
│           ├── delaysboxplot-1.pdf
│           ├── march3plot-1.pdf
│           ├── nice-fig-1.pdf
│           └── pressure-1.pdf
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

### Building the Predissertation Paper

To actually compile your predissertation paper into a PDF file, click the `Build Book` button under the `Build` tab in RStudio. (Or select `Build All` from the `Build` menu.) Clicking `Knit` will only compile the chapter you are currently working on and will likely put PLACEHOLDERS in for other chapters. Building, not knitting, is how the entire document is created.

The predissertation paper is then compiled into a TeX document (`predissertation.tex`) and a PDF file (`predissertation.pdf`). Both of these are created and placed in the `_book` directory.

### Adding Content

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


### Word Document for your Advisor

You can send the PDF file of your predissertation paper to your advisor for comments and edits. However, most advisors are more comfortable using Word to edit and make comments. There is an R script file (`knit-chapters-to-docx.R`) in the `scripts` folder that you can run to compile each chapter into a separate DOCX document.

## Mathematics

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


## Footnotes and Endnotes

You might want to footnote something. ^[footnote text] The footnote will be in a smaller font and placed appropriately. Endnotes work in much the same way. 


## Citations

You can write citations, too. For example, we are using the **bookdown** package `[@R-bookdown]` in this sample book, which was built on top of R Markdown and **knitr** `[@xie2015]`.


## Bibliographies

Of course you will need to cite things, and you will probably accumulate an armful of sources. There are a variety of tools available for creating a bibliography database (stored with the .bib extension). In addition to BibTeX suggested below, you may want to consider using the free and easy-to-use tool called Zotero. Some Zotero documentation is at http://libguides.reed.edu/citation/zotero. In addition, a tutorial is available from Middlebury College at http://sites.middlebury.edu/zoteromiddlebury/.

_R Markdown_ uses _pandoc_ (http://pandoc.org/) to build its bibliographies. One nice caveat of this is that you won't have to do a second compile to load in references as standard LaTeX requires. To cite references in your thesis (after creating your bibliography database), place the reference name inside square brackets and precede it by the "at" symbol. For example, here's a reference to a book about worrying: [@Molina1994]. This `Molina1994` entry appears in a file called `thesis.bib` in the `bib` folder. This bibliography database file was created by a program called BibTeX. You can call this file something else if you like (look at the YAML header in the main .Rmd file) and, by default, is to placed in the `bib` folder. 

For more information about BibTeX and bibliographies, see (http://web.reed.edu/cis/help/latex/index.html)^[@reedweb2007]. There are three pages on this topic: _bibtex_ (which talks about using BibTeX, at http://web.reed.edu/cis/help/latex/bibtex.html), _bibtexstyles_ (about how to find and use the bibliography style that best suits your needs, at http://web.reed.edu/cis/help/latex/bibtexstyles.html) and _bibman_ (which covers how to make and maintain a bibliography by hand, without BibTeX, at http://web.reed.edu/cis/help/latex/bibman.html). The last page will not be useful unless you have only a few sources.

If you look at the YAML header at the top of the main .Rmd file you can see that we can specify the style of the bibliography by referencing the appropriate csl file. You can download a variety of different style files at https://www.zotero.org/styles. Make sure to download the file into the csl folder.

**Tips for Bibliographies**

- Like with thesis formatting, the sooner you start compiling your bibliography for something as large as thesis, the better. 
- The cite key (a citation's label) needs to be unique from the other entries.
- When you have more than one author or editor, you need to separate each author's name by the word "and" e.g. `Author = {Noble, Sam and Youngberg, Jessica},`.
- Bibliographies made using BibTeX (whether manually or using a manager) accept LaTeX markup, so you can italicize and add symbols as necessary.
- To force capitalization in an article title or where all lowercase is generally used, bracket the capital letter in curly braces.



## Credits, Notes, and Thanks

The QME Predissertation Paper template draws inspiration from several places. This list is likely incomplete, but attempts to credit those that came before. "If I have seen further, it is because I stand on the shoulders of giants."

- [Michael Ekstrand](https://md.ekstrandom.net/resources/umn-thesis/) [[github](https://github.com/mdekstrand/umn-thesis)] for his inspired use of the `memoir` class to format scholarly work, the University of Minnesota thesis in particular.
- [Ben Marwick](https://github.com/benmarwick/huskydown/blob/master/README.md) for his work on `huskydown` (a thesis template for the University of Washington), especially the font choice. 
- [Yihui Xie](https://bookdown.org/yihui/bookdown/) for his work on `bookdown`, the work-horse beneath the template.
- [RStudio Team](https://www.rstudio.com/) for their vision in creating RStudio, their continued resources in building educational resources, and their willingness to share all of it with the world.


## Anything else?

If you would like to see examples of other things in this template, please contact me at [zief0002@umn.edu](zief0002@umn.edu) with your suggestions. I love to see people using _R Markdown_ for their theses, and am happy to help.

