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
  tag = "u899169c3f49f";

  upstream = {
    api = "7f2ff4ceb6ac216768429284ee973e823900679d";
    admin = "78dc57ab68d54d1abd0f05cb0d2c5944b165f65f";
    portal = "d47816492e363c98319afe1b29d01660e384a67b";
  };
}
