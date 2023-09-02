{
  description = "MrBayes with MPI and BEAGLE";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {

      packages.x86_64-linux.mrbayes = pkgs.stdenv.mkDerivation rec {
        pname = "mrbayes";
        version = "3.2.7";

        src = ./.;
      };

      packages.x86_64-linux.default = self.packages.x86_64-linux.mrbayes;

    };
}
