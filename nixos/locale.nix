# This file defines locale configurations

{ config, pkgs, ... }:

{


  # Locale configuration
  console.packages = [ pkgs.terminus_font ];
  console.font = "ter-116n";
  console.keyMap = "us";
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
      "zh_CN.GBK/GBK"
      "zh_CN.GB18030/GB18030"
      "zh_CN/GB2312" 
    ];
  };

  # Time zone configuration
  time.timeZone = "Asia/Shanghai";

  # Input method configuration
  i18n.inputMethod = {
    enabled = "fcitx";
    fcitx.engines = with pkgs.fcitx-engines; [ rime libpinyin ];
  };

  # Font configuration
  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [ wqy_microhei ];
  fonts.fontconfig.defaultFonts = {
    monospace = [ "WenQuanYi MicroHei Mono" ];
    sansSerif = [ "WenQuanYi MicroHei Mono" ];
    serif = [ "WenQuanYi MicroHei Mono" ];
  };
}
