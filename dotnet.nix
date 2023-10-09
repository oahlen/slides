{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

    nuget-packageslock2nix = {
      url = "github:mdarocha/nuget-packageslock2nix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    nuget-packageslock2nix,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      bin = pkgs.buildDotnetModule {
        pname = "dotnetdemo";
        version = "1.0.0";

        projectFile = "DemoProject.csproj";
        nugetDeps = nuget-packageslock2nix.lib {
          system = "x86_64-linux";
          name = "dotnetdemo";
          lockfiles = [
            ./packages.lock.json
          ];
        };

        src = ./.;

        dotnet-sdk = pkgs.dotnetCorePackages.sdk_7_0;
        dotnet-runtime = pkgs.dotnetCorePackages.aspnetcore_7_0;
        selfContainedBuild = false;

useDotnetFromEnv = true;

        meta = with pkgs.lib; {
          homepage = "some_homepage";
          description = "some_description";
          license = licenses.mit;
        };
      };

      dockerImage = pkgs.dockerTools.buildLayeredImage {
        name = "dotnetdemo";
        tag = "latest";

        contents = [ bin ];

        config = {
          Cmd = ["${bin}/bin/DemoProject"];
          ExposedPorts = {
            "80/tcp" = {};
          };
        };
      };
    in {
      packages = {
        inherit bin dockerImage;
        default = bin;
      };

      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          (with dotnetCorePackages;
            combinePackages [
              sdk_7_0
              sdk_6_0
            ])
          netcoredbg
          omnisharp-roslyn
        ];
      };
    });
}
