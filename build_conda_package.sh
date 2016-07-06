echo "Y\n" | conda update conda
echo "Y\n" | conda update conda-build

conda-build .
OUT=$(conda-build . --output)

cp $OUT /root/

cp -r /tmp/gromacs_build/versions/gromacs-5.1.2/gnu/* .

bunzip2 *.bz2
tar rvf $(ls *.tar) share/
tar rvf $(ls *.tar) bin/
bzip2 *.tar
