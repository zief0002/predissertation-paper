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

<!-- Required to number equations in HTML files -->
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  TeX: { equationNumbers: { autoNumber: "AMS" } }
});
</script>



\TeX\ is the best way to typeset mathematics. Donald Knuth designed \TeX\ when he got frustrated at how long it was taking the typesetters to finish his book, which contained a lot of mathematics.  One nice feature of _R Markdown_ is its ability to read LaTeX code directly.


$$
\sum_{j=1}^n (\delta\theta_j)^2 \leq {{\beta_i^2}\over{\delta_i^2 + \rho_i^2}}
\left[ 2\rho_i^2 + {\delta_i^2\beta_i^2\over{\delta_i^2 + \rho_i^2}} \right] \equiv \omega_i^2
$$

From Informational Dynamics, we have the following (Dave Braden):

After _n_ such encounters the posterior density for $\theta$ is

<!-- To have a numbered equation, use the \begin{equation} and \end{equation} to embed your mathematics rather than '$$' -->

\begin{equation}
\pi(\theta|X_1< y_1,\dots,X_n<y_n) \varpropto \pi(\theta) \prod_{i=1}^n\int_{-\infty}^{y_i}
   \exp\left(-{(x-\theta)^2\over{2\sigma^2}}\right)\ dx
\end{equation}

Another equation:

$$
\det\left|\,\begin{matrix}%
c_0&c_1\hfill&c_2\hfill&\ldots&c_n\hfill\cr
c_1&c_2\hfill&c_3\hfill&\ldots&c_{n+1}\hfill\cr
c_2&c_3\hfill&c_4\hfill&\ldots&c_{n+2}\hfill\cr
\,\vdots\hfill&\,\vdots\hfill&
  \,\vdots\hfill&&\,\vdots\hfill\cr
c_n&c_{n+1}\hfill&c_{n+2}\hfill&\ldots&c_{2n}\hfill\cr
\end{matrix}\right|>0
$$


Lapidus and Pindar, Numerical Solution of Partial Differential Equations in Science and
Engineering.  Page 54

$$
\int_t\left\{\sum_{j=1}^3 T_j \left({d\phi_j\over dt}+k\phi_j\right)-kT_e\right\}w_i(t)\ dt=0,
   \qquad\quad i=1,2,3.
$$

L\&P  Galerkin method weighting functions.  Page 55

$$
\sum_{j=1}^3 T_j\int_0^1\left\{{d\phi_j\over dt} + k\phi_j\right\} \phi_i\ dt
   = \int_{0}^1k\,T_e\phi_idt, \qquad i=1,2,3 $$

Another L\&P (p145)

$$
\int_{-1}^1\!\int_{-1}^1\!\int_{-1}^1 f\big(\xi,\eta,\zeta\big)
   = \sum_{k=1}^n\sum_{j=1}^n\sum_{i=1}^n w_i w_j w_k f\big( \xi,\eta,\zeta\big).
$$

Another L\&P (p126)

$$
\int_{A_e} (\,\cdot\,) dx dy = \int_{-1}^1\!\int_{-1}^1 (\,\cdot\,) \det[J] d\xi d\eta.
$$


## Credits, Notes, and Thanks

The QME Predissertation Paper template draws inspiration from several places. This list is likely incomplete, but attempts to credit those that came before. "If I have seen further, it is because I stand on the shoulders of giants."

- [Michael Ekstrand](https://md.ekstrandom.net/resources/umn-thesis/) [[github](https://github.com/mdekstrand/umn-thesis)] for his inspired use of the `memoir` class to format scholarly work, the University of Minnesota thesis in particular.
- [Ben Marwick](https://github.com/benmarwick/huskydown/blob/master/README.md) for his work on `huskydown` (a thesis template for the University of Washington), especially the font choice. 
- [Yihui Xie](https://bookdown.org/yihui/bookdown/) for his work on `bookdown`, the work-horse beneath the template.
- [RStudio Team](https://www.rstudio.com/) for their vision in creating RStudio, their continued resources in building educational resources, and their willingness to share all of it with the world.


