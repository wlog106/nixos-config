{
  description = "my flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... } @inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/default/configuration.nix
	  home-manager.nixosModules.home-manager
	  {
	    home-manager = {
	      extraSpecialArgs = { inherit inputs; };
	      useGlobalPkgs = true;
	      useUserPackages = true;
	      users.wlog = ./hosts/default/home.nix;
	    };
	  }
        ];
      };
    };
}
