PREFIX_EFFECTIVE=$PREFIX

# Strip PREFIX to package level
# needed when using environments
# does not break when not using them

while true; do
  resp=$(echo $PREFIX_EFFECTIVE | grep -q envs)
  if [ $? -eq 0 ]; then
    PREFIX_EFFECTIVE=$(dirname $PREFIX_EFFECTIVE)
    continue
  fi
  break
done

# edit the paths in the RC files

INSTALL_DIR=$PREFIX_EFFECTIVE/pkgs/$PKG_NAME-$PKG_VERSION-py27_1/gromacs
INSTALL_BIN=$INSTALL_DIR/bin
INSTALL_SHARE=$INSTALL_DIR/share

sed -i "s|.*GMXRC.bash.*|. $INSTALL_BIN/GMXRC.bash|" $INSTALL_BIN/GMXRC
sed -i "s|.*GMXRC.csh.*|. $INSTALL_BIN/GMXRC.csh|" $INSTALL_BIN/GMXRC
sed -i "s|GMXPREFIX=.*|GMXPREFIX=$INSTALL_DIR|" $INSTALL_BIN/GMXRC.bash
sed -i "s|setenv GMXPREFIX.*|setenv GMXPREFIX $INSTALL_DIR|" $INSTALL_BIN/GMXRC.csh
sed -i "s|source.*|source $INSTALL_BIN/GMXRC.bash|" $INSTALL_BIN/GMXRC.zsh

# copy the path finding tool to $HOME
# for convenience of user

cp $INSTALL_DIR/get_gmx $HOME/

# append the new path the list of gromacs versions
echo 5.1.2,$INSTALL_BIN/GMXRC >> ~/.gromacs_versions
