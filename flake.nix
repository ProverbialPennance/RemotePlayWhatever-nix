{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = [
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: rec {
      RemotePlayWhatever = nixpkgs.legacyPackages.${system}.callPackage ./RemotePlayWhatever {};
      default = RemotePlayWhatever;
    });

    overlays.default = import ./overlay.nix;
    nixosModules.default = import ./module.nix;
  };
}
