echo "Y\n" | conda update conda
echo "Y\n" | conda update conda-build

conda-build .

OUT=$(conda-build . --output)

INSTALL_DIR=$(echo $(dirname $OUT)/$(basename $OUT | cut -d'.' -f1-5) | sed "s|conda-bld/linux-64|pkgs|")/gromacs

INSTALL_BIN=$INSTALL_DIR/bin
INSTALL_SHARE=$INSTALL_DIR/share

cp $OUT /root/
cp -r /tmp/gromacs_build/versions/gromacs-5.1.2/gnu/* /root/gromacs

cd ..
rm gromacs/*.sh gromacs/meta.yaml
cp /root/get_gmx gromacs/

bunzip2 *.bz2
tar rvf $(ls *.tar) gromacs/
bzip2 *.tar
