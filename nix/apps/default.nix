# nix/apps/default.nix
{
  self,
  pkgs,
  ...
}: let
  drv = self.packages.${pkgs.system}.krabby;
in {
  type = "app";
  program = "${drv}/bin/${drv.pname or "krabby"}";
}
