{ pkgs, ... }: 

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.8;
      font = {
      	size = 12.0; 
      	normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
      };
    };
  };

} 
