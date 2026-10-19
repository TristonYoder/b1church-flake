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
  tag = "ud7cd1c09226f";

  upstream = {
    api = "ba56388f4001f5d1a7ba4a779736fa99641c2c19";
    admin = "ee8d9b8f48918d3d90b4473fc54e72a2fd5286ae";
    portal = "ecd55e2d94872011c4bcfbfb5117f3d8258c6a70";
  };
}
