{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 4;
        
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "disk" "temperature" "pulseaudio" "network" "battery" "tray" ];
        
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            default = "○";
            active = "●";
          };
        };
        
        "hyprland/window" = {
          max-length = 50;
          separate-outputs = true;
        };
        
        clock = {
          format = "{:%H:%M  %d/%m/%Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        
        cpu = {
          format = " {usage}%";
          tooltip = true;
        };
        
        memory = {
          format = " {}%";
          tooltip-format = "RAM: {used:0.1f}G / {total:0.1f}G";
        };
        
        disk = {
          format = " {percentage_used}%";
          path = "/";
          tooltip-format = "Used: {used} / {total}";
        };
        
        temperature = {
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C";
          format-icons = [ "" "" "" ];
        };
        
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };
        
        network = {
          format-wifi = " {essid}";
          format-ethernet = " {ipaddr}";
          format-disconnected = "⚠ Disconnected";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        };
        
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };
        
        tray = {
          spacing = 10;
        };
      };
    };
    
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }
      
      window#waybar {
        background: rgba(30, 30, 46, 0.95);
        color: #cdd6f4;
        border-bottom: 2px solid #89b4fa;
      }
      
      #workspaces button {
        padding: 0 8px;
        color: #cdd6f4;
        background: transparent;
      }
      
      #workspaces button.active {
        color: #89b4fa;
        font-weight: bold;
      }
      
      #workspaces button:hover {
        background: rgba(137, 180, 250, 0.2);
      }
      
      #window {
        color: #89b4fa;
        font-weight: bold;
        padding: 0 10px;
      }
      
      #clock {
        color: #f9e2af;
        font-weight: bold;
        padding: 0 15px;
      }
      
      #cpu, #memory, #disk, #temperature {
        padding: 0 10px;
        color: #a6e3a1;
      }
      
      #temperature.critical {
        color: #f38ba8;
      }
      
      #pulseaudio {
        padding: 0 10px;
        color: #89dceb;
      }
      
      #network {
        padding: 0 10px;
        color: #fab387;
      }
      
      #network.disconnected {
        color: #f38ba8;
      }
      
      #battery {
        padding: 0 10px;
        color: #a6e3a1;
      }
      
      #battery.warning {
        color: #f9e2af;
      }
      
      #battery.critical {
        color: #f38ba8;
      }
      
      #tray {
        padding: 0 10px;
      }
    '';
  };
}
