{
  pkgs ? import <nixpkgs> {
    config = { };
    overlays = [ ];
  },
}:
pkgs.mkShell {
  buildInputs = [
    pkgs.marp-cli
    pkgs.prettier
  ];
}
