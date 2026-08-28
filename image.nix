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
  tag = "ubc7863454b23";

  upstream = {
    api = "1770c78b05ee87cc87a4d27ee818c835a3c85865";
    admin = "7a0adc936a5edc7dfc589080006b8248051861e4";
    portal = "2f8e391c3f19d9c2158dfcf314e831d4d4a796cf";
  };
}
