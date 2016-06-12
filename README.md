# My LaTeX paper

A template for organizing publications written in LaTeX

This repository comes with a
[Makefile](https://github.com/jiahao/latex-template/blob/master/Makefile)
that organizes a host of common LaTeX housekeeping tasks.

## List of `make` targets

- `pdf` (Default) - Builds a PDF of the LaTeX file `$(MAIN).tex`, where `MAIN`
  is a Makefile variable set on the first line.
- `all` - Builds the PDF and also runs any `Makefile` placed in code. The idea
  is to also run some code if your paper describes some algorithms or data
  analyses.
- `lint` - Runs LaTeX linting commands like `chktex` and `biber --tool -V`.
- `arxiv` - Creates an `arxiv.zip` file suitable for submission to
  [arXiv.org](http://arxiv.org).


## Other things you might want to do

- [ ] Turn on continuous integration with [Travis](https://travis-ci.org).
      This repository comes with a [Travis configuration script](https://github.com/jiahao/latex-template/blob/master/.travis.yml).

- [ ] Tag a release and assign it a [DOI with Zenodo](https://zenodo.org/account/settings/github/).

