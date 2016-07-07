echo "Y\n" | conda update conda
echo "Y\n" | conda update conda-build

conda-build .

OUT=$(conda-build . --output)

INSTALL_DIR=$(echo $(dirname $OUT)/$(basename $OUT | cut -d'.' -f1-5) | sed "s?conda-bld/linux-64?pkgs?")

echo $INSTALL_DIR

INSTALL_BIN=$INSTALL_DIR/bin
INSTALL_SHARE=$INSTALL_DIR/share

echo $INSTALL_BIN
echo $INSTALL_SHARE

cp $OUT /root/

cp -r /tmp/gromacs_build/versions/gromacs-5.1.2/gnu/* .

sed -i "s?.*GMXRC.bash.*?. $INSTALL_BIN/GMXRC.bash?" bin/GMXRC
sed -i "s?.*GMXRC.csh.*?. $INSTALL_BIN/GMXRC.csh?" bin/GMXRC
sed -i "s?GMXPREFIX=.*?GMXPREFIX=$INSTALL_DIR?" bin/GMXRC.bash

bunzip2 *.bz2
tar rvf $(ls *.tar) share/
tar rvf $(ls *.tar) bin/
bzip2 *.tar
