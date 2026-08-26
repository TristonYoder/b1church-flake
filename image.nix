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
  tag = "ud9749d55e609";

  upstream = {
    api = "204f3899ba7e28e4b315f901abd355c77b50bec7";
    admin = "7ba9ca22650915067282f4566817175526b6e754";
    portal = "7da2909505ab87b9d3549a94df7b064892009e84";
  };
}
