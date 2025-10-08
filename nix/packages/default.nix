# nix/packages/default.nix
{
  pkgs,
  inputs,
  ...
}:
pkgs.callPackage ./krabby {inherit inputs pkgs;}
