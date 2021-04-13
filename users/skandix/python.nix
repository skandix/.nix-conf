{ pkgs, ... }:

{
  home.packages = with pkgs;
  [
    (python39.withPackages
    (ps: with ps; [
      neovim
      setuptools
      virtualenv
      pipenv
  ]))
  ];
}
