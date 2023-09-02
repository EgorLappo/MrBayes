{
  description = "MrBayes with MPI support";

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

        buildInputs = [ pkgs.mpi ];

        configurePhase = ''
          ./configure --with-mpi
        '';

        installPhase = ''
          mkdir -p $out/bin
          cp src/mb $out/bin
        '';
      };

      packages.x86_64-linux.default = self.packages.x86_64-linux.mrbayes;

    };
}


