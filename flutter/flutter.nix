{  pkgs, ... }:

{
  home.packages = with pkgs; [
    android-studio
    clang
    cmake
    flutter
    ninja
    pkg-config
  ];

  programs.adb.enable = true;

  users.users.kahasta = {
    extraGroups = [
      "adbusers"
    ];
  };

  system.userActivationScripts = {
    stdio = {
      text = ''
        rm -f ~/Android/Sdk/platform-tools/adb
        ln -s /run/current-system/sw/bin/adb ~/Android/Sdk/platform-tools/adb
      '';
      deps = [
      ];
    };
  };

}
