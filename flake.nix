{
  description = "my flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, home-manager, ... } @inputs:
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
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
