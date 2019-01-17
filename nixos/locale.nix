# This file defines locale configurations

{ config, pkgs, ... }:

{


  # Locale configuration
  i18n = {
    consolePackages = [ pkgs.terminus_font ];
    consoleFont = "ter-116n";
    consoleKeyMap = "us";
    defaultLocale = "zh_CN.UTF-8";
  };

  # Time zone configuration
  time.timeZone = "Asia/Shanghai";

  # Input method configuration
  i18n.inputMethod = {
    enabled = "fcitx";
    fcitx.engines = with pkgs.fcitx-engines; [ rime libpinyin ];
  };

  # Font configuration
  fonts.fonts = with pkgs; [ wqy_microhei ];
  fonts.fontconfig.defaultFonts = {
    monospace = [ "WenQuanYi MicroHei Mono" ];
    sansSerif = [ "WenQuanYi MicroHei Mono" ];
    serif = [ "WenQuanYi MicroHei Mono" ];
  };
}
