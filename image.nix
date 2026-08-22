# Written by .github/workflows/build.yml — do not edit by hand.
#
# The nightly build publishes tagged images and commits the tag here,
# so this repo's git revision *is* the deployed version: consumers pin
# it through flake.lock and upgrade with `nix flake update b1church`.
#
# The tag is derived from the three upstream commits below, so it only
# changes when upstream does.
{
  registry = "ghcr.io/tristonyoder/b1church";
  tag = "u319378c7b15d";

  upstream = {
    api = "8787ec95a7d28dd1ff42a60c4415b26a4a8374de";
    admin = "e87a88bb124773d8548af53f6afe23887dedc48f";
    portal = "97b0843df74bf60015ee40aaba4c9b1da4f9c6ba";
  };
}
