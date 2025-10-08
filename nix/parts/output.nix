# nix/parts/krabby.nix
{inputs, ...}: {
  perSystem = {
    pkgs,
    system,
    ...
  }: let
    # Reuse your existing naersk-based derivation:
    krabby = pkgs.callPackage ../packages/krabby {inherit inputs pkgs;};
  in {
    # Expose both a named package and the default alias.
    packages.krabby = krabby;
    packages.default = krabby;

    # Optional: make `nix run` Just Work.
    apps.default = {
      type = "app";
      program = "${krabby}/bin/${krabby.pname or "krabby"}";
    };
  };
}
