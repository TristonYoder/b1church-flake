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
  tag = "u4b4226db53d3";

  upstream = {
    api = "99457b27b80f8c9bfbe30a60383f720d88a90156";
    admin = "6418d33708c4db775669b9c1778b95e35368011f";
    portal = "55af4463e86ff195b3e4be25d89239dcd1282477";
  };
}
