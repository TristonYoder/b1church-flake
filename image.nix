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
  tag = "uc5674532f6d1";

  upstream = {
    api = "95f82feeafa2abd5bc37693d6610f504910761ce";
    admin = "70729178ca77eae9953571b92a73278088054da7";
    portal = "52049f574239a0331e565a6d0b079260dc9951d1";
  };
}
