{ pkgs ? import <nixpkgs> {} }:
let pythonPackages = packages: with packages;
      [ fire
        jinja2
        pyyaml
      ];
    pythonWithPackages = pkgs.python3.withPackages pythonPackages;
in pkgs.mkShell {
  buildInputs = with pkgs;
    [ pythonWithPackages
      texlive.combined.scheme-full
    ];
}
