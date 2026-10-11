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
  tag = "u8341d1a076c2";

  upstream = {
    api = "66acd437935725620d82c1f17542775dee6b3211";
    admin = "64ba452ab515f1da75015fd72624ed10d39f0e61";
    portal = "c44c1273a5c2266b5fe10a6106fe77c9499cdbc7";
  };
}
