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
  tag = "u1d7dc007a4e8";

  upstream = {
    api = "c20c493d4a2a745e7db89ae15fcda7e90dbe09f6";
    admin = "196cab1eb37169b00ee0ea21cbc023e6dbd9e960";
    portal = "b393d54f4816b00589d6657079c1bd26d285a827";
  };
}
