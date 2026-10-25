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
  tag = "uda9c0f1bb33e";

  upstream = {
    api = "64ae4f2dae73f57f9cf7f1903d67f0bac2615303";
    admin = "400630988e93373480cbf4c78de3b7a719f3d52f";
    portal = "979a6f823e76a2244bf939b7285b47d2d8b763f7";
  };
}
