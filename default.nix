{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "nixcon2017-website";

  src = ../nixcon2017;

  buildInputs = with pkgs; [
    glibcLocales
    (haskellPackages.ghcWithPackages (ps: with ps; [
      hakyll
    ]))
  ];

  phases = [ "unpackPhase" "buildPhase" "installPhase" ];

  LC_ALL = "en_US.UTF-8";

  buildPhase = ''
    ghc --make site.hs
    ./site build
  '';

  installPhase = ''

  '';
}
