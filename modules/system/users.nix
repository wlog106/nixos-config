{ ... }:

{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.wlog = {
    isNormalUser = true;
    description = "wlog";
    extraGroups = [ "networkmanager" "wheel" ];
  };

}
