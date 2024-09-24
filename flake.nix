{
  description = "A Rust project as a Nix flake";

  inputs = {
    # Add the nixpkgs flake for package dependencies
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";  # Adjust for your system (e.g., "aarch64-linux" for ARM)
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.rustPlatform.buildRustPackage {
        pname = "krabby";
        version = "0.1.8";

        # Set your source directory (can be a relative path to Cargo.toml)
        src = ./.;

        cargoHash = "sha256-/wXfdH9ObKGOw8EXHG/3Gvhm66v632lpDp/V3zFIzh4=";

        nativeBuildInputs = [ pkgs.pkg-config ];

        # Optional: Specify any additional dependencies
        buildInputs = [ ];

        # Optional: Enable crate features (if needed)
        cargoFeatures = [ "--verbose" ];
      };

      # This allows you to run the package as a flake app
      apps.default = {
        type = "app";
        program = "${self.packages.${system}.default}/bin/krabby";
      };
    };
}

