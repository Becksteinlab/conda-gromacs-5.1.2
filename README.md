# README for conda-gromacs-5.1.2

This repository contains everything needed to build
[conda](https://conda.io/docs/) packages for the popular
[Gromacs](http://www.gromacs.org) molecular dynamics package.

**WARNING**: The package builds a **minimal, portable Gromacs version** that is
primarily useful for testing. It is **not recommended to use it for
production-scale simulations.**

Reduced performance features:
* only thread parallelization
* uses bundled FFT (not a fast FFT)
* no GPU support


## Using the installed package

Multiple versions of Gromacs can be installed in parallel. A script
`get_gmx` is installed in the user's home directory that allows the
user to select the desired version of Gromacs. It returns the path to
the `GMXRC` startup script, which in turn needs to be sourced to set
up the Gromacs environment. For instance, to select version
*5.1.2* one would run in the shell

```
source `get_gmx 5.1.2`
```


## Pre-built packages
Anaconda packages for *linux-64* are available in the Anaconda Cloud channel
[anaconda.org/becksteinlab](https://anaconda.org/becksteinlab). If you
have `conda` installed you can install this package with

```
conda install -c becksteinlab gromacs-5.1.2
```

## Building the package

(TBW)

## Licensing

[Gromacs](http://www.gromacs.org/About_Gromacs) itself is published
under the GNU
[Lesser General Public License](http://www.gnu.org/licenses/lgpl-2.1.html)
(LGPL), version 2.1. The files to *build anaconda packages* are
licensed under the MIT license (see file `LICENSE`).


## Contributing

We welcome contributions in the form of issue reports and pull requests.
