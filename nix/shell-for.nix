{ system, pkgs, systemDeps ? [] }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ libsForQt5.qt5.wrapQtAppsHook ];
  buildInputs = with pkgs; [
    pkgs.python39

    python39Packages.jinja2
    python39Packages.pyyaml

    # FIXME: we're not being too precise about the versions here, we need to
    # write a derivation for pyqt, too.
    python39Packages.pyqt5
    python39Packages.pyqtwebengine
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qttools
    libsForQt5.qt5.qtwebengine
  ] ++ systemDeps;

  shellHook = ''
    export QT_QPA_PLATFORM_PLUGIN_PATH="${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins";
  '';
}
