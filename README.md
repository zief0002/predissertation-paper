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

You need to install these before proceeding, either by using your usual method of installing fonts (the fonts are included in this repository inside the `fonts` folder), or following these instructions:

On a Linux system here's the simplest way to install the fonts:

```
git clone https://github.com/benmarwick/huskydown
cp huskydown/inst/fonts -r /usr/local/share/fonts
sudo fc-cache -f -v
```

On an OSX system you can download a copy of the fonts in this repository with <https://github.com/benmarwick/huskydown/raw/master/fonts.zip>, unzip and move them to your fonts directory, or, assuming [homebrew](https://brew.sh/) is installed and updated, this will get you the fonts needed for this template:

```
brew update
brew tap caskroom/fonts
brew cask install font-eb-garamond font-source-code-pro font-lato
```

On Windows the usual pointing and clicking is required to install the fonts listed above. You can download a copy of the fonts in this repository at <https://github.com/benmarwick/huskydown/raw/master/fonts.zip>, unzip and move them to your fonts directory. 



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
pkg <- c("dplyr", "ggplot2", "knitr", "bookdown", "devtools")

# Check if packages are not installed and assign the
# names of the packages not installed to the variable new.pkg
new.pkg <- pkg[!(pkg %in% installed.packages())]

# If there are any packages in the list that aren't installed,
# install them
if (length(new.pkg))
  install.packages(new.pkg, repos = "http://cran.rstudio.com")
```


## Credits, Notes, and Thanks

The QME Predissertation Paper template draws inspiration from several places. This list is likely incomplete, but attempts to credit those that came before. "If I have seen further, it is because I stand on the shoulders of giants."

- [Michael Ekstrand](https://md.ekstrandom.net/resources/umn-thesis/) [[github](https://github.com/mdekstrand/umn-thesis)] for his inspired use of the `memoir` class to format scholarly work, the University of Minnesota thesis in particular.
- [Ben Marwick](https://github.com/benmarwick/huskydown/blob/master/README.md) for his work on `huskydown` (a thesis template for the University of Washington), especially the font choice. 
- [Yihui Xie](https://bookdown.org/yihui/bookdown/) for his work on `bookdown`, the work-horse beneath the template.
- [RStudio Team](https://www.rstudio.com/) for their vision in creating RStudio, their continued resources in building educational resources, and their willingness to share all of it with the world.
