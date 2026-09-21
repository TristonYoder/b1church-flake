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
  tag = "u1478b1bcd1fd";

  upstream = {
    api = "97fc9bb3c3659d90d99589aeb2cac85574b42d3d";
    admin = "3c1683be3c4a426762a8c8afb98dbe378de73290";
    portal = "a1cb4fb8ac8e852cc3bfb94edc15be67f3a41bcf";
  };
}
