{
  description = "Iosevka custom fonts";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        { pkgs, ... }:
        let
          fonts = {
            normal = pkgs.callPackage ./packages/normal.nix { };
            term   = pkgs.callPackage ./packages/term.nix   { };
            mono   = pkgs.callPackage ./packages/mono.nix   { };
          };
        in
        {
          packages = fonts // {
            default = fonts.term;
          };
        };
    };
}
