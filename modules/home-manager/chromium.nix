{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      { id = "hhfnghjdeddcfegfekjeihfmbjenlomm"; } # Web Activity Time Tracker
      { id = "abocjojdmemdpiffeadpdnicnlhcndcg"; } # SocialFocus
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # Proton Pass
    ];
  };
}