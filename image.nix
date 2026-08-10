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
  tag = "uaccc6095b990";

  upstream = {
    api = "05775af738426c1b6e1d731a289c08e0729f1077";
    admin = "f71b017df3580e6e7bdcbabd3bf69d3ba53a8052";
    portal = "ed820c22b7b44aa22e05278460e965144f868b0a";
  };
}
