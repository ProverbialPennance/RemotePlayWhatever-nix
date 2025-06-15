{pkgs ? import <nixpkgs> {}, ...}: {
  RemotePlayWhatever = pkgs.callPackage ./RemotePlayWhatever {};
}
