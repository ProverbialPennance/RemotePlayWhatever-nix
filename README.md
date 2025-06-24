# RemotePlayWhatever

## Deprecation

DATE: `2025-06-24`

This repo is being archived, and is now managed under [just-one-more-repo](https://github.com/ProverbialPennance/just-one-more-repo)

## Installation

For a [flakes enabled system](https://nixos.wiki/wiki/flakes#Enable_flakes_permanently_in_NixOS), the following additions to a `flake.nix` in your system's configuration directory will add an overlay replacing the package in nixpkgs with this one.

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # NOTE: replace nixos-25.05 with the desired version, such as nixos-unstable

    RemotePlayWhatever = {
        url = "github:ProverbialPennance/RemotePlayWhatever-nix";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    RemotePlayWhatever,
  }:
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          RemotePlayWhatever.nixosModules.default
        ];
      };
    };
  };
}
```

after which you can add the `RemotePlayWhatever` to your configuration.nix as per usual:

```nix
{
  config,
  lib,
  pkgs,
  ...
}:
...
environment.systemPackages = [
  RemotePlayWhatever
];
```
